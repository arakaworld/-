<!DOCTYPE html>
<html>
	<head>
		<meta charset = "UTF-8">
		<title>演習１</title>
		<script>
			function age() { 
				var n  = document.myform.myYear.value;
				var born = n - 1987;
				window.alert("あなたは今年、" + born + "歳になります。");
			}

			function pull() {
				var now = (new Date).getFullYear();
  				for(var i=1930; i<=now; i++) {
	  				document.write("<option value=" + i + ">" + i + "年</option>"); //←難しく考えすぎない事。単純にhtml文を出力してしまえば良い。
				}
			}
		</script>
	</head>
	<body>
		<h1>あなたの今年の年齢を計算します</h1>
<HR>
		<p>あなたの生まれた西暦を選択し、［年齢計算］ボタンを押してください</p>
	<form name ="myform">
		<select name = "myYear">
		<script><!--
  			pull();
		--></script>
		<input type = "button" value = "年齢計算" onclick = "age();">
		</select>
	</form>	
