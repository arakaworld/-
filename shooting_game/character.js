	function Character() {
		this.position = new Point();
		this.size = 0;
	}

	Character.prototype.init = function(size) {
		this.size = size;
	};

	function CharacterShot() {
		this.position = new Point();
		this.size = 0;
		this.speed = 0;
		this.alive = false;
	}

	CharacterShot.prototype.set = function(p, size, speed) {
		//座標をセット
		this.position.x = p.x;
		this.position.y = p.y;

		//サイズ、スピードをセット
		this.size = size;
		this.speed = speed;

		//生存フラグを立てる
		this.alive = true;
	};

	CharacterShot.prototype.move = function() {
		//座標を真上にspeed分だけ移動させる
		this.position.y -= this.speed;

		//一定以上の座標に到達していたら生存フラグを降ろす
		if(this.position.y < -this.size) {
			this.alive = false;
		}
	};

//- エネミークラス --------------------------------------------------

	function Enemy() {
		this.position = new Point();
		this.size = 0;
		this.type = 0;
		this.param = 0;
		this.alive = false;
	}

	Enemy.prototype.set = function(p, size, type) {
		//座標をセット
		this.position.x = p.x;
		this.position.y = p.y;

		//サイズ、タイプをセット
		this.size = size;
		this.type = type;

		//パラメータをリセット
		this.param = 0;

		//生存フラグを立てる
		this.alive = true;
	};

	Enemy.prototype.move = function() {
		//パラメータをインクリメント
		this.param++;

		//タイプに応じて分岐
		switch(this.type) {
			case 0 :
				// x方向へまっすぐ進む
				this.position.x += 2;

				//スクリーンの右端より奥に到達したら生存フラグを降ろす
				if(this.position.x > this.size + screenCanvas.width) {
					this.alive = false;
				}
				break;
			case 1 :
				//マイナスx方向へまっすぐ進む
				this.position.x -= 2;

				//スクリーンの左端より奥に到達したら生存フラグを降ろす
				if(this.position.x < -this.size) {
					this.alive = false;
				}
				break;
		}
	};

//- エネミーショットクラス --------------------------------------------------
	function EnemyShot() {
		this.position = new Point();
		this.vector = new Point();
		this.size = 0;
		this.speed = 0;
		this.alive = false;
	}

	EnemyShot.prototype.set = function(p, vector, size, speed) {
		this.position.x = p.x;
		this.position.y = p.y;
		this.vector.x = vector.x;
		this.vector.y = vector.y;

		this.size = size;
		this.speed = speed;

		this.alive = true;
	};

	EnemyShot.prototype.move = function() {
		this.position.x += this.vector.x * this.speed;
		this.position.y += this.vector.y * this.speed;

		if(
			this.position.x < -this.size ||
			this.position.y < -this.size ||
			this.position.x > this.size + screenCanvas.width ||
			this.position.y > this.size + screenCanvas.height
		) {
			this.alive = false;
		}
	};
