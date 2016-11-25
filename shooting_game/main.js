//- global--------------------------------
	var screenCanvas, info;
	var run = true;
	var fps = 1000 / 30;
	var mouse = new Point();
	var ctx; // canvas2d �R���e�L�X�g�i�[�p
	var fire = false;
	var counter = 0;
//- const ------------------------------------------------------------------

	var CHARA_COLOR = "rgba(0, 0, 255, 0.75)";
	var CHARA_SHOT_COLOR = "rgba(0, 255, 0, 0.75)";
	var CHARA_SHOT_MAX_COUNT = 10;
	var ENEMY_COLOR = "rgba(255, 0, 0, 0.75)";
	var ENEMY_MAX_COUNT =10;
	var ENEMY_SHOT_COLOR = "rgba(255, 0, 0, 0.75)";
	var ENEMY_SHOT_MAX_COUNT = 100;

// - main ------------------------------------------------------------------

	window.onload = function() {
		// �ėp�ϐ�
		var i, j;
		var p = new Point();

		// �X�N���[���̏�����
		screenCanvas = document.getElementById("screen");
		screenCanvas.width = 256;
		screenCanvas.height = 256;

		// 2d�R���e�L�X�g
		ctx = screenCanvas.getContext("2d");

		//�C�x���g�̓o�^
		screenCanvas.addEventListener("mousemove", mouseMove, true);
		screenCanvas.addEventListener("mousedown", mouseDown, true);
		window.addEventListener("keydown", keyDown, true);

		//���̑��̃G�������g�֘A
		info = document.getElementById("info");

		// ���@������
		var chara = new Character();
		chara.init(10);

		//���@�V���b�g�̏�����
		var charaShot = new Array(CHARA_SHOT_MAX_COUNT);
		for(i = 0; i < CHARA_SHOT_MAX_COUNT; i++) {
			charaShot[i] = new CharacterShot();
		}

		//�G�l�~�[������
		var enemy = new Array(ENEMY_MAX_COUNT);
		for(i = 0; i < ENEMY_MAX_COUNT; i++) {
			enemy[i] = new Enemy();
		}

		// �G�l�~�[�V���b�g������
		var enemyShot = new Array(ENEMY_SHOT_MAX_COUNT);
		
		for(i = 0; i < ENEMY_SHOT_MAX_COUNT; i++){
			enemyShot[i] = new EnemyShot();
		}
		
	// �����_�����O�������Ăяo��
	(function(){
		// �J�E���^���C���N�������g
		counter++;
		
		// HTML���X�V
		info.innerHTML = mouse.x + ' : ' + mouse.y;
		
		// screen�N���A
		ctx.clearRect(0, 0, screenCanvas.width, screenCanvas.height);
		
		// ���@ ---------------------------------------------------------------
		// �p�X�̐ݒ���J�n
		ctx.beginPath();
		
		// ���@�̈ʒu��ݒ�
		chara.position.x = mouse.x;
		chara.position.y = mouse.y;
		
		// ���@��`���p�X��ݒ�
		ctx.arc(
			chara.position.x,
			chara.position.y,
			chara.size,
			0, Math.PI * 2, false
		);
		
		// ���@�̐F��ݒ肷��
		ctx.fillStyle = CHARA_COLOR;
		
		// ���@��`��
		ctx.fill();
		
		// fire�t���O�̒l�ɂ�蕪��
		if(fire){
			// ���ׂĂ̎��@�V���b�g�𒲍�����
			for(i = 0; i < CHARA_SHOT_MAX_COUNT; i++){
				// ���@�V���b�g�����ɔ��˂���Ă��邩�`�F�b�N
				if(!charaShot[i].alive){
					// ���@�V���b�g��V�K�ɃZ�b�g
					charaShot[i].set(chara.position, 3, 5);
					
					// ���[�v�𔲂���
					break;
				}
			}
			// �t���O���~�낵�Ă���
			fire = false;
		}
		
		// ���@�V���b�g -------------------------------------------------------
		// �p�X�̐ݒ���J�n
		ctx.beginPath();
		
		// ���ׂĂ̎��@�V���b�g�𒲍�����
		for(i = 0; i < CHARA_SHOT_MAX_COUNT; i++){
			// ���@�V���b�g�����ɔ��˂���Ă��邩�`�F�b�N
			if(charaShot[i].alive){
				// ���@�V���b�g�𓮂���
				charaShot[i].move();
				
				// ���@�V���b�g��`���p�X��ݒ�
				ctx.arc(
					charaShot[i].position.x,
					charaShot[i].position.y,
					charaShot[i].size,
					0, Math.PI * 2, false
				);
				
				// �p�X�������������
				ctx.closePath();
			}
		}
		
		// ���@�V���b�g�̐F��ݒ肷��
		ctx.fillStyle = CHARA_SHOT_COLOR;
		
		// ���@�V���b�g��`��
		ctx.fill();
		
		// �G�l�~�[�̏o���Ǘ� -------------------------------------------------
		// 100 �t���[���Ɉ�x�o��������
		if(counter % 100 === 0){
			// ���ׂẴG�l�~�[�𒲍�����
			for(i = 0; i < ENEMY_MAX_COUNT; i++){
				// �G�l�~�[�̐����t���O���`�F�b�N
				if(!enemy[i].alive){
					// �^�C�v�����肷��p�����[�^���Z�o
					j = (counter % 200) / 100;
					
					// �^�C�v�ɉ����ď����ʒu�����߂�
					var enemySize = 15;
					p.x = -enemySize + (screenCanvas.width + enemySize * 2) * j
					p.y = screenCanvas.height / 2;
					
					// �G�l�~�[��V�K�ɃZ�b�g
					enemy[i].set(p, enemySize, j);
					
					// 1�̏o���������̂Ń��[�v�𔲂���
					break;
				}
			}
		}
		
		// �G�l�~�[ -----------------------------------------------------------
		// �p�X�̐ݒ���J�n
		ctx.beginPath();
		
		// ���ׂẴG�l�~�[�𒲍�����
		for(i = 0; i < ENEMY_MAX_COUNT; i++){
			// �G�l�~�[�̐����t���O���`�F�b�N
			if(enemy[i].alive){
				// �G�l�~�[�𓮂���
				enemy[i].move();
				
				// �G�l�~�[��`���p�X��ݒ�
				ctx.arc(
					enemy[i].position.x,
					enemy[i].position.y,
					enemy[i].size,
					0, Math.PI * 2, false
				);
				// �V���b�g��ł��ǂ����p�����[�^�̒l����`�F�b�N
				if(enemy[i].param % 30 === 0){
					// �G�l�~�[�V���b�g�𒲍�����
					for(j = 0; j < ENEMY_SHOT_MAX_COUNT; j++){
						if(!enemyShot[j].alive){
							// �G�l�~�[�V���b�g��V�K�ɃZ�b�g����
							p = enemy[i].position.distance(chara.position);
							p.normalize();
							enemyShot[j].set(enemy[i].position, p, 5, 5);
							
							// 1�o���������̂Ń��[�v�𔲂���
							break;
						}
					}
				}
				// �p�X�������������
				ctx.closePath();
			}
		}
		
		// �G�l�~�[�̐F��ݒ肷��
		ctx.fillStyle = ENEMY_COLOR;
		
		// �G�l�~�[��`��
		ctx.fill();

		// �G�l�~�[�V���b�g -----------------------------------------------------------
		//�p�X�̐ݒ���J�n
		ctx.beginPath();

		//���ׂẴG�l�~�[�V���b�g�𒲍�����
		for(i = 0; i < ENEMY_SHOT_MAX_COUNT; i++) {
			if(enemyShot[i].alive) {
				enemyShot[i].move();

				ctx.arc(
					enemyShot[i].position.x,
					enemyShot[i].position.y,
					enemyShot[i].size,
					0, Math.PI * 2, false
				);

				ctx.closePath();
			}
		}

		ctx.fillStyle = ENEMY_SHOT_COLOR;

		ctx.fill();

		// �Փ˔���-----------------------------------------------------------------
		//���ׂĂ̎��@�V���b�g�𒲍�����
		for(i = 0; i < CHARA_SHOT_MAX_COUNT; i++) {
			if(charaShot[i].alive) {
				for(j = 0; j < ENEMY_MAX_COUNT; j++) {
					if(enemy[j].alive) {
						p = enemy[j].position.distance(charShot[i].position);
						





		// �t���O�ɂ��ċA�Ăяo��
		if(run){setTimeout(arguments.callee, fps);}
	})();
};


// - event -------------------------------------------------------------------

	function mouseMove(event) {
		//�}�E�X�J�[�\���̍��W�̍X�V
		mouse.x = event.clientX - screenCanvas.offsetLeft;
		mouse.y = event.clientY - screenCanvas.offsetTop;
	}

	function mouseDown(event) {
		//�t���O�𗧂Ă�
		fire = true;
	}

	function keyDown(event) {
		//�L�[�R�[�h���擾
		var ck = event.keyCode;

		//Esc�L�[��������Ă�����t���O���~�낷
		if(ck === 27) { run = false; }
	}
