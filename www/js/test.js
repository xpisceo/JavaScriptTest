function sendCommand(cmd,param){
	var url="testapp:"+cmd+":"+param;
	document.location = url;
}
function clickLink(){
	sendCommand("alert","hello world");
}

function showAlert() {
	alert('in show alert');
}