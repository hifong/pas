package com.flying.pas.service;

import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import com.flying.common.util.Codes;
import com.flying.common.util.Utils;
import com.flying.framework.annotation.DaoCreate;
import com.flying.framework.annotation.DaoQuery;
import com.flying.framework.annotation.DaoUpdate;
import com.flying.framework.annotation.Param;
import com.flying.framework.annotation.Service;
import com.flying.framework.annotation.ServiceConfig;
import com.flying.framework.data.Data;
import com.flying.framework.service.AbstractService;

@Service(value="SequenceService", configs={@ServiceConfig(name="step-size", value="10")})
public class SequenceService extends AbstractService {
	private final static Map<String, SequenceItem> items = Utils.newHashMap();
	
	@DaoCreate(entity="sequence", sql="insert into t_sequence(category, next_val, version) values(?, 0, ?)")
	public Data create(@Param(value = "category", required=true) String category, 
			@Param(value = "version", required=true) long version) {
		return null;
	}
	
	@DaoUpdate(entity="sequence", sql="update t_sequence set next_val=?, version=version+1,update_date=now() where category=? and version=?")
	public Data updateNext(@Param(value = "next_val", required=true) long next_val, 
			@Param(value = "category", required=true) String category, 
			@Param(value = "version", required=true) long version) {
		return null;
	}
	
	@DaoUpdate(entity="sequence", sql="update t_sequence set step=?, update_date=now() where category=?")
	public Data updateStep(@Param(value = "step", required=true) long step, 
			@Param(value = "category", required=true) String category) {
		return null;
	}
	
	@DaoQuery(entity="sequence", single=true)
	public Data query(@Param(value = "category", required=true) String category) {
		return null;
	}
	
	public SequenceItem getSequenceItem(String category) {
		if(items.containsKey(category)) {
			return items.get(category);
		} else {
			synchronized(category) {
				SequenceItem item = new SequenceItem(category, query(category));
				items.put(category, item);
				return item;
			}
		}
	}
	
	public Data nextValue(@Param(value = "category", required=true) String category) {
		long nextVal = getSequenceItem(category).nextVal();
		while(nextVal == -1) {
			synchronized(category) {
				items.remove(category);
			}
			nextVal = getSequenceItem(category).nextVal();
		}
		return new Data("value", nextVal);
	}
	
	class SequenceItem {
		private final AtomicLong counter;
		private final AtomicLong version;
		private final String category;
		private long max;
		private long step;
		
		public SequenceItem(String category, Data data) {
			this.category = category;
			this.counter = new AtomicLong(data.getLong("next_val", 0));
			this.version = new AtomicLong(data.getLong("version", -1));
			this.step = data.getLong("step", getServiceConfig().getConfigs().getLong("step-size", 10));
			if(this.version.longValue() == -1) {
				synchronized(category) {
					long ver = this.version.incrementAndGet();
					create(category, ver);
				}
			}
			items.put(category, this);
		}
		
		public long nextVal() {
			synchronized(category) {
				long res = counter.incrementAndGet();
				if(res > max) {
					long ver = this.version.longValue();
					max = res + this.step - 1;
					int rows = updateNext(max, category, ver).getInt(Codes.EFFECT_ROWS, 0);
					this.version.incrementAndGet();
					if(rows == 0) {
						return -1;
					}
				}
				return res;
			}
		}
	}
	
}
