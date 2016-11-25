	window.onload = init;

	function init() {
		document.formMsg.btnMsg.onclick = showMsg;
	}

	function showMsg() {
		window.alert("ようこそ！");
	}