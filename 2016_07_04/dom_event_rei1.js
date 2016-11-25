window.onload = init;

function init() {
	var t = document.getElementById("target");
	t.addEventListener("click" , showMsg, false);
	t.addEventListener("click" , show, false);
}

function showMsg() {
	window.alert("ようこそ");
}

function show() {
	window.alert("ヨウコソ");
}