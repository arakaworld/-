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
		//���W���Z�b�g
		this.position.x = p.x;
		this.position.y = p.y;

		//�T�C�Y�A�X�s�[�h���Z�b�g
		this.size = size;
		this.speed = speed;

		//�����t���O�𗧂Ă�
		this.alive = true;
	};

	CharacterShot.prototype.move = function() {
		//���W��^���speed�������ړ�������
		this.position.y -= this.speed;

		//���ȏ�̍��W�ɓ��B���Ă����琶���t���O���~�낷
		if(this.position.y < -this.size) {
			this.alive = false;
		}
	};

//- �G�l�~�[�N���X --------------------------------------------------

	function Enemy() {
		this.position = new Point();
		this.size = 0;
		this.type = 0;
		this.param = 0;
		this.alive = false;
	}

	Enemy.prototype.set = function(p, size, type) {
		//���W���Z�b�g
		this.position.x = p.x;
		this.position.y = p.y;

		//�T�C�Y�A�^�C�v���Z�b�g
		this.size = size;
		this.type = type;

		//�p�����[�^�����Z�b�g
		this.param = 0;

		//�����t���O�𗧂Ă�
		this.alive = true;
	};

	Enemy.prototype.move = function() {
		//�p�����[�^���C���N�������g
		this.param++;

		//�^�C�v�ɉ����ĕ���
		switch(this.type) {
			case 0 :
				// x�����ւ܂������i��
				this.position.x += 2;

				//�X�N���[���̉E�[��艜�ɓ��B�����琶���t���O���~�낷
				if(this.position.x > this.size + screenCanvas.width) {
					this.alive = false;
				}
				break;
			case 1 :
				//�}�C�i�Xx�����ւ܂������i��
				this.position.x -= 2;

				//�X�N���[���̍��[��艜�ɓ��B�����琶���t���O���~�낷
				if(this.position.x < -this.size) {
					this.alive = false;
				}
				break;
		}
	};

//- �G�l�~�[�V���b�g�N���X --------------------------------------------------
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
