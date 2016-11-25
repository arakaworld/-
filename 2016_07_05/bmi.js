			function onClickBMI(){
				var weight=document.bmiForm.weight.value;
				var height=document.bmiForm.height.value;
				var stdWgt = calcStdW(height);
				var bmi=calcBMI(height,weight);
				var judg=calcBMIJudg(bmi);
				var hantei="あなたの身長は"+height+"cm、体重は"+weight+"kgです\n"
				 + "あなたのBMIは"+bmi+"、"+judg+"です\n"
				 + "あなたの標準体重は"+stdWgt+"kgです\n";
				if(weight > stdWgt){
					hantei=hantei + "あと"+(weight-stdWgt).toFixed(1)+"kg減らしましょう\n";
				}else if(weight < stdWgt){
					hantei=hantei + "あと"+(stdWgt-weight).toFixed(1)+"kg増やしましょう\n";
				}else{
					hantei="現在の体重を維持して下さい\n";
				}
				document.bmiForm.hantei.value=hantei;
			}
			// 標準体重を求める関数「calcStdW()」の定義
			// 関数を実行する場合、1つの値が指定される。その値を関数内では変数「height」に代入する
			function calcStdW( height ) { 
				// 指定された値(身長)は「cm」なので、「m」に変換する
				height=height/100;
				// 標準体重を計算し、その結果を小数点以下1位まで返す
				return (height*height*22).toFixed(1);
			}

			// 身長、体重からBMI（Body Mass Index）を求める関数「calcBMI()」の定義
			function calcBMI( height,weight ) { 
				// 指定された値(身長)は「cm」なので、「m」に変換する
				height=height/100;
				// BMIを計算し、その結果を小数点以下1位までで返す
				return (weight / (height*height)).toFixed(1);
			}

			// BMI（Body Mass Index）から判定結果を返す関数「calcBMIJudg()」の定義
			function calcBMIJudg( bmi ) { 
				var ret="";
				if(bmi < 18.5){
					ret = "低体重（痩せ型）";
				}else if(bmi < 25){
					ret = "普通体重";
				}else if(bmi < 30){
					ret = "肥満（1度）";
				}else if(bmi < 35){
					ret = "肥満（2度）";
				}else if(bmi < 40){
					ret = "肥満（3度）";
				}else{
					ret = "肥満（4度）";
				}
				return ret;
			}