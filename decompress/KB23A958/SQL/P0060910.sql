/**********************************************************************************/
/*  ���сF�l��WEB                                                                 */
/*  �@�\�F�V�X�e���Ǘ�                                                            */
/*  �����F���R���ڐݒ�                                                            */
/*  ���e�F�o�^�����E���[�N�쐬����                                                */
/*  ���́FWEB_SP0060910_S                                                         */
/*  FILE�FP0060910.SQL                                                            */
/*  ���l�F                                                                        */
/*                                                                                */
/*  �쐬�FVer6.1  2001/05/01 T.M                                                  */
/*  �����FVer6.2  2001/10/01 T.M �\�����ڕύX,�����Ή�,�敪�C�ӓ���               */
/*  �����FVer6.2a 2001/11/01 T.M �Z���E�X�֔ԍ������ݒ�̕s��Ή�               */
/*  �����FVer6.2a 2001/11/01 T.M ���ڍ폜���̃`�F�b�N�E��o����ID�ύX�s��Ή�   */
/*  �����FVer6.2b 2001/12/01 T.M �͏o�A�g���̍쐬�敪�o�^�R��Ή�                 */
/*  �����FVer6.3  2002/02/01 T.M �͏o�S�\�����ύX�Ή�                             */
/*  �����FVer6.3  2002/02/01 T.M �\�[�g���ځE�͈͎w��Ή�,�l���l�ύX�Ή�      */
/*  �����FVer7.0  2002/10/01 T.M �͏o���͐��������t�@�C���Ή�                     */
/*  �����FVer7.0  2002/10/01 T.M �����Ǘ�����,�g�p�敪,���̕ύX�敪�Ή�           */
/*  �����FVer7.0a 2003/xx/xx T.M ���v�����敪�̑Ή�                               */
/*  �����FVer7.0a 2003/xx/xx T.M ���̑��V�X�e���Q�Ǝ��̃\�[�g�敪�s��Ή�       */
/*  �����FVer8.0  2002/12/01 T.M �L�[�ݒ�,���_�ݒ�Ή�                            */
/*  �����FVer8.0.5 2003/03/19 T.M �L�[�ݒ莞�̃\�[�g���g�p�`�F�b�N                */
/*  �����FVer8.0.6 2003/05/02 T.M �t�@�C���g�p�Ή�                                */
/*  �����FVer8.0.7 2003/08/05 T.M ���_���玞�_�ȊO�ɂ����ꍇ�̕s�v�f�[�^�폜�Ή�  */
/*  �����FVer8.0.7 2003/08/28 T.M �ʉ݌^�Ή�                                      */
/*  �����FVerP1.1  2003/05/01 T.M �p�����Ή�                                      */
/*  �����FVerP1.1  2003/05/01 T.M ���[�N�e�[�u���X�y�[�X�Ή�                      */
/*  �����FVerP1.2b 2003/11/25 T.M ���ڒǉ����ɓ͏o�A�g���̕s��Ή�              */
/*  �����FVerP1.2b 2004/01/16 T.M �͏o�A�g���̕K�{�敪���ڍs�R��s��Ή�        */
/*  �����FVerP1.2b 2004/01/22 T.M �͏o�A�g���̈ڍs�s��Ή�                      */
/*  �����FVerP1.3  2004/02/23 T.M ���_�ݒ�i�J�n�E�I���^�C�v�j�̒ǉ�              */
/*  �����FVerP2.01 2004/04/28 T.M ���_�ݒ�i�J�n�E�I���^�C�v�j�̑Ή�              */
/*  �����FVerP2.11 2004/07/12 S.Z.H �}�X�^�X�V���O�Ή�                            */
/*  �����FVerP2.32 2004/12/29 T.M ���̑��V�X�e���Q�Ǝ��e�[�u�������ύX�s��Ή�  */
/*  �����FVerP3.01 2005/09/07 I.H E100079 ���_�ݒ�i�J�n�E�I���^�C�v�j�̎擾���@�ύX */
/*  �����FVerP3.01 2005/10/17 T.M D100001 �}���`�J���p�j�[�Ή�                    */
/*  �����FVerP3.02 2005/12/01 M.I D100041 ���O�ύX�Ή�                            */
/*  �����FVerP3.02 2005/12/19 T.M D100001 �Еʕ����X�V�R��Ή�                    */
/*  �����FVerP3.04 2006/02/07 T.M D100001 ���̑��V�X�e���Q�Ǝ��Ή��R��            */
/*  �����FVerP3.04 2006/02/17 T.M D100069 �^�C�v�ύX(FILEDATA LONG RAW �� BLOB)   */
/*  �����FVerP3.04 2006/02/28 T.M D100001 ���J�o�����̉�ЃR�[�h�Z�b�g�R��        */
/*  �����FVerP3.0a 2006/03/07 T.M E100184 �Ǘ����ڂ̐ݒ�p�̃p�����[�^�ǉ��Ή�    */
/*  �����FVerP3.0d 2006/06/13 T.M E100306 ���̑��Q�ƎЈ��{��БI�����̕s�      */
/*  �����FVerP3.0e 2006/10/06 M.I E100414 �\�����X�V�R��s��Ή�                */
/*  �����FVerP3.0f 2006/12/08 Y.Y E100471 �⏕���͐�i�L�[�ݒ肠��j�s��Ή�    */
/*  �����FVerP3.0f 2006/12/08 Y.Y E100472 ���R�\���A�g���̍폜�s��Ή�          */
/*  �����FVerP3.0f 2006/12/08 M.I E100473 ���R�\���A�g���̊m��s��Ή�          */
/*  �����FVerP3.0f 2007/01/16 M.I E100504 �m�莞��WEB_TP1000021_M�X�V�R��Ή�     */
/*  �����FVerP3.0f 2007/01/26 M.I E100519 �Ј��ԍ��^�C�v���̕\�������Z�b�g�R��    */
/*  �����FVerP3.1  2006/09/28 I.H D100170 �f�[�^�X�V���O�p�t�H�[�}���X���P�Ή�    */
/*  �����FVerP3.1  2007/02/05 M.I E100522 ���X�g�\������21_M�X�V�R��Ή�          */
/*  �����FVerP3.1a 2007/05/17 M.I E100641 ���R�\���A�g���̊m��s��Ή�          */
/*  �����FVerP3.1a 2007/07/06 M.I E100670 �m�莞��WEB_TP1000021_M�X�V�R��Ή�     */
/*  �����FVerP4.0  2007/06/08 M.I D100288 ���F�����������Ή�                      */
/*  �����FVerP4.0  2007/08/30 T.M D100318 �\�����R�E�p�����R�T�C�Y�g���i200��500�j*/
/*  �����FVerP4.0  2007/12/18 Y.N D100371 ���������s�`���̍����w��Ή�            */
/*  �����FVerP4.0  2007/12/26 M.I D100379 TDE�Ή�                                 */
/*  �����FVerP4.0d 2009/06/26 C.O E101255 ���R�\���A�g���̊m��s��Ή��R��Ή�  */
/*  �����FVerP4.0d 2009/09/07 M.I�y�C��449�zE101304 �ύX����̧���ް������Ή�      */
/*  �����FVerP4.0f 2010/05/19 M.I�y�C��599�zE101458 Ͻ������敪�ݒ�R��Ή�       */
/*  �����FVerP4.0g 2010/09/14 M.I�y�C��693�zE101557 �X�V���X�V�Һ��ޓo�^�R��Ή�  */
/*  �����FVerP4.0g 2011/03/07 M.I�y�C��779�zE101649 ���_�ύX���̎ЕʃJ�e�S�����s��*/
/*  �����FVer.2    2011/11/18 T.M�y���PP-11-004�z                                 */
/*  �����FVer.2    2011/12/08 M.I�y�C��P11430�z                                   */
/*  �����FVer.3    2012/04/16 M.I�y�C��P12590�z                                   */
/*  �����FVer.3a   2012/07/23 M.K�y�C��P13970�z                                   */
/*  �����FVer.3a   2012/11/14 M.K�y�C��P14650�z                                   */
/*  �����FVer.3a   2012/11/20 M.K�y�C��P14680�z                                   */
/*  �����FVer.3a   2013/01/24 I.H�y�C��P14930�z                                   */
/*  �����FVer5.0a  2013/01/25 H.N�y�C��P14960�z                                   */
/*  �����FVer5.0a  2013/02/08 M.K�y�C��P15130�z                                   */
/*  �����FVer5.0a  2013/02/25 M.I�y�C��P15180�z                                   */
/*  �����FVer6.0   2014/10/30 SHSC�yP-14-208�z�֑����������Ή��i��s�j            */
/*  �����FVerP6.0  2015/01/07 T.M�y�C��P17970�z                                   */
/*  �����FVerP6.1  2015/03/23 T.M�y���PP-14-083�z                                 */
/*  �����FVerP6.1  2015/04/10 T.M�y���PP-14-084�z                                 */
/*  �����FVerP6.0  2015/07/02 ISID�y�C��P16860�z                                  */
/*  �����FVerP6.1  2015/07/08 ICOM�y�C��P16100�z                                  */
/*  �����FVerP6.1  2015/08/05 T.M�yP18280�z(PCS-BUG-765)                          */
/*  �����FVerP6.1  2015/09/24 T.M�y�C��P19630�z                                   */
/*  �����FVerP6.1  2015/10/05 T.M�yP20600�z(PCS-BUG-916,917)                      */
/*  �����FVerP6.1  2017/03/01 ISID�yP24220�z���R�l����View�폜�s���Ή�        */
/*  �����FVer6.1   2017/05/19 ISID�y�C��P24440�z                                  */
/*  �����FVer6.1   2017/05/22 ISID�y�C��P23850�z                                  */
/*  �����FVer6.1   2018/11/26 ISID�y�C��P27480�z                                  */
/*  �����FVer6.1   2019/02/28 ISID�y�C��P27481�z                                  */
/*  �����FVer6.1   2020/12/11 ISID�y�C��P32260�z                                  */
/**********************************************************************************/
DROP PROCEDURE WEB_SP0060910_S;

CREATE PROCEDURE WEB_SP0060910_S(
	P_SKBN      IN  NUMBER,   /* 1:���[�N�o�^,2:�m��o�^ */
	P_TBKBN     IN  NUMBER,   /* 1:�ʏ�,2:���̑����(�Ј��R�[�h),3:���̑����(��ЃR�[�h+�\���Ј��R�[�h) */
	P_UPDKBN    IN  NUMBER,   /* 1:�V�K,2:�ύX,3:�폜 */
	P_UPDID     IN  WEB_TPFIELD.UPDID%TYPE,/* �X�V�҃R�[�h */
	P_RID       IN  NUMBER,   /* ���p�҂h�c */
	P_KEY       IN  NUMBER,   /* �敪 */
	P_NAME      IN  VARCHAR2, /* ���� */
	P_GROUP     IN  NUMBER,   /* �O���[�v�敪 */
	P_RKBN      IN  VARCHAR2, /* ���敪(0:�P��,1:��) */
	P_TSORT     IN  NUMBER,   /* �o�^�p�\���� */
	P_SSORT     IN  NUMBER,   /* �Ɖ�p�\���� */
	P_SRTKBN    IN  VARCHAR2, /* �\�[�g�敪(0:��,1:�L) */
	P_KEYUSE    IN  VARCHAR2, /* �L�[�ݒ�(0:��,1:�L) */
	P_JITEN     IN  VARCHAR2, /* ���_�ݒ�(0:��,1:�L) */
	P_FILEKBN   IN  VARCHAR2, /* �t�@�C���敪(0:��,1:�L) */
	P_OBJTYPE   IN  VARCHAR2, /* �I�u�W�F�N�g�^�C�v(1:�e�[�u��,2:�r���[)*/
	P_OBJNAME   IN  VARCHAR2, /* �I�u�W�F�N�g���� */
	P_MKAISYA   IN  WEB_TPFIELD.KAISYACD%TYPE, /* �Ǘ���ЃR�[�h */
	P_ERR       OUT NUMBER    /* �G���[�敪(-1:�G���[,0:����,1:���ږ�,2:���ڏd��,3:�敪�d��,4:�͈͎w��`�F�b�N) */
	                          /*             5:�L�[�ݒ�,7:�\�[�g�ݒ� */
	                          /*             11:���_�ݒ莞(�L�[�g�p���肩�̃`�F�b�N) */
	                          /*             12:���_�ݒ莞(���_�ݒ��ݒ�ς��̃`�F�b�N) */
	                          /*             13:���_�ݒ莞(�L�[���ڂɐݒ肵�Ă��邩�̃`�F�b�N) */
	                          /*             14:���_�ݒ莞(���_�ݒ萔�̃I�[�o�[�`�F�b�N) */
	                          /*             15:�J�n�I���^�C�v(�Е��̂ݐݒ�) */
	                          /*             16:�J�n�I���^�C�v(�����ݒ�) */
)

IS

TYPE T_NUM1 IS TABLE OF NUMBER(3)                 INDEX BY BINARY_INTEGER; /* */
TYPE T_KCD  IS TABLE OF WEB_TPFIELD.KAISYACD%TYPE INDEX BY BINARY_INTEGER; /* */
TYPE T_VAR1 IS TABLE OF VARCHAR(510)              INDEX BY BINARY_INTEGER; /* */
TYPE T_NUM2 IS TABLE OF NUMBER(10)                INDEX BY BINARY_INTEGER; /* */
TYPE T_VAR2 IS TABLE OF VARCHAR(10)                INDEX BY BINARY_INTEGER; /* */

W_OLDID    T_NUM1;          /* ���h�c */
W_NEWID    T_NUM1;          /* �V�h�c */
W_MOTOID   NUMBER(3);       /* ���h�c */
W_MOTO1    NUMBER(3);       /* ���\�����R�h�c */
W_MOTO2    NUMBER(3);       /* ���p�����R�h�c */
W_MOTO3    NUMBER(3);       /* �ޔ�\�����R�h�c */
W_MOTO4    NUMBER(3);       /* �ޔ��p�����R�h�c */
W_CHGCNT   NUMBER(5);       /* ���[�N�J�E���g */
W_SQL      VARCHAR2(10000);  /* SQL������ */
W_SQL_R1   VARCHAR2(10000);  /* ���J�o��SQL������ */
W_SQL_R2   VARCHAR2(10000);  /* ���J�o��SQL������ */
W_SQL_R3   VARCHAR2(10000);  /* ���J�o��SQL������(�͏o�\���p) */
W_SQL_R4   VARCHAR2(10000);  /* ���J�o��SQL������(�͏o�\���p) */
W_SQL_R5   VARCHAR2(10000);  /* ���J�o��SQL������(�t�@�C���p) */
W_TABLE1   VARCHAR2(60);    /* �e�[�u���� */
W_TABLE2   VARCHAR2(60);    /* �o�b�N�A�b�v�e�[�u���� */
W_TABLE3   VARCHAR2(60);    /* �͏o�e�[�u���� */
W_TABLE4   VARCHAR2(60);    /* �͏o�o�b�N�A�b�v�e�[�u���� */
W_TABLE5   VARCHAR2(60);    /* �t�@�C���p�e�[�u���� */
W_TABLE6   VARCHAR2(60);    /* �o�b�N�A�b�v�t�@�C���p�e�[�u���� */
W_VIEW1    VARCHAR2(60);    /* �r���[�� */
W_VIEW2    VARCHAR2(60);    /* �r���[�� */
W_JITENKEY1 VARCHAR2(60);   /* ���_���ڃL�[1 */
W_JITENKEY2 VARCHAR2(60);   /* ���_���ڃL�[2 */
W_INDEX1   VARCHAR2(60);    /* �C���f�b�N�X�� */
W_INDEX2   VARCHAR2(60);    /* �C���f�b�N�X�� */
W_INDEX3   VARCHAR2(60);    /* �C���f�b�N�X��(�͏o�p) */
W_INDEX4   VARCHAR2(60);    /* �C���f�b�N�X��(�͏o�p) */
W_INDEX5   VARCHAR2(60);    /* �t�@�C���p�C���f�b�N�X�� */
W_SCDKEY   VARCHAR2(100);    /* �Ј��ԍ����ږ� */
W_TYPE     VARCHAR2(100);    /* �擪�\�[�g���ڃ^�C�v */
W_TSID     NUMBER(5);       /* �o�^�E�Ɖ�敪 */
W_TSID1    NUMBER(5);       /* �o�^�E�Ɖ�敪(����) */
W_TSID2    NUMBER(5);       /* �o�^�E�Ɖ�敪(���) */
W_TBID     NUMBER(5);       /* �o�^�E�Ɖ�敪 */
W_USEKBN   VARCHAR2(2);     /* �g�p�敪 */
W_MSIZE    NUMBER(5);       /* �T�C�Y */
W_SSIZE    NUMBER(5);       /* �����T�C�Y */
W_FIELD    VARCHAR2(10);     /* ���ږ� */
W_KEY      NUMBER(5);       /* �͏o�敪 */
W_CNT      NUMBER(10);       /* ���[�N�J�E���g */
W_I        NUMBER(5);       /* ���[�N�J�E���g */
W_J        NUMBER(5);       /* ���[�N�J�E���g */
W_K        NUMBER(5);       /* ���[�N�J�E���g */
W_ID       NUMBER(5);       /* ���[�N�J�E���g */
W_JIID1    NUMBER(5);       /* ���_�h�c���[�N */
W_JIID2    NUMBER(5);       /* ���_�h�c���[�N */
W_DCNT     NUMBER(5);       /* �폜���� */
W_FCNT     NUMBER(5);       /* ���ڃJ�E���g */
W_GCNT     NUMBER(5);       /* ��ʈʒu�J�E���g */
W_KCNT1    NUMBER(5);       /* �e�Ѓf�[�^���݌��� */
W_KCNT2    NUMBER(5);       /* �e�Ѓf�[�^���݃C���f�b�N�X */
W_TDKFLG   NUMBER(5);       /* �͏o�A�g�t���O(0:��,1>=�͏o�敪) */
W_RKBN     VARCHAR2(2);     /* ���敪 */
W_HOJYO    VARCHAR2(200);   /* �⏕�敪�� */
W_SRTKBN   VARCHAR2(20);    /* �\�[�g�敪 */
W_SRTJKN   VARCHAR2(200);   /* �\�[�g���� */
W_STR_X    NUMBER(5);       /* ���[�N�J�E���g */
W_WKTBSP   VARCHAR2(100);    /* ���[�N�e�[�u���X�y�[�X */
W_STYPE    NUMBER(1);       /* �Ј��ԍ����� */
W_SNAME    VARCHAR2(100);    /* �Ј��ԍ����� */
W_JIRKBN   NUMBER(1);       /* ���_�𔻒f(0:�P��,1>=:��) */
W_WDATA1   VARCHAR2(200);   /* ���[�N�ϐ� */
W_OLDKJUN  NUMBER(5);       /* �����ڏ� */
W_NEWKJUN  NUMBER(5);       /* �V���ڏ� */
W_KCD      T_KCD;           /* �X�V�Ώۉ�ЃR�[�h */
W_KEYFIELD VARCHAR2(200);   /* �L�[��� */
W_SDATA    T_VAR2;          /* �\�������ݒ� */
W_GET_ID   NUMBER(3);       /* �h�c */
W_GET_TKBN VARCHAR2(20);    /* �Ώۋ敪 */
W_KJUN     NUMBER(3);       /* ���ڏ� */
W_KNAME    VARCHAR2(100);   /* ���ږ� */
W_NEWKBN   NUMBER(1);       /* ���R���ڐV�͈͋敪(0:�]��,1:�V�K) */

W_CSR      INTEGER;         /* ���I�J�[�\���ϐ� */
W_RVL      INTEGER;         /* ���I�J�[�\���ϐ� */
W_CSR2     INTEGER;         /* ���I�J�[�\���ϐ� */
W_RVL2     INTEGER;         /* ���I�J�[�\���ϐ� */
W_ERRCODE  NUMBER;          /* ORACLE�G���[�R�[�h */
W_ERRMSG   VARCHAR2(510);   /* ORACLE�G���[���b�Z�[�W */
W_NDATA    NUMBER(5);       /* �f�[�^�擾�p */
W_MITU     VARCHAR2(4000);
W_SVID     VARCHAR2(2000);
W_21REC_V  T_VAR1;
W_21REC_N  T_NUM2;

W_LGSNO    NUMBER;         /* ���O�擾�����ԍ� */
W_LOGSET   NUMBER(1);      /* ���O�擾(0:��,1:�L) */
W_LGGET    VARCHAR2(2);    /* ���O�擾�͈� 1:���Ȃ�,2:�L�[���̂�,3:���ڗ��� */
W_LGIUD    VARCHAR2(6);    /* ���O�擾���� �r�b�g���f(0:�s�v,1:�v) 1:�ǉ�,2:�ύX,3:�폜 */
W_ROWID    VARCHAR2(400);  /* ���O�擾�pROWID */
W_WHERE    VARCHAR2(4000); /* ������ */
W_ERR      NUMBER;         /* �֐��߂�l�p�G���[�敪 */
W_DTFLG    NUMBER(1);      /* �l���̃f�[�^���f�t���O */
W_DISP_TYPE VARCHAR2(10);  /* �\���������[�N */

W_ITM_ID1  NUMBER(3);      /* ���ڂh�c�i�Ј��ԍ��j*/
W_ITM_ID2  NUMBER(3);      /* ���ڂh�c�i���h�c�j*/
W_ITM_ID3  NUMBER(3);      /* ���ڂh�c�i�X�V���j*/
W_ITM_ID4  NUMBER(3);      /* ���ڂh�c�i�X�V�҃R�[�h�j*/
W_ITM_ID5  NUMBER(3);      /* ���ڂh�c�i���X�V���j*/
W_ITM_ID6  NUMBER(3);      /* ���ڂh�c�i���X�V�҃R�[�h�j*/

/* �o�^�� */
CURSOR C_001 IS
	SELECT
		ITEM_ID,
		NEW_ITEM_ID,
		PROCESS_DIV
	 FROM WEB_TP0061140_W
	WHERE CUSTOMER_ID = P_RID
	  AND ITEM_ID > 0
	ORDER BY ITEM_ID
;

/* �\�����󋵏� */
CURSOR C_002 IS
	SELECT
		ITEM_ID,
		PROCESS_DIV 
	 FROM WEB_TP0061140_W
	WHERE CUSTOMER_ID = P_RID
	ORDER BY DISP_ORDER,ITEM_ID
;

/* �X�V��� */
CURSOR C_004(P_ID NUMBER) IS
	SELECT
		ITEM_ID,
		ITEM_NAME,
		DATA_TYPE,
		NVL(DATA_SIZE,0)     DATA_SIZE,
		NVL(FRACTION_SIZE,0) FRACTION_SIZE
	 FROM WEB_TP0061120_M
	WHERE IDENTIFIER = P_ID
	ORDER BY ITEM_ID
;

/* �g�p�h�c��� */
CURSOR C_005 IS
	SELECT
		IDENTIFIER
	 FROM WEB_TP0061110_M
	ORDER BY IDENTIFIER
;

/* ���ڏ�� */
CURSOR C_006(P_ID NUMBER) IS
	SELECT A.*,
	       B.REGISTER_USE_DIV
	 FROM WEB_TP0061120_M A,
	      WEB_TP0061140_W B
	WHERE A.IDENTIFIER = P_ID
	  AND A.ITEM_ID > 0
	  AND B.CUSTOMER_ID(+) = P_RID
	  AND A.ITEM_ID = B.NEW_ITEM_ID(+)
	ORDER BY A.ITEM_ID
;

/* �\�[�g�敪�ύX�p */
CURSOR C_007 IS
	SELECT
		SORT_DIV
	 FROM WEB_TP0061140_W
	WHERE CUSTOMER_ID = P_RID
	  AND PROCESS_DIV NOT IN ('3','4')
	  AND SORT_DIV IS NOT NULL
	ORDER BY SORT_DIV
	FOR UPDATE
;

/* �\�[�g�����쐬�p */
CURSOR C_008(P_ID NUMBER) IS
	SELECT
		MANAGEMENT_NAME,
		SORT_DIV,
		SORT_METHOD
	 FROM WEB_TP0061120_M
	WHERE IDENTIFIER = P_ID
	  AND ITEM_ID > 0
	  AND SORT_DIV IS NOT NULL
	  AND SORT_DIV > 0
	ORDER BY SORT_DIV
;

/* �L�[�� */
CURSOR C_009(P_ID NUMBER) IS
	SELECT
		ITEM_NAME,
		KEY_CONF,
		DATA_TYPE,
		NVL(DATA_SIZE,0)     DATA_SIZE,
		NVL(FRACTION_SIZE,0) FRACTION_SIZE
	 FROM WEB_TP0061120_M
	WHERE IDENTIFIER = P_ID
	  AND KEY_CONF > 0
	  AND KEY_CONF IS NOT NULL
	ORDER BY KEY_CONF
	FOR UPDATE
;

/* ���_�ݒ� */
CURSOR C_010(P_ID1 NUMBER,P_ID2 NUMBER) IS
	SELECT
		ITEM_NAME
	 FROM WEB_TP0061120_M
	WHERE IDENTIFIER = P_ID1
	  AND TIME_CONF = P_ID2
;

/* ���_�ݒ�ȊO�̃L�[���� */
CURSOR C_011(P_ID NUMBER) IS
	SELECT
		ITEM_NAME
	 FROM WEB_TP0061120_M
	WHERE IDENTIFIER = P_ID
	  AND (TIME_CONF = 0 OR TIME_CONF IS NULL)
	  AND (KEY_CONF > 0 AND KEY_CONF IS NOT NULL)
	ORDER BY KEY_CONF
;

/* ��ЃR�[�h�擾 */
CURSOR C_012 IS
	SELECT KAISYACD
	  FROM KAISYA_MS
;

/* �O����p�̌���h�c�擾 */
CURSOR C_013 IS
	SELECT LANGUAGEID
	  FROM CMN_LANGUAGE_MS
	 WHERE LANGUAGEID <> 0
	 GROUP BY LANGUAGEID
;

/* �o�^���(�O���[�v�\����) */
CURSOR C_031(P_ID NUMBER) IS
	SELECT
		DISP_ORDER,DIV
	 FROM WEB_TP0000010_M
	WHERE GROUP_DIV = P_GROUP
	  AND DIV <> P_ID
	ORDER BY DISP_ORDER,DIV
	FOR UPDATE
;

/* �Ɖ���(�O���[�v�\����) */
CURSOR C_032(P_ID NUMBER) IS
	SELECT
		DISP_ORDER,CATEGORY_DIV
	 FROM WEB_TP0010010_M
	WHERE GROUP_DIV = P_GROUP
	  AND CATEGORY_DIV <> P_ID
	ORDER BY DISP_ORDER,CATEGORY_DIV
	FOR UPDATE
;

CURSOR C_041 IS
	SELECT
		A.ITEM_ID          OLD_ID,
		A.DATA_TYPE            ���^�C�v,
		A.DATA_SIZE-NVL(A.FRACTION_SIZE,0) ���T�C�Y,
		NVL(A.FRACTION_SIZE,0) �������T�C�Y,
		B.NEW_ITEM_ID        NEW_ID,
		B.DATA_TYPE            �V�^�C�v,
		B.DATA_SIZE            �V�T�C�Y,
		NVL(B.FRACTION_SIZE,0) �V�����T�C�Y
	 FROM WEB_TP0061120_M A
	     ,WEB_TP0061140_W B
	WHERE A.IDENTIFIER = P_KEY
	  AND B.CUSTOMER_ID=P_RID
	  AND A.ITEM_ID=B.ITEM_ID
	  AND B.PROCESS_DIV<>'3'
	;

CURSOR C_051 IS
	SELECT
		A.SUPPORT_DIV_DEST        SUPPORT_DIV_DEST
	 FROM WEB_TP0061140_W A
	 WHERE A.CUSTOMER_ID=P_RID
	   AND A.SUPPORT_DIV IN (1,3)
	   AND A.SUPPORT_DIV_DEST IS NOT NULL
	ORDER BY A.ITEM_ID
	FOR UPDATE
	;

CURSOR C_052 IS
	SELECT
		A.SUPPORT_DIV_DEST        SUPPORT_DIV_DEST
	 FROM WEB_TP0000020_M A
	WHERE A.DIV=W_TSID
	  AND A.SUPPORT_DIV IN (1,3)
	  AND A.SUPPORT_DIV_DEST IS NOT NULL
	ORDER BY A.ITEM_ORDER
	FOR UPDATE
	;

/* �V�E���h�c�ϊ������p */
CURSOR C_061 IS
	SELECT
		ITEM_ID   IDENTIFIER,
		NEW_ITEM_ID NEW_ID
	 FROM WEB_TP0061140_W
	WHERE CUSTOMER_ID = P_RID
	  AND ITEM_ID <> NEW_ITEM_ID
	  AND PROCESS_DIV NOT IN ('1','3')
	ORDER BY ITEM_ID
;

/* �V�E���h�c�ϊ�����(�Е�)�p */
CURSOR C_071(P_ID1 NUMBER,P_ID2 NUMBER) IS
	SELECT
		ITEM_ORDER
	  FROM WEB_TP0061141_W
	 WHERE CUSTOMER_ID = P_RID
	   AND TBL_DIV = 2
	   AND CATEGORY_DIV = P_ID1
	   AND ITEM_NAME = 'F' || TO_CHAR(P_ID2,'FM000')
	ORDER BY ITEM_ORDER
;


CURSOR C_081(P_TSID NUMBER) IS
	SELECT B.KAISYACD,NVL(B.CATEGORY_NAME,A.CATEGORY_NAME) CATEGORY_NAME
	  FROM WEB_TP0000010_M A
		  ,WEB_TP0000011_M B
	 WHERE A.DIV = B.DIV
	   AND B.DIV = P_TSID
	;
	
CURSOR C_082 IS
	SELECT A.DIV DIV, A.MANAGEMENT_KAISYACD KAISYACD, A.CATEGORY_NAME CATEGORY_NAME
	  FROM WEB_TP0000010_M A
	 WHERE A.DIV = W_TSID
	   AND A.MANAGEMENT_KAISYACD = P_MKAISYA
;

CURSOR C_091(P_TSID NUMBER) IS
	SELECT B.KAISYACD,NVL(B.CATEGORY_NAME,A.CATEGORY_NAME) CATEGORY_NAME
	  FROM WEB_TP0010010_M A
		  ,WEB_TP0010011_M B
	 WHERE A.CATEGORY_DIV = B.CATEGORY_DIV
	   AND B.CATEGORY_DIV = P_TSID
	;

CURSOR C_092 IS
	SELECT A.CATEGORY_DIV CATEGORY_DIV, A.MANAGEMENT_KAISYACD KAISYACD, A.CATEGORY_NAME CATEGORY_NAME
	  FROM WEB_TP0010010_M A
	 WHERE A.CATEGORY_DIV = W_TSID
	   AND A.MANAGEMENT_KAISYACD = P_MKAISYA
;

/************************************************************************/
/* �֐����FSUBL_P_UPD_TDFLDID()											*/
/* �@�@�\�F���̓`�F�b�N�E��o�����ݒ�E�O����e�[�u���̐V�h�c�̕ύX����	*/
/************************************************************************/
PROCEDURE SUBL_P_UPD_TDFLDID(
	PW_TDKBN	IN  NUMBER,			/* �͏o�敪 */
	PW_OLDID	IN  NUMBER,			/* ���h�c */
	PW_NEWID	IN  NUMBER			/* �V�h�c */
)
IS

BEGIN
	/* �Q�Ɛ��� */
	UPDATE WEB_TP0061160_M
	   SET ITEM_ID = PW_NEWID
	      ,UPDATE_DATE = SYSDATE
	      ,UPDATE_USER = P_UPDID
	 WHERE SYSTEM_DIV = 2
	   AND IDENTIFIER = PW_TDKBN
	   AND ITEM_ID = PW_OLDID
	;

	/* �������(�Y������) */
	UPDATE WEB_TP0061170_M
	   SET ITEM_ID = PW_NEWID
	      ,UPDATE_DATE = SYSDATE
	      ,UPDATE_USER = P_UPDID
	 WHERE SYSTEM_DIV = 2
	   AND IDENTIFIER = PW_TDKBN
	   AND ITEM_ID = PW_OLDID
	;

	/* �������(�Q�ƌ�) */
	UPDATE WEB_TP0061170_M
	   SET COMPARISON_SRC_REFERENCE = PW_NEWID
	      ,UPDATE_DATE = SYSDATE
	      ,UPDATE_USER = P_UPDID
	 WHERE SYSTEM_DIV = 2
	   AND IDENTIFIER = PW_TDKBN
	   AND COMPARISON_SRC_DIV='1'
	   AND COMPARISON_SRC_REFERENCE = PW_OLDID
	;

	UPDATE WEB_TP0061170_M
	   SET COMPARISON_REFERENCE1 = PW_NEWID
	      ,UPDATE_DATE = SYSDATE
	      ,UPDATE_USER = P_UPDID
	 WHERE SYSTEM_DIV = 2
	   AND IDENTIFIER = PW_TDKBN
	   AND COMPARISON_DIV1='1'
	   AND COMPARISON_REFERENCE1 = PW_OLDID
	;

	UPDATE WEB_TP0061170_M
	   SET COMPARISON_REFERENCE2 = PW_NEWID
	      ,UPDATE_DATE = SYSDATE
	      ,UPDATE_USER = P_UPDID
	 WHERE SYSTEM_DIV = 2
	   AND IDENTIFIER = PW_TDKBN
	   AND COMPARISON_DIV2='1'
	   AND COMPARISON_REFERENCE2 = PW_OLDID
	;

	UPDATE WEB_TP0061171_M
	   SET ITEM_ID = PW_NEWID
	      ,UPDATE_DATE = SYSDATE
	      ,UPDATE_USER = P_UPDID
	 WHERE SYSTEM_DIV = 2
	   AND IDENTIFIER = PW_TDKBN
	   AND ITEM_ID = PW_OLDID
	;

	/* ��o�����ݒ� */
	W_SQL := 'UPDATE WEB_TP1000050_M';
	W_SQL := W_SQL || '   SET ITEM_ORDER=' || PW_NEWID;
	W_SQL := W_SQL || '      ,UPDATE_DATE=SYSDATE';
	W_SQL := W_SQL || '      ,UPDATE_USER=:ORA_1';
	W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || PW_TDKBN;
	W_SQL := W_SQL || ' AND REFERENCE_DIV =''1''';
	W_SQL := W_SQL || ' AND ITEM_ORDER =' || PW_OLDID;
	DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
	DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
	W_RVL := DBMS_SQL.EXECUTE(W_CSR);

	/* �O����e�[�u���̍X�V */
	W_SQL := 'UPDATE WEB_TP1000022_M SET';
	W_SQL := W_SQL || ' IDENTIFIER = :ORA_1';
	W_SQL := W_SQL || ' ,UPDATE_DATE=SYSDATE';
	W_SQL := W_SQL || ' ,UPDATE_USER=:ORA_4';
	W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV = :ORA_2';
	W_SQL := W_SQL || '   AND IDENTIFIER = :ORA_3';
	DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
	DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',PW_NEWID);
	DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',PW_TDKBN);
	DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_3',PW_OLDID);
	DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_4',P_UPDID);
	W_RVL := DBMS_SQL.EXECUTE(W_CSR);
	
	W_SQL := 'UPDATE WEB_TP1000023_M SET';
	W_SQL := W_SQL || ' IDENTIFIER = :ORA_1';
	W_SQL := W_SQL || ' ,UPDATE_DATE=SYSDATE';
	W_SQL := W_SQL || ' ,UPDATE_USER=:ORA_4';
	W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV = :ORA_2';
	W_SQL := W_SQL || '   AND IDENTIFIER = :ORA_3';
	DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
	DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',PW_NEWID);
	DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',PW_TDKBN);
	DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_3',PW_OLDID);
	DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_4',P_UPDID);
	W_RVL := DBMS_SQL.EXECUTE(W_CSR);

END;

 BEGIN

/**********************************************************************/
/* ��������                                                           */
/**********************************************************************/
	P_ERR := 0;
	W_LGSNO := 0;
	W_WKTBSP := WEB_SP0002000_F(10);
	W_STYPE := WEB_SP0002000_F(1);
	W_SNAME := WEB_SP0002000_F(3);

	W_TDKFLG := 0;
	/* ���I�r�p�k�J�[�\���I�[�v�� */
	W_CSR := DBMS_SQL.OPEN_CURSOR;
	W_CSR2 := DBMS_SQL.OPEN_CURSOR;

	FOR W_I IN 1..16 LOOP
		W_21REC_V(W_I) := NULL;
		W_21REC_N(W_I) := -1;
	END LOOP;

	FOR W_I IN 1..5 LOOP
		W_SDATA(W_I) := NULL;
	END LOOP;

	IF P_KEY <= 99 THEN
		W_NEWKBN := 0;
	ELSE
		W_NEWKBN := 1;
	END IF;

/**********************************************************************/
/* ���O���[�N�폜����                                                 */
/**********************************************************************/
	/* ���O�擾���f�t���O��` */
	WEB_SP0003160_S(W_LOGSET,W_LGGET,W_LGIUD);
	IF W_LOGSET = 1 THEN
		WEB_SP0003111_S(1,0,0,0,'WEB_SP0060910_S','','',0,W_LGGET,W_LGIUD,P_UPDID,P_RID,W_ERR);
		IF W_ERR <> 0 THEN
			P_ERR := -1;
			GOTO L_EXIT;
		END IF;
	END IF;

/**********************************************************************/
/* �e�[�u�����b�N����                                                 */
/**********************************************************************/
	LOCK TABLE WEB_TP0061110_M IN EXCLUSIVE MODE;

/**********************************************************************/
/* �͏o�V�X�e���A�g���                                               */
/**********************************************************************/
	IF P_SKBN = 2 AND P_UPDKBN <> 1 THEN
		SELECT COUNT(*) INTO W_CNT
		 FROM WEB_TP0060010_M
		WHERE DIV1 = 4;

		IF W_CNT > 0 THEN
			W_SQL := 'SELECT NOTIFICATION_DIV';
			W_SQL := W_SQL || ' FROM WEB_TP1000010_M';
			W_SQL := W_SQL || ' WHERE FREE_ITEM_LINK=' || P_KEY;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_TDKFLG);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
			IF W_RVL > 0 THEN
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_TDKFLG);
			END IF;
			IF W_TDKFLG IS NULL THEN
				W_TDKFLG := 0;
			ELSE
				IF W_TDKFLG < 900 THEN
					W_TABLE3 := 'WEB_TP1001' || TO_CHAR(W_TDKFLG-800,'FM000') || '_T'; 
					W_TABLE4 := 'WEB_TP1001' || TO_CHAR(W_TDKFLG-800,'FM000') || '_T_BAK'; 
					W_INDEX3 := 'WEB_IP1001' || TO_CHAR(W_TDKFLG-800,'FM000') || '_T'; 
					W_INDEX4 := 'WEB_IP1001' || TO_CHAR(W_TDKFLG-800,'FM000') || '_T1';
				ELSE
					W_TABLE3 := 'WEB_TP092' || TO_CHAR(W_TDKFLG - 10000,'FM0000') || '_T'; 
					W_TABLE4 := 'WEB_TP092' || TO_CHAR(W_TDKFLG - 10000,'FM0000') || '_T_BAK'; 
					W_INDEX3 := 'WEB_IP092' || TO_CHAR(W_TDKFLG - 10000,'FM0000') || '_T'; 
					W_INDEX4 := 'WEB_IP092' || TO_CHAR(W_TDKFLG - 10000,'FM0000') || '_T1';
				END IF;
				/* �q�̃f�[�^�������ЃR�[�h���i�[ */
				W_KCNT2 := 0;
				FOR C_012_REC IN C_012 LOOP
					W_SQL := 'SELECT COUNT(*)';
					W_SQL := W_SQL || ' FROM WEB_TP1000021_M';
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_0';
					W_SQL := W_SQL || '   AND NOTIFICATION_DIV = ' || W_TDKFLG;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_0',C_012_REC.KAISYACD);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KCNT1);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KCNT1);
					IF W_KCNT1 > 0 THEN
						W_KCNT2 := W_KCNT2 + 1;
						W_KCD(W_KCNT2) := C_012_REC.KAISYACD;
					END IF;
				END LOOP;
			END IF;
		END IF;
	END IF;

/**********************************************************************/
/* ���[�N�쐬����                                                     */
/**********************************************************************/
	IF P_SKBN = 1 THEN
		/* �O�񃏁[�N�폜 */
		DELETE FROM WEB_TP0061140_W
		 WHERE CUSTOMER_ID = P_RID
		;

		/* ���f�[�^�ǉ� */
		IF P_UPDKBN = 2 THEN
			INSERT INTO WEB_TP0061140_W(
				CUSTOMER_ID,
				ITEM_ID,
				ITEM_NAME,
				MANAGEMENT_NAME,
				DATA_TYPE,
				DATA_SIZE,
				FRACTION_SIZE,
				KEY_CONF,
				TIME_CONF,
				SORT_DIV,
				SORT_METHOD,
				REQUIRE_DIV,
				IME_DIV,
				INPUT_DIV,
				REFERENCE_DIV,
				MASTER_ID,
				LITERAL_CONTENT,
				INPUT_AREA_FORM,
				MULTI_ROW_DISP_COUNT,
				SUPPORT_DIV,
				SUPPORT_DIV_DEST,
				DISP_ORDER,
				STATISTICS_SEARCH_DIV,
				STATISTICS_AGGREGATE_DIV,
				REGISTER_ITEM_ORDER,
				INQUIRY_ITEM_ORDER1,
				INQUIRY_ITEM_ORDER2,
				PERSONAL_INFO_ROW,
				PERSONAL_INFO_COLUMN,
				PERSONAL_INFO_WIDTH1,
				PERSONAL_INFO_WIDTH2,
				PERSONAL_INFO_ALIGN,
				REGISTER_USE_DIV,
				REGISTER_CONTROL_DIV,
				REGISTER_TAKE_DIV,
				REGISTER_REQUIRE_DIV,
				REGISTER_HEADER_NAME,
				REMARKS,
				PROCESS_DIV)
			SELECT
				P_RID,
				A.ITEM_ID,
				A.ITEM_NAME,
				A.MANAGEMENT_NAME,
				A.DATA_TYPE,
				A.DATA_SIZE - NVL(A.FRACTION_SIZE,0),
				A.FRACTION_SIZE,
				A.KEY_CONF,
				A.TIME_CONF,
				A.SORT_DIV,
				A.SORT_METHOD,
				A.REQUIRE_DIV,
				A.IME_DIV,
				A.INPUT_DIV,
				A.REFERENCE_DIV,
				A.MASTER_ID,
				A.LITERAL_CONTENT,
				A.INPUT_AREA_FORM,
				A.MULTI_ROW_DISP_COUNT,
				A.SUPPORT_DIV,
				A.SUPPORT_DIV_DEST,
				A.DISP_ORDER,
				A.STATISTICS_SEARCH_DIV,
				A.STATISTICS_AGGREGATE_DIV,
				A.REGISTER_ITEM_ORDER,
				A.INQUIRY_ITEM_ORDER1,
				A.INQUIRY_ITEM_ORDER2,
				A.PERSONAL_INFO_ROW,
				A.PERSONAL_INFO_COLUMN,
				A.PERSONAL_INFO_WIDTH1,
				A.PERSONAL_INFO_WIDTH2,
				A.PERSONAL_INFO_ALIGN,
				B.USAGE_DIV,
				B.MANAGEMENT_DIV,
				B.TAKE_DIV,
				B.REQUIRE_DIV,
				B.HEADER_NAME,
				A.REMARKS,
				'0'
			 FROM WEB_TP0061120_M A,
			      WEB_TP0000020_M B
			WHERE A.IDENTIFIER = P_KEY
			  AND B.DIV (+) = DECODE(W_NEWKBN,0,(P_KEY + 700),(P_KEY + 10000))
			  AND A.ITEM_NAME = B.ITEM_NAME(+)
			;
		END IF;

/**********************************************************************/
/* �o�^����                                                           */
/**********************************************************************/
	ELSE
	/**********************************************************************/
	/* ���̓`�F�b�N                                                       */
	/**********************************************************************/
		IF P_UPDKBN = 1 THEN
		/**********************************************************************/
		/* ����敪�`�F�b�N                                                   */
		/**********************************************************************/
			SELECT COUNT(*) INTO W_CNT
			  FROM WEB_TP0061110_M
			 WHERE IDENTIFIER = P_KEY
			;
			IF W_CNT > 0 THEN
				P_ERR := 3;
				GOTO L_EXIT;
			END IF;
		END IF;

		IF P_UPDKBN = 1 OR P_UPDKBN = 2 THEN
		/**********************************************************************/
		/* ���ꍀ�ڑ��݃`�F�b�N                                               */
		/**********************************************************************/
			SELECT COUNT(*) INTO W_CNT
			  FROM (SELECT MANAGEMENT_NAME
					 FROM WEB_TP0061140_W
				    WHERE CUSTOMER_ID = P_RID
			 		  AND PROCESS_DIV <> '3'
				   HAVING COUNT(*) > 1
				    GROUP BY MANAGEMENT_NAME) A
			;
			IF W_CNT > 0 THEN
				P_ERR := 2;
				GOTO L_EXIT;
			END IF;

		/**********************************************************************/
		/* ���ږ��쐬�`�F�b�N                                                 */
		/**********************************************************************/
			SELECT COUNT(*) INTO W_CNT
			  FROM WEB_TP0061140_W
			 WHERE CUSTOMER_ID = P_RID
			   AND ITEM_ID > 0
			   AND PROCESS_DIV <> '3'
			;
		
			IF W_CNT = 0 THEN
				P_ERR := 1;
				GOTO L_EXIT;
			END IF;

		/**********************************************************************/
		/* �͈͐ݒ�`�F�b�N                                                   */
		/**********************************************************************/
--			IF P_SRTKBN = '1' THEN
--				SELECT MAX(�^�C�v) INTO W_SQL
--				  FROM WEB_TP0061140_W
--				 WHERE ���p�҂h�c = P_RID
--				   AND �����敪 <> '3'
--				   AND �\�[�g�敪 IN (
--					SELECT MIN(�\�[�g�敪)
--					  FROM WEB_TP0061140_W
--					 WHERE ���p�҂h�c = P_RID
--					   AND �����敪 <> '3')
--				;
		
--				IF W_SQL <> 'DATE' THEN
--					P_ERR := 4;
--					GOTO L_EXIT;
--				END IF;
--			END IF;

		/**********************************************************************/
		/* �L�[�ݒ�`�F�b�N                                                   */
		/**********************************************************************/
			IF P_KEYUSE <> '0' THEN
				SELECT COUNT(*) INTO W_CNT
				  FROM WEB_TP0061140_W
				 WHERE CUSTOMER_ID = P_RID
				   AND KEY_CONF <> 0
				   AND PROCESS_DIV <> '3'
				;
		
				IF W_CNT = 0 THEN
					P_ERR := 5;
					GOTO L_EXIT;
				END IF;

				SELECT COUNT(*) INTO W_CNT
				  FROM WEB_TP0061140_W
				 WHERE CUSTOMER_ID = P_RID
				   AND SORT_DIV IS NOT NULL
			       AND SORT_DIV > 0
				   AND PROCESS_DIV <> '3'
				;
		
				IF W_CNT = 0 THEN
					P_ERR := 7;
					GOTO L_EXIT;
				END IF;
			END IF;

		/**********************************************************************/
		/* ���_�ݒ�`�F�b�N                                                   */
		/**********************************************************************/
			IF P_JITEN <> '0' THEN
			/**********************************************************************/
			/* �s�����f�[�^�N���A����                                             */
			/**********************************************************************/
				IF P_JITEN = '1' THEN
					UPDATE WEB_TP0061140_W SET
						TIME_CONF = NULL
					 WHERE CUSTOMER_ID = P_RID
					   AND DATA_TYPE <> 'DATE'
					;
				ELSIF P_JITEN = '2' THEN
					UPDATE WEB_TP0061140_W SET
						TIME_CONF = NULL
					 WHERE CUSTOMER_ID = P_RID
					   AND SUPPORT_DIV <> 12
					;
				ELSIF P_JITEN = '3' THEN
					UPDATE WEB_TP0061140_W SET
						TIME_CONF = NULL
					 WHERE CUSTOMER_ID = P_RID
					   AND SUPPORT_DIV <> 18
					;
				ELSIF P_JITEN = '4' THEN
					UPDATE WEB_TP0061140_W SET
						TIME_CONF = NULL
					 WHERE CUSTOMER_ID = P_RID
					   AND (MASTER_ID IS NULL 
						OR MASTER_ID NOT IN (50,68))
					;
				ELSIF P_JITEN = '5' THEN
					UPDATE WEB_TP0061140_W SET
						TIME_CONF = NULL
					 WHERE CUSTOMER_ID = P_RID
					   AND SUPPORT_DIV NOT IN (20,21)
					;
				END IF;

			/**********************************************************************/
			/* �L�[���ڂ��g�p���̃`�F�b�N                                         */
			/**********************************************************************/
				IF P_KEYUSE = '0' AND P_JITEN <> '5' THEN
					P_ERR := 11;
					GOTO L_EXIT;
				END IF;

			/**********************************************************************/
			/* ���ڑ��̎��_�ݒ��ݒ�ς��̃`�F�b�N                               */
			/**********************************************************************/
				SELECT COUNT(*) INTO W_CNT
				  FROM WEB_TP0061140_W
				 WHERE CUSTOMER_ID = P_RID
				   AND TIME_CONF <> 0 AND TIME_CONF IS NOT NULL
				   AND PROCESS_DIV <> '3'
				;
				IF (P_JITEN IN ('4','5') AND W_CNT <= 1) OR W_CNT = 0 THEN
					P_ERR := 12;
					GOTO L_EXIT;
				END IF;

			/**********************************************************************/
			/* �L�[���ڂ�ΏۂƂ��Ă��邩�̃`�F�b�N                               */
			/**********************************************************************/
				IF P_JITEN <> '5' THEN
					SELECT COUNT(*) INTO W_CNT
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND PROCESS_DIV <> '3'
					   AND (TIME_CONF <> 0 AND TIME_CONF IS NOT NULL)
					   AND (KEY_CONF = 0 OR KEY_CONF IS NOT NULL)
					;
					IF W_CNT = 0 THEN
						P_ERR := 13;
						GOTO L_EXIT;
					END IF;
				END IF;

			/**********************************************************************/
			/* ���_���ڐ��`�F�b�N                                                 */
			/**********************************************************************/
				SELECT COUNT(*) INTO W_CNT
				  FROM WEB_TP0061140_W
				 WHERE CUSTOMER_ID = P_RID
				   AND PROCESS_DIV <> '3'
				   AND TIME_CONF ='1'
				;
				IF W_CNT > 1 THEN
					P_ERR := 14;
					GOTO L_EXIT;
				END IF;
				IF P_JITEN IN ('4','5') THEN
					SELECT COUNT(*) INTO W_CNT
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND PROCESS_DIV <> '3'
					   AND TIME_CONF ='2'
					;
					IF W_CNT > 1 THEN
						P_ERR := 14;
						GOTO L_EXIT;
					END IF;
				END IF;
			ELSE
			/**********************************************************************/
			/* �J�n�E�I���^�C�v�̃`�F�b�N                                         */
			/**********************************************************************/
				SELECT COUNT(*) INTO W_CNT
				  FROM WEB_TP0061140_W
				 WHERE CUSTOMER_ID = P_RID
				   AND PROCESS_DIV <> '3'
				   AND SUPPORT_DIV IS NOT NULL
				   AND SUPPORT_DIV IN (20,21)
				;
	
				IF W_CNT = 1 THEN
					P_ERR := 15;
					GOTO L_EXIT;
				END IF;
	
				SELECT COUNT(*) INTO W_CNT
				  FROM WEB_TP0061140_W
				 WHERE CUSTOMER_ID = P_RID
				   AND PROCESS_DIV <> '3'
				   AND SUPPORT_DIV IS NOT NULL
				   AND SUPPORT_DIV IN (20)
				;
	
				IF W_CNT > 1 THEN
					P_ERR := 16;
					GOTO L_EXIT;
				END IF;
	
				SELECT COUNT(*) INTO W_CNT
				  FROM WEB_TP0061140_W
				 WHERE CUSTOMER_ID = P_RID
				   AND PROCESS_DIV <> '3'
				   AND SUPPORT_DIV IS NOT NULL
				   AND SUPPORT_DIV IN (21)
				;

				IF W_CNT > 1 THEN
					P_ERR := 16;
					GOTO L_EXIT;
				END IF;
			END IF;
		END IF;
	/**********************************************************************/
	/* �e�[�u�����擾����                                                 */
	/**********************************************************************/
		W_KEY := P_KEY;
		IF W_NEWKBN = 0 THEN
			IF P_TBKBN = 1 THEN
				W_TABLE1 := 'WEB_TP0002' || TO_CHAR(W_KEY,'FM000') || '_T'; 
			ELSE
				W_TABLE1 := 'WEB_VP0006' || TO_CHAR(W_KEY,'FM000'); 
			END IF;
			W_TABLE2 := 'WEB_TP0002' || TO_CHAR(W_KEY,'FM000') || '_T_BAK'; 
			W_INDEX1 := 'WEB_IP0002' || TO_CHAR(W_KEY,'FM000') || '_T'; 
			W_INDEX2 := 'WEB_IP0002' || TO_CHAR(W_KEY,'FM000') || '_T1';
			W_TSID  := W_KEY + 700;
			W_TSID1 := W_KEY + 800;
			W_TSID2 := W_KEY + 900;
			W_TABLE5 := 'WEB_TP0004' || TO_CHAR(W_TSID,'FM000') || '_T';
			W_TABLE6 := 'WEB_TP0004' || TO_CHAR(W_TSID,'FM000') || '_T_BAK';
			W_INDEX5 := 'WEB_IP0004' || TO_CHAR(W_TSID,'FM000') || '_T';
		ELSE
			IF P_TBKBN = 1 THEN
				W_TABLE1 := 'WEB_TP090' || TO_CHAR(W_KEY,'FM0000') || '_T'; 
			ELSE
				W_TABLE1 := 'WEB_VP090' || TO_CHAR(W_KEY,'FM0000'); 
			END IF;
			W_TABLE2 := 'WEB_TP090' || TO_CHAR(W_KEY,'FM0000') || '_T_BAK'; 
			W_INDEX1 := 'WEB_IP090' || TO_CHAR(W_KEY,'FM0000') || '_T'; 
			W_INDEX2 := 'WEB_IP090' || TO_CHAR(W_KEY,'FM0000') || '_T1';
			W_TSID  := W_KEY + 10000;
			W_TSID1 := W_KEY + 30000;
			W_TSID2 := W_KEY + 50000;
			W_TABLE5 := 'WEB_TP091' || TO_CHAR(W_KEY,'FM0000') || '_T';
			W_TABLE6 := 'WEB_TP091' || TO_CHAR(W_KEY,'FM0000') || '_T_BAK';
			W_INDEX5 := 'WEB_IP091' || TO_CHAR(W_KEY,'FM0000') || '_T';
		END IF;

		/**********************************************************************/
		/* �l���̃f�[�^���f                                               */
		/**********************************************************************/
		IF P_TBKBN = 1 AND P_UPDKBN = 2 THEN	/* �ύX�Œʏ펞 */
			W_DTFLG := 0;
			IF P_RKBN = '1' THEN	/* ���̏ꍇ */
				/* �l���Ƀf�[�^�����݂��邩�`�F�b�N */
				W_SQL := 'SELECT COUNT(*) FROM ' || W_TABLE1;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_CNT);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				IF W_RVL > 0 THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_CNT);
				ELSE
					W_CNT := 0;
				END IF;
				IF W_CNT > 0 THEN
					W_DTFLG := 1;
				END IF;
			ELSE
				W_DTFLG := 1;
			END IF;
		END IF;

	/**********************************************************************/
	/* �ǉ��E�ύX����                                                     */
	/**********************************************************************/
		IF P_UPDKBN = 1 OR P_UPDKBN = 2 THEN
		/**********************************************************************/
		/* �\�����X�V����                                                     */
		/**********************************************************************/
			W_CNT := 0;
			FOR C_002_REC IN C_002 LOOP
				IF C_002_REC.PROCESS_DIV <> '3' AND C_002_REC.PROCESS_DIV <> '4' THEN
					W_CNT := W_CNT + 1;
					UPDATE WEB_TP0061140_W SET
						DISP_ORDER = W_CNT
					 WHERE CUSTOMER_ID = P_RID
					   AND ITEM_ID = C_002_REC.ITEM_ID
					;
				END IF;
			END LOOP;

		/**********************************************************************/
		/* �\�[�g�敪�X�V����                                                 */
		/**********************************************************************/
			W_CNT := 0;
			FOR C_007_REC IN C_007 LOOP
				W_CNT := W_CNT + 1;
				UPDATE WEB_TP0061140_W SET
					SORT_DIV = W_CNT
				WHERE CURRENT OF C_007
				;
			END LOOP;

		/**********************************************************************/
		/* �L�[�ݒ�X�V����                                                   */
		/**********************************************************************/
			IF P_KEYUSE = '0' THEN		/* �L�[�w��g�p�F���Ȃ� */
				UPDATE WEB_TP0061140_W SET
					KEY_CONF = NULL
				 WHERE CUSTOMER_ID = P_RID
				   AND KEY_CONF IS NOT NULL
				;
			END IF;

		/**********************************************************************/
		/* ���̓`�F�b�N�E��o�����E�O������̍폜�i�͏o�A�g���j             */
		/**********************************************************************/
			IF W_TDKFLG > 0 AND P_UPDKBN = 2 THEN
				/* �Q�Ɛ��� */
				DELETE FROM WEB_TP0061160_M
				 WHERE SYSTEM_DIV = 2
				   AND IDENTIFIER = W_TDKFLG
				   AND ITEM_ID IN (
					SELECT ITEM_ID
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND PROCESS_DIV = '3')
				;

				/* �������(�Y������) */
				DELETE FROM WEB_TP0061170_M
				 WHERE SYSTEM_DIV = 2
				   AND IDENTIFIER = W_TDKFLG
				   AND ITEM_ID IN (
					SELECT ITEM_ID
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND PROCESS_DIV = '3')
				;

				/* �������(�Q�ƌ�) */
				DELETE FROM WEB_TP0061170_M
				 WHERE SYSTEM_DIV = 2
				   AND IDENTIFIER = W_TDKFLG
				   AND ITEM_ID IN (
					 SELECT DISTINCT ITEM_ID
					   FROM WEB_TP0061170_M
				 	  WHERE SYSTEM_DIV = 2
					    AND IDENTIFIER = W_TDKFLG
					    AND ((COMPARISON_SRC_DIV='1' AND COMPARISON_SRC_REFERENCE IN (SELECT ITEM_ID  FROM WEB_TP0061140_W WHERE CUSTOMER_ID = P_RID AND PROCESS_DIV = '3'))
					     OR  (COMPARISON_DIV1='1' AND COMPARISON_REFERENCE1 IN (SELECT ITEM_ID  FROM WEB_TP0061140_W WHERE CUSTOMER_ID = P_RID AND PROCESS_DIV = '3'))
					     OR  (COMPARISON_DIV2='1' AND COMPARISON_REFERENCE2 IN (SELECT ITEM_ID  FROM WEB_TP0061140_W WHERE CUSTOMER_ID = P_RID AND PROCESS_DIV = '3'))))
				;

				DELETE FROM WEB_TP0061171_M
				 WHERE SYSTEM_DIV = 2
				   AND IDENTIFIER = W_TDKFLG
				   AND ITEM_ID IN (
					SELECT ITEM_ID
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND PROCESS_DIV = '3')
				;

				/* ��o�����ݒ� */
				W_SQL := 'DELETE FROM WEB_TP1000050_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				W_SQL := W_SQL || '   AND REFERENCE_DIV = ''1''';
				W_SQL := W_SQL || '   AND ITEM_ORDER IN (';
				W_SQL := W_SQL || '    SELECT ITEM_ID';
				W_SQL := W_SQL || '      FROM WEB_TP0061140_W';
				W_SQL := W_SQL || '     WHERE CUSTOMER_ID =' || P_RID;
				W_SQL := W_SQL || '       AND PROCESS_DIV = ''3'')';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �O������폜 */
				W_SQL := 'DELETE FROM WEB_TP1000022_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				W_SQL := W_SQL || '   AND IDENTIFIER IN (';
				W_SQL := W_SQL || '    SELECT ITEM_ID';
				W_SQL := W_SQL || '      FROM WEB_TP0061140_W';
				W_SQL := W_SQL || '     WHERE CUSTOMER_ID =' || P_RID;
				W_SQL := W_SQL || '       AND PROCESS_DIV = ''3'')';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000023_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				W_SQL := W_SQL || '   AND IDENTIFIER IN (';
				W_SQL := W_SQL || '    SELECT ITEM_ID';
				W_SQL := W_SQL || '      FROM WEB_TP0061140_W';
				W_SQL := W_SQL || '     WHERE CUSTOMER_ID =' || P_RID;
				W_SQL := W_SQL || '       AND PROCESS_DIV = ''3'')';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;

		/**********************************************************************/
		/* �V���ڂh�c�E���ڍX�V����                                           */
		/**********************************************************************/
			W_CNT := 0;
			IF P_TBKBN <> 1 THEN
				UPDATE WEB_TP0061140_W SET
					NEW_ITEM_ID = ITEM_ID
				 WHERE CUSTOMER_ID = P_RID
				   AND ITEM_ID IN (0,-1)
				;
			END IF;

			FOR C_001_REC IN C_001 LOOP
				IF C_001_REC.PROCESS_DIV <> '3' AND C_001_REC.PROCESS_DIV <> '4' THEN
					W_CNT := W_CNT + 1;
					UPDATE WEB_TP0061140_W SET
						NEW_ITEM_ID = W_CNT,
						ITEM_NAME = DECODE(P_TBKBN,1,'F' || TO_CHAR(W_CNT,'FM000'),ITEM_NAME)
					 WHERE CUSTOMER_ID = P_RID
					   AND ITEM_ID = C_001_REC.ITEM_ID
					;
				END IF;
			END LOOP;

		/**********************************************************************/
		/* �V�E���h�c�ύX�擾                                                 */
		/**********************************************************************/
			IF P_UPDKBN = 2 THEN
				W_CHGCNT := 0;
				FOR C_061_REC IN C_061 LOOP
					W_CHGCNT := W_CHGCNT + 1;
					W_OLDID(W_CHGCNT) := C_061_REC.IDENTIFIER;
					W_NEWID(W_CHGCNT) := C_061_REC.NEW_ID;
				END LOOP;
				/* ���X�V�� */
				SELECT MAX(ITEM_ORDER) INTO W_ITM_ID5 FROM WEB_TP0000020_M WHERE DIV = W_TSID AND UPDATE_DIV = '2';
				/* ���X�V�҃R�[�h */
				SELECT MAX(ITEM_ORDER) INTO W_ITM_ID6 FROM WEB_TP0000020_M WHERE DIV = W_TSID AND UPDATE_DIV = '3';
			END IF;

			IF W_TDKFLG > 0 AND P_UPDKBN = 2 THEN

				/* �\�����R�h�c�擾 */
				W_SQL := 'SELECT IDENTIFIER FROM WEB_TP1000020_M WHERE NOTIFICATION_DIV=' || W_TDKFLG || ' AND SUPPORT_DIV=102';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_MOTO1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_MOTO1);

				/* �p�����R�h�c�擾 */
				W_SQL := 'SELECT IDENTIFIER FROM WEB_TP1000020_M WHERE NOTIFICATION_DIV=' || W_TDKFLG || ' AND SUPPORT_DIV=100';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_MOTO2);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_MOTO2);
			END IF;

		/**********************************************************************/
		/* �⏕�敪��ύX����                                                 */
		/**********************************************************************/
			FOR C_051_REC IN C_051 LOOP
				W_I := 1;
				W_HOJYO := '';
				LOOP 
					W_STR_X := INSTR(C_051_REC.SUPPORT_DIV_DEST || ',',',',W_I);
					IF W_STR_X = 0 THEN
						EXIT;
					END IF;

					IF W_STR_X - W_I = 0 THEN
						W_HOJYO := W_HOJYO || ',';
					ELSE
						W_CNT := SUBSTR(C_051_REC.SUPPORT_DIV_DEST,W_I,W_STR_X - W_I);

						SELECT A.NEW_ITEM_ID INTO W_CNT
						  FROM WEB_TP0061140_W A
						 WHERE A.CUSTOMER_ID=P_RID
					       AND A.ITEM_ID = W_CNT;
	
						IF W_CNT IS NULL THEN
							W_HOJYO := W_HOJYO || ',';
						ELSE
							W_HOJYO := W_HOJYO || ',' || W_CNT;
						END IF;
					END IF;
					W_I := W_STR_X + 1;
				END LOOP;
				UPDATE WEB_TP0061140_W SET
					SUPPORT_DIV_DEST = SUBSTR(W_HOJYO,2)
				 WHERE CURRENT OF C_051
				;
			END LOOP;

		/**********************************************************************/
		/* ���J�o����������                                                   */
		/**********************************************************************/
			IF P_TBKBN = 1 AND P_UPDKBN = 2 THEN
				W_SQL_R1 := 'INSERT INTO ' || W_TABLE1 || ' (EMP_CODE,HISTORY_ID,UPDATE_DATE,UPDATE_USER,KAISYACD';
				W_SQL_R2 := ' SELECT EMP_CODE,HISTORY_ID,UPDATE_DATE,UPDATE_USER,KAISYACD';
				W_SQL_R3 := 'INSERT INTO ' || W_TABLE3 || ' (EMP_CODE,NOTIFICATION_DIV,IDENTIFIER,HISTORY_ID,UPDATE_DATE,UPDATE_USER';
				W_SQL_R4 := ' SELECT EMP_CODE,NOTIFICATION_DIV,IDENTIFIER,HISTORY_ID,UPDATE_DATE,UPDATE_USER';
				W_SQL_R3 := W_SQL_R3 || ',REASON_DATE,PROCESS_DIV,APPLY_REASON,REJECT_RESON';
				W_SQL_R4 := W_SQL_R4 || ',REASON_DATE,PROCESS_DIV,APPLY_REASON,REJECT_RESON';
				FOR C_041_REC IN C_041 LOOP
					W_CNT := 0;
					IF C_041_REC.NEW_ID IS NOT NULL THEN
						IF C_041_REC.���^�C�v = 'DATE' THEN
							IF C_041_REC.�V�^�C�v = 'DATE' THEN
								W_CNT := 1;
							END IF;
						ELSIF C_041_REC.���^�C�v = 'NUMBER' THEN
							IF C_041_REC.�V�^�C�v = 'NUMBER' AND C_041_REC.�V�T�C�Y >= C_041_REC.���T�C�Y AND C_041_REC.�V�����T�C�Y >= C_041_REC.�������T�C�Y THEN
								W_CNT := 1;
							END IF;
						ELSE
							IF C_041_REC.�V�^�C�v = 'VARCHAR2' AND C_041_REC.�V�T�C�Y >= C_041_REC.���T�C�Y THEN
								W_CNT := 1;
							END IF;
						END IF;
						IF W_CNT = 1 THEN
							W_SQL_R1 := W_SQL_R1 || ',F' || TO_CHAR(C_041_REC.NEW_ID,'FM000');
							W_SQL_R2 := W_SQL_R2 || ',F' || TO_CHAR(C_041_REC.OLD_ID,'FM000');
							W_SQL_R3 := W_SQL_R3 || ',F' || TO_CHAR(C_041_REC.NEW_ID,'FM000');
							W_SQL_R4 := W_SQL_R4 || ',F' || TO_CHAR(C_041_REC.OLD_ID,'FM000');
						END IF;
					END IF;
				END LOOP;
				W_SQL_R1 := W_SQL_R1 || ')';
				W_SQL_R2 := W_SQL_R2 || ' FROM ' || W_TABLE2;
				W_SQL_R3 := W_SQL_R3 || ')';
				W_SQL_R4 := W_SQL_R4 || ' FROM ' || W_TABLE4;

				IF P_FILEKBN = 1 THEN
					IF W_DTFLG = 1 THEN	/* �l���Ƀf�[�^���� */
						W_SQL_R5 := 'INSERT INTO ' || W_TABLE5 || ' SELECT * FROM ' || W_TABLE6;
					END IF;
				END IF;
			END IF;

		/**********************************************************************/
		/* �e�[�u�����e�o�^                                                   */
		/**********************************************************************/
			/* �ǉ����� */
			IF P_UPDKBN = 1 THEN
				INSERT INTO WEB_TP0061110_M(
					IDENTIFIER,
					NAME,
					TBL_NAME,
					VIEW_NAME,
					HISTORY_DIV,
					GROUP_DIV,
					REGISTER_DIV,
					INQUIRY_DIV,
					REGISTER_DISP_ORDER,
					INQUIRY_DISP_ORDER,
					RANGE_CONF,
					KEY_CONF,
					TIME_CONF,
					FILE_DIV,
					REFERENCE_DIV,
					MANAGEMENT_KAISYACD,
					UPDATE_DATE,
					UPDATE_USER)
				VALUES(
					W_KEY,
					P_NAME,
					W_TABLE1,
					DECODE(P_TBKBN,2,P_OBJNAME,3,P_OBJNAME,''),
					P_RKBN,
					P_GROUP,
					W_TSID,
					W_TSID,
					P_TSORT,
					P_SSORT,
					P_SRTKBN,
					P_KEYUSE,
					P_JITEN,
					P_FILEKBN,
					P_TBKBN,
					P_MKAISYA,
					SYSDATE,
					P_UPDID)
				;
				IF W_LOGSET = 1 THEN
					W_ROWID := DBMS_SQL.LAST_ROW_ID;
					W_LGSNO := W_LGSNO + 1;
					WEB_SP0003111_S(2,1,1,0,'','WEB_TP0061110_M',W_ROWID,W_LGSNO,W_LGGET,W_LGIUD,P_UPDID,P_RID,W_ERR);
					IF W_ERR <> 0 THEN
						P_ERR := -1;
						GOTO L_EXIT;
					END IF;
				END IF;
			ELSIF P_UPDKBN = 2 THEN
				IF W_LOGSET = 1 THEN
					W_WHERE := 'IDENTIFIER = ' || W_KEY;
					WEB_SP0003150_S(1,'ROWID','WEB_TP0061110_M',W_WHERE,P_RID,W_ROWID,W_ERR);
					IF W_ERR <> 0 THEN
						P_ERR := -1;
						GOTO L_EXIT;
					END IF;
					W_LGSNO := W_LGSNO + 1;
					WEB_SP0003111_S(2,2,1,0,'','WEB_TP0061110_M',W_ROWID,1,W_LGGET,W_LGIUD,P_UPDID,P_RID,W_ERR);
					IF W_ERR <> 0 THEN
						P_ERR := -1;
						GOTO L_EXIT;
					END IF;
				END IF;
				UPDATE WEB_TP0061110_M SET
					NAME         = P_NAME,
					TBL_NAME   = DECODE(P_TBKBN,1,TBL_NAME,W_TABLE1),
					VIEW_NAME     = DECODE(P_TBKBN,2,P_OBJNAME,3,P_OBJNAME,''),
					HISTORY_DIV       = P_RKBN,
					GROUP_DIV = P_GROUP,
					REGISTER_DISP_ORDER   = P_TSORT,
					INQUIRY_DISP_ORDER   = P_SSORT,
					RANGE_CONF     = P_SRTKBN,
					KEY_CONF     = P_KEYUSE,
					TIME_CONF     = P_JITEN,
					FILE_DIV = P_FILEKBN,
					REFERENCE_DIV = P_TBKBN,
					UPDATE_DATE       = SYSDATE,
					UPDATE_USER = P_UPDID
				 WHERE IDENTIFIER = W_KEY
				;
				IF W_LOGSET = 1 THEN
					WEB_SP0003111_S(2,2,2,0,'','WEB_TP0061110_M',W_ROWID,1,W_LGGET,W_LGIUD,P_UPDID,P_RID,W_ERR);
					IF W_ERR <> 0 THEN
						P_ERR := -1;
						GOTO L_EXIT;
					END IF;
				END IF;
			END IF;

		/**********************************************************************/
		/* ���ڏ��o�^                                                       */
		/**********************************************************************/
			SELECT MAX(ITEM_ID) INTO W_ID
			  FROM WEB_TP0061120_M
			 WHERE IDENTIFIER = W_KEY
			;

			/* �O��f�[�^�폜���� */
			DELETE FROM WEB_TP0061120_M
			 WHERE IDENTIFIER = W_KEY
			;

			/* ���ڏ��ǉ����� */
			INSERT INTO WEB_TP0061120_M(
				IDENTIFIER,
				ITEM_ID,
				ITEM_NAME,
				MANAGEMENT_NAME,
				DATA_TYPE,
				DATA_SIZE,
				FRACTION_SIZE,
				KEY_CONF,
				TIME_CONF,
				SORT_DIV,
				SORT_METHOD,
				REQUIRE_DIV,
				IME_DIV,
				INPUT_DIV,
				REFERENCE_DIV,
				MASTER_ID,
				LITERAL_CONTENT,
				INPUT_AREA_FORM,
				MULTI_ROW_DISP_COUNT,
				SUPPORT_DIV,
				SUPPORT_DIV_DEST,
				DISP_ORDER,
				STATISTICS_SEARCH_DIV,
				STATISTICS_AGGREGATE_DIV,
				REGISTER_ITEM_ORDER,
				INQUIRY_ITEM_ORDER1,
				INQUIRY_ITEM_ORDER2,
				PERSONAL_INFO_ROW,
				PERSONAL_INFO_COLUMN,
				PERSONAL_INFO_WIDTH1,
				PERSONAL_INFO_WIDTH2,
				PERSONAL_INFO_ALIGN,
				UPDATE_DATE,
				UPDATE_USER)
			SELECT 
				W_KEY,
				NEW_ITEM_ID,
				ITEM_NAME,
				MANAGEMENT_NAME,
				DATA_TYPE,
				DATA_SIZE + NVL(FRACTION_SIZE,0),
				FRACTION_SIZE,
				KEY_CONF,
				TIME_CONF,
				SORT_DIV,
				SORT_METHOD,
				REQUIRE_DIV,
				IME_DIV,
				INPUT_DIV,
				REFERENCE_DIV,
				MASTER_ID,
				LITERAL_CONTENT,
				INPUT_AREA_FORM,
				MULTI_ROW_DISP_COUNT,
				SUPPORT_DIV,
				SUPPORT_DIV_DEST,
				DISP_ORDER,
				STATISTICS_SEARCH_DIV,
				STATISTICS_AGGREGATE_DIV,
				REGISTER_ITEM_ORDER,
				INQUIRY_ITEM_ORDER1,
				INQUIRY_ITEM_ORDER2,
				PERSONAL_INFO_ROW,
				PERSONAL_INFO_COLUMN,
				PERSONAL_INFO_WIDTH1,
				PERSONAL_INFO_WIDTH2,
				PERSONAL_INFO_ALIGN,
				SYSDATE,
				P_UPDID
			FROM WEB_TP0061140_W
			WHERE CUSTOMER_ID = P_RID
			  AND PROCESS_DIV NOT IN ('3','4')
			;

		/**********************************************************************/
		/* �L�[�ݒ�X�V����                                                   */
		/**********************************************************************/
			W_CNT := 0;
			FOR C_009_REC IN C_009(W_KEY) LOOP
				W_CNT := W_CNT + 1;
				UPDATE WEB_TP0061120_M SET
					 KEY_CONF = W_CNT
					,UPDATE_DATE = SYSDATE
					,UPDATE_USER = P_UPDID
				WHERE CURRENT OF C_009
				;
			END LOOP;

		/**********************************************************************/
		/* �Еʗp�e�[�u���ύX����(�ύX�E�폜���ڂ̍폜)                       */
		/**********************************************************************/
			IF P_UPDKBN = 2 THEN
				DELETE FROM WEB_TP0061141_W
				 WHERE CUSTOMER_ID = P_RID;

				INSERT INTO WEB_TP0061141_W(CUSTOMER_ID,TBL_DIV,CATEGORY_DIV,ITEM_ORDER,ITEM_NAME)
				SELECT P_RID,1,DIV,ITEM_ORDER,ITEM_NAME
				  FROM WEB_TP0000020_M
				 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
				;

				INSERT INTO WEB_TP0061141_W(CUSTOMER_ID,TBL_DIV,CATEGORY_DIV,ITEM_ORDER,ITEM_NAME)
				SELECT P_RID,2,CATEGORY_DIV,ITEM_ORDER,ITEM_NAME
				  FROM WEB_TP0010020_M
				 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
				;

				FOR W_I IN 0..2 LOOP
					DELETE FROM WEB_TP0000021_M
					 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER IN (
						SELECT ITEM_ORDER
						  FROM WEB_TP0000020_M
						 WHERE DIV  = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_NAME IN (
							SELECT 'F' || TO_CHAR(ITEM_ID,'FM000')
							  FROM WEB_TP0061140_W
							 WHERE CUSTOMER_ID = P_RID
							   AND PROCESS_DIV IN (2,3)))
					;

					DELETE FROM WEB_TP0010021_M
					 WHERE CATEGORY_DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER IN (
						SELECT ITEM_ORDER
						  FROM WEB_TP0010020_M
						 WHERE CATEGORY_DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_NAME IN (
							SELECT 'F' || TO_CHAR(ITEM_ID,'FM000')
							  FROM WEB_TP0061140_W
							 WHERE CUSTOMER_ID = P_RID
							   AND PROCESS_DIV IN (2,3)))
					;
				END LOOP;
			END IF;

		/**********************************************************************/
		/* �o�^�n�֘A�\�����o�^(WEB_TP0000010_M)                              */
		/**********************************************************************/
			W_CNT := 0;
			FOR C_031_REC IN C_031(W_TSID) LOOP
				W_CNT := W_CNT + 1;
				IF W_CNT = P_TSORT THEN
					W_CNT := W_CNT + 1;
				END IF;
				UPDATE WEB_TP0000010_M SET
					 DISP_ORDER = W_CNT
					,UPDATE_DATE = SYSDATE
					,UPDATE_USER = P_UPDID
				WHERE CURRENT OF C_031
				;
				UPDATE WEB_TP0061110_M SET
					 REGISTER_DISP_ORDER = W_CNT
					,UPDATE_DATE = SYSDATE
					,UPDATE_USER = P_UPDID
				WHERE REGISTER_DIV = C_031_REC.DIV
				;
			END LOOP;

		/**********************************************************************/
		/* �o�^�n�֘A�o�^(WEB_TP0000010_M)                                    */
		/**********************************************************************/
			IF P_SRTKBN = '1' THEN
				SELECT MAX(DATA_TYPE) INTO W_TYPE
				  FROM WEB_TP0061120_M
				 WHERE IDENTIFIER = W_KEY
				   AND SORT_DIV IN (
					SELECT MIN(SORT_DIV)
				 	  FROM WEB_TP0061120_M
					 WHERE IDENTIFIER = W_KEY)
				;
			END IF;

			/* �\�[�g�����쐬 */
			W_SRTKBN := '';
			W_SRTJKN := '';
			FOR C_008_REC IN C_008(W_KEY) LOOP
				W_SRTKBN := W_SRTKBN || C_008_REC.SORT_METHOD;
			END LOOP;
			IF P_TBKBN = 1 AND P_RKBN = '1' AND P_KEYUSE = '0' THEN
				W_SRTKBN := W_SRTKBN || '0';
			END IF;

			FOR C_008_REC IN C_008(W_KEY) LOOP
				IF C_008_REC.SORT_DIV = 1 THEN
					W_SRTJKN := W_SRTJKN || '0' || SUBSTR(W_SRTKBN,2) || ',' || C_008_REC.MANAGEMENT_NAME || '(����)-';
					W_SRTJKN := W_SRTJKN || '1' || SUBSTR(W_SRTKBN,2) || ',' || C_008_REC.MANAGEMENT_NAME || '(�~��)';
					EXIT;
				END IF;
			END LOOP;

			W_SCDKEY := 'EMP_CODE';


			DELETE FROM WEB_TP0000010_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2);

			INSERT INTO WEB_TP0000010_M(
				DIV,
				TBL_NAME,
				CATEGORY_NAME,
				HISTORY_DIV,
				SORT_DIV,
				REGISTER_DIV,
				DUPLICATION_DIV,
				LINK_DIV,
				SPECIAL_REGISTER1,
				SPECIAL_REGISTER2,
				SPECIAL_REGISTER3,
				EMP_KEY1,
				LIST_VIEW,
				GROUP_DIV,
				DISP_ORDER,
				SORT_CONDITION,
				OUTPUT_CONDITION,
				FILE_DIV,
				MANAGEMENT_KAISYACD,
				UPDATE_DATE,
				UPDATE_USER)
			SELECT
				W_TSID,
				TBL_NAME,
				NAME,
				HISTORY_DIV,
--				DECODE(���敪,'0','',DECODE(P_TBKBN,'1',W_SRTKBN,'')),
				DECODE(HISTORY_DIV,'0','',W_SRTKBN),
				DECODE(P_TBKBN,1,'0','2'),
				DECODE(HISTORY_DIV,'0','1',DECODE(P_KEYUSE,'1','1','0')),	/* �P��͗L,���̓L�[�ݒ莞�̂ݗL */
				0,
				DECODE(HISTORY_DIV,'0','0','1'),
				DECODE(HISTORY_DIV,'0','1','0'),
				'0',
				W_SCDKEY,
				DECODE(W_NEWKBN,0,'WEB_VP0020' || TO_CHAR(W_TSID,'FM000'),'WEB_VP092' || TO_CHAR(W_TSID,'FM00000')),
				GROUP_DIV,
				REGISTER_DISP_ORDER,
				DECODE(W_SRTJKN,NULL,'',W_SRTJKN),
				DECODE(P_SRTKBN,'0','','1',DECODE(W_TYPE,'DATE','0,�S��-1,�ŐV(x��)-2,�ߋ�(x�N)-3,����','0,�S��-1,�ŐV(x��)')),
				FILE_DIV,
				P_MKAISYA,
				SYSDATE,
				P_UPDID
			 FROM WEB_TP0061110_M
			WHERE IDENTIFIER = W_KEY
			;

			IF P_UPDKBN = 2 THEN /* �Еʗp�e�[�u���̃J�e�S�������X�V */
				FOR C_082_REC IN C_082 LOOP
					UPDATE WEB_TP0000011_M SET
						 CATEGORY_NAME = C_082_REC.CATEGORY_NAME
						,UPDATE_DATE = SYSDATE
						,UPDATE_USER = P_UPDID
					 WHERE DIV = C_082_REC.DIV
					   AND KAISYACD = C_082_REC.KAISYACD;
				END LOOP;
			END IF;

		/**********************************************************************/
		/* �o�^�n�֘A�o�^(WEB_TP0000020_M)                                    */
		/**********************************************************************/
			DELETE FROM WEB_TP0000020_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2);

			W_FCNT := 1;
			/* �Ј��ԍ����� */
			INSERT INTO WEB_TP0000020_M(
				DIV,ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,DATA_TYPE,DATA_SIZE,KEY_ITEM,REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
				IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,
				SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,TAKE_DIV,
				CONF_CONTROL_DIV,DEFAULT_CONF_INFO,DEFAULT_SCREEN_DISP_ORDER,UPDATE_DATE,UPDATE_USER)
			VALUES(
				W_TSID,W_FCNT,W_SCDKEY,W_SNAME,W_SNAME,'1','1',DECODE(W_STYPE,0,'NUMBER','VARCHAR2'),10,1,'1','3','0',
				'0','1','1',DECODE(W_STYPE,0,'5','0'),'0','0',
				W_FCNT,'0','0','0',0,'5',
				'30000','2351',1,SYSDATE,P_UPDID)
			;
			W_ITM_ID1 := W_FCNT;

			/* �h�c���� */
			IF P_TBKBN = 1 AND P_RKBN = '1' AND P_KEYUSE = '0' THEN
				W_FCNT := W_FCNT + 1;
				INSERT INTO WEB_TP0000020_M(
					DIV,ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,DATA_TYPE,DATA_SIZE,KEY_ITEM,SORT_DIV,REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
					IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,
					SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,TAKE_DIV,INPUT_DESCRIPTION,
					CONF_CONTROL_DIV,DEFAULT_CONF_INFO,DEFAULT_SCREEN_DISP_ORDER,UPDATE_DATE,UPDATE_USER)
				VALUES(
					W_TSID,W_FCNT,'HISTORY_ID','���h�c','���h�c','1','1','NUMBER',5,2,LENGTH(W_SRTKBN),'0','3','0',
					'0','1','6','5','0','0',
					W_FCNT,'0','0','0',0,'4','�u���f�[�^�̏ꍇ�́A�K�����͂��ĉ������B',
					'00000','1111',W_FCNT,SYSDATE,P_UPDID)
				;

				W_ITM_ID2 := W_FCNT;
			END IF;

			/* �ʏ퍀�� */
			INSERT INTO WEB_TP0000020_M(
				DIV,ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,DATA_TYPE,
				DATA_SIZE,FRACTION_SIZE,KEY_ITEM,SORT_DIV,REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
				IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,MASTER_ID,
				LITERAL_CONTENT,INPUT_AREA_FORM,MULTI_ROW_DISP_COUNT,SUPPORT_DIV,SUPPORT_DIV_DEST,
				SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,TAKE_DIV,HEADER_NAME,
				CONF_CONTROL_DIV,DEFAULT_CONF_INFO,DEFAULT_SCREEN_DISP_ORDER,UPDATE_DATE,UPDATE_USER)
			SELECT
				W_TSID,A.ITEM_ID+W_FCNT,DECODE(P_TBKBN,1,'F' || TO_CHAR(A.ITEM_ID,'FM000'),A.ITEM_NAME),A.MANAGEMENT_NAME,A.MANAGEMENT_NAME,DECODE(A.KEY_CONF,NULL,NVL(B.REGISTER_USE_DIV,'1'),'1'),'1',A.DATA_TYPE,
				A.DATA_SIZE,DECODE(A.FRACTION_SIZE,0,NULL,A.FRACTION_SIZE),DECODE(P_KEYUSE,'0',NULL,DECODE(A.KEY_CONF,NULL,NULL,A.KEY_CONF+1)),A.SORT_DIV,DECODE(A.KEY_CONF,NULL,NVL(B.REGISTER_REQUIRE_DIV,'0'),1),DECODE(A.KEY_CONF,NULL,NVL(B.REGISTER_CONTROL_DIV,'1'),'1'),'0',
				A.IME_DIV,'1','1',A.INPUT_DIV,A.REFERENCE_DIV,A.REFERENCE_DIV,A.MASTER_ID,
				A.LITERAL_CONTENT,A.INPUT_AREA_FORM,A.MULTI_ROW_DISP_COUNT,A.SUPPORT_DIV,A.SUPPORT_DIV_DEST,
				A.DISP_ORDER+W_FCNT,DECODE(P_RKBN,'0','0','1'),DECODE(P_RKBN,'0','1','0'),'0',0,DECODE(A.KEY_CONF,NULL,NVL(B.REGISTER_TAKE_DIV,'1'),'1'),NVL(B.REGISTER_HEADER_NAME,''),
				DECODE(A.KEY_CONF,NULL,'11111','10011'),DECODE(A.KEY_CONF,NULL,'1110','1111'),A.ITEM_ID + W_FCNT,SYSDATE,P_UPDID
			 FROM WEB_TP0061120_M A,
			      WEB_TP0061140_W B
			WHERE A.IDENTIFIER = W_KEY
			  AND A.ITEM_ID > 0
			  AND B.CUSTOMER_ID(+) = P_RID
			  AND A.ITEM_ID = B.NEW_ITEM_ID(+)
			;

			/* �⏕�敪��ύX���� */
			FOR C_052_REC IN C_052 LOOP
				W_I := 1;
				W_HOJYO := '';
				LOOP 
					W_STR_X := INSTR(C_052_REC.SUPPORT_DIV_DEST || ',',',',W_I);
					IF W_STR_X = 0 THEN
						EXIT;
					END IF;
					IF W_STR_X - W_I = 0 THEN
						W_HOJYO := W_HOJYO || ',';
					ELSE
						IF P_RKBN = '0' OR (P_RKBN = '1' AND P_KEYUSE = '1' ) THEN
							W_HOJYO := W_HOJYO || ',' || (SUBSTR(C_052_REC.SUPPORT_DIV_DEST,W_I,W_STR_X - W_I) + 1);
						ELSE
							W_HOJYO := W_HOJYO || ',' || (SUBSTR(C_052_REC.SUPPORT_DIV_DEST,W_I,W_STR_X - W_I) + 2);
						END IF;
					END IF;
					W_I := W_STR_X + 1;
				END LOOP;
				UPDATE WEB_TP0000020_M SET
					 SUPPORT_DIV_DEST = SUBSTR(W_HOJYO,2)
					,UPDATE_DATE = SYSDATE
					,UPDATE_USER = P_UPDID
				 WHERE CURRENT OF C_052
				;
			END LOOP;

			SELECT COUNT(*) INTO W_CNT
			 FROM WEB_TP0061120_M
			WHERE IDENTIFIER = W_KEY
			;

			IF P_TBKBN = 1 THEN
				W_FCNT := W_FCNT + W_CNT + 1;

				/* �X�V������ */
				INSERT INTO WEB_TP0000020_M(
					DIV,ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,DATA_TYPE,REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
					IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,
					SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,TAKE_DIV,
					CONF_CONTROL_DIV,DEFAULT_CONF_INFO,DEFAULT_SCREEN_DISP_ORDER,UPDATE_DATE,UPDATE_USER)
				VALUES(
					W_TSID,W_FCNT,'UPDATE_DATE','�X�V��','�X�V��','1','1','DATE','0','3','0',
					'0','0','2','2','0','0',
					W_FCNT,'0','0','0',0,'2',
					'00000','1320',W_FCNT,SYSDATE,P_UPDID)
				;

				W_ITM_ID3 := W_FCNT;

				/* �X�V�҃R�[�h���� */
				W_FCNT := W_FCNT + 1;
		
				INSERT INTO WEB_TP0000020_M(
					DIV,ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,DATA_TYPE,DATA_SIZE,REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
					IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,
					SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,TAKE_DIV,
					CONF_CONTROL_DIV,DEFAULT_CONF_INFO,DEFAULT_SCREEN_DISP_ORDER,UPDATE_DATE,UPDATE_USER)
				VALUES(
					W_TSID,W_FCNT,'UPDATE_USER','�X�V�҃R�[�h','�X�V�҃R�[�h','1','1',DECODE(W_STYPE,0,'NUMBER','VARCHAR2'),10,'0','3','0',
					'0','0','3',DECODE(W_STYPE,0,'5','0'),'0','0',
					W_FCNT,'0','0','0',0,'3',
					'00000','1330',W_FCNT,SYSDATE,P_UPDID)
				;

				W_ITM_ID4 := W_FCNT;
			END IF;

		/**********************************************************************/
		/* �Ɖ�n�֘A�\�����o�^(WEB_TP0010010_M)                              */
		/**********************************************************************/
			W_CNT := 0;
			FOR C_032_REC IN C_032(W_TSID) LOOP
				W_CNT := W_CNT + 1;
				IF W_CNT = P_SSORT THEN
					W_CNT := W_CNT + 1;
				END IF;
				UPDATE WEB_TP0010010_M SET
					 DISP_ORDER = W_CNT
					,UPDATE_DATE = SYSDATE
					,UPDATE_USER = P_UPDID
				WHERE CURRENT OF C_032
				;
				UPDATE WEB_TP0061110_M SET
					 INQUIRY_DISP_ORDER = W_CNT
					,UPDATE_DATE = SYSDATE
					,UPDATE_USER = P_UPDID
				WHERE INQUIRY_DIV = C_032_REC.CATEGORY_DIV
				;
			END LOOP;

		/**********************************************************************/
		/* �Ɖ�n�֘A�o�^(WEB_TP0010010_M)                                    */
		/**********************************************************************/
			DELETE FROM WEB_TP0010010_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2);

			INSERT INTO WEB_TP0010010_M(
				CATEGORY_DIV,
				CATEGORY_NAME,
				CRITERIA_TBL,
				EMP_KEY1,
				INQUIRY_VIEW,
				HISTORY_DIV,
				USAGE_DIV,
				LINK_DIV,
				UNION_DIV,
				GROUP_DIV,
				DISP_ORDER,
				TIME_CONF,
				MANAGEMENT_KAISYACD,
				UPDATE_DATE,
				UPDATE_USER)
			SELECT
				W_TSID,
				NAME,
				TBL_NAME,
				W_SCDKEY,
				DECODE(W_NEWKBN,0,'WEB_VP0010' || TO_CHAR(W_TSID,'FM000'),'WEB_VP093' || TO_CHAR(W_TSID,'FM00000')),
				DECODE(HISTORY_DIV,'1','2','1'),
				'0',
				0,
				'0',
				GROUP_DIV,
				INQUIRY_DISP_ORDER,
				P_JITEN,
				P_MKAISYA,
				SYSDATE,
				P_UPDID
			 FROM WEB_TP0061110_M
			WHERE IDENTIFIER = W_KEY
			;

			IF P_UPDKBN = 2 THEN /* �Еʗp�e�[�u���̃J�e�S�������X�V */
				FOR C_092_REC IN C_092 LOOP
					UPDATE WEB_TP0010011_M SET
						 CATEGORY_NAME = C_092_REC.CATEGORY_NAME
					 WHERE CATEGORY_DIV = C_092_REC.CATEGORY_DIV
					   AND KAISYACD = C_092_REC.KAISYACD;
				END LOOP;
			END IF;

		/**********************************************************************/
		/* �Ɖ�n�֘A�o�^(WEB_TP0010020_M)                                    */
		/**********************************************************************/
			DELETE FROM WEB_TP0010020_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2);

			/* �Ј��ԍ����� */
			INSERT INTO WEB_TP0010020_M(
				CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,DISP_TYPE,DEFAULT_DISP_TYPE,DISP_FORMAT,
				SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,SCREEN_DISP_DIV,
				COMPOUND_SEARCH_DIV,STATISTICS_SEARCH_DIV,ANY_SELECT_DIV,STATISTICS_AGGREGATE_DIV,UPDATE_DATE,UPDATE_USER)
			VALUES(
				W_TSID,1,W_TSID,W_SCDKEY,'01','01','01',
				0,0,1,1,
				'0','0','0',0,SYSDATE,P_UPDID)
			;

			/* �������� */
			INSERT INTO WEB_TP0010020_M(
				CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,DISP_TYPE,DEFAULT_DISP_TYPE,
				SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,SCREEN_DISP_DIV,
				COMPOUND_SEARCH_DIV,STATISTICS_SEARCH_DIV,ANY_SELECT_DIV,STATISTICS_AGGREGATE_DIV,UPDATE_DATE,UPDATE_USER)
			VALUES(
				W_TSID,2,2,'NAME','01','01',
				0,0,1,1,
				'0','0','0',0,SYSDATE,P_UPDID)
			;

			W_FCNT := 2;
			FOR C_006_REC IN C_006(W_KEY) LOOP
				W_FCNT := W_FCNT + 1;
				W_GCNT := W_GCNT + 1;
				W_SQL := 'INSERT INTO WEB_TP0010020_M(';
				W_SQL := W_SQL || 'CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,DISP_TYPE,DEFAULT_DISP_TYPE,DISP_FORMAT,';
				W_SQL := W_SQL || 'SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,SCREEN_DISP_DIV,';
				W_SQL := W_SQL || 'COMPOUND_SEARCH_DIV,ANY_SELECT_DIV,STATISTICS_SEARCH_DIV,STATISTICS_AGGREGATE_DIV,UPDATE_DATE,UPDATE_USER)';
				W_SQL := W_SQL || ' VALUES(';
				W_SQL := W_SQL || W_TSID || ',' || W_FCNT || ',' || W_TSID || ',';
				IF P_TBKBN = 1 THEN
					W_SQL := W_SQL || '''F' || TO_CHAR(C_006_REC.ITEM_ID,'FM000') || ''',';
				ELSE
					W_SQL := W_SQL || '''' || C_006_REC.ITEM_NAME || ''',';
				END IF;
				/* �\���^�C�v */
				IF C_006_REC.REGISTER_USE_DIV = '0' THEN
					IF C_006_REC.MASTER_ID IS NOT NULL THEN
						W_SQL := W_SQL || '''99'',''02'',';
					ELSE
						W_SQL := W_SQL || '''99'',''01'',';
					END IF;
				ELSE
					IF C_006_REC.MASTER_ID IS NOT NULL THEN
						W_SQL := W_SQL || '''02'',''02'',';
					ELSE
						W_SQL := W_SQL || '''01'',''01'',';
					END IF;
				END IF;
				/* �\������ */
				IF C_006_REC.SUPPORT_DIV = 11 THEN	/* �Ј��ԍ� */
					W_SQL := W_SQL || '''01'',';
				ELSIF C_006_REC.SUPPORT_DIV = 18 THEN	/* �N */
					W_SQL := W_SQL || ''''',';
				ELSIF C_006_REC.SUPPORT_DIV = 19 THEN
					W_SQL := W_SQL || '''32'',';
				ELSIF C_006_REC.DATA_TYPE = 'DATE' THEN
					W_SQL := W_SQL || '''02'',';
				ELSIF C_006_REC.DATA_TYPE = 'NUMBER' THEN
					IF C_006_REC.DATA_SIZE IS NOT NULL THEN
						IF C_006_REC.FRACTION_SIZE IS NULL THEN
							W_SQL := W_SQL || '''31'',';
						ELSE
							W_SQL := W_SQL || '''33'',';
						END IF;
					ELSE
						W_SQL := W_SQL || '''33'',';
					END IF;
				ELSE
					W_SQL := W_SQL || 'NULL,';
				END IF;
				/* ��ʈʒu�P,�Q,�R */
				W_SQL := W_SQL || '1,' || C_006_REC.DISP_ORDER || ',1,';
				/* ��ʕ\���敪 */
				IF C_006_REC.DATA_SIZE >= 30 THEN
					W_SQL := W_SQL || '''2'',';
				ELSE
					W_SQL := W_SQL || '''1'',';
				END IF;
				/* ���������敪,�C�ӑI���敪 */
				IF C_006_REC.DATA_TYPE = 'DATE' THEN
					W_SQL := W_SQL || '''3'',''1'',';
				ELSIF C_006_REC.DATA_TYPE = 'NUMBER' THEN
					W_SQL := W_SQL || '''2'',''1'',';
				ELSE
					IF C_006_REC.REFERENCE_DIV = '2' THEN
						W_SQL := W_SQL || '''5'',''1'',';
					ELSE
						W_SQL := W_SQL || '''1'',''1'',';
					END IF;
				END IF;

				/* ���v�����敪 */
				IF C_006_REC.STATISTICS_SEARCH_DIV = '1' THEN
					W_SQL := W_SQL || '''1'',';
				ELSE
					W_SQL := W_SQL || '''0'',';
				END IF;

				/* ���v�W�v�敪 */
				IF C_006_REC.STATISTICS_AGGREGATE_DIV = '1' THEN
					W_SQL := W_SQL || '1';
				ELSE
					W_SQL := W_SQL || '0';
				END IF;
				W_SQL := W_SQL || ',SYSDATE,:ORA_1)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				UPDATE WEB_TP0061120_M SET
					 INQUIRY_ITEM_ORDER1 = W_FCNT
					,UPDATE_DATE = SYSDATE
					,UPDATE_USER = P_UPDID
				 WHERE IDENTIFIER = C_006_REC.IDENTIFIER
				   AND ITEM_ID = C_006_REC.ITEM_ID
				;

				/* �}�X�^�� */
				IF C_006_REC.MASTER_ID IS NOT NULL THEN
					W_FCNT := W_FCNT + 1;
					IF C_006_REC.REGISTER_USE_DIV = '0' THEN
						W_DISP_TYPE := '99';
					ELSE
						W_DISP_TYPE := '01';
					END IF;
					
					INSERT INTO WEB_TP0010020_M(
						CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,DISP_TYPE,DEFAULT_DISP_TYPE,
						SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,SCREEN_DISP_DIV,
						COMPOUND_SEARCH_DIV,STATISTICS_SEARCH_DIV,ANY_SELECT_DIV,STATISTICS_AGGREGATE_DIV,UPDATE_DATE,UPDATE_USER)
					VALUES(
						W_TSID,W_FCNT,W_TSID,DECODE(P_TBKBN,1,'F' || TO_CHAR(C_006_REC.ITEM_ID,'FM000'),C_006_REC.ITEM_NAME),W_DISP_TYPE,'01',
						1,C_006_REC.DISP_ORDER,1,1,
						'4','1','1',0,SYSDATE,P_UPDID)
					;

					UPDATE WEB_TP0061120_M SET
						 INQUIRY_ITEM_ORDER2 = W_FCNT
						,UPDATE_DATE = SYSDATE
						,UPDATE_USER = P_UPDID
					 WHERE IDENTIFIER = C_006_REC.IDENTIFIER
					   AND ITEM_ID = C_006_REC.ITEM_ID
					;

					/* ���v�����敪������ꍇ�A�R�[�h�\���̏ꍇ�̓N���A����B */
					IF C_006_REC.STATISTICS_SEARCH_DIV = '1' THEN
						UPDATE WEB_TP0010020_M SET
							 STATISTICS_SEARCH_DIV = '0'
							,UPDATE_DATE = SYSDATE
							,UPDATE_USER = P_UPDID
						 WHERE CATEGORY_DIV = W_TSID
						   AND ITEM_ORDER = (W_FCNT - 1)
						;
					END IF;
				END IF;
			END LOOP;
			
			IF P_TBKBN = 1 THEN
				/* �X�V������ */
				W_FCNT := W_FCNT + 1;
				INSERT INTO WEB_TP0010020_M(
					CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,DISP_TYPE,DEFAULT_DISP_TYPE,DISP_FORMAT,
					SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,SCREEN_DISP_DIV,
					COMPOUND_SEARCH_DIV,STATISTICS_SEARCH_DIV,ANY_SELECT_DIV,STATISTICS_AGGREGATE_DIV,UPDATE_DATE,UPDATE_USER)
				VALUES(
					W_TSID,W_FCNT,W_TSID,'UPDATE_DATE','03','03','02',
					90,0,1,1,
					'3','1','1',0,SYSDATE,P_UPDID)
				;

				/* �X�V�҃R�[�h���� */
				W_FCNT := W_FCNT + 1;
				INSERT INTO WEB_TP0010020_M(
					CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,DISP_TYPE,DEFAULT_DISP_TYPE,DISP_FORMAT,
					SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,SCREEN_DISP_DIV,
					COMPOUND_SEARCH_DIV,STATISTICS_SEARCH_DIV,ANY_SELECT_DIV,STATISTICS_AGGREGATE_DIV,UPDATE_DATE,UPDATE_USER)
				VALUES(
					W_TSID,W_FCNT,W_TSID,'UPDATE_USER','03','03','01',
					90,0,2,1,
					DECODE(W_STYPE,0,'2','1'),'1','1',0,SYSDATE,P_UPDID)
				;
			END IF;

			IF P_FILEKBN = 1 THEN
				W_FCNT := W_FCNT + 1;
				INSERT INTO WEB_TP0010020_M(
					CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,SUPPORT_ACTION_NAME,DISP_TYPE,DEFAULT_DISP_TYPE,
					SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,SCREEN_DISP_DIV,
					COMPOUND_SEARCH_DIV,STATISTICS_SEARCH_DIV,ANY_SELECT_DIV,STATISTICS_AGGREGATE_DIV,UPDATE_DATE,UPDATE_USER)
				VALUES(
					W_TSID,W_FCNT,W_TSID,'EMP_CODE','�t�@�C��','95','95',
					91,0,1,1,
					'E','0','0',0,SYSDATE,P_UPDID)
				;
			END IF;

		/**********************************************************************/
		/* �Ɖ�n�֘A�o�^(WEB_TP0010030_M)                                    */
		/**********************************************************************/
			DELETE FROM WEB_TP0010030_M WHERE CATEGORY_DIV = W_TSID;

			/* �Ј��ԍ����� */
			INSERT INTO WEB_TP0010030_M(
				CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,UPDATE_DATE,UPDATE_USER)
			VALUES(
				W_TSID,1,2,'EMP_CODE',SYSDATE,P_UPDID)
			;
			
			/* ���̏ꍇ�h�c */
			IF P_TBKBN = 1 AND P_RKBN = '1' THEN
				IF P_KEYUSE = '0' THEN
					INSERT INTO WEB_TP0010030_M(
						CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,UPDATE_DATE,UPDATE_USER)
					VALUES(
						W_TSID,2,W_TSID,'HISTORY_ID',SYSDATE,P_UPDID)
					;
				ELSE
					INSERT INTO WEB_TP0010030_M(
						CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,UPDATE_DATE,UPDATE_USER)
					SELECT
						W_TSID,
						A.KEY_CONF + 1,
						W_TSID,
						A.ITEM_NAME,
						SYSDATE,
						P_UPDID
					 FROM WEB_TP0061120_M A
					WHERE A.IDENTIFIER = W_KEY
					  AND A.ITEM_ID > 0
					  AND A.KEY_CONF IS NOT NULL
					  AND A.KEY_CONF > 0
					;
				END IF;
			END IF;

		/**********************************************************************/
		/* �͏o�֘A�Đݒ�                                                     */
		/**********************************************************************/
			IF W_TDKFLG > 0 THEN
				/* �O�񃏁[�N�폜 */
				W_SQL := 'DELETE FROM WEB_TP1000610_W';
				W_SQL := W_SQL || ' WHERE CUSTOMER_ID =' || P_RID;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'INSERT INTO WEB_TP1000610_W(';
				W_SQL := W_SQL || 'CUSTOMER_ID,IDENTIFIER,NOTIFICATION_ITEM,MANAGEMENT_NAME,MANAGEMENT_NAME_DEFAULT';
				W_SQL := W_SQL || ',LIST_DISP';
				W_SQL := W_SQL || ',USAGE_DIV';
				W_SQL := W_SQL || ',TARGET_DIV';
				W_SQL := W_SQL || ',CREATE_DIV';
				W_SQL := W_SQL || ',PERSONAL_DIV,PERSONAL_ITEM,DATA_TYPE,DATA_SIZE,FRACTION_SIZE,SUPPORT_DIV,SUPPORT_DIV_DEST,IME_DIV,INPUT_DIV,REFERENCE_DIV';
				W_SQL := W_SQL || ',MASTER_ID,LITERAL_CONTENT,INPUT_AREA_FORM,DISP_ORDER';
				W_SQL := W_SQL || ',REQUIRE_DIV';
				W_SQL := W_SQL || ',INPUT_DESCRIPTION';
				W_SQL := W_SQL || ',DEFAULT_VALUE_DIV';
				W_SQL := W_SQL || ',DEFAULT_VALUE';
				W_SQL := W_SQL || ',DEFAULT_VALUE_TBL';
				W_SQL := W_SQL || ',DEFAULT_VALUE_ITEM';
				W_SQL := W_SQL || ',DEFAULT_VALUE_EMP_NUMBER';
				W_SQL := W_SQL || ',HEADER_NAME';
				W_SQL := W_SQL || ',CONFIRM_DISP_DIV';
				W_SQL := W_SQL || ',INPUT_ROW_COUNT';
				W_SQL := W_SQL || ',PROCESS_DIV)';
				W_SQL := W_SQL || ' SELECT';
				W_SQL := W_SQL || ' ' || P_RID || ',A.ITEM_ID,A.ITEM_NAME,DECODE(C.MANAGEMENT_NAME,NULL,NULL,C.MANAGEMENT_NAME),''''';
				W_SQL := W_SQL || ',NVL(C.LIST_DISP,''0'')';
				W_SQL := W_SQL || ',NVL(C.USAGE_DIV,''1'')';
				W_SQL := W_SQL || ',NVL(C.TARGET_DIV,''1111'')';
				W_SQL := W_SQL || ',''1''';
				W_SQL := W_SQL || ',' || W_TSID || ',A.ITEM_NAME,A.DATA_TYPE,A.DATA_SIZE,A.FRACTION_SIZE,A.SUPPORT_DIV,DECODE(A.SUPPORT_DIV,0,NVL(A.SUPPORT_DIV_DEST,C.SUPPORT_DIV_DEST),A.SUPPORT_DIV_DEST),A.IME_DIV,A.INPUT_DIV,A.REFERENCE_DIV';
				W_SQL := W_SQL || ',A.MASTER_ID,A.LITERAL_CONTENT,A.INPUT_AREA_FORM,A.DISP_ORDER';
				W_SQL := W_SQL || ',NVL(DECODE(A.REQUIRE_DIV,''1'',A.REQUIRE_DIV,C.REQUIRE_DIV),''0'')';
				W_SQL := W_SQL || ',C.INPUT_DESCRIPTION';
				--W_SQL := W_SQL || ',DECODE(B.�����敪,''2'',NULL,C.�����l�敪)';
				--W_SQL := W_SQL || ',DECODE(B.�����敪,''2'',NULL,C.�����l)';
				--W_SQL := W_SQL || ',DECODE(B.�����敪,''2'',NULL,C.�����l�e�[�u��)';
				--W_SQL := W_SQL || ',DECODE(B.�����敪,''2'',NULL,C.�����l����)';
				--W_SQL := W_SQL || ',DECODE(B.�����敪,''2'',NULL,C.�����l�Ј��ԍ�)';
				W_SQL := W_SQL || ',NVL(C.DEFAULT_VALUE_DIV,''0'')';
				W_SQL := W_SQL || ',C.DEFAULT_VALUE';
				W_SQL := W_SQL || ',C.DEFAULT_VALUE_TBL';
				W_SQL := W_SQL || ',C.DEFAULT_VALUE_ITEM';
				W_SQL := W_SQL || ',C.DEFAULT_VALUE_EMP_NUMBER';
				W_SQL := W_SQL || ',C.HEADER_NAME';
				W_SQL := W_SQL || ',NVL(C.CONFIRM_DISP_DIV,''1'')';
				W_SQL := W_SQL || ',NVL(C.INPUT_ROW_COUNT,3)';
				W_SQL := W_SQL || ',B.PROCESS_DIV';
				W_SQL := W_SQL || ' FROM WEB_TP0061120_M A';
				W_SQL := W_SQL || '     ,WEB_TP0061140_W B';
				W_SQL := W_SQL || '     ,WEB_TP1000020_M C';
				W_SQL := W_SQL || ' WHERE A.IDENTIFIER=' || W_KEY;
				W_SQL := W_SQL || '   AND A.ITEM_ID=B.NEW_ITEM_ID';
				W_SQL := W_SQL || '   AND B.CUSTOMER_ID=' || P_RID;
				W_SQL := W_SQL || '   AND C.NOTIFICATION_DIV(+)=' || W_TDKFLG;
				W_SQL := W_SQL || '   AND C.IDENTIFIER(+)<=' || W_ID;
				W_SQL := W_SQL || '   AND B.ITEM_ID=C.IDENTIFIER(+)';
				W_SQL := W_SQL || '   AND C.SUPPORT_DIV(+) NOT IN (100,101,102,103)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SVID := NULL;
				W_SQL := 'SELECT A.ITEM_ID';
				W_SQL := W_SQL || ' FROM WEB_TP0061120_M A';
				W_SQL := W_SQL || '     ,WEB_TP0061140_W B';
				W_SQL := W_SQL || '     ,WEB_TP1000020_M C';
				W_SQL := W_SQL || ' WHERE A.IDENTIFIER=' || W_KEY;
				W_SQL := W_SQL || '   AND A.ITEM_ID=B.NEW_ITEM_ID';
				W_SQL := W_SQL || '   AND B.CUSTOMER_ID=' || P_RID;
				W_SQL := W_SQL || '   AND C.NOTIFICATION_DIV(+)=' || W_TDKFLG;
				W_SQL := W_SQL || '   AND C.IDENTIFIER(+)<=' || W_ID;
				W_SQL := W_SQL || '   AND B.ITEM_ID=C.IDENTIFIER(+)';
				W_SQL := W_SQL || '   AND C.SUPPORT_DIV(+) NOT IN (100,101,102,103)';
				W_SQL := W_SQL || '   AND B.PROCESS_DIV=''2''';
				W_SQL := W_SQL || '   AND (A.DATA_TYPE<>C.DATA_TYPE';
				W_SQL := W_SQL || '    OR A.DATA_SIZE<>C.DATA_SIZE';
				W_SQL := W_SQL || '    OR A.INPUT_DIV<>C.INPUT_DIV';
				W_SQL := W_SQL || '    OR A.MASTER_ID<>C.MASTER_ID';
				W_SQL := W_SQL || '    OR A.SUPPORT_DIV<>C.SUPPORT_DIV';
				W_SQL := W_SQL || '    OR A.INPUT_AREA_FORM<>C.INPUT_AREA_FORM';
				W_SQL := W_SQL || '    OR A.REFERENCE_DIV<>C.REFERENCE_DIV)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_NDATA);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP 
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_NDATA);
						W_SVID := W_SVID || ',' || W_NDATA;
					ELSE
						EXIT;
					END IF;
				END LOOP;
				/* �^�C�v�����ύX���ꂽ�ꍇ */
				IF W_SVID IS NOT NULL THEN
					W_SQL := 'UPDATE WEB_TP1000610_W SET';
					W_SQL := W_SQL || '	 DEFAULT_VALUE_DIV = NULL';
					W_SQL := W_SQL || '	,DEFAULT_VALUE = NULL';
					W_SQL := W_SQL || '	,DEFAULT_VALUE_TBL = NULL';
					W_SQL := W_SQL || '	,DEFAULT_VALUE_ITEM = NULL';
					W_SQL := W_SQL || '	,DEFAULT_VALUE_EMP_NUMBER = NULL';
					W_SQL := W_SQL || ' WHERE CUSTOMER_ID = ' || P_RID;
					W_SQL := W_SQL || '   AND IDENTIFIER IN (' || SUBSTR(W_SVID,2) || ')';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					W_SQL := 'UPDATE WEB_TP1000610_W SET';
					W_SQL := W_SQL || '	 SUPPORT_DIV_DEST = NULL';
					W_SQL := W_SQL || ' WHERE CUSTOMER_ID = ' || P_RID;
					W_SQL := W_SQL || '   AND IDENTIFIER IN (' || SUBSTR(W_SVID,2) || ')';
					W_SQL := W_SQL || '   AND SUPPORT_DIV = 0';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				/* ���R�������E���h�c�E�p�����R�E�\�����R�ȊO�̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000020_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV NOT IN (100,101,102,103)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_CNT := 200;
				/* ���h�c�̑ޔ� */
				IF P_RKBN = 1 AND P_KEYUSE = '0' THEN
					W_CNT := W_CNT + 1;
					W_SQL := 'SELECT COUNT(*)';
					W_SQL := W_SQL || '  FROM WEB_TP1000020_M';
					W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV = ' || W_TDKFLG;
					W_SQL := W_SQL || '   AND SUPPORT_DIV = 103';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KCNT1);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KCNT1);
					IF W_KCNT1 > 0 THEN
			            W_SQL := 'UPDATE WEB_TP1000020_M SET ';
						W_SQL := W_SQL || '   IDENTIFIER=' || W_CNT;
						W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
						W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
						W_SQL := W_SQL || '   AND SUPPORT_DIV = 103';
					ELSE
						W_SQL := 'INSERT INTO WEB_TP1000020_M(';
						W_SQL := W_SQL || 'NOTIFICATION_DIV,IDENTIFIER,NOTIFICATION_ITEM,USAGE_DIV,CREATE_DIV,TARGET_DIV,LIST_DISP';
						W_SQL := W_SQL || ',PERSONAL_DIV,PERSONAL_ITEM,SUPPORT_DIV,REQUIRE_DIV,INPUT_AREA_FORM,DISP_ORDER,CONFIRM_DISP_DIV';
						W_SQL := W_SQL || ',UPDATE_DATE,UPDATE_USER';
						W_SQL := W_SQL || ')VALUES(';
						W_SQL := W_SQL || W_TDKFLG || ',' || W_CNT || ',''HISTORY_ID'',''3'',''1'',''1111'',''0''';
						W_SQL := W_SQL || ',' || TO_CHAR(P_KEY+700) || ',''HISTORY_ID'',103,''0'',''0'',-1,''1''';
						W_SQL := W_SQL || ',SYSDATE,:ORA_1)';
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				/* ���h�c�̍폜 */
				IF P_RKBN = 1 AND P_KEYUSE = '1' THEN
					W_SQL := 'DELETE FROM WEB_TP1000020_M';
					W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
					W_SQL := W_SQL || '   AND NVL(SUPPORT_DIV,99999) = 103';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				/* �\�����R�̑ޔ� */
				W_CNT := W_CNT + 1;
				W_MOTO3 := W_CNT;

				/* �\�����R�h�c�擾 */
				W_SQL := 'SELECT MAX(IDENTIFIER)';
				W_SQL := W_SQL || '  FROM WEB_TP1000020_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV = 102';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_MOTOID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_MOTOID);

				/* �\�����R�h�c�̕ϊ��i�ޔ��j */
				SUBL_P_UPD_TDFLDID(W_TDKFLG,W_MOTOID,W_CNT);

	            W_SQL := 'UPDATE WEB_TP1000020_M SET ';
				W_SQL := W_SQL || '  IDENTIFIER=' || W_CNT;
				W_SQL := W_SQL || '  ,DISP_ORDER=2';
				W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
				W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV = 102';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �p�����R�̑ޔ� */
				W_CNT := W_CNT + 1;
				W_MOTO4 := W_CNT;

				/* �p�����R�h�c�擾 */
				W_SQL := 'SELECT MAX(IDENTIFIER)';
				W_SQL := W_SQL || '  FROM WEB_TP1000020_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV = 100';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_MOTOID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_MOTOID);

				/* �p�����R�h�c�̕ϊ��i�ޔ��j */
				SUBL_P_UPD_TDFLDID(W_TDKFLG,W_MOTOID,W_CNT);

	            W_SQL := 'UPDATE WEB_TP1000020_M SET ';
				W_SQL := W_SQL || '   IDENTIFIER=' || W_CNT;
				W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
				W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV = 100';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ���R�������̕\�����ύX�Ή� */
	            W_SQL := 'UPDATE WEB_TP1000020_M SET ';
				W_SQL := W_SQL || '   DISP_ORDER=1';
				W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
				W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV = 101';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ���ڂ̓o�^ */
				W_SQL := 'INSERT INTO WEB_TP1000020_M(';
				W_SQL := W_SQL || 'NOTIFICATION_DIV,IDENTIFIER,NOTIFICATION_ITEM,MANAGEMENT_NAME,MANAGEMENT_NAME_DEFAULT';
				W_SQL := W_SQL || ',LIST_DISP,USAGE_DIV,TARGET_DIV,CREATE_DIV';
				W_SQL := W_SQL || ',PERSONAL_DIV,PERSONAL_ITEM,DATA_TYPE,DATA_SIZE,FRACTION_SIZE,SUPPORT_DIV,SUPPORT_DIV_DEST,REQUIRE_DIV,IME_DIV,INPUT_DIV,REFERENCE_DIV';
				W_SQL := W_SQL || ',MASTER_ID,LITERAL_CONTENT,INPUT_AREA_FORM,DISP_ORDER';
				W_SQL := W_SQL || ',INPUT_DESCRIPTION,DEFAULT_VALUE_DIV,DEFAULT_VALUE,DEFAULT_VALUE_TBL,DEFAULT_VALUE_ITEM,DEFAULT_VALUE_EMP_NUMBER,HEADER_NAME,CONFIRM_DISP_DIV,INPUT_ROW_COUNT';
				W_SQL := W_SQL || ',UPDATE_DATE,UPDATE_USER)';
				W_SQL := W_SQL || ' SELECT ';
				W_SQL := W_SQL || '' || W_TDKFLG || ',IDENTIFIER,NOTIFICATION_ITEM,MANAGEMENT_NAME,MANAGEMENT_NAME_DEFAULT';
				W_SQL := W_SQL || ',LIST_DISP,USAGE_DIV,TARGET_DIV,CREATE_DIV';
				W_SQL := W_SQL || ',PERSONAL_DIV,PERSONAL_ITEM,DATA_TYPE,DATA_SIZE,FRACTION_SIZE,SUPPORT_DIV,SUPPORT_DIV_DEST,REQUIRE_DIV,IME_DIV,INPUT_DIV,REFERENCE_DIV';
				W_SQL := W_SQL || ',MASTER_ID,LITERAL_CONTENT,INPUT_AREA_FORM,DISP_ORDER';
				W_SQL := W_SQL || ',INPUT_DESCRIPTION,DEFAULT_VALUE_DIV,DEFAULT_VALUE,DEFAULT_VALUE_TBL,DEFAULT_VALUE_ITEM,DEFAULT_VALUE_EMP_NUMBER,HEADER_NAME,CONFIRM_DISP_DIV,INPUT_ROW_COUNT';
				W_SQL := W_SQL || ',SYSDATE,:ORA_1';
				W_SQL := W_SQL || ' FROM WEB_TP1000610_W';
				W_SQL := W_SQL || ' WHERE CUSTOMER_ID=' || P_RID;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ���h�c�E�\�����R�E�p�����R�̍̔� */
				SELECT MAX(ITEM_ID) INTO W_CNT
				  FROM WEB_TP0061120_M
				 WHERE IDENTIFIER = W_KEY;

	            W_SQL := 'UPDATE WEB_TP1000020_M SET ';
				W_SQL := W_SQL || '  IDENTIFIER=IDENTIFIER-' || (201 - W_CNT - 1);
--				W_SQL := W_SQL || '  ,�\����=�h�c-' || (201 - W_CNT - 1);
				W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
				W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV IN (100,102,103)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �\�����̍Ċ��U�� */
				W_SQL := 'SELECT IDENTIFIER';
				W_SQL := W_SQL || ' FROM WEB_TP1000020_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV NOT IN (100,101,102,103)';
				W_SQL := W_SQL || ' ORDER BY DECODE(USAGE_DIV,''3'',2,1),DISP_ORDER,IDENTIFIER';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_I);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_J := 2;
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_I);
						W_J := W_J + 1;
						W_SQL := 'UPDATE WEB_TP1000020_M SET ';
						W_SQL := W_SQL || '   DISP_ORDER=' || W_J;
						W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
						W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
						W_SQL := W_SQL || '   AND IDENTIFIER = ' || W_I;
						DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',P_UPDID);
						W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
					ELSE
						EXIT;
					END IF;
				END LOOP;

				IF P_UPDKBN = 2 AND P_RKBN = 1 THEN				/* ���敪:�� */
					W_KEYFIELD := '';

					/* �\�������ݒ�̎擾 */
					W_SQL := 'SELECT APPLY_PROCESS_CONF';
					W_SQL := W_SQL || ',APPLY_GENERAL';
					W_SQL := W_SQL || ',APPLY_BOSS';
					W_SQL := W_SQL || ',APPLY_PERSONNEL1';
					W_SQL := W_SQL || ',APPLY_PERSONNEL2';
					W_SQL := W_SQL || ' FROM WEB_TP1000010_M';
					W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_SDATA(1),10);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_SDATA(2),10);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_SDATA(3),10);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_SDATA(4),10);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_SDATA(5),10);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_SDATA(1));
						DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_SDATA(2));
						DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_SDATA(3));
						DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_SDATA(4));
						DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_SDATA(5));
					END IF;

					IF P_KEYUSE = '0' THEN		/* �L�[�ݒ�:�� */
						/* �g�p�敪�̕ύX */
						W_SQL := 'UPDATE WEB_TP1000020_M SET ';
						W_SQL := W_SQL || '   USAGE_DIV=''1''';
						W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
						W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
						W_SQL := W_SQL || '   AND SUPPORT_DIV NOT IN (100,101,102,103)';
						W_SQL := W_SQL || '   AND USAGE_DIV = ''2''';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);

						/* �L�[���ڂ̎擾 */
						W_KEYFIELD := 'HISTORY_ID';

						/* �\�������ݒ�E�l���KEY�̕ύX */
						W_SQL := 'UPDATE WEB_TP1000010_M SET ';
						W_SQL := W_SQL || '   APPLY_PROCESS_CONF=''' || SUBSTR(W_SDATA(1),1,1) || '1' || SUBSTR(W_SDATA(1),3,1) || '''';
						W_SQL := W_SQL || '  ,PERSONAL_INFO_KEY=''' || W_KEYFIELD || '''';
						W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
						W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					ELSIF P_KEYUSE = '1' THEN	/* �L�[�ݒ�:�L */
						/* �L�[���ڂ̎擾 */
						W_SQL := 'SELECT A.IDENTIFIER';
						W_SQL := W_SQL || ' ,NVL(A.TARGET_DIV,''0000'')';
						W_SQL := W_SQL || '  FROM WEB_TP1000020_M A';
						W_SQL := W_SQL || '      ,WEB_TP0000020_M B';
						W_SQL := W_SQL || ' WHERE A.NOTIFICATION_DIV = ' || W_TDKFLG;
						W_SQL := W_SQL || '   AND A.PERSONAL_DIV = B.DIV';
						W_SQL := W_SQL || '   AND A.PERSONAL_ITEM = B.ITEM_NAME';
						W_SQL := W_SQL || '   AND B.KEY_ITEM IS NOT NULL';
						W_SQL := W_SQL || '   AND B.KEY_ITEM > 0';
						W_SQL := W_SQL || ' ORDER BY A.IDENTIFIER';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_GET_ID);
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_GET_TKBN,20);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						LOOP 
							W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);

							IF W_RVL > 0 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_GET_ID);
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_GET_TKBN);
								/* �g�p�敪�E�K�{�敪�E�Ώۋ敪�̕ύX(�L�[����) */
								W_SQL := 'UPDATE WEB_TP1000020_M SET ';
								W_SQL := W_SQL || '   USAGE_DIV=''2''';
								W_SQL := W_SQL || '  ,REQUIRE_DIV=''1''';
								W_SQL := W_SQL || '  ,TARGET_DIV=''' || '1' || SUBSTR(W_GET_TKBN,2) || '''';
								W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
								W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
								W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
								W_SQL := W_SQL || '   AND IDENTIFIER =' || W_GET_ID;
								W_SQL := W_SQL || '   AND SUPPORT_DIV NOT IN (100,101,102,103)';
								DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',P_UPDID);
								W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
							ELSE
								EXIT;
							END IF;
						END LOOP;

						/* �g�p�敪�̕ύX(�L�[���ڈȊO) */
						W_SQL := 'UPDATE WEB_TP1000020_M SET ';
						W_SQL := W_SQL || '   USAGE_DIV=''1''';
						W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
						W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
						W_SQL := W_SQL || '   AND IDENTIFIER NOT IN (SELECT A.IDENTIFIER';
						W_SQL := W_SQL || '                      FROM WEB_TP1000020_M A';
						W_SQL := W_SQL || '                          ,WEB_TP0000020_M B';
						W_SQL := W_SQL || '                     WHERE A.NOTIFICATION_DIV =' || W_TDKFLG;
						W_SQL := W_SQL || '                       AND A.PERSONAL_DIV = B.DIV';
						W_SQL := W_SQL || '                       AND A.PERSONAL_ITEM = B.ITEM_NAME';
						W_SQL := W_SQL || '                       AND B.KEY_ITEM IS NOT NULL)';
						W_SQL := W_SQL || '   AND SUPPORT_DIV NOT IN (100,101,102,103)';
						W_SQL := W_SQL || '   AND USAGE_DIV=''2''';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);

						/* �L�[���ڂ̎擾 */
						FOR C_009_REC IN C_009(W_KEY) LOOP
							W_KEYFIELD := W_KEYFIELD || ',' || C_009_REC.ITEM_NAME;
						END LOOP;
						W_KEYFIELD := SUBSTR(W_KEYFIELD,2);

						/* ���敪�E�\�������ݒ�E�l���KEY�̕ύX */
						W_SQL := 'UPDATE WEB_TP1000010_M SET ';
						W_SQL := W_SQL || ' HISTORY_DIV=''1''';
						W_SQL := W_SQL || ',APPLY_PROCESS_CONF=''' || SUBSTR(W_SDATA(1),1,1) || '2' || SUBSTR(W_SDATA(1),3,1) || '''';
						W_SQL := W_SQL || ',APPLY_GENERAL=''' || SUBSTR(W_SDATA(2),1,1) || '0' || SUBSTR(W_SDATA(2),3,1) || '''';
						W_SQL := W_SQL || ',APPLY_BOSS=''' || SUBSTR(W_SDATA(3),1,1) || '0' || SUBSTR(W_SDATA(3),3,1) || '''';
						W_SQL := W_SQL || ',APPLY_PERSONNEL1=''' || SUBSTR(W_SDATA(4),1,1) || '0' || SUBSTR(W_SDATA(4),3,1) || '''';
						W_SQL := W_SQL || ',APPLY_PERSONNEL2=''' || SUBSTR(W_SDATA(5),1,1) || '0' || SUBSTR(W_SDATA(5),3,1) || '''';
						W_SQL := W_SQL || ',PERSONAL_INFO_KEY=''' || W_KEYFIELD || '''';
						W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || ',UPDATE_USER=:ORA_1';
						W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;

				END IF;

			/**********************************************************************/
			/* ���̓`�F�b�N�E��o�����ݒ�E�O����e�[�u���̐V�h�c�̕ύX����       */
			/**********************************************************************/
				IF P_UPDKBN = 2 THEN
					IF P_RKBN = '1' AND P_KEYUSE = '0' THEN
						W_CNT := W_CNT + 1;
					END IF;

					/* �\�����R�ǉ� */
					W_CNT := W_CNT + 1;
					W_CHGCNT := W_CHGCNT + 1;
					W_OLDID(W_CHGCNT) := W_MOTO1;
					W_NEWID(W_CHGCNT) := W_CNT;

					/* �p�����R�ǉ� */
					W_CNT := W_CNT + 1;
					W_CHGCNT := W_CHGCNT + 1;
					W_OLDID(W_CHGCNT) := W_MOTO2;
					W_NEWID(W_CHGCNT) := W_CNT;

					FOR W_I IN 1..W_CHGCNT LOOP
						IF (W_NEWID(W_I) <> W_OLDID(W_I)) OR W_OLDID(W_I) = W_MOTO1 OR W_OLDID(W_I) = W_MOTO2 THEN

							IF W_OLDID(W_I) = W_MOTO1 THEN		/* �\�����R�h�c */
								W_MOTOID := W_MOTO3;
							ELSIF W_OLDID(W_I) = W_MOTO2 THEN	/* �p�����R�h�c */
								W_MOTOID := W_MOTO4;
							ELSE
								W_MOTOID := W_OLDID(W_I);
							END IF;

							SUBL_P_UPD_TDFLDID(W_TDKFLG,W_MOTOID,W_NEWID(W_I));

						END IF;
					END LOOP;

				/**********************************************************************/
				/* �e�Ѓp�����[�^�ύX����(�ύX���̂�)                                 */
				/**********************************************************************/
					/* [WEB_TP1000021_M] */
					FOR W_I IN 1..W_KCNT2 LOOP

						W_SQL := 'SELECT A.MANAGEMENT_NAME';				--1
						W_SQL := W_SQL || ',A.USAGE_DIV';			--2
						W_SQL := W_SQL || ',A.TARGET_DIV';			--3
						W_SQL := W_SQL || ',A.SUPPORT_DIV';			--4
						W_SQL := W_SQL || ',A.REQUIRE_DIV';			--5
						W_SQL := W_SQL || ',A.DISP_ORDER';				--6
						W_SQL := W_SQL || ',A.INPUT_DESCRIPTION';			--7
						W_SQL := W_SQL || ',A.DEFAULT_VALUE_DIV';			--8
						W_SQL := W_SQL || ',A.DEFAULT_VALUE';				--9
						W_SQL := W_SQL || ',A.DEFAULT_VALUE_TBL';		--10
						W_SQL := W_SQL || ',A.DEFAULT_VALUE_ITEM';			--11
						W_SQL := W_SQL || ',A.DEFAULT_VALUE_EMP_NUMBER';		--12
						W_SQL := W_SQL || ',A.HEADER_NAME';			--13
						W_SQL := W_SQL || ',A.CONFIRM_DISP_DIV';		--14
						W_SQL := W_SQL || ',C.NEW_ITEM_ID';			--15
						W_SQL := W_SQL || ',B.INPUT_DIV';			--16
						W_SQL := W_SQL || ',B.REFERENCE_DIV';			--17
						W_SQL := W_SQL || ',B.INPUT_AREA_FORM';			--18
						W_SQL := W_SQL || ',B.SUPPORT_DIV';			--19
						W_SQL := W_SQL || ',DECODE(B.SUPPORT_DIV,0,NVL(B.SUPPORT_DIV_DEST,A.SUPPORT_DIV_DEST),B.SUPPORT_DIV_DEST)';		--20
						W_SQL := W_SQL || '  FROM WEB_TP1000021_M A';
						W_SQL := W_SQL || '      ,WEB_TP1000610_W B';
						W_SQL := W_SQL || '      ,WEB_TP0061140_W C';
						W_SQL := W_SQL || ' WHERE A.KAISYACD = :ORA_1';
						W_SQL := W_SQL || '   AND A.NOTIFICATION_DIV = ' || W_TDKFLG;
						W_SQL := W_SQL || '   AND A.IDENTIFIER = C.ITEM_ID(+)';
						W_SQL := W_SQL || '   AND B.CUSTOMER_ID(+) = ' || P_RID;
						W_SQL := W_SQL || '   AND B.CREATE_DIV(+) =''1''';
						W_SQL := W_SQL || '   AND C.CUSTOMER_ID = ' || P_RID;
						W_SQL := W_SQL || '   AND C.NEW_ITEM_ID = B.IDENTIFIER(+)';
						W_SQL := W_SQL || '   AND C.PROCESS_DIV NOT IN (''1'',''3'',''4'')';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_21REC_V(1),510);	-- A.�Ǘ�����
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_21REC_V(2),510);   -- A.�g�p�敪
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_21REC_V(3),510);   -- A.�Ώۋ敪
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_21REC_N(1));       -- A.�⏕�敪
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_21REC_V(4),510);   -- A.�K�{�敪
						DBMS_SQL.DEFINE_COLUMN(W_CSR,6,W_21REC_N(2));       -- A.�\����
						DBMS_SQL.DEFINE_COLUMN(W_CSR,7,W_21REC_V(5),510);   -- A.���͐���
						DBMS_SQL.DEFINE_COLUMN(W_CSR,8,W_21REC_V(6),510);   -- A.�����l�敪
						DBMS_SQL.DEFINE_COLUMN(W_CSR,9,W_21REC_V(7),510);   -- A.�����l
						DBMS_SQL.DEFINE_COLUMN(W_CSR,10,W_21REC_V(8),510);  -- A.�����l�e�[�u��
						DBMS_SQL.DEFINE_COLUMN(W_CSR,11,W_21REC_V(9),510);  -- A.�����l����
						DBMS_SQL.DEFINE_COLUMN(W_CSR,12,W_21REC_V(10),510);	-- A.�����l�Ј��ԍ�
						DBMS_SQL.DEFINE_COLUMN(W_CSR,13,W_21REC_V(11),510); -- A.�w�b�_�[��
						DBMS_SQL.DEFINE_COLUMN(W_CSR,14,W_21REC_V(12),510); -- A.�m�F�\���敪
						DBMS_SQL.DEFINE_COLUMN(W_CSR,15,W_21REC_N(3));      -- C.�V���ڂh�c
						DBMS_SQL.DEFINE_COLUMN(W_CSR,16,W_21REC_V(13),510); -- B.���͋敪
						DBMS_SQL.DEFINE_COLUMN(W_CSR,17,W_21REC_V(14),510); -- B.�Q�Ƌ敪
						DBMS_SQL.DEFINE_COLUMN(W_CSR,18,W_21REC_V(15),510); -- B.���͈�`��
						DBMS_SQL.DEFINE_COLUMN(W_CSR,19,W_21REC_N(4));      -- B.�⏕�敪
						DBMS_SQL.DEFINE_COLUMN(W_CSR,20,W_21REC_V(16),510); -- B.�⏕�敪��
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						LOOP 
							W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
							IF W_RVL > 0 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_21REC_V(1));
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_21REC_V(2));
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_21REC_V(3));
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_21REC_N(1));
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_21REC_V(4));
								DBMS_SQL.COLUMN_VALUE(W_CSR,6,W_21REC_N(2));
								DBMS_SQL.COLUMN_VALUE(W_CSR,7,W_21REC_V(5));
								DBMS_SQL.COLUMN_VALUE(W_CSR,8,W_21REC_V(6));
								DBMS_SQL.COLUMN_VALUE(W_CSR,9,W_21REC_V(7));
								DBMS_SQL.COLUMN_VALUE(W_CSR,10,W_21REC_V(8));
								DBMS_SQL.COLUMN_VALUE(W_CSR,11,W_21REC_V(9));
								DBMS_SQL.COLUMN_VALUE(W_CSR,12,W_21REC_V(10));
								DBMS_SQL.COLUMN_VALUE(W_CSR,13,W_21REC_V(11));
								DBMS_SQL.COLUMN_VALUE(W_CSR,14,W_21REC_V(12));
								DBMS_SQL.COLUMN_VALUE(W_CSR,15,W_21REC_N(3));
								DBMS_SQL.COLUMN_VALUE(W_CSR,16,W_21REC_V(13));
								DBMS_SQL.COLUMN_VALUE(W_CSR,17,W_21REC_V(14));
								DBMS_SQL.COLUMN_VALUE(W_CSR,18,W_21REC_V(15));
								DBMS_SQL.COLUMN_VALUE(W_CSR,19,W_21REC_N(4));
								DBMS_SQL.COLUMN_VALUE(W_CSR,20,W_21REC_V(16));
								W_SQL := 'UPDATE WEB_TP1000610_W A SET';
								W_SQL := W_SQL || ' A.MANAGEMENT_NAME = :ORA_21REC_V1,';
								W_SQL := W_SQL || ' A.USAGE_DIV = :ORA_21REC_V2,';
								W_SQL := W_SQL || ' A.TARGET_DIV = :ORA_21REC_V3,';
								W_SQL := W_SQL || ' A.SUPPORT_DIV = NULL,';
								W_SQL := W_SQL || ' A.REQUIRE_DIV = :ORA_21REC_V4,';
								W_SQL := W_SQL || ' A.DISP_ORDER = ' || TO_CHAR(W_21REC_N(2)-2) || ',';
								W_SQL := W_SQL || ' A.INPUT_DESCRIPTION = :ORA_21REC_V5,';
								W_SQL := W_SQL || ' A.DEFAULT_VALUE_DIV = :ORA_21REC_V6,';
								W_SQL := W_SQL || ' A.DEFAULT_VALUE = :ORA_21REC_V7,';
								W_SQL := W_SQL || ' A.DEFAULT_VALUE_TBL = :ORA_21REC_V8,';
								W_SQL := W_SQL || ' A.DEFAULT_VALUE_ITEM = :ORA_21REC_V9,';
								W_SQL := W_SQL || ' A.DEFAULT_VALUE_EMP_NUMBER = :ORA_21REC_V10,';
								W_SQL := W_SQL || ' A.HEADER_NAME = :ORA_21REC_V11,';
								W_SQL := W_SQL || ' A.CONFIRM_DISP_DIV = :ORA_21REC_V12';
								W_SQL := W_SQL || ' WHERE A.CUSTOMER_ID = ' || P_RID;
								W_SQL := W_SQL || '  AND A.IDENTIFIER = ' || W_21REC_N(3);
								DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V1',W_21REC_V(1));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V2',W_21REC_V(2));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V3',W_21REC_V(3));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V4',W_21REC_V(4));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V5',W_21REC_V(5));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V6',W_21REC_V(6));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V7',W_21REC_V(7));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V8',W_21REC_V(8));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V9',W_21REC_V(9));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V10',W_21REC_V(10));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V11',W_21REC_V(11));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_21REC_V12',W_21REC_V(12));
								W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);

								/* �⏕�敪���X�V���邩���f */
								IF W_21REC_V(13) = '0' OR (W_21REC_V(13) = '1' AND W_21REC_V(14) = '4') THEN
									IF W_21REC_V(15) = '0' THEN
										IF W_21REC_N(4) IS NULL OR (W_21REC_N(4) IN (0,14,15) AND W_21REC_N(1) IN (0,14,15)) THEN
											IF W_21REC_N(1) IS NOT NULL THEN
												W_SQL := 'UPDATE WEB_TP1000610_W A SET';
												W_SQL := W_SQL || ' A.SUPPORT_DIV = ' || W_21REC_N(1);
												IF W_21REC_V(16) = '10001' THEN
													W_SQL := W_SQL || ',A.SUPPORT_DIV_DEST = ' || W_21REC_V(16);
 												END IF;
												W_SQL := W_SQL || ' WHERE A.CUSTOMER_ID = ' || P_RID;
												W_SQL := W_SQL || '  AND A.IDENTIFIER = ' || W_21REC_N(3);
												DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
												W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
											END IF;
										END IF;
									END IF;
								END IF;
							ELSE
								EXIT;
							END IF;
						END LOOP;

						/* �^�C�v�����ύX���ꂽ�ꍇ */
						IF W_SVID IS NOT NULL THEN
							W_SQL := 'UPDATE WEB_TP1000610_W SET';
							W_SQL := W_SQL || '	 DEFAULT_VALUE_DIV = NULL';
							W_SQL := W_SQL || '	,DEFAULT_VALUE = NULL';
							W_SQL := W_SQL || '	,DEFAULT_VALUE_TBL = NULL';
							W_SQL := W_SQL || '	,DEFAULT_VALUE_ITEM = NULL';
							W_SQL := W_SQL || '	,DEFAULT_VALUE_EMP_NUMBER = NULL';
							W_SQL := W_SQL || ' WHERE CUSTOMER_ID = ' || P_RID;
							W_SQL := W_SQL || '   AND IDENTIFIER IN (' || SUBSTR(W_SVID,2) || ')';
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);

							W_SQL := 'UPDATE WEB_TP1000610_W SET';
							W_SQL := W_SQL || '	 SUPPORT_DIV_DEST = NULL';
							W_SQL := W_SQL || ' WHERE CUSTOMER_ID = ' || P_RID;
							W_SQL := W_SQL || '   AND IDENTIFIER IN (' || SUBSTR(W_SVID,2) || ')';
							W_SQL := W_SQL || '   AND SUPPORT_DIV = 0';
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						END IF;

						W_SQL := 'DELETE FROM WEB_TP1000021_M';
						W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
						W_SQL := W_SQL || '   AND NOTIFICATION_DIV = ' || W_TDKFLG;
						W_SQL := W_SQL || '   AND NVL(SUPPORT_DIV,99999) NOT IN (100,101,102,103)';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);

						W_CNT := 200;
						/* ���h�c�̑ޔ� */
						IF P_RKBN = 1 AND P_KEYUSE = '0' THEN
							W_CNT := W_CNT + 1;
							W_SQL := 'SELECT COUNT(*)';
							W_SQL := W_SQL || '  FROM WEB_TP1000021_M';
							W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
							W_SQL := W_SQL || '   AND NOTIFICATION_DIV = ' || W_TDKFLG;
							W_SQL := W_SQL || '   AND SUPPORT_DIV = 103';
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KCNT1);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
							W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KCNT1);
							IF W_KCNT1 > 0 THEN
					            W_SQL := 'UPDATE WEB_TP1000021_M SET ';
								W_SQL := W_SQL || '  IDENTIFIER=' || W_CNT;
								W_SQL := W_SQL || ' ,UPDATE_DATE=SYSDATE';
								W_SQL := W_SQL || ' ,UPDATE_USER=:ORA_2';
								W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
								W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
								W_SQL := W_SQL || '   AND SUPPORT_DIV = 103';
							ELSE
								W_SQL := 'INSERT INTO WEB_TP1000021_M(';
								W_SQL := W_SQL || 'KAISYACD,NOTIFICATION_DIV,IDENTIFIER,USAGE_DIV,TARGET_DIV,LIST_DISP';
								W_SQL := W_SQL || ',SUPPORT_DIV,REQUIRE_DIV,DISP_ORDER,CONFIRM_DISP_DIV,UPDATE_DATE,UPDATE_USER';
								W_SQL := W_SQL || ')VALUES(';
								W_SQL := W_SQL || ':ORA_1,' || W_TDKFLG || ',' || W_CNT || ',''3'',''1111'',''0''';
								W_SQL := W_SQL || ',103,''0'',-1,''1'',SYSDATE,:ORA_2)';
							END IF;
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						END IF;

						/* ���h�c�̍폜 */
						IF P_RKBN = 1 AND P_KEYUSE = '1' THEN
							W_SQL := 'DELETE FROM WEB_TP1000021_M';
							W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
							W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
							W_SQL := W_SQL || '   AND NVL(SUPPORT_DIV,99999) = 103';
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						END IF;

						/* �\�����R�̑ޔ� */
						W_CNT := W_CNT + 1;
			            W_SQL := 'UPDATE WEB_TP1000021_M SET ';
						W_SQL := W_SQL || ' IDENTIFIER=' || W_CNT;
						W_SQL := W_SQL || ',DISP_ORDER=2';
						W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || ',UPDATE_USER=:ORA_2';
						W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
						W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
						W_SQL := W_SQL || '   AND SUPPORT_DIV = 102';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);

						/* �p�����R�̑ޔ� */
						W_CNT := W_CNT + 1;
			            W_SQL := 'UPDATE WEB_TP1000021_M SET ';
						W_SQL := W_SQL || ' IDENTIFIER=' || W_CNT;
						W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || ',UPDATE_USER=:ORA_2';
						W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
						W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
						W_SQL := W_SQL || '   AND SUPPORT_DIV = 100';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);

						/* ���R�������̕\�����ύX�Ή� */
			            W_SQL := 'UPDATE WEB_TP1000021_M SET ';
						W_SQL := W_SQL || ' DISP_ORDER=1';
						W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || ',UPDATE_USER=:ORA_2';
						W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
						W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
						W_SQL := W_SQL || '   AND SUPPORT_DIV = 101';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						
						/* �ǉ����ڂ̕\�����͊������ڂ̖��ԁ{�P���珇�ɐݒ肷�� */
						W_SQL := 'SELECT COUNT(*)';
						W_SQL := W_SQL || '  FROM WEB_TP1000610_W';
						W_SQL := W_SQL || ' WHERE CUSTOMER_ID = ' || P_RID;
						W_SQL := W_SQL || '   AND PROCESS_DIV =''1''';
						W_SQL := W_SQL || '   AND CREATE_DIV =''1''';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KCNT1);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KCNT1);

						W_SQL := 'SELECT MAX(DISP_ORDER)';
						W_SQL := W_SQL || ' 	FROM WEB_TP1000610_W';
						W_SQL := W_SQL || ' 	WHERE CUSTOMER_ID = :ORA_1';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_CNT);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_RID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_CNT);

						FOR W_I IN 1..W_KCNT1 LOOP
							W_CNT := W_CNT + 1;
							W_SQL := 'UPDATE WEB_TP1000610_W SET ';
							W_SQL := W_SQL || ' DISP_ORDER =:ORA_1';
							W_SQL := W_SQL || ' ,PROCESS_DIV =''2''';
							W_SQL := W_SQL || ' WHERE CUSTOMER_ID = ' || P_RID;
							W_SQL := W_SQL || '   AND PROCESS_DIV =''1''';
							W_SQL := W_SQL || '   AND CREATE_DIV =''1''';
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_CNT);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						END LOOP;

						W_SQL := 'INSERT INTO WEB_TP1000021_M(';
						W_SQL := W_SQL || ' KAISYACD,';
						W_SQL := W_SQL || ' NOTIFICATION_DIV,';
						W_SQL := W_SQL || ' IDENTIFIER,';
						W_SQL := W_SQL || ' MANAGEMENT_NAME,';
						W_SQL := W_SQL || ' USAGE_DIV,';
						W_SQL := W_SQL || ' TARGET_DIV,';
						W_SQL := W_SQL || ' LIST_DISP,';
						W_SQL := W_SQL || ' SUPPORT_DIV,';
						W_SQL := W_SQL || ' SUPPORT_DIV_DEST,';
						W_SQL := W_SQL || ' REQUIRE_DIV,';
						W_SQL := W_SQL || ' DISP_ORDER,';
						W_SQL := W_SQL || ' INPUT_DESCRIPTION,';
						W_SQL := W_SQL || ' DEFAULT_VALUE_DIV,';
						W_SQL := W_SQL || ' DEFAULT_VALUE,';
						W_SQL := W_SQL || ' DEFAULT_VALUE_TBL,';
						W_SQL := W_SQL || ' DEFAULT_VALUE_ITEM,';
						W_SQL := W_SQL || ' DEFAULT_VALUE_EMP_NUMBER,';
						W_SQL := W_SQL || ' HEADER_NAME,';
						W_SQL := W_SQL || ' CONFIRM_DISP_DIV,';
						W_SQL := W_SQL || ' INPUT_ROW_COUNT,';
						W_SQL := W_SQL || ' UPDATE_DATE,';
						W_SQL := W_SQL || ' UPDATE_USER)';
						W_SQL := W_SQL || ' SELECT';
						W_SQL := W_SQL || ' :ORA_1,';
						W_SQL := W_SQL || ' ' || W_TDKFLG || ',';
						W_SQL := W_SQL || ' IDENTIFIER,';
						W_SQL := W_SQL || ' DECODE(PERSONAL_DIV,NULL,MANAGEMENT_NAME,DECODE(MANAGEMENT_NAME,MANAGEMENT_NAME_DEFAULT,NULL,MANAGEMENT_NAME)),';
						W_SQL := W_SQL || ' DECODE(KEY_CONF,NULL,USAGE_DIV,''2''),';
						W_SQL := W_SQL || ' TARGET_DIV,';
						W_SQL := W_SQL || ' LIST_DISP,';
						W_SQL := W_SQL || ' SUPPORT_DIV,';
						W_SQL := W_SQL || ' SUPPORT_DIV_DEST,';
						W_SQL := W_SQL || ' DECODE(KEY_CONF,NULL,REQUIRE_DIV,''1''),';
						W_SQL := W_SQL || ' DISP_ORDER,';
						W_SQL := W_SQL || ' INPUT_DESCRIPTION,';
						W_SQL := W_SQL || ' DEFAULT_VALUE_DIV,';
						W_SQL := W_SQL || ' DEFAULT_VALUE,';
						W_SQL := W_SQL || ' DEFAULT_VALUE_TBL,';
						W_SQL := W_SQL || ' DEFAULT_VALUE_ITEM,';
						W_SQL := W_SQL || ' DEFAULT_VALUE_EMP_NUMBER,';
						W_SQL := W_SQL || ' HEADER_NAME,';
						W_SQL := W_SQL || ' CONFIRM_DISP_DIV,';
						W_SQL := W_SQL || ' INPUT_ROW_COUNT,';
						W_SQL := W_SQL || ' SYSDATE,';
						W_SQL := W_SQL || ' :ORA_2';
						W_SQL := W_SQL || ' FROM WEB_TP1000610_W';
						W_SQL := W_SQL || ' WHERE CUSTOMER_ID = ' || P_RID;
						W_SQL := W_SQL || '   AND PROCESS_DIV NOT IN (''3'',''4'')';
						W_SQL := W_SQL || '   AND CREATE_DIV =''1''';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);

						/* ���h�c�E�\�����R�E�p�����R�̍̔� */
						SELECT MAX(ITEM_ID) INTO W_CNT
						  FROM WEB_TP0061120_M
						 WHERE IDENTIFIER = W_KEY;

			            W_SQL := 'UPDATE WEB_TP1000021_M SET ';
						W_SQL := W_SQL || ' IDENTIFIER=IDENTIFIER-' || (201 - W_CNT - 1);
						W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || ',UPDATE_USER=:ORA_2';
						W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
						W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
						W_SQL := W_SQL || '   AND SUPPORT_DIV IN (100,102,103)';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);

						W_SQL := 'SELECT NVL(B.IDENTIFIER,A.IDENTIFIER) IDENTIFIER';
						W_SQL := W_SQL || '  FROM WEB_TP1000020_M A';
						W_SQL := W_SQL || '      ,WEB_TP1000021_M B';
						W_SQL := W_SQL || ' WHERE A.NOTIFICATION_DIV = ' || W_TDKFLG;
						W_SQL := W_SQL || '   AND B.KAISYACD(+) = :ORA_1';
						W_SQL := W_SQL || '   AND B.NOTIFICATION_DIV(+) = A.NOTIFICATION_DIV';
						W_SQL := W_SQL || '   AND B.IDENTIFIER(+) = A.IDENTIFIER';
						W_SQL := W_SQL || '   AND NVL(NVL(B.SUPPORT_DIV,A.SUPPORT_DIV),99999) NOT IN (100,101,102,103)';
						W_SQL := W_SQL || ' ORDER BY DECODE(NVL(B.USAGE_DIV,A.USAGE_DIV),''3'',2,1),NVL(B.DISP_ORDER,A.DISP_ORDER),IDENTIFIER';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_K);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						W_J := 2;
						LOOP
							W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
							IF W_RVL > 0 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_K);
								W_J := W_J + 1;
								W_SQL := 'UPDATE WEB_TP1000021_M SET ';
								W_SQL := W_SQL || ' DISP_ORDER=' || W_J;
								W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
								W_SQL := W_SQL || ',UPDATE_USER=:ORA_2';
								W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
								W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
								W_SQL := W_SQL || '   AND IDENTIFIER = ' || W_K;
								DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KCD(W_I));
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',P_UPDID);
								W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
							ELSE
								EXIT;
							END IF;
						END LOOP;

						IF P_RKBN = 1 THEN				/* ���敪:�� */

							FOR W_I IN 1..5 LOOP
								W_SDATA(W_I) := NULL;
							END LOOP;

							/* �\�������ݒ�̎擾 */
							W_SQL := 'SELECT APPLY_GENERAL';
							W_SQL := W_SQL || ',APPLY_BOSS';
							W_SQL := W_SQL || ',APPLY_PERSONNEL1';
							W_SQL := W_SQL || ',APPLY_PERSONNEL2';
							W_SQL := W_SQL || ' FROM WEB_TP1000011_M';
							W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
							W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
							DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_SDATA(1),10);
							DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_SDATA(2),10);
							DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_SDATA(3),10);
							DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_SDATA(4),10);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
							W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
							IF W_RVL > 0 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_SDATA(1));
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_SDATA(2));
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_SDATA(3));
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_SDATA(4));
							END IF;

							IF P_KEYUSE = '0' THEN		/* �L�[�ݒ�:�� */
								/* �g�p�敪�̕ύX */
								W_SQL := 'UPDATE WEB_TP1000021_M SET ';
								W_SQL := W_SQL || ' USAGE_DIV=''1''';
								W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
								W_SQL := W_SQL || ',UPDATE_USER=:ORA_2';
								W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
								W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
								W_SQL := W_SQL || '   AND (SUPPORT_DIV IS NULL';
								W_SQL := W_SQL || '        OR (SUPPORT_DIV IS NOT NULL AND SUPPORT_DIV NOT IN (100,101,102,103)))';
								W_SQL := W_SQL || '   AND USAGE_DIV = ''2''';
								DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
								DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
								DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
								W_RVL := DBMS_SQL.EXECUTE(W_CSR);
							ELSIF P_KEYUSE = '1' THEN	/* �L�[�ݒ�:�L */
								W_SQL := 'SELECT A.IDENTIFIER';
								W_SQL := W_SQL || ' ,NVL(A.TARGET_DIV,''0000'')';
								W_SQL := W_SQL || '  FROM WEB_TP1000020_M A';
								W_SQL := W_SQL || '      ,WEB_TP0000020_M B';
								W_SQL := W_SQL || ' WHERE A.NOTIFICATION_DIV = ' || W_TDKFLG;
								W_SQL := W_SQL || '   AND A.PERSONAL_DIV = B.DIV';
								W_SQL := W_SQL || '   AND A.PERSONAL_ITEM = B.ITEM_NAME';
								W_SQL := W_SQL || '   AND B.KEY_ITEM IS NOT NULL';
								W_SQL := W_SQL || '   AND B.KEY_ITEM > 0';
								W_SQL := W_SQL || ' ORDER BY A.IDENTIFIER';
								DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
								DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_GET_ID);
								DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_GET_TKBN,20);
								W_RVL := DBMS_SQL.EXECUTE(W_CSR);
								LOOP 
									W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);

									IF W_RVL > 0 THEN
										DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_GET_ID);
										DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_GET_TKBN);
										/* �g�p�敪�E�K�{�敪�E�Ώۋ敪�̕ύX(�L�[����) */
										W_SQL := 'UPDATE WEB_TP1000021_M SET ';
										W_SQL := W_SQL || ' USAGE_DIV=''2''';
										W_SQL := W_SQL || ',REQUIRE_DIV=''1''';
										W_SQL := W_SQL || ',TARGET_DIV=''' || '1' || SUBSTR(W_GET_TKBN,2) || '''';
										W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
										W_SQL := W_SQL || ',UPDATE_USER=:ORA_2';
										W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
										W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
										W_SQL := W_SQL || '   AND IDENTIFIER =' || W_GET_ID;
										W_SQL := W_SQL || '   AND (SUPPORT_DIV IS NULL';
										W_SQL := W_SQL || '        OR (SUPPORT_DIV IS NOT NULL AND SUPPORT_DIV NOT IN (100,101,102,103)))';
										DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
										DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KCD(W_I));
										DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',P_UPDID);
										W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
									ELSE
										EXIT;
									END IF;
								END LOOP;

								/* �g�p�敪�̕ύX(�L�[���ڈȊO) */
								W_SQL := 'UPDATE WEB_TP1000021_M SET ';
								W_SQL := W_SQL || ' USAGE_DIV=''1''';
								W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
								W_SQL := W_SQL || ',UPDATE_USER=:ORA_2';
								W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
								W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
								W_SQL := W_SQL || '   AND IDENTIFIER NOT IN (SELECT A.IDENTIFIER';
								W_SQL := W_SQL || '                      FROM WEB_TP1000020_M A';
								W_SQL := W_SQL || '                          ,WEB_TP0000020_M B';
								W_SQL := W_SQL || '                     WHERE A.NOTIFICATION_DIV =' || W_TDKFLG;
								W_SQL := W_SQL || '                       AND A.PERSONAL_DIV = B.DIV';
								W_SQL := W_SQL || '                       AND A.PERSONAL_ITEM = B.ITEM_NAME';
								W_SQL := W_SQL || '                       AND B.KEY_ITEM IS NOT NULL)';
								W_SQL := W_SQL || '   AND (SUPPORT_DIV IS NULL';
								W_SQL := W_SQL || '        OR (SUPPORT_DIV IS NOT NULL AND SUPPORT_DIV NOT IN (100,101,102,103)))';
								W_SQL := W_SQL || '   AND USAGE_DIV=''2''';
								DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
								DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
								DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
								W_RVL := DBMS_SQL.EXECUTE(W_CSR);

								/* �\�������ݒ�̕ύX */
								W_SQL := 'UPDATE WEB_TP1000011_M SET ';
								W_SQL := W_SQL || ' APPLY_GENERAL=''' || SUBSTR(W_SDATA(1),1,1) || '0' || SUBSTR(W_SDATA(1),3,1) || '''';
								W_SQL := W_SQL || ',APPLY_BOSS=''' || SUBSTR(W_SDATA(2),1,1) || '0' || SUBSTR(W_SDATA(2),3,1) || '''';
								W_SQL := W_SQL || ',APPLY_PERSONNEL1=''' || SUBSTR(W_SDATA(3),1,1) || '0' || SUBSTR(W_SDATA(3),3,1) || '''';
								W_SQL := W_SQL || ',APPLY_PERSONNEL2=''' || SUBSTR(W_SDATA(4),1,1) || '0' || SUBSTR(W_SDATA(4),3,1) || '''';
								W_SQL := W_SQL || ',UPDATE_DATE=SYSDATE';
								W_SQL := W_SQL || ',UPDATE_USER=:ORA_2';
								W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
								W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
								DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
								DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
								DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
								W_RVL := DBMS_SQL.EXECUTE(W_CSR);
							END IF;
						END IF;
					END LOOP;
				END IF;
			END IF;

		/**********************************************************************/
		/* �e�[�u���o�b�N�A�b�v����                                           */
		/**********************************************************************/
			IF P_TBKBN = 1 AND P_UPDKBN = 2 THEN
				WEB_SP0003020_S(1,W_TABLE2);
				W_SQL := 'CREATE TABLE ' || W_TABLE2;
				IF W_WKTBSP IS NOT NULL THEN
					W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' '; 
				END IF;
				W_SQL :=  W_SQL || ' UNRECOVERABLE AS SELECT * FROM ' || W_TABLE1; 
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* TDE */
				WEB_SP0003230_S('WEB_SP0060910_S',41,W_TABLE2,P_RID,P_ERR);
				IF P_ERR <> 0 THEN
					GOTO L_EXIT;
				END IF;

				IF P_FILEKBN = 1 THEN
					IF W_DTFLG = 1 THEN	/* �l���Ƀf�[�^���� */
						WEB_SP0003020_S(1,W_TABLE6);
						W_SQL := 'CREATE TABLE ' || W_TABLE6;
						IF W_WKTBSP IS NOT NULL THEN
							W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' '; 
						END IF;
						W_SQL :=  W_SQL || ' UNRECOVERABLE AS SELECT * FROM ' || W_TABLE5; 
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);

						/* TDE */
						WEB_SP0003230_S('WEB_SP0060910_S',41,W_TABLE6,P_RID,P_ERR);
						IF P_ERR <> 0 THEN
							GOTO L_EXIT;
						END IF;
					END IF;
				END IF;

				IF W_TDKFLG > 0 THEN
					WEB_SP0003020_S(1,W_TABLE4);
					W_SQL := 'CREATE TABLE ' || W_TABLE4;
					IF W_WKTBSP IS NOT NULL THEN
						W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' '; 
					END IF;
					W_SQL :=  W_SQL || ' UNRECOVERABLE AS SELECT * FROM ' || W_TABLE3; 
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					/* TDE */
					WEB_SP0003230_S('WEB_SP0060910_S',41,W_TABLE4,P_RID,P_ERR);
					IF P_ERR <> 0 THEN
						GOTO L_EXIT;
					END IF;

				END IF;
			END IF;

		/**********************************************************************/
		/* �e�[�u���쐬����                                                   */
		/**********************************************************************/
			IF P_TBKBN = 1 THEN
			/**********************************************************************/
			/* �l�}�X�^�p                                                       */
			/**********************************************************************/
				WEB_SP0003020_S(1,W_TABLE1);

				W_SQL := 'CREATE TABLE ' || W_TABLE1;
				IF W_STYPE = 0 THEN
					W_SQL := W_SQL || ' (EMP_CODE NUMBER(10)';
				ELSE
					W_SQL := W_SQL || ' (EMP_CODE VARCHAR2(10)';
				END IF;
				W_SQL := W_SQL || ',HISTORY_ID NUMBER(5)';
				FOR C_004_REC IN C_004(W_KEY) LOOP
					W_MSIZE := C_004_REC.DATA_SIZE;
					W_SSIZE := C_004_REC.FRACTION_SIZE;
					W_FIELD := 'F' || TO_CHAR(C_004_REC.ITEM_ID,'FM000');
					IF C_004_REC.DATA_TYPE = 'VARCHAR2' THEN
						W_SQL := W_SQL || ',' || W_FIELD || ' VARCHAR2(' || W_MSIZE || ')';
					ELSIF C_004_REC.DATA_TYPE = 'NUMBER' THEN
						IF W_SSIZE = 0 THEN
							W_SQL := W_SQL || ',' || W_FIELD || ' NUMBER(' || W_MSIZE || ')';
						ELSE
							W_SQL := W_SQL || ',' || W_FIELD || ' NUMBER(' || W_MSIZE || ',' || W_SSIZE || ')';
						END IF;
					ELSIF C_004_REC.DATA_TYPE = 'DATE' THEN
						W_SQL := W_SQL || ',' || W_FIELD || ' DATE';
					END IF;
				END LOOP;
				W_SQL := W_SQL || ',UPDATE_DATE DATE';
				IF W_STYPE = 0 THEN
					W_SQL := W_SQL || ',UPDATE_USER NUMBER(10)';
				ELSE
					W_SQL := W_SQL || ',UPDATE_USER VARCHAR2(10)';
				END IF;
				W_SQL := W_SQL || ',KAISYACD NUMBER(8)';
				IF P_RKBN = '1' AND P_KEYUSE = '1' THEN
					W_SQL := W_SQL || ',CONSTRAINT ' || W_INDEX1 || ' PRIMARY KEY (EMP_CODE';
					FOR C_009_REC IN C_009(W_KEY) LOOP
						W_SQL := W_SQL || ',' || C_009_REC.ITEM_NAME;
					END LOOP;
					W_SQL := W_SQL || ')';
				ELSE
					W_SQL := W_SQL || ',CONSTRAINT ' || W_INDEX1 || ' PRIMARY KEY (EMP_CODE,HISTORY_ID)';
				END IF;
				W_SQL := W_SQL || ' USING INDEX PCTFREE 10)';
				W_SQL := W_SQL || ' PCTFREE 20';
				W_SQL := W_SQL || ' PCTUSED 70';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* TDE */
				WEB_SP0003230_S('WEB_SP0060910_S',41,W_TABLE1,P_RID,P_ERR);
				IF P_ERR <> 0 THEN
					GOTO L_EXIT;
				END IF;

			/**********************************************************************/
			/* �l�t�@�C���p                                                     */
			/**********************************************************************/
				IF P_FILEKBN = 1 THEN
					WEB_SP0003020_S(1,W_TABLE5);

					W_SQL := 'CREATE TABLE ' || W_TABLE5;
					IF W_STYPE = 0 THEN
						W_SQL := W_SQL || ' (SYAINCD NUMBER(10)';
					ELSE
						W_SQL := W_SQL || ' (SYAINCD VARCHAR2(10)';
					END IF;
					W_CNT := 0;
					IF P_KEYUSE = '1' THEN
						FOR C_009_REC IN C_009(W_KEY) LOOP
							W_CNT := W_CNT + 1;
							W_MSIZE := C_009_REC.DATA_SIZE;
							W_SSIZE := C_009_REC.FRACTION_SIZE;
							W_FIELD := 'KEY' || W_CNT;
							IF C_009_REC.DATA_TYPE = 'VARCHAR2' THEN
								W_SQL := W_SQL || ',' || W_FIELD || ' VARCHAR2(' || W_MSIZE || ')';
							ELSIF C_009_REC.DATA_TYPE = 'NUMBER' THEN
								IF W_SSIZE = 0 THEN
									W_SQL := W_SQL || ',' || W_FIELD || ' NUMBER(' || W_MSIZE || ')';
								ELSE
									W_SQL := W_SQL || ',' || W_FIELD || ' NUMBER(' || W_MSIZE || ',' || W_SSIZE || ')';
								END IF;
							ELSIF C_009_REC.DATA_TYPE = 'DATE' THEN
								W_SQL := W_SQL || ',' || W_FIELD || ' DATE';
							END IF;
						END LOOP;
					ELSE
						W_SQL := W_SQL || ',KEY1 NUMBER(5)';
					END IF;
					W_SQL := W_SQL || ',ID NUMBER(2)';
					W_SQL := W_SQL || ',FILENAME VARCHAR2(400)';
					W_SQL := W_SQL || ',FILEDATA BLOB';
					IF W_STYPE = 0 THEN
						W_SQL := W_SQL || ',UPDID NUMBER(10)';
					ELSE
						W_SQL := W_SQL || ',UPDID VARCHAR2(10)';
					END IF;
					W_SQL := W_SQL || ',UPDDATE DATE';
					W_SQL := W_SQL || ',CONSTRAINT ' || W_INDEX5 || ' PRIMARY KEY (SYAINCD';
					IF P_KEYUSE = '1' THEN
						W_CNT := 0;
						FOR C_009_REC IN C_009(W_KEY) LOOP
							W_CNT := W_CNT + 1;
							W_SQL := W_SQL || ',KEY' || W_CNT;
						END LOOP;
					ELSE
						W_SQL := W_SQL || ',KEY1';
					END IF;
					W_SQL := W_SQL || ',ID)';
					W_SQL := W_SQL || ' USING INDEX PCTFREE 10)';
					W_SQL := W_SQL || ' PCTFREE 20';
					W_SQL := W_SQL || ' PCTUSED 70';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					/* TDE */
					WEB_SP0003230_S('WEB_SP0060910_S',21,W_TABLE5,P_RID,P_ERR);
					IF P_ERR <> 0 THEN
						GOTO L_EXIT;
					END IF;

				END IF;

			/**********************************************************************/
			/* �͏o�p                                                             */
			/**********************************************************************/
				IF W_TDKFLG > 0 THEN
					WEB_SP0003020_S(1,W_TABLE3);

					W_SQL := 'CREATE TABLE ' || W_TABLE3;
					IF W_STYPE = 0 THEN
						W_SQL := W_SQL || ' (EMP_CODE NUMBER(10)';
					ELSE
						W_SQL := W_SQL || ' (EMP_CODE VARCHAR2(10)';
					END IF;
					W_SQL := W_SQL || ',NOTIFICATION_DIV NUMBER(5)';
					W_SQL := W_SQL || ',IDENTIFIER NUMBER(5)';
					W_SQL := W_SQL || ',HISTORY_ID NUMBER(5)';
					W_SQL := W_SQL || ',REASON_DATE DATE';
					W_SQL := W_SQL || ',PROCESS_DIV NUMBER(1)';
					W_SQL := W_SQL || ',APPLY_REASON VARCHAR2(1000)';
					W_SQL := W_SQL || ',REJECT_RESON VARCHAR2(1000)';
					FOR C_004_REC IN C_004(W_KEY) LOOP
						W_MSIZE := C_004_REC.DATA_SIZE;
						W_SSIZE := C_004_REC.FRACTION_SIZE;
						W_FIELD := 'F' || TO_CHAR(C_004_REC.ITEM_ID,'FM000');
						IF C_004_REC.DATA_TYPE = 'VARCHAR2' THEN
							W_SQL := W_SQL || ',' || W_FIELD || ' VARCHAR2(' || W_MSIZE || ')';
						ELSIF C_004_REC.DATA_TYPE = 'NUMBER' THEN
							IF W_SSIZE = 0 THEN
								W_SQL := W_SQL || ',' || W_FIELD || ' NUMBER(' || W_MSIZE || ')';
							ELSE
								W_SQL := W_SQL || ',' || W_FIELD || ' NUMBER(' || W_MSIZE || ',' || W_SSIZE || ')';
							END IF;
						ELSIF C_004_REC.DATA_TYPE = 'DATE' THEN
							W_SQL := W_SQL || ',' || W_FIELD || ' DATE';
						END IF;
					END LOOP;
					W_SQL := W_SQL || ',UPDATE_DATE DATE';
					W_SQL := W_SQL || ',UPDATE_USER VARCHAR2(10)';
					W_SQL := W_SQL || ',CONSTRAINT ' || W_INDEX3 || ' PRIMARY KEY (EMP_CODE,NOTIFICATION_DIV,IDENTIFIER,HISTORY_ID)';
					W_SQL := W_SQL || ' USING INDEX PCTFREE 10)';
					W_SQL := W_SQL || ' PCTFREE 20';
					W_SQL := W_SQL || ' PCTUSED 70';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					/* TDE */
					WEB_SP0003230_S('WEB_SP0060910_S',41,W_TABLE3,P_RID,P_ERR);
					IF P_ERR <> 0 THEN
						GOTO L_EXIT;
					END IF;

					W_SQL := 'CREATE INDEX ' || W_INDEX4 || ' ON ' || W_TABLE3;
					W_SQL := W_SQL || ' (NOTIFICATION_DIV)';
					W_SQL := W_SQL || ' PCTFREE 10';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

			ELSE
				WEB_SP0003020_S(2,W_TABLE1);

				W_SQL := 'CREATE VIEW ' || W_TABLE1;
				W_SQL := W_SQL || ' AS SELECT';
				W_SQL := W_SQL || ' B.EMP_CODE EMP_CODE';
				W_SQL := W_SQL || ',B.KAISYACD KAISYACD';
				FOR C_006_REC IN C_006(W_KEY) LOOP
					W_SQL := W_SQL || ',A.' || C_006_REC.ITEM_NAME;
				END LOOP;
				W_SQL := W_SQL || ' FROM ' || P_OBJNAME || ' A';
				W_SQL := W_SQL || ',EMP_BASIC_INFO B';
				IF P_TBKBN = 2 THEN
					SELECT MAX(ITEM_NAME) INTO W_WDATA1
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND ITEM_ID = 0
					;
					W_SQL := W_SQL || ' WHERE A.' || W_WDATA1 || '=B.EMP_CODE';
				ELSIF P_TBKBN = 3 THEN
					SELECT MAX(ITEM_NAME) INTO W_WDATA1
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND ITEM_ID = -1
					;
					W_SQL := W_SQL || ' WHERE A.' || W_WDATA1 || '=B.KAISYACD';
					SELECT MAX(ITEM_NAME) INTO W_WDATA1
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND ITEM_ID = 0
					;
					W_SQL := W_SQL || ' AND A.' || W_WDATA1 || '=B.SYAINCD';
				END IF;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;

		/**********************************************************************/
		/* �e�[�u�����J�o������                                               */
		/**********************************************************************/
			IF P_TBKBN = 1 AND P_UPDKBN = 2 THEN
				DBMS_SQL.PARSE(W_CSR,W_SQL_R1 || W_SQL_R2,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				WEB_SP0003020_S(1,W_TABLE2);

				IF W_TDKFLG > 0 THEN
					DBMS_SQL.PARSE(W_CSR,W_SQL_R3 || W_SQL_R4,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					WEB_SP0003020_S(1,W_TABLE4);
				END IF;
				IF P_FILEKBN = 1 THEN
					IF W_DTFLG = 1 THEN	/* �l���Ƀf�[�^���� */
						DBMS_SQL.PARSE(W_CSR,W_SQL_R5,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						WEB_SP0003020_S(1,W_TABLE6);
					END IF;
				END IF;
			END IF;

		/**********************************************************************/
		/* ���_���쐬����                                                   */
		/**********************************************************************/
			IF P_JITEN IN ('1','2','3','4','5') THEN

			/**********************************************************************/
			/* �𔻒f����                                                         */
			/**********************************************************************/
				W_JIRKBN := 0;
				FOR C_011_REC IN C_011(W_KEY) LOOP
					W_JIRKBN := W_JIRKBN + 1;
				END LOOP;

			/**********************************************************************/
			/* VIEW�쐬����                                                       */
			/**********************************************************************/
				IF W_NEWKBN = 0 THEN
					W_VIEW1 := 'WEB_VP00050' || TO_CHAR(W_KEY,'FM00');
					W_VIEW2 := 'WEB_TPK' || TO_CHAR(W_TSID2,'FM000');
				ELSE
					W_VIEW1 := 'WEB_VP091' || TO_CHAR(W_KEY,'FM0000');
					W_VIEW2 := 'WEB_TPK' || TO_CHAR(W_TSID2,'FM00000');
				END IF;
				FOR C_010_REC IN C_010(W_KEY,1) LOOP
					W_JITENKEY1 := C_010_REC.ITEM_NAME;
				END LOOP;
				IF P_JITEN = '5' THEN
					FOR C_010_REC IN C_010(W_KEY,2) LOOP
						W_JITENKEY2 := C_010_REC.ITEM_NAME;
					END LOOP;
					W_JIRKBN := 1;
				END IF;

				WEB_SP0003020_S(2,W_VIEW1);
				IF P_JITEN = '1' THEN
					W_SQL := 'CREATE VIEW ' || W_VIEW1;
					W_SQL := W_SQL || ' AS SELECT * FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || ' WHERE A.' || W_JITENKEY1 || '=(';
					W_SQL := W_SQL || ' SELECT MAX(B.' || W_JITENKEY1 || ')';
					W_SQL := W_SQL || '   FROM ' || W_TABLE1 || ' B';
					W_SQL := W_SQL || '  WHERE A.' || W_SCDKEY || '=B.' || W_SCDKEY;
					IF W_JIRKBN > 0 THEN
						FOR C_011_REC IN C_011(W_KEY) LOOP
							W_SQL := W_SQL || '  AND A.' || C_011_REC.ITEM_NAME || '=B.' || C_011_REC.ITEM_NAME;
						END LOOP;
					END IF;
					W_SQL := W_SQL || '    AND B.' || W_JITENKEY1 || '<=SYSDATE)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_JIID1 := 1;
					W_JIID2 := 2;
				ELSIF P_JITEN = '2' THEN
					W_SQL := 'CREATE VIEW ' || W_VIEW1;
					W_SQL := W_SQL || ' AS SELECT * FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || ' WHERE A.' || W_JITENKEY1 || '=TO_CHAR(SYSDATE,''YYYY/MM'')';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_JIID1 := 1;
					W_JIID2 := 2;
				ELSIF P_JITEN = '3' THEN
					W_SQL := 'CREATE VIEW ' || W_VIEW1;
					W_SQL := W_SQL || ' AS SELECT * FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || ' WHERE A.' || W_JITENKEY1 || '=TO_CHAR(SYSDATE,''YYYY'')';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_JIID1 := 1;
					W_JIID2 := 2;
				ELSIF P_JITEN = '4' THEN	/* 	�N�x�E���̏ꍇ�͍����͑��݂��Ȃ� */
					W_JIID1 := 2;
					W_JIID2 := 2;
					DELETE FROM WEB_TP0000011_M WHERE DIV = W_TSID1;
					DELETE FROM WEB_TP0000021_M WHERE DIV = W_TSID1;
					DELETE FROM WEB_TP0010011_M WHERE CATEGORY_DIV = W_TSID1;
					DELETE FROM WEB_TP0010021_M WHERE CATEGORY_DIV = W_TSID1;
				ELSIF P_JITEN = '5' THEN
					W_SQL := 'CREATE VIEW ' || W_VIEW1;
					W_SQL := W_SQL || ' AS SELECT * FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || ' WHERE A.' || W_JITENKEY1 || '<=TRUNC(SYSDATE,''DD'')';
					W_SQL := W_SQL || '   AND (';
					W_SQL := W_SQL || '          A.' || W_JITENKEY2 || '>=TRUNC(SYSDATE,''DD'')';
					W_SQL := W_SQL || '       OR A.' || W_JITENKEY2 || ' IS NULL';
					W_SQL := W_SQL || '       )';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_JIID1 := 1;
					W_JIID2 := 2;
				END IF;

			/**********************************************************************/
			/* ���ǉ�����                                                       */
			/**********************************************************************/
				FOR W_I IN W_JIID1..W_JIID2 LOOP
				/**********************************************************************/
				/* �o�^���ǉ�����                                                   */
				/**********************************************************************/
					DELETE FROM WEB_TP0000010_M
					 WHERE DIV = DECODE(W_I,1,W_TSID1,2,W_TSID2)
					;
					INSERT INTO WEB_TP0000010_M(
						DIV,TBL_NAME,CATEGORY_NAME,HISTORY_DIV,SORT_DIV,
						REGISTER_DIV,DUPLICATION_DIV,LINK_DIV,
						SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_KEY1,GROUP_DIV,DISP_ORDER,FILE_DIV,MANAGEMENT_KAISYACD,
						UPDATE_DATE,UPDATE_USER)
					SELECT
						DECODE(W_I,1,W_TSID1,2,W_TSID2),DECODE(W_I,1,W_VIEW1,W_VIEW2),
						CATEGORY_NAME ||
							 DECODE(W_I,1,'(����)',
								DECODE(P_JITEN,4,'(��N�x�E��)',1,'(���)',2,'(��N��)',3,'(��N)',5,'(���)')),
						DECODE(W_JIRKBN,0,'0','1'),DECODE(W_JIRKBN,0,NULL,W_SRTKBN),
						'2','0',0,
						'0','0','0',W_SCDKEY,GROUP_DIV,DISP_ORDER,'0',P_MKAISYA,
						SYSDATE,P_UPDID
					 FROM WEB_TP0000010_M
					WHERE DIV = W_TSID
					;
					IF P_UPDKBN = 2 THEN	/* ���_�ݒ�̕ύX���l�����A�Еʗp�e�[�u���̃J�e�S�������X�V */
						FOR C_081_REC IN C_081(W_TSID) LOOP
							UPDATE WEB_TP0000011_M
							   SET CATEGORY_NAME = C_081_REC.CATEGORY_NAME || DECODE(W_I,1,'(����)',
												DECODE(P_JITEN,4,'(��N�x�E��)',1,'(���)',2,'(��N��)',3,'(��N)',5,'(���)'))
								  ,UPDATE_DATE=SYSDATE
								  ,UPDATE_USER=P_UPDID
							 WHERE KAISYACD = C_081_REC.KAISYACD
							   AND DIV = DECODE(W_I,1,W_TSID1,2,W_TSID2)
							;
						END LOOP;
					END IF;

					DELETE FROM WEB_TP0000020_M
					 WHERE DIV = DECODE(W_I,1,W_TSID1,2,W_TSID2)
					;

					INSERT INTO WEB_TP0000020_M(
						DIV,ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,
						DATA_TYPE,DATA_SIZE,FRACTION_SIZE,KEY_ITEM,SORT_DIV,REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
						IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,
						MASTER_ID,MASTER_LINK_ITEM,LITERAL_CONTENT,INPUT_AREA_FORM,MULTI_ROW_DISP_COUNT,SUPPORT_DIV,
						SUPPORT_DIV_DEST,SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,
						TAKE_DIV,INPUT_DESCRIPTION,INPUT_SIZE,INPUT_CHECK,REMARKS,
						UPDATE_DATE,UPDATE_USER)
					SELECT
						DECODE(W_I,1,W_TSID1,2,W_TSID2),ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,
						DATA_TYPE,DATA_SIZE,FRACTION_SIZE,DECODE(ITEM_ORDER,1,1,NULL),DECODE(W_JIRKBN,0,NULL,SORT_DIV),REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
						IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,
						MASTER_ID,MASTER_LINK_ITEM,LITERAL_CONTENT,INPUT_AREA_FORM,MULTI_ROW_DISP_COUNT,SUPPORT_DIV,
						SUPPORT_DIV_DEST,SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,
						TAKE_DIV,INPUT_DESCRIPTION,INPUT_SIZE,INPUT_CHECK,REMARKS,
						SYSDATE,P_UPDID
					 FROM WEB_TP0000020_M
					WHERE DIV = W_TSID
					;

					/* ���̑��L�[�̐ݒ� */
					W_CNT := 1;
					IF W_JIRKBN > 0 THEN
						FOR C_011_REC IN C_011(W_KEY) LOOP
							W_CNT := W_CNT + 1;
							UPDATE WEB_TP0000020_M
							   SET KEY_ITEM = W_CNT
							      ,UPDATE_DATE = SYSDATE
							      ,UPDATE_USER = P_UPDID
							 WHERE DIV = DECODE(W_I,1,W_TSID1,2,W_TSID2)
							   AND ITEM_NAME = C_011_REC.ITEM_NAME
							;
						END LOOP;
					END IF;

				/**********************************************************************/
				/* �Ɖ�n�֘A�o�^                                                     */
				/**********************************************************************/
					DELETE FROM WEB_TP0010010_M
					 WHERE CATEGORY_DIV = DECODE(W_I,1,W_TSID1,2,W_TSID2)
					;

					INSERT INTO WEB_TP0010010_M(
						CATEGORY_DIV,CATEGORY_NAME,CRITERIA_TBL,EMP_KEY1,INQUIRY_VIEW,
						HISTORY_DIV,USAGE_DIV,LINK_DIV,UNION_DIV,GROUP_DIV,DISP_ORDER,TIME_CONF,MANAGEMENT_KAISYACD,
						UPDATE_DATE,UPDATE_USER)
					SELECT
						DECODE(W_I,1,W_TSID1,2,W_TSID2),CATEGORY_NAME || 
							DECODE(W_I,1,'(����)',
								DECODE(P_JITEN,4,'(��N�x�E��)',1,'(���)',2,'(��N��)',3,'(��N)',5,'(���)')),
						DECODE(W_I,1,W_VIEW1,W_VIEW2),W_SCDKEY,
						DECODE(W_NEWKBN,0,'WEB_VP0010' || TO_CHAR(DECODE(W_I,1,W_TSID1,2,W_TSID),'FM000'),'WEB_VP093' || TO_CHAR(DECODE(W_I,1,W_TSID1,2,W_TSID),'FM00000')),
						DECODE(W_JIRKBN,0,'1','2'),'0',0,'0',GROUP_DIV,DISP_ORDER,DECODE(W_I,1,0,2,P_JITEN),P_MKAISYA,
						SYSDATE,P_UPDID
					  FROM WEB_TP0010010_M
					 WHERE CATEGORY_DIV = W_TSID
					;

					IF P_UPDKBN = 2 THEN	/* ���_�ݒ�̕ύX���l�����A�Еʗp�e�[�u���̃J�e�S�������X�V */
						FOR C_091_REC IN C_091(W_TSID) LOOP
							UPDATE WEB_TP0010011_M
							   SET CATEGORY_NAME = C_091_REC.CATEGORY_NAME || DECODE(W_I,1,'(����)',
												DECODE(P_JITEN,4,'(��N�x�E��)',1,'(���)',2,'(��N��)',3,'(��N)',5,'(���)'))
								  ,UPDATE_DATE=SYSDATE
								  ,UPDATE_USER=P_UPDID
							 WHERE KAISYACD = C_091_REC.KAISYACD
							   AND CATEGORY_DIV = DECODE(W_I,1,W_TSID1,2,W_TSID2)
							;
						END LOOP;
					END IF;

					DELETE FROM WEB_TP0010020_M
					 WHERE CATEGORY_DIV = DECODE(W_I,1,W_TSID1,2,W_TSID2)
					;

					INSERT INTO WEB_TP0010020_M(
						CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,SUPPORT_ACTION_NAME,
						DISP_TYPE,DEFAULT_DISP_TYPE,DISP_FORMAT,SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,
						SCREEN_DISP_DIV,AUX_DISP_ORDER,COMPOUND_SEARCH_DIV,STATISTICS_SEARCH_DIV,
						ANY_SELECT_DIV,STATISTICS_AGGREGATE_DIV,REMARKS,UPDATE_DATE,UPDATE_USER)
					SELECT
						DECODE(W_I,1,W_TSID1,2,W_TSID2),ITEM_ORDER,DECODE(ITEM_ORDER,2,2,DECODE(W_I,1,W_TSID1,2,W_TSID2)),ITEM_NAME,SUPPORT_ACTION_NAME,
						DISP_TYPE,DEFAULT_DISP_TYPE,DISP_FORMAT,SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,
						SCREEN_DISP_DIV,AUX_DISP_ORDER,COMPOUND_SEARCH_DIV,STATISTICS_SEARCH_DIV,
						ANY_SELECT_DIV,STATISTICS_AGGREGATE_DIV,REMARKS,SYSDATE,P_UPDID
					  FROM WEB_TP0010020_M
					 WHERE CATEGORY_DIV = W_TSID
					   AND DISP_TYPE <> '95'
					;

					DELETE FROM WEB_TP0010030_M
					 WHERE CATEGORY_DIV = DECODE(W_I,1,W_TSID1,2,W_TSID2)
					;

					INSERT INTO WEB_TP0010030_M(
						CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,UPDATE_DATE,UPDATE_USER)
					VALUES(
						DECODE(W_I,1,W_TSID1,2,W_TSID2),1,2,'EMP_CODE',SYSDATE,P_UPDID)
					;

					/* ���̑��L�[�̐ݒ� */
					W_CNT := 1;
					IF W_JIRKBN > 0 THEN
						FOR C_009_REC IN C_009(W_KEY) LOOP
							W_CNT := W_CNT + 1;
							INSERT INTO WEB_TP0010030_M(
								CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,UPDATE_DATE,UPDATE_USER)
							VALUES(
								DECODE(W_I,1,W_TSID1,2,W_TSID2),W_CNT,DECODE(W_I,1,W_TSID1,2,W_TSID2),C_009_REC.ITEM_NAME,SYSDATE,P_UPDID)
							;
						END LOOP;
					END IF;
				END LOOP;
			END IF;

		/**********************************************************************/
		/* �o�^�n�֘A�\�����o�^(WEB_TP0000010_M)                              */
		/**********************************************************************/
			W_CNT := 0;
			FOR C_031_REC IN C_031(0) LOOP
				W_CNT := W_CNT + 1;
				UPDATE WEB_TP0000010_M
				   SET DISP_ORDER = W_CNT
				      ,UPDATE_DATE = SYSDATE
				      ,UPDATE_USER = P_UPDID
				WHERE CURRENT OF C_031
				;
			END LOOP;

		/**********************************************************************/
		/* �}�X�^�����֘A�o�^(WEB_TP0000010_M)                                */
		/* ���_�ݒ�u���t�v�u�J�n�E�I�����t�v                                 */
		/**********************************************************************/
			SELECT COUNT(A.IDENTIFIER) INTO W_GET_ID
			  FROM WEB_TP0061110_M A
			 WHERE A.IDENTIFIER = W_KEY
			   AND A.HISTORY_DIV = '1'
			   AND A.KEY_CONF = '1'
			   AND A.TIME_CONF IN ('1','5')
			;
			IF W_GET_ID > 0 THEN
				SELECT MAX(A.ITEM_ORDER),MAX(A.ITEM_NAME)
				  INTO W_KJUN,W_KNAME
				  FROM WEB_TP0000020_M A
				      ,WEB_TP0061120_M B
				 WHERE A.DIV = W_TSID
				   AND B.IDENTIFIER = W_KEY
				   AND B.TIME_CONF IN ('1','5')
				   AND B.SUPPORT_DIV IN (0,20)
				   AND A.ITEM_NAME = B.ITEM_NAME
				;
				IF W_KJUN IS NOT NULL AND W_KNAME IS NOT NULL THEN
					UPDATE WEB_TP0000010_M
					   SET MASTER_HISTORY_DIV = '1'
					      ,MASTER_HISTORY_ITEM_ORDER = W_KJUN
					      ,MASTER_HISTORY_ITEM_NAME = W_KNAME
					      ,UPDATE_DATE = SYSDATE
					      ,UPDATE_USER = P_UPDID
					 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
					;
				END IF;
			END IF;

		/**********************************************************************/
		/* �Ɖ�n�֘A�\�����o�^(WEB_TP0010010_M)                              */
		/**********************************************************************/
			W_CNT := 0;
			FOR C_032_REC IN C_032(0) LOOP
				W_CNT := W_CNT + 1;
				UPDATE WEB_TP0010010_M
				   SET DISP_ORDER = W_CNT
				      ,UPDATE_DATE = SYSDATE
				      ,UPDATE_USER = P_UPDID
				WHERE CURRENT OF C_032
				;
			END LOOP;

		/**********************************************************************/
		/* �ЕʁE�O����p�e�[�u���ύX����(���ڂh�c�t���ւ�����)               */
		/**********************************************************************/
			IF P_UPDKBN = 2 THEN
				FOR W_I IN 0..2 LOOP
				/**********************************************************************/
				/* �o�^�p(WEB_TP0000022_M,WEB_TP0000023_M) �X�V���폜                 */
				/**********************************************************************/
					DELETE FROM WEB_TP0000022_M
					 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER = W_ITM_ID5;
					DELETE FROM WEB_TP0000023_M
					 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER = W_ITM_ID5;

				/**********************************************************************/
				/* �o�^�p(WEB_TP0000022_M,WEB_TP0000023_M) �X�V�҃R�[�h�폜           */
				/**********************************************************************/
					DELETE FROM WEB_TP0000022_M
					 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER = W_ITM_ID6;
					DELETE FROM WEB_TP0000023_M
					 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER = W_ITM_ID6;

					FOR W_J IN 1..W_CHGCNT LOOP
					/**********************************************************************/
					/* �o�^�p(WEB_TP0000021_M,WEB_TP0000022_M,WEB_TP0000023_M)            */
					/**********************************************************************/
						/* �V���ڏ� */
						SELECT MAX(ITEM_ORDER) INTO W_NEWKJUN
						  FROM WEB_TP0000020_M
						 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_NAME = 'F' || TO_CHAR(W_NEWID(W_J),'FM000')
						;
	
						/* �����ڏ� */
						SELECT MAX(ITEM_ORDER) INTO W_OLDKJUN
						  FROM WEB_TP0061141_W
						 WHERE CUSTOMER_ID = P_RID
						   AND TBL_DIV = 1
						   AND CATEGORY_DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_NAME = 'F' || TO_CHAR(W_OLDID(W_J),'FM000')
						;

						/* �X�V���� */
						UPDATE WEB_TP0000021_M
						   SET ITEM_ORDER = W_NEWKJUN
						      ,UPDATE_DATE = SYSDATE
						      ,UPDATE_USER = P_UPDID
						 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_ORDER = W_OLDKJUN
						;
						UPDATE WEB_TP0000022_M
						   SET ITEM_ORDER = W_NEWKJUN
						      ,UPDATE_DATE = SYSDATE
						      ,UPDATE_USER = P_UPDID
						 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_ORDER = W_OLDKJUN
						;
						UPDATE WEB_TP0000023_M
						   SET ITEM_ORDER = W_NEWKJUN
						      ,UPDATE_DATE = SYSDATE
						      ,UPDATE_USER = P_UPDID
						 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_ORDER = W_OLDKJUN
						;

					/**********************************************************************/
					/* �Ɖ�p(WEB_TP0010021_M,WEB_TP0010022_M,WEB_TP0010023_M)            */
					/**********************************************************************/
						/* �V���ڏ� */
						SELECT MIN(ITEM_ORDER) INTO W_NEWKJUN
						  FROM WEB_TP0010020_M
						 WHERE CATEGORY_DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_NAME = 'F' || TO_CHAR(W_NEWID(W_J),'FM000')
						;

						IF W_I = 0 THEN
							W_ID := W_TSID;
						ELSIF W_I = 1 THEN
							W_ID := W_TSID1;
						ELSIF W_I = 2 THEN
							W_ID := W_TSID2;
						END IF;
						
						FOR C_071_REC IN C_071(W_ID,W_OLDID(W_J)) LOOP
							UPDATE WEB_TP0010021_M
							   SET ITEM_ORDER = W_NEWKJUN
							      ,UPDATE_DATE = SYSDATE
							      ,UPDATE_USER = P_UPDID
							 WHERE CATEGORY_DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
							   AND ITEM_ORDER = C_071_REC.ITEM_ORDER
							;
							UPDATE WEB_TP0010022_M
							   SET ITEM_ORDER = W_NEWKJUN
							      ,UPDATE_DATE = SYSDATE
							      ,UPDATE_USER = P_UPDID
							 WHERE CATEGORY_DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
							   AND ITEM_ORDER = C_071_REC.ITEM_ORDER
							;
							UPDATE WEB_TP0010023_M
							   SET ITEM_ORDER = W_NEWKJUN
							      ,UPDATE_DATE = SYSDATE
							      ,UPDATE_USER = P_UPDID
							 WHERE CATEGORY_DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
							   AND ITEM_ORDER = C_071_REC.ITEM_ORDER
							;
							W_NEWKJUN := W_NEWKJUN + 1;
						END LOOP;
					END LOOP;
				END LOOP;
			END IF;

		/**********************************************************************/
		/* �O����p�f�[�^�Z�b�g����                                           */
		/**********************************************************************/
			FOR W_I IN 0..2 LOOP
				SELECT COUNT(*) INTO W_CNT
				  FROM WEB_TP0000010_M
				 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2);

				/* �Ј��ԍ����� */
				DELETE FROM WEB_TP0000022_M WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2) AND ITEM_ORDER = W_ITM_ID1;
				IF W_CNT > 0 THEN
					INSERT INTO WEB_TP0000022_M(DIV,ITEM_ORDER,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME)
					SELECT DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2),W_ITM_ID1,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME
					  FROM WEB_TP0000022_M
					 WHERE DIV = 2 AND ITEM_ORDER = 1;
				END IF;

				IF P_TBKBN = 1 THEN
					/* �h�c���� */
					IF P_TBKBN = 1 AND P_RKBN = '1' AND P_KEYUSE = '0' THEN
						DELETE FROM WEB_TP0000022_M WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2) AND ITEM_ORDER = W_ITM_ID2;
						IF W_CNT > 0 THEN
							INSERT INTO WEB_TP0000022_M(DIV,ITEM_ORDER,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME)
							SELECT DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2),W_ITM_ID2,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME
							  FROM WEB_TP0000022_M
							 WHERE DIV = 87 AND ITEM_ORDER = 2;
						END IF;
					END IF;

					/* �X�V������ */
					DELETE FROM WEB_TP0000022_M WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2) AND ITEM_ORDER = W_ITM_ID3;
					IF W_CNT > 0 THEN
						INSERT INTO WEB_TP0000022_M(DIV,ITEM_ORDER,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME)
						SELECT DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2),W_ITM_ID3,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME
						  FROM WEB_TP0000022_M
						 WHERE DIV = 2 AND ITEM_ORDER = 22;
					END IF;

					/* �X�V�҃R�[�h���� */
					DELETE FROM WEB_TP0000022_M WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2) AND ITEM_ORDER = W_ITM_ID4;
					IF W_CNT > 0 THEN
						INSERT INTO WEB_TP0000022_M(DIV,ITEM_ORDER,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME)
						SELECT DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2),W_ITM_ID4,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME
						  FROM WEB_TP0000022_M
						 WHERE DIV = 2 AND ITEM_ORDER = 23;
					END IF;
				END IF;
			END LOOP;

		/**********************************************************************/
		/* �o�^�p�r���[�̍쐬                                                 */
		/**********************************************************************/
			WEB_SP0060020_S(1,P_RID);

		/**********************************************************************/
		/* �Ɖ�p�r���[�̍쐬                                                 */
		/**********************************************************************/
			WEB_SP0060010_S(1,P_RID);

	/**********************************************************************/
	/* �폜����                                                           */
	/**********************************************************************/
		ELSIF P_UPDKBN = 3 THEN
		/**********************************************************************/
		/* ���R���ڐݒ�֘A                                                   */
		/**********************************************************************/
			IF W_LOGSET = 1 THEN
				W_WHERE := 'IDENTIFIER = ' || W_KEY;
				WEB_SP0003150_S(1,'ROWID','WEB_TP0061110_M',W_WHERE,P_RID,W_ROWID,W_ERR);
				IF W_ERR <> 0 THEN
					P_ERR := -1;
					GOTO L_EXIT;
				END IF;
				W_LGSNO := W_LGSNO + 1;
				WEB_SP0003111_S(2,3,1,0,'','WEB_TP0061110_M',W_ROWID,W_LGSNO,W_LGGET,W_LGIUD,P_UPDID,P_RID,W_ERR);
				IF W_ERR <> 0 THEN
					P_ERR := -1;
					GOTO L_EXIT;
				END IF;
			END IF;
			DELETE FROM WEB_TP0061110_M
			 WHERE IDENTIFIER = W_KEY
			;

			DELETE FROM WEB_TP0061111_M
			 WHERE IDENTIFIER = W_KEY
			;

			DELETE FROM WEB_TP0061120_M
			 WHERE IDENTIFIER = W_KEY
			;

			DELETE FROM WEB_TP0061121_M
			 WHERE IDENTIFIER = W_KEY
			;

		/**********************************************************************/
		/* �����֘A                                                           */
		/**********************************************************************/
			/* ������� */
			DELETE FROM WEB_TP0050030_M
			 WHERE SUB_DIV = 2
			   AND DIV IN (W_TSID,W_TSID1,W_TSID2)
			;
			DELETE FROM WEB_TP0050030_M
			 WHERE SUB_DIV = 4
			   AND DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

		/**********************************************************************/
		/* �o�^�֘A                                                           */
		/**********************************************************************/
			DELETE FROM WEB_TP0000010_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0000011_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0000012_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0000013_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0000020_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0000021_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0000022_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0000023_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			/* �o�^�r���[�폜 */
			IF W_NEWKBN = 0 THEN
				WEB_SP0003020_S(2,'WEB_VP0020' || TO_CHAR(W_TSID,'FM000'));
				WEB_SP0003020_S(2,'WEB_VP00050' || TO_CHAR(W_KEY,'FM00'));
			ELSE
				WEB_SP0003020_S(2,'WEB_VP092' || TO_CHAR(W_TSID,'FM00000'));
				WEB_SP0003020_S(2,'WEB_VP091' || TO_CHAR(W_KEY,'FM0000'));
			END IF;

		/**********************************************************************/
		/* �Ɖ�֘A                                                           */
		/**********************************************************************/
			DELETE FROM WEB_TP0010010_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0010011_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0010012_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0010013_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0010020_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0010021_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0010022_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0010023_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			DELETE FROM WEB_TP0010030_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

			/* �Ɖ�r���[�폜 */
			IF W_NEWKBN = 0 THEN
			 WEB_SP0003020_S(2,'WEB_VP0010' || TO_CHAR(W_TSID,'FM000'));
			 WEB_SP0003020_S(2,'WEB_VP0010' || TO_CHAR(W_TSID+100,'FM000'));
			ELSE
			 WEB_SP0003020_S(2,'WEB_VP093' || TO_CHAR(W_TSID,'FM00000'));
			 WEB_SP0003020_S(2,'WEB_VP093' || TO_CHAR(W_TSID1,'FM00000'));
			END IF;

		/**********************************************************************/
		/* �l���֘A                                                       */
		/**********************************************************************/
		--	DELETE FROM WEB_TP0010430_M
		--	 WHERE ���ދ敪 = W_TSID
		--	;

		/**********************************************************************/
		/* �l�f�[�^�̍폜                                                   */
		/**********************************************************************/
			IF P_TBKBN = 1 THEN
				WEB_SP0003020_S(1,W_TABLE1);
			END IF;

		/**********************************************************************/
		/* �t�@�C���f�[�^�̍폜                                               */
		/**********************************************************************/
			WEB_SP0003020_S(1,W_TABLE5);

		/**********************************************************************/
		/* �͏o�\���֘A�̍폜                                                 */
		/**********************************************************************/
			IF W_TDKFLG > 0 THEN
				/* ���̓`�F�b�N���̍폜 */
				W_SQL := 'DELETE FROM WEB_TP0061160_M';
				W_SQL := W_SQL || ' WHERE SYSTEM_DIV=2';
				W_SQL := W_SQL || '   AND IDENTIFIER=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP0061170_M';
				W_SQL := W_SQL || ' WHERE SYSTEM_DIV=2';
				W_SQL := W_SQL || '   AND IDENTIFIER=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP0061171_M';
				W_SQL := W_SQL || ' WHERE SYSTEM_DIV=2';
				W_SQL := W_SQL || '   AND IDENTIFIER=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �͏o���̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000010_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000011_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000012_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000013_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000014_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �͏o���ڏ��̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000020_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000021_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000022_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000023_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �͏o�������̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000040_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000041_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ��o�����ݒ�̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000050_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ��o�����t�@�C���̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000060_T';
				W_SQL := W_SQL || ' WHERE TDKKBN=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000061_T';
				W_SQL := W_SQL || ' WHERE TDKKBN=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ���͐��������t�@�C���̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000070_T';
				W_SQL := W_SQL || ' WHERE TDKKBN=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000071_T';
				W_SQL := W_SQL || ' WHERE TDKKBN=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �͏o�����t�q�k���̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000080_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000081_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ����Ȏ��� */
				W_SQL := 'DELETE FROM WEB_TP1000520_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000521_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �C�x���g���  */
				W_SQL := 'DELETE FROM WEB_TP0140050_T';
				W_SQL := W_SQL || ' WHERE DIV=1';
				W_SQL := W_SQL || '   AND TARGET_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �������̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000320_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ���F���̍폜 */
				W_SQL := 'DELETE FROM WEB_TP1000110_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000111_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000112_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �͏o�\���f�[�^�̍폜 */
				WEB_SP0003020_S(1,W_TABLE3);
			END IF;
		END IF;
	END IF;

/**********************************************************************/
/* �l�}�X�^�X�V���O�e�[�u�����ڏ��̍č쐬                         */
/**********************************************************************/
	IF P_SKBN = 2 THEN
		WEB_SP0060090_S(1,0,P_RID,P_UPDID);
	END IF;

/**********************************************************************/
/* �l�J�e�S�����̍č쐬(�O����)                                   */
/**********************************************************************/
	IF P_SKBN IN (1,2) THEN
		FOR C_013_REC IN C_013 LOOP
			/* �\�[�g����(�S��) */
			WEB_SP0060140_S(1,0,W_TSID,C_013_REC.LANGUAGEID,0,P_RID,P_UPDID,W_ERR);
			/* �\�[�g����(�e��) */
			FOR C_012_REC IN C_012 LOOP
				WEB_SP0060140_S(2,C_012_REC.KAISYACD,W_TSID,C_013_REC.LANGUAGEID,0,P_RID,P_UPDID,W_ERR);
			END LOOP;
			/* �o�͏��� */
			WEB_SP0060140_S(3,0,W_TSID,C_013_REC.LANGUAGEID,0,P_RID,P_UPDID,W_ERR);
		END LOOP;
	END IF;

/**********************************************************************/
/* ���O�擾�ŏI�X�V����                                               */
/**********************************************************************/
	IF W_LOGSET = 1 THEN
		WEB_SP0003111_S(3,0,0,0,'WEB_SP0060910_S','','',0,W_LGGET,W_LGIUD,P_UPDID,P_RID,W_ERR);
		IF W_ERR <> 0 THEN
			P_ERR := -1;
			GOTO L_EXIT;
		END IF;
	END IF;

/**********************************************************************/
/* �I������                                                           */
/**********************************************************************/
<<L_EXIT>>
	IF P_ERR = -1 THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
	DBMS_SQL.CLOSE_CURSOR(W_CSR);
	DBMS_SQL.CLOSE_CURSOR(W_CSR2);

/**********************************************************************/
/* �G���[����������                                                   */
/**********************************************************************/
EXCEPTION
WHEN OTHERS THEN
	ROLLBACK;
	P_ERR :=-1;
	W_ERRCODE := SQLCODE;
	W_ERRMSG  := SQLERRM(SQLCODE);
	WEB_SP0003010_S(
		1,
		P_RID,
		P_UPDID,
		'WEB_SP0060910_S',
		'1',
		W_ERRCODE,
		W_ERRMSG,
		SUBSTR(W_SQL,1,1333))
	;
 END;
/

