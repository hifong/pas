function getDatagrid(dg) {
	return $('#'+dg);
}

function getDialog(dlg) {
	return $('#'+dlg);
}

function getForm(dlg) {
	return $('#'+dlg+'-form');
}

function getFieldDiv(dlg, field) {
	return document.getElementById("div-"+dlg+"-"+field);
}

function openActionDialog(dlg, title){
	if(title) {
    	getDialog(dlg).dialog('open').dialog('setTitle',title);
    }
    getForm(dlg).form('clear');
	var row = {};
	getForm(dlg).form('load',row);
}
