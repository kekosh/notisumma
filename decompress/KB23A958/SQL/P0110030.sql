/**********************************************************************************/
/*  ���сF�l��WEB                                                                 */
/*  �@�\�F�}�X�^�ێ�                                                              */
/*  �����F����                                                                    */
/*  ���e�F�捞����                                                                */
/*  ���́FWEB_SP0110030_S                                                         */
/*  FILE�FP0110030.SQL                                                            */
/*  ���l�F                                                                        */
/*                                                                                */
/*  �쐬�FVer6.1   2001/05/01 T.M                                                 */
/*  �����FVer6.3   2002/02/01 T.M �̗p�Ǘ��Ή�                                    */
/*  �����FVer6.3   2002/02/01 T.M �ꊇ�捞�Ή�                                    */
/*  �����FVer8.0   2002/02/01 T.M �d���Ή�,�����捞�Ή�                           */
/*  �����FVer8.0.7 2002/09/16 T.M ���̃}�X�^�̃R�[�h�e�L�X�g�A�������Ή�          */
/*  �����FVerP1.1  2003/05/01 T.M �p�����Ή�                                      */
/*  �����FVerP1.1  2003/05/01 T.M ���[�N�e�[�u���X�y�[�X�Ή�                      */
/*  �����FVerP1.2b 2003/11/26 T.M �E�\�������̐E���R�[�h�`�F�b�N�Ή�              */
/*  �����FVerP2.0  2004/XX/XX T.M ���̃}�X�^�����g���Ή�                          */
/*  �����FVerP2.1  2004/05/14 T.M �}�X�^�\���Ή�                                  */
/*  �����FVerP2.12 2004/08/18 T.M ����擾�s��Ή�                              */
/*  �����FVerP2.21 2004/10/26 T.M �}�X�^�������Ή�                                */
/*  �����FVerP2.42 2005/06/06 M.I �[�t��(�n�������c�̏���)�ǉ��Ή�                */
/*                                ��s�{�x�X(�S�⋦)�ǉ��Ή�                      */
/*                                �X�֔ԍ��ǉ��Ή�                                */
/*  �����FVerP3.01 2005/08/03 T.M D100001 �}���`�J���p�j�[�Ή�                    */
/*  �����FVerP3.01 2005/09/06 M.I E100078 �ꊇ�捞�G���[���O�X�V���s��Ή�      */
/*  �����FVerP3.01 2005/09/07 M.I E100080 ���������ԏd��(�����f�[�^)�s��Ή�    */
/*  �����FVerP3.03 2006/01/18 M.I D100059 �U��������Ή�                          */
/*  �����FVerP3.0a 2006/03/06 M.I E100174 �}���`�J���p�j�[�Ή��R��                */
/*  �����FVerP3.0a 2006/03/07 T.M D100075 �w�Z�}�X�^�����Ή�                      */
/*  �����FVerP3.0a 2006/03/22 M.I E100210 ���������R��Ή�                        */
/*  �����FVerP3.0c 2006/05/15 Y.Y D100107 �S�⋦�̓��ꕶ���捞�Ή�                */
/*  �����FVerP3.0d 2006/06/19 M.I E100315 �S�⋦�̕s���f�[�^�`�F�b�N�Ή�          */
/*  �����FVerP3.1  2007/01/25 M.I D100164 �w�ZϽ��ú�ؕ����Ή�                    */
/*  �����FVerP3.1  2007/02/15 M.I D100205 �����_�g���Ή�                          */
/*  �����FVerP4.0  2007/11/08 M.I D100351 �P���Љ^�p�Ή�                        */
/*  �����FVerP4.0  2007/12/26 M.I D100379 TDE�Ή�                                 */
/*  �����FVerP4.0  2008/02/19 M.I D100423 ���̃}�X�^�[�̉�Еʃ}�X�^�[�ݒ�Ή�    */
/*  �����FVerP4.0c 2009/02/19 Y.Y E101192 �ύX���̗��������ԏd�������s��Ή�    */
/*  �����FVerP4.0f 2010/04/08 M.K �y���P�zD100557 ���R�}�X�^�[�̗������Ή�        */
/*  �����FVerP4.0g 2010/09/30 M.K�y�C��693�zE101557 �X�V���X�V�Һ��ޓo�^�R��Ή�  */
/*  �����FVer.2    2011/08/02 T.M�y���PP-11-004�z                                 */
/*  �����FVer.3    2012/01/30 M.I�y�C��P11870�z                                   */
/*  �����FVer.3    2012/02/16 M.I�y�C��P11970�z                                   */
/*  �����FVer.3    2012/04/09 M.K�y�C��P12480�z                                   */
/*  �����FVerP6.0  2014/07/15 ISID�yP-14-017�z                                    */
/*  �����FVerP6.0  2014/12/18 ISID�yP17520�z                                      */
/*  �����FVerP6.1  2015/05/11 T.M�y���PP-14-083�z                                 */
/*  �����FVerP6.1  2016/06/06 ISID�yP21610�z��s�}�X�^�X�V���̃f�[�^�X�V���O�Ή�  */
/*  �����FVer6.1   2020/12/04 ISID�y�C��P32240�z                                   */
/**********************************************************************************/
DROP PROCEDURE WEB_SP0110030_S;

CREATE PROCEDURE WEB_SP0110030_S(
	P_SKBN      IN  NUMBER,   /* 1:�e�[�u���쐬,2:�`�F�b�N,3:�o�^,4:�e�[�u���폜,5:���[�N�ύX,6:�ꊇ�捞 */
	P_MSTID     IN  NUMBER,   /* 1:���̃}�X�^,2:�E�\������,3:�{������,4:��s,5:��s�x�X,6:�Z���Ŕ[�t��,7:���R�}�X�^,8:�g�D�l�� */
                              /* 11:�X�֔ԍ�(�}�X�^(P_YOBI=1),�ꎞ��(P_YOBI=2)) */
                              /* 12:�[�t��(�n�������c�̏���) */
                              /* 13:��s�{�x�X(�S�⋦) */
	P_MSTKBN    IN  VARCHAR2, /* �}�X�^�敪,�E���R�[�h,��s�R�[�h */
	P_UPDKBN    IN  VARCHAR2, /* �X�V�敪(1:�ǉ�,2:�u���ǉ�,3:�폜�ǉ�),ܰ��ύX��(1:����,2:�ύX,3:�폜) */
	P_WKKBN     IN  VARCHAR2, /* ܰ��ύX���敪(1:����,2:�ύX,3:�폜) */
	P_KAISYA    IN  WEB_TPFIELD.KAISYACD%TYPE, /* ��ЃR�[�h */
	P_SID       IN  WEB_TPFIELD.SYAINCD%TYPE, /* �X�V�ҎЈ��R�[�h,ܰ��ύX��(���R�[�h�h�c) */
	P_RID       IN  NUMBER,   /* ���p�҂h�c */
	P_SDATE     IN  VARCHAR2, /* �������� */
	P_EXEID     IN  NUMBER,   /* ���s�h�c */
	P_KDATE     IN  VARCHAR2, /* �J�n���� */
	P_ERREXE    IN  VARCHAR2, /* �G���[�Ή� */
	P_UNIQUE    IN  VARCHAR2, /* �d���Ή�(1:��.2:�擪�D��,3:�ŏI�D��) */
	P_YOBI      IN  VARCHAR2, /* �\���t���O */
	P_UPDID     IN  WEB_TPFIELD.UPDID%TYPE, /* �X�V�҂h�c */
	P_ERR       OUT NUMBER    /* �G���[�敪(0:����,-1:�G���[) */
	                          /* 2:�L�[�d��(�捞��),3:�L�[�d��(�����f�[�^),4:�捞�s���� */
	                          /* 11:�}�X�^������(��s�}�X�^),12:�}�X�^������(�E�\������) */
	                          /* 13:�}�X�^������(���̃}�X�^-�w�Z) */
)

IS

TYPE T_LVAR1 IS TABLE OF VARCHAR2(100)   INDEX BY BINARY_INTEGER; /* �z��錾 */
W_SQL      VARCHAR2(4000);  /* �S�r�p�k */
W_TABLE1   VARCHAR2(100);    /* ���[�N�e�[�u���� */
W_TABLE2   VARCHAR2(100);    /* �ۑ��e�[�u���� */
W_TABLE3   VARCHAR2(100);    /* �ۑ��e�[�u����(�\��) */
W_TABLE4   VARCHAR2(100);    /* �������[�N�e�[�u���� */
W_INDEX1   VARCHAR2(100);    /* ���[�N�e�[�u���C���f�b�N�X */
W_INDEX2   VARCHAR2(100);    /* ���[�N�e�[�u���C���f�b�N�X */
W_KEYINF   VARCHAR2(400);   /* �L�[��� */
W_KEYINF2  VARCHAR2(400);   /* �L�[��� */
W_FIELD    VARCHAR2(1000);   /* �t�B�[���h��� */
W_FIELD2   VARCHAR2(1000);   /* �t�B�[���h��� */
W_MSTSYU   VARCHAR2(2);     /* �}�X�^��� */
W_INCNT    NUMBER(10);      /* �ꊇ�捞���� */
W_ERRCNT   NUMBER(10);      /* �ꊇ�捞�G���[���� */
W_UPDCNT   NUMBER(10);      /* �ꊇ�捞�o�^���� */
W_I        NUMBER(5);       /* ���[�N�J�E���g */
W_J        NUMBER(5);       /* ���[�N�J�E���g */
W_CNT      NUMBER(10);      /* ���[�N�J�E���g */
W_NDATA1   NUMBER(10);      /* �J�[�\���擾�f�[�^ */
W_NDATA2   NUMBER(10);      /* �J�[�\���擾�f�[�^ */
W_NDATA3   NUMBER(10);      /* �J�[�\���擾�f�[�^ */
W_NDATA4   NUMBER(4);       /* �J�[�\���擾�f�[�^(��s�R�[�h) */
W_NDATA5   NUMBER(3);       /* �J�[�\���擾�f�[�^(��s�x�X�R�[�h) */
W_DATA1    NUMBER;          /* �擾�f�[�^ */
W_DATA2    VARCHAR2(20);    /* �擾�f�[�^ */
W_DATA3    VARCHAR2(20);    /* �擾�f�[�^ */
W_DATA4    VARCHAR2(6);     /* �擾�f�[�^ */
W_DATA5    VARCHAR2(40);    /* �擾�f�[�^ */
W_DATA6    VARCHAR2(66);    /* �擾�f�[�^ */
W_DATA7    VARCHAR2(44);    /* �擾�f�[�^ */
W_DATA8    VARCHAR2(66);    /* �擾�f�[�^ */
W_DATA9    VARCHAR2(60);    /* �擾�f�[�^ */
W_DATA10   VARCHAR2(90);    /* �擾�f�[�^ */
W_DATA11   VARCHAR2(60);    /* �擾�f�[�^ */
W_DATA12   VARCHAR2(90);    /* �擾�f�[�^ */
W_DATA13   VARCHAR2(60);    /* �擾�f�[�^ */
W_DATA14   VARCHAR2(60);    /* �擾�f�[�^ */
W_DATE     DATE;            /* �ύX�����X�V���t */
W_SID      NUMBER(10);      /* ���[�N�Ј��R�[�h */
W_BDATA2   VARCHAR2(20);    /* */
W_BDATA3   VARCHAR2(20);    /* */
W_STR_X    NUMBER(3);       /* �����T�[�`�ϐ� */
W_MSTK1    VARCHAR2(100);    /* �}�X�^�R�[�h����1 */
W_MSTK2    VARCHAR2(100);    /* �}�X�^�R�[�h����2 */
W_SEDAI    NUMBER(5);       /* ����ԍ� */
W_RIREKI   NUMBER(1);       /* �����t���O(0:�ʏ�,1:����) */
                            /* �����敪(0:�e�Д��f,1:�S�Д��f) */
W_DOUKI    VARCHAR2(1) DEFAULT '0';
W_DOUKIFLG VARCHAR2(1) DEFAULT '0';
W_KAISYA   WEB_TPFIELD.KAISYACD%TYPE; /* ������ЃR�[�h */
W_KAISYA_L WEB_TPFIELD.KAISYACD%TYPE; /* ���O�C����ЃR�[�h */
W_KFLG     VARCHAR2(1);     /* �P���Љ^�p�t���O */
W_KDATA1   NUMBER;          /* ���ԏd���f�[�^���[�N(�h�c) */
W_KDATA2   VARCHAR2(6);     /* ���ԏd���f�[�^���[�N(�}�X�^�敪�R�[�h) */
W_KDATA3   VARCHAR2(11);    /* ���ԏd���f�[�^���[�N(�R�[�h) */
W_KDATA4   DATE;            /* ���ԏd���f�[�^���[�N(�J�n��) */
W_KDATA5   DATE;            /* ���ԏd���f�[�^���[�N(�I����) */
W_KDATA6   NUMBER;          /* ���ԏd���f�[�^���[�N(����) */
W_CHKFLG   NUMBER(1);		/* ���������ԏd���Ώۃt���O(0:�ΏۊO�C1:�Ώ�) */
W_GRPINF   VARCHAR2(400);   /* �O���[�v��� */

W_YOBI     VARCHAR2(1);     /* �\����� */
W_MSTID    NUMBER(6);       /* �}�X�^�h�c */
W_MAPFI    VARCHAR2(50);    /* �}�b�s���O���ږ� */
W_MAPTB    VARCHAR2(50);    /* �}�b�s���O�e�[�u���� */
W_MAPTBL   VARCHAR2(50);    /* �}�b�s���O�e�[�u����(�O����) */

W_WKTBSP   VARCHAR2(100);    /* ���[�N�e�[�u���X�y�[�X */
W_CSR      INTEGER;
W_CSR2     INTEGER;
W_RVL      INTEGER;
W_RVL2     INTEGER;
W_ERRCODE  NUMBER;          /* ORACLE�G���[�R�[�h */
W_ERRMSG   VARCHAR2(510);   /* ORACLE�G���[���b�Z�[�W */
W_ERR      NUMBER;          /* �֐��߂�l�p�G���[�敪 */

W_LEN      NUMBER;          /* �����T�C�Y */
W_ASC_CD   NUMBER;          /* �A�X�L�[�R�[�h */
W_ASC_ERR  NUMBER(1);       /* �G���[���f */
W_ADATA1   NUMBER(8);       /* �h�c */
W_ADATA2   NUMBER(2);       /* �L�[ */
W_ADATA3   VARCHAR2(90);    /* ��s���J�i */
W_ADATA4   VARCHAR2(90);    /* �x�X���J�i */
W_SET      VARCHAR2(20);    /* ���ݒ� */
W_RTN      VARCHAR2(20);    /* �֐��߂�l */
W_CADATA   VARCHAR2(30000); /* �`�F�b�N�Ώە�����i�ꎞ���p�j */

W_COLUMN    VARCHAR2(60);   /* ���[�N���ږ��ϐ� */

/* �\�����ڏ�� */
CURSOR C_001(P_ID NUMBER) IS
	SELECT
		A.ITEM_ID,
		A.ITEM_NAME,
		A.MANAGEMENT_NAME,
		A.DATA_TYPE,
		A.INPUT_DIV,
		A.REFERENCE_DIV,
		A.MASTER_ID,
		A.LITERAL_CONTENT,
		B.OBJECT_NAME MASTER_NAME,
		B.CODE_ITEM MASTER_CODE_ITEM,
		B.CORP_DIV
	  FROM WEB_TP0110220_M A,
	       WEB_TP0110210_M B
	 WHERE A.IDENTIFIER = P_ID
	   AND A.USAGE_DIV = '1'
	   AND A.MASTER_ID = B.IDENTIFIER(+)
	  ORDER BY A.ITEM_ID
	;

/* ��Џ�� */
CURSOR C_002 IS
	SELECT KAISYACD
	  FROM KAISYA_MS
	ORDER BY DECODE(KAISYACD,P_KAISYA,1,2),KAISYACD
;

C_002_REC C_002%ROWTYPE;

CURSOR C_003 IS
	SELECT '0' KAISYACD
	  FROM DUAL
;

/* �}�b�s���O���ڏ�� */
CURSOR C_011(P_KAISYA_D NUMBER,P_MSTID_D NUMBER) IS
	SELECT
		A.KAISYACD,
		DECODE(A.KAISYACD,0,'0','1') KAISYA_DIV,
		A.MAPPING_ID,
		A.DATA_TYPE_DIV,
		A.DATA_SIZE,
		A.FRACTION_SIZE,
		A.NAME_SIZE,
		A.TARGET_KAISYA_DIV,
		A.LOCAL_UPDATE_DIV,
		B.TARGET_KAISYACD
	  FROM WEB_TP0110410_M A,
	       WEB_TP0110420_M B
	 WHERE ((A.KAISYACD = 0 AND TARGET_KAISYA_DIV = '1') OR (A.KAISYACD = 0 AND TARGET_KAISYA_DIV = '2' AND B.TARGET_KAISYACD = P_KAISYA_D) OR A.KAISYACD = P_KAISYA_D)
	   AND A.MASTER_ID = P_MSTID_D
	   AND A.KAISYACD = B.KAISYACD(+)
	   AND A.MASTER_ID = B.MASTER_ID(+)
	   AND A.MAPPING_ID = B.MAPPING_ID(+)
	  ORDER BY A.KAISYACD,A.DISP_ORDER
	;

/* ��s���J�i�A�x�X���J�i���ꕶ���g�p�`�F�b�N */
FUNCTION FNCL_ZENBANK_CHK RETURN VARCHAR2 IS W_RET VARCHAR2(20);

BEGIN

	W_RET := '';

	SELECT MAX(CONF_VALUE) INTO W_SET FROM WEB_TP0001020_M
	 WHERE DIV1 = 0 AND DIV2 = 0 AND DIV3 = 0 AND IDENTIFIER = 18;

	IF W_SET = '1' THEN
		/* 17:��s���J�i���ꕶ���g�p�A18:�x�X���J�i���ꕶ���g�p */
		W_SQL := 'SELECT IDENTIFIER, KEY_ITEM, GINKOKME, SITENKME';
		W_SQL := W_SQL || '  FROM ' || W_TABLE1;
		W_SQL := W_SQL || ' WHERE ERROR IS NULL';
		W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_ADATA1);
		DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_ADATA2);
		DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_ADATA3,180);
		DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_ADATA4,180);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		LOOP 
			W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
			IF W_RVL > 0 THEN
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_ADATA1);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_ADATA2);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_ADATA3);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_ADATA4);
				W_ASC_ERR := 0;

				W_LEN := LENGTH(W_ADATA3);
				/* �J�i�������`�F�b�N */
				SELECT REGEXP_REPLACE(W_ADATA3,'\-|[ (),./\��]|[0-9A-Z]|[���-���]','')
				INTO W_CADATA FROM DUAL;
				IF NOT W_CADATA IS NULL THEN
					W_ASC_ERR := 1;
				ELSE
				/* ���p�����`�F�b�N */
					SELECT REGEXP_REPLACE(W_ADATA3,'['||CHR(9)||CHR(10)||CHR(13)||']'||'|\-|\]|[ !"#$%&''()*+,./:;<=>?@[\^_`{|}~�����]|[0-9A-Za-z]|[��-���-���]','')
					INTO W_CADATA FROM DUAL;
					IF NOT W_CADATA IS NULL THEN
						W_ASC_ERR := 1;
					END IF;
				END IF;

				IF W_ASC_ERR = 0 THEN
					W_LEN := LENGTH(W_ADATA4);
					/* �J�i�������`�F�b�N */
					SELECT REGEXP_REPLACE(W_ADATA4,'\-|[ (),./\��]|[0-9A-Z]|[���-���]','')
					INTO W_CADATA FROM DUAL;
					IF NOT W_CADATA IS NULL THEN
						W_ASC_ERR := 2;
					ELSE
					/* ���p�����`�F�b�N */
						SELECT REGEXP_REPLACE(W_ADATA4,'['||CHR(9)||CHR(10)||CHR(13)||']'||'|\-|\]|[ !"#$%&''()*+,./:;<=>?@[\^_`{|}~�����]|[0-9A-Za-z]|[��-���-���]','')
						INTO W_CADATA FROM DUAL;
						IF NOT W_CADATA IS NULL THEN
							W_ASC_ERR := 2;
						END IF;
					END IF;
				END IF;

				IF W_ASC_ERR = 1 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=17';
					W_SQL := W_SQL || ' WHERE IDENTIFIER = ' || W_ADATA1;
					DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
				ELSIF W_ASC_ERR = 2 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=18';
					W_SQL := W_SQL || ' WHERE IDENTIFIER = ' || W_ADATA1;
					DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
				END IF;
			ELSE
				EXIT;
			END IF;
		END LOOP;
	END IF;

	RETURN W_RET;

END;


 BEGIN

/**********************************************************************/
/* �s�G���[���e                                                       */
/*    2:�L�[�d��(�捞��)                                              */
/*    3:�L�[�d��(�����f�[�^)                                          */
/*    4:�捞�s����                                                  */
/*    5:�L�[���ݒ�                                                    */
/*    6:���ԏd��(�捞��)                                              */
/*    7:���ԏd��(�����f�[�^)                                          */
/*    8:�L�[�d�����O�f�[�^�i�ꊇ�捞���j                              */
/*   11:��s�}�X�^������(��s�x�X�捞��)                              */
/*   12:�E���}�X�^������(�E�\�������捞��)                            */
/*   13:����}�X�^������(�g�D�l�ێ捞��)                              */
/*   14:�x�X�R�[�hNULL(��s�{�x�X(�S�⋦))                            */
/*   15:��s������30���ȏ�(��s�{�x�X(�S�⋦))                        */
/*   16:�x�X������30���ȏ�(��s�{�x�X(�S�⋦))                        */
/*   17:��s���J�i���ꕶ���g�p(��s�{�x�X(�S�⋦))                    */
/*   18:�x�X���J�i���ꕶ���g�p(��s�{�x�X(�S�⋦))                    */
/*   100�`:�}�X�^������(�\������)                                     */
/*   1000�`:�}�X�^������(�}�b�s���O����(�S��))                        */
/*   2000�`:�}�X�^������(�}�b�s���O����(�e��))                        */
/**********************************************************************/

/**********************************************************************/
/* ��������                                                           */
/**********************************************************************/
	P_ERR := 0;
	W_YOBI := '0';
	W_RIREKI := 0;
	W_WKTBSP := WEB_SP0002000_F(10);
	W_KFLG := WEB_SP0002000_F(30);
	W_CSR := DBMS_SQL.OPEN_CURSOR;
	W_CSR2 := DBMS_SQL.OPEN_CURSOR;
	W_TABLE1 := 'WEB_TP0110070_W_' || P_RID;
	W_INDEX1 := 'WEB_IP0110070_W1_' || P_RID;
	W_INDEX2 := 'WEB_IP0110070_W2_' || P_RID;

/**********************************************************************/
/* ���O�C����Ў擾                                                   */
/**********************************************************************/
	SELECT MAX(KAISYACD) INTO W_KAISYA_L
	  FROM EMP_BASIC_INFO
	 WHERE EMP_CODE = P_UPDID;
	 
	IF W_KAISYA_L IS NULL THEN
		SELECT MAX(KAISYACD) INTO W_KAISYA_L
		  FROM WEB_TP0050810_T
		 WHERE EMP_CODE = P_UPDID;
	END IF;

/**********************************************************************/
/* �}�X�^�h�c�擾                                                     */
/**********************************************************************/
	IF P_MSTID = 1 THEN
		SELECT MAX(IDENTIFIER) INTO W_MSTID
		  FROM WEB_TP0110210_M
		 WHERE MASTER_KIND = '1'
		   AND MASTER_DIV1 = P_MSTKBN
		;
	ELSIF P_MSTID = 7 THEN
		SELECT MAX(IDENTIFIER) INTO W_MSTID
		  FROM WEB_TP0110210_M
		 WHERE MASTER_KIND = '2'
		   AND MASTER_DIV2 = P_MSTKBN
		;
	ELSIF P_MSTID = 8 THEN
		W_MSTID := 10001;
	ELSE
		W_MSTID := 0;
	END IF;

/**********************************************************************/
/* �e�[�u�����E�L�[���ݒ�                                         */
/**********************************************************************/
	IF P_MSTID = 1 THEN
		SELECT MAX(MASTER_KIND),NVL(MAX(AUX_INFO),0) INTO W_MSTSYU,W_YOBI
		  FROM WEB_TP0110210_M
		 WHERE MASTER_DIV1 = P_MSTKBN
		   AND MASTER_KIND IN ('1','6')
		;

		/* �S�Д��f(0:���Ȃ��E1:����) */
		IF W_MSTSYU = '1' THEN
			SELECT NVL(SYNC_DIV,'0'),NVL(SYNC_PROCESS_FLAG,'0') INTO W_DOUKI,W_DOUKIFLG
			  FROM WEB_TP0110210_M
			 WHERE MASTER_KIND = '1'
			   AND MASTER_DIV1 = P_MSTKBN
			 ;
		END IF;

		IF WEB_SP0002420_F(1,W_MSTID) = 0 THEN
			W_KEYINF := 'MASTER_DIV_CODE,CODE_VALUE';
			IF W_MSTSYU = '1' THEN
				IF P_MSTKBN IN ('9c') THEN
					W_TABLE2 := 'SCHOOL_MS';
				ELSE
					W_TABLE2 := 'MASTER';
				END IF;
			ELSE
				W_TABLE2 := 'APPLICANT_MS_INFO';
			END IF;
			IF P_MSTKBN IN ('9c') THEN
				W_TABLE3 := 'SCHOOL_MS_AUX_INFO';
			ELSE
				W_TABLE3 := 'MASTER_AUX_INFO';
			END IF;
			W_FIELD  := 'MASTER_DIV_CODE,CODE_VALUE,TEXT1,TEXT2,TEXT3,NUMBER1';
		ELSE
			W_KEYINF := 'MASTER_DIV_CODE,CODE_VALUE,BEGIN_DAY';
			W_TABLE2 := 'MASTER_HISTORY';
			W_TABLE3 := 'MASTER_AUX_INFO_HISTORY';
			W_FIELD  := 'MASTER_DIV_CODE,CODE_VALUE,BEGIN_DAY,END_DAY,TEXT1,TEXT2,TEXT3,NUMBER1';
			W_RIREKI := 1;
			W_GRPINF := 'MASTER_DIV_CODE,CODE_VALUE';
		END IF;
	ELSIF P_MSTID = 2 THEN
		W_MSTID := 200;
		IF WEB_SP0002420_F(1,W_MSTID) = 0 THEN
			W_KEYINF := 'GRADE_CODE,GRADE';
			W_TABLE2 := 'JOB_GRADE_NAME';
			W_FIELD  := 'GRADE_CODE,GRADE,NAME';
		ELSE
			W_KEYINF := 'GRADE_CODE,GRADE,BEGIN_DAY';
			W_TABLE2 := 'JOB_GRADE_NAME_HISTORY';
			W_FIELD  := 'GRADE_CODE,GRADE,BEGIN_DAY,END_DAY,NAME';
			W_RIREKI := 1;
			W_GRPINF := 'GRADE_CODE,GRADE';
		END IF;
	ELSIF P_MSTID = 3 THEN
		W_MSTID := 201;
		IF WEB_SP0002420_F(1,W_MSTID) = 0 THEN
			W_KEYINF := 'GRADE';
			W_TABLE2 := 'BASE_PAY_GRADE_NAME';
			W_FIELD  := 'GRADE,NAME';
		ELSE
			W_KEYINF := 'GRADE,BEGIN_DAY';
			W_TABLE2 := 'BASE_PAY_GRADE_NAME_HIS';
			W_FIELD  := 'GRADE,BEGIN_DAY,END_DAY,NAME';
			W_RIREKI := 1;
			W_GRPINF := 'GRADE';
		END IF;
	ELSIF P_MSTID = 4 THEN
		W_KEYINF := 'GINKOCD';
		W_TABLE2 := 'GINKO_MS';
		W_FIELD  := 'GINKOCD,GINKOJME,GINKOKME,GINKOAME';
	ELSIF P_MSTID = 5 THEN
		W_KEYINF := 'GINKOCD,SITENCD';
		W_TABLE2 := 'GINKSTN_MS';
		W_FIELD  := 'GINKOCD,SITENCD,SITENJME,SITENKME,SITENAME';
	ELSIF P_MSTID = 6 THEN
		W_KEYINF := 'JMZNHSCD';
		W_TABLE2 := 'JMZNHSK_MS';
		W_FIELD  := 'JMZNHSCD,NOHSKJME,NOHSKKME,NOHSKRME';
	ELSIF P_MSTID = 7 THEN
		IF WEB_SP0002420_F(1,W_MSTID) = 0 THEN
			W_KEYINF := 'MASTER_DIV,CODE_VALUE';
			W_TABLE2 := 'WEB_TP000250' || MOD(P_MSTKBN,10) || '_T';
			W_TABLE3 := 'WEB_TP000251' || MOD(P_MSTKBN,10) || '_T';
			W_FIELD  := 'MASTER_DIV,CODE_VALUE,CHAR1,NUMBER1';
		ELSE
			W_KEYINF := 'MASTER_DIV,CODE_VALUE,BEGIN_DAY';
			W_TABLE2 := 'WEB_TP000252' || MOD(P_MSTKBN,10) || '_T';
			W_TABLE3 := 'WEB_TP000253' || MOD(P_MSTKBN,10) || '_T';
			W_FIELD  := 'MASTER_DIV,CODE_VALUE,BEGIN_DAY,END_DAY,CHAR1,NUMBER1';
			W_RIREKI := 1;
			W_GRPINF := 'MASTER_DIV,CODE_VALUE';
		END IF;

		SELECT MAX(MASTER_KIND),NVL(MAX(AUX_INFO),0) INTO W_MSTSYU,W_YOBI
		  FROM WEB_TP0110210_M
		 WHERE MASTER_DIV2 = P_MSTKBN
		   AND MASTER_KIND = '2'
		;

		/* �S�Д��f(0:���Ȃ��E1:����) */
		SELECT NVL(SYNC_DIV,'0'),NVL(SYNC_PROCESS_FLAG,'0') INTO W_DOUKI,W_DOUKIFLG
		  FROM WEB_TP0110210_M
		 WHERE IDENTIFIER = W_MSTID
		 ;

	ELSIF P_MSTID = 8 THEN
		W_KEYINF := 'FISCAL_YEAR,PERIOD_DIV,RANK,CODE_VALUE';
		W_TABLE2 := 'WEB_TP0002720_T';
		W_TABLE3 := 'WEB_TP0002720_T';
		W_FIELD  := 'FISCAL_YEAR,PERIOD_DIV,RANK,CODE_VALUE';

	ELSIF P_MSTID = 11 THEN
		IF P_YOBI = '1' THEN		/* �}�X�^ */
			W_TABLE2 := 'ZIP_CODE_MS';
			W_FIELD  := 'AREA_CODE,CURRENT_ZIP_CODE,NEW_ZIP_CODE,PREFECTURE_KANA,MUNICIPALITY_KANA,AREA_NAME_KANA,PREFECTURE,MUNICIPALITY_NAME,AREA_NAME,REMARKS1,REMARKS2,REMARKS3,REMARKS4,REMARKS5,REMARKS6,PREFECTURE_ROMAN,MUNICIPALITY_ROMAN,AREA_NAME_ROMAN';
		ELSE						/* �ꎞ�� */
			W_TABLE2 := 'ZIP_CODE_MS_TEMP';
			W_FIELD  := 'AREA_CODE,CURRENT_ZIP_CODE,NEW_ZIP_CODE,PREFECTURE_KANA,MUNICIPALITY_KANA,AREA_NAME_KANA,PREFECTURE,MUNICIPALITY_NAME,AREA_NAME,REMARKS1,REMARKS2,REMARKS3,REMARKS4,REMARKS5,REMARKS6,PREFECTURE_ROMAN,MUNICIPALITY_ROMAN,AREA_NAME_ROMAN';
		END IF;

	ELSIF P_MSTID = 12 THEN
		W_KEYINF := 'JMZNHSCD';
		W_TABLE2 := 'JMZNHSK_MS';
		W_FIELD  := 'JMZNHSCD,NOHSKJME,NOHSKKME';
		
	ELSIF P_MSTID = 13 THEN
		W_KEYINF  := 'GINKOCD,SITENCD';
		W_KEYINF2 := 'GINKOCD';
		W_TABLE2  := 'GINKSTN_MS';
		W_TABLE3  := 'GINKO_MS';
		W_FIELD   := 'GINKOCD,SITENCD,SITENJME,SITENKME';
		W_FIELD2  := 'GINKOCD,GINKOJME,GINKOKME';
	END IF;

/**********************************************************************/
/* �e�[�u���쐬                                                       */
/**********************************************************************/
	IF P_SKBN = 1 THEN
		/* �O��e�[�u���폜 */
		WEB_SP0003020_S(1,W_TABLE1);

		/* �e�[�u���쐬 */
		W_SQL := 'CREATE TABLE ' || W_TABLE1 || ' (';
		W_SQL := W_SQL || ' IDENTIFIER             NUMBER(8)';
		IF P_MSTID = 13 THEN
			W_SQL := W_SQL || ',KEY_ITEM           NUMBER(2)';
		END IF;
		W_SQL := W_SQL || ',ERROR           NUMBER(5)';
		W_SQL := W_SQL || ',DELETE_DIV         VARCHAR2(1)';
		IF P_MSTID = 1 THEN
			W_SQL := W_SQL || ',MASTER_DIV_CODE VARCHAR2(3)';
			W_SQL := W_SQL || ',CODE_VALUE           VARCHAR2(11)';
			W_SQL := W_SQL || ',TEXT1       VARCHAR2(200)';
			W_SQL := W_SQL || ',TEXT2       VARCHAR2(60)';
			W_SQL := W_SQL || ',TEXT3       VARCHAR2(60)';
			W_SQL := W_SQL || ',NUMBER1            NUMBER(10)';
		ELSIF P_MSTID = 2 THEN
			W_SQL := W_SQL || ',GRADE_CODE VARCHAR2(10)';
			W_SQL := W_SQL || ',GRADE       NUMBER(3)';
			W_SQL := W_SQL || ',NAME       VARCHAR2(40)';
		ELSIF P_MSTID = 3 THEN
			W_SQL := W_SQL || ',GRADE       NUMBER(3)';
			W_SQL := W_SQL || ',NAME       VARCHAR2(40)';
		ELSIF P_MSTID = 4 THEN
			W_SQL := W_SQL || ',GINKOCD    NUMBER(4)';
			W_SQL := W_SQL || ',GINKOJME   VARCHAR2(60)';
			W_SQL := W_SQL || ',GINKOKME   VARCHAR2(90)';
			W_SQL := W_SQL || ',GINKOAME   VARCHAR2(30)';
		ELSIF P_MSTID = 5 THEN
			W_SQL := W_SQL || ',GINKOCD    NUMBER(4)';
			W_SQL := W_SQL || ',SITENCD    NUMBER(3)';
			W_SQL := W_SQL || ',SITENJME   VARCHAR2(60)';
			W_SQL := W_SQL || ',SITENKME   VARCHAR2(90)';
			W_SQL := W_SQL || ',SITENAME   VARCHAR2(30)';
		ELSIF P_MSTID = 6 THEN
			W_SQL := W_SQL || ',JMZNHSCD   CHAR(6)';
			W_SQL := W_SQL || ',NOHSKJME   VARCHAR2(40)';
			W_SQL := W_SQL || ',NOHSKKME   VARCHAR2(66)';
			W_SQL := W_SQL || ',NOHSKRME   VARCHAR2(22)';
		ELSIF P_MSTID = 7 THEN
			W_SQL := W_SQL || ',MASTER_DIV NUMBER(6)';
			W_SQL := W_SQL || ',CODE_VALUE     VARCHAR2(10)';
			W_SQL := W_SQL || ',CHAR1      VARCHAR2(200)';
			W_SQL := W_SQL || ',NUMBER1      NUMBER(10)';
		ELSIF P_MSTID = 8 THEN
			W_SQL := W_SQL || ',FISCAL_YEAR       VARCHAR2(4)';
			W_SQL := W_SQL || ',PERIOD_DIV     VARCHAR2(10)';
			W_SQL := W_SQL || ',RANK     NUMBER(2)';
			W_SQL := W_SQL || ',CODE_VALUE     NUMBER(8)';
			IF W_KFLG = '0' THEN
				W_SQL := W_SQL || ',KAISYACD NUMBER(8)';
			END IF;
			W_SQL := W_SQL || ',BELONG_CODE VARCHAR2(20)';
		ELSIF P_MSTID = 11 THEN
			W_SQL := W_SQL || ',AREA_CODE   VARCHAR2(5)';
			W_SQL := W_SQL || ',CURRENT_ZIP_CODE   VARCHAR2(5)';
			W_SQL := W_SQL || ',NEW_ZIP_CODE   VARCHAR2(7)';
			W_SQL := W_SQL || ',PREFECTURE_KANA VARCHAR2(60)';
			W_SQL := W_SQL || ',MUNICIPALITY_KANA VARCHAR2(300)';
			W_SQL := W_SQL || ',AREA_NAME_KANA     VARCHAR2(300)';
			W_SQL := W_SQL || ',PREFECTURE     VARCHAR2(40)';
			W_SQL := W_SQL || ',MUNICIPALITY_NAME     VARCHAR2(200)';
			W_SQL := W_SQL || ',AREA_NAME         VARCHAR2(200)';
			W_SQL := W_SQL || ',REMARKS1       VARCHAR2(1)';
			W_SQL := W_SQL || ',REMARKS2       VARCHAR2(1)';
			W_SQL := W_SQL || ',REMARKS3       VARCHAR2(1)';
			W_SQL := W_SQL || ',REMARKS4       VARCHAR2(1)';
			W_SQL := W_SQL || ',REMARKS5       VARCHAR2(1)';
			W_SQL := W_SQL || ',REMARKS6       VARCHAR2(1)';
			W_SQL := W_SQL || ',PREFECTURE_ROMAN   VARCHAR2(40)';
			W_SQL := W_SQL || ',MUNICIPALITY_ROMAN   VARCHAR2(200)';
			W_SQL := W_SQL || ',AREA_NAME_ROMAN       VARCHAR2(200)';
		ELSIF P_MSTID = 12 THEN
			W_SQL := W_SQL || ',JMZNHSCD   CHAR(6)';
			W_SQL := W_SQL || ',NOHSKJME   VARCHAR2(40)';
			W_SQL := W_SQL || ',NOHSKKME   VARCHAR2(66)';
		ELSIF P_MSTID = 13 THEN
			W_SQL := W_SQL || ',GINKOCD    NUMBER(4)';
			W_SQL := W_SQL || ',SITENCD    NUMBER(3)';
			W_SQL := W_SQL || ',GINKOKME   VARCHAR2(90)';
			W_SQL := W_SQL || ',GINKOJME   VARCHAR2(400)';
			W_SQL := W_SQL || ',SITENKME   VARCHAR2(90)';
			W_SQL := W_SQL || ',SITENJME   VARCHAR2(400)';
		END IF;
		IF W_RIREKI = 1 THEN
			W_SQL := W_SQL || ',BEGIN_DAY DATE';
			W_SQL := W_SQL || ',END_DAY DATE';
		END IF;

		/* �\������ */
		IF (P_MSTID IN (1,7) AND W_YOBI = '2') OR P_MSTID = 8 THEN
			FOR C_001_REC IN C_001(W_MSTID) LOOP
				IF C_001_REC.ITEM_ID <= 200 THEN
					W_SQL := W_SQL || ',AUX_NUMBER' || TO_CHAR(C_001_REC.ITEM_ID-100,'FM00') || ' NUMBER(13,5)';
				ELSIF C_001_REC.ITEM_ID <= 300 THEN
					W_SQL := W_SQL || ',AUX_DATE' || TO_CHAR(C_001_REC.ITEM_ID-200,'FM00') || ' DATE';
				ELSIF C_001_REC.ITEM_ID <= 400 THEN
					W_SQL := W_SQL || ',AUX_CHAR' || TO_CHAR(C_001_REC.ITEM_ID-300,'FM00') || ' VARCHAR2(200)';
				END IF;
			END LOOP;
		END IF;

		/* �}�b�s���O���� */
		IF P_MSTID IN (1,2,3,7) THEN
			FOR C_011_REC IN C_011(P_KAISYA,W_MSTID) LOOP
				W_SQL := W_SQL || ',MAP_' || C_011_REC.KAISYA_DIV || '_' ||  C_011_REC.MAPPING_ID;
				IF C_011_REC.DATA_TYPE_DIV = '1' THEN
					W_SQL := W_SQL || ' NUMBER(13,5)';
				ELSIF C_011_REC.DATA_TYPE_DIV = '2' THEN
					W_SQL := W_SQL || ' VARCHAR2(1000)';
				ELSIF C_011_REC.DATA_TYPE_DIV = '3' THEN
					W_SQL := W_SQL || ' DATE';
				ELSIF C_011_REC.DATA_TYPE_DIV = '4' THEN
					W_SQL := W_SQL || ' VARCHAR2(10)';
				END IF;
			END LOOP;
		END IF;
		W_SQL := W_SQL || ')';
		W_SQL := W_SQL || ' PCTFREE 10';
		W_SQL := W_SQL || ' PCTUSED 80';
		IF W_WKTBSP IS NOT NULL THEN
			W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' '; 
		END IF;
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);

		/* TDE */
		WEB_SP0003230_S('WEB_SP0110030_S',43,W_TABLE1,P_RID,P_ERR);
		IF P_ERR <> 0 THEN
			GOTO L_EXIT;
		END IF;

	END IF;

/**********************************************************************/
/* �`�F�b�N����                                                       */
/**********************************************************************/
	IF P_SKBN = 2 OR (P_SKBN=5 AND P_WKKBN=1) OR P_SKBN = 6 THEN

	/**********************************************************************/
	/* �g�D�l��(��ЃR�[�h�E�����R�[�h�����僉���N�E����R�[�h�ϊ�����)   */
	/**********************************************************************/
		IF P_MSTID = 8 THEN
			SELECT MAX(AGE_NUMBER) INTO W_SEDAI
			  FROM DEPT_AGE_CONTROL_TBL
			WHERE KAISYACD = P_KAISYA
			AND FIX_FLAG = '1'
			AND VALID_DATE <= TO_DATE(P_YOBI,'YYYY/MM/DD')
			;
			W_SQL := 'UPDATE ' || W_TABLE1 || ' A SET';
			W_SQL := W_SQL || ' (A.RANK,A.CODE_VALUE)=(';
			W_SQL := W_SQL || ' SELECT B.RANK,B.CODE_VALUE';
			W_SQL := W_SQL || '   FROM (SELECT B1.AGE_NUMBER,B1.RANK,B1.CODE_VALUE,B1.SALARY_BELONG_CODE';
			W_SQL := W_SQL || '           FROM DEPT_MS_DISP_ORDER B1';
			W_SQL := W_SQL || '               ,DEPT_MS B2';
			W_SQL := W_SQL || '  WHERE B1.KAISYACD = :ORA_1';
			W_SQL := W_SQL || '    AND B1.AGE_NUMBER = ' || W_SEDAI;
			W_SQL := W_SQL || '    AND B1.KAISYACD=B2.KAISYACD';
			W_SQL := W_SQL || '    AND B1.RANK=B2.RANK';
			W_SQL := W_SQL || '    AND B1.CODE_VALUE=B2.CODE_VALUE) B';
			W_SQL := W_SQL || '  WHERE B.SALARY_BELONG_CODE=A.BELONG_CODE)';
			W_SQL := W_SQL || ' WHERE A.RANK IS NULL';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;

	/**********************************************************************/
	/* �C���f�b�N�X�쐬                                                   */
	/**********************************************************************/
		IF (P_SKBN = 2 OR P_SKBN = 6) THEN
			/* �h�c�ɑ΂��� */
			W_SQL := 'CREATE INDEX ' || W_INDEX1 || ' ON ' || W_TABLE1;
			W_SQL :=  W_SQL || '(IDENTIFIER)'; 
			W_SQL :=  W_SQL || ' PCTFREE 5'; 
			IF W_WKTBSP IS NOT NULL THEN
				W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' '; 
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			
			IF P_MSTID <> 11 THEN
				/* �L�[���ڂɑ΂��� */
				W_SQL := 'CREATE INDEX ' || W_INDEX2 || ' ON ' || W_TABLE1;
				W_SQL :=  W_SQL || '(' || W_KEYINF || ')';
				W_SQL :=  W_SQL || ' PCTFREE 5';
				IF W_WKTBSP IS NOT NULL THEN
					W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' '; 
				END IF;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
		END IF;

	/**********************************************************************/
	/* �L�[���ݒ�                                                         */
	/**********************************************************************/
		IF P_MSTID = 8 THEN
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=5';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND (RANK IS NULL OR CODE_VALUE IS NULL)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;

		IF P_MSTID <> 11 THEN
		/**********************************************************************/
		/* �L�[�d��(�捞��)                                                   */
		/**********************************************************************/
			IF P_SKBN = 2 OR P_SKBN = 6 THEN
			/**********************************************************************/
			/* �����폜�Ȃ�                                                       */
			/**********************************************************************/
				IF P_UNIQUE = '1' THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=2';
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
					W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
					W_SQL := W_SQL || '    FROM ' || W_TABLE1;
					IF P_MSTID = 13 THEN
						W_SQL := W_SQL || '   WHERE SITENCD IS NOT NULL';
					END IF;
					W_SQL := W_SQL || '   HAVING COUNT(*) > 1';
					W_SQL := W_SQL || '   GROUP BY ' || W_KEYINF || ')';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/**********************************************************************/
			/* �����폜����                                                       */
			/**********************************************************************/
				ELSE
					LOOP
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=8';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND (' || W_KEYINF || ',IDENTIFIER) IN (';
						W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
						IF P_UNIQUE = '2' THEN
							W_SQL := W_SQL || ',MAX(IDENTIFIER)';
						ELSE
							W_SQL := W_SQL || ',MIN(IDENTIFIER)';
						END IF;
						W_SQL := W_SQL || '    FROM ' || W_TABLE1;
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						IF P_MSTID = 13 THEN
							W_SQL := W_SQL || '   WHERE SITENCD IS NOT NULL';
						END IF;
						W_SQL := W_SQL || '   HAVING COUNT(*) > 1';
						W_SQL := W_SQL || '   GROUP BY ' || W_KEYINF || ')';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						IF W_RVL = 0 THEN
							EXIT;
						END IF;
					END LOOP;
				END IF;
			ELSE
				/* �G���[��Ԃ��N���A */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
				W_SQL := W_SQL || ' WHERE IDENTIFIER = 0';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'SELECT COUNT(*) COEFFICIENT';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER > 0';
				W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
				W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
				W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				W_SQL := W_SQL || '    FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER = 0)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP 
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
						IF W_DATA1 > 0 THEN
							P_ERR := 1;
						END IF;
						EXIT;
					END IF;
				END LOOP;
				IF P_ERR = 1 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=2';
					W_SQL := W_SQL || ' WHERE IDENTIFIER = 0';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

		/**********************************************************************/
		/* �L�[�d��(�����f�[�^)                                               */
		/**********************************************************************/
			IF P_UPDKBN = 1 AND P_MSTID <> 11 THEN
				IF P_SKBN = 2 OR P_SKBN = 6 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=3';
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
					W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
					W_SQL := W_SQL || '    FROM ' || W_TABLE2;
					IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
						W_SQL := W_SQL || '  WHERE KAISYACD = :ORA_1';
					END IF;
					W_SQL := W_SQL || ')';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					/* ��s�{�x�X(�S�⋦) */
					IF P_MSTID = 13 THEN
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=3';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND (' || W_KEYINF2 || ') IN (';
						W_SQL := W_SQL || '  SELECT ' || W_KEYINF2;
						W_SQL := W_SQL || '    FROM ' || W_TABLE3 || ')';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				ELSIF P_SKBN = 5 THEN
					IF P_ERR = 0 THEN
						W_SQL := 'SELECT COUNT(*) COEFFICIENT';
						W_SQL := W_SQL || ' FROM ' || W_TABLE2;
						W_SQL := W_SQL || ' WHERE (' || W_KEYINF || ') IN (';
						W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
						W_SQL := W_SQL || '    FROM ' || W_TABLE1;
						W_SQL := W_SQL || '   WHERE IDENTIFIER = 0)';
						IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
							--W_SQL := W_SQL || ' WHERE ��ЃR�[�h = :ORA_1';
							W_SQL := W_SQL || ' AND KAISYACD = :ORA_1';
						END IF;
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
						END IF;
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
						IF W_DATA1 > 0 THEN
							P_ERR := 1;
						END IF;
						IF P_ERR = 1 THEN
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=3';
							W_SQL := W_SQL || ' WHERE IDENTIFIER = 0';
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						END IF;
						/* ��s�{�x�X(�S�⋦) */
						IF P_MSTID = 13 THEN
							W_SQL := 'SELECT COUNT(*) COEFFICIENT';
							W_SQL := W_SQL || ' FROM ' || W_TABLE3;
							W_SQL := W_SQL || ' WHERE (' || W_KEYINF2 || ') IN (';
							W_SQL := W_SQL || '  SELECT ' || W_KEYINF2;
							W_SQL := W_SQL || '    FROM ' || W_TABLE1;
							W_SQL := W_SQL || '   WHERE IDENTIFIER = 0)';
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
							W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
							IF W_DATA1 > 0 THEN
								P_ERR := 1;
							END IF;
							IF P_ERR = 1 THEN
								W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=3';
								W_SQL := W_SQL || ' WHERE IDENTIFIER = 0';
								DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
								W_RVL := DBMS_SQL.EXECUTE(W_CSR);
							END IF;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;

	/**********************************************************************/
	/* ���������ԏd��                                                     */
	/**********************************************************************/
		W_CHKFLG := 1;
		IF W_RIREKI = 1 THEN
			-- �Ώ۔��f
			IF P_SKBN IN (2,6) THEN		/* �񗚗���=0�� */
				IF P_MSTID = 1 THEN
					IF P_MSTKBN NOT IN ('11','30','32','33','S7','SL') THEN
						W_CHKFLG := 0;
					END IF;
				ELSIF P_MSTID NOT IN (2,3,7) THEN
					W_CHKFLG := 0;
				END IF;
			ELSIF P_SKBN = 5 THEN		/* �񗚗���=0 ������=2�� */
				IF P_MSTID = 1 THEN
					IF P_MSTKBN NOT IN ('11','30','32','33','S7','SL') THEN
						W_CHKFLG := 0;
					ELSE
						W_CHKFLG := 2;
					END IF;
				ELSIF P_MSTID IN (2,3,7) THEN
					W_CHKFLG := 2;
				ELSE
					W_CHKFLG := 0;
				END IF;
			ELSE
				W_CHKFLG := 0;
			END IF;

			IF W_CHKFLG = 1 THEN
				W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* �h�c*/
				IF W_MSTID = 200 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* �E���R�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* ���� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
				ELSIF W_MSTID = 201 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* ���� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* �I���� */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* �}�X�^�敪�R�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* �R�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* �h�c */
						IF W_MSTID = 200 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* �E���R�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* ���� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
						ELSIF W_MSTID = 201 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* ���� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* �I���� */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* �}�X�^�敪�R�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �R�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
						END IF;
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=6';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER = (';
						W_SQL := W_SQL || ' SELECT ' || W_KDATA1 || ' FROM ' || W_TABLE1;
						W_SQL := W_SQL || '  WHERE BEGIN_DAY <= :ORA_0';
						W_SQL := W_SQL || '    AND NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_1';
						--W_SQL := W_SQL || '    AND �I���� >= :ORA_1';
						IF W_MSTID = 200 THEN
							W_SQL := W_SQL || '    AND GRADE_CODE = ''' || W_KDATA3 || '''';
							W_SQL := W_SQL || '    AND GRADE = ' || W_KDATA6; 
						ELSIF W_MSTID = 201 THEN
							W_SQL := W_SQL || '    AND GRADE = ' || W_KDATA6; 
						ELSIF P_MSTID = 7 THEN
							W_SQL := W_SQL || '    AND MASTER_DIV = ''' || W_KDATA2 || '''';
							W_SQL := W_SQL || '    AND CODE_VALUE = ''' || W_KDATA3 || '''';
						ELSE
							W_SQL := W_SQL || '    AND MASTER_DIV_CODE = ''' || W_KDATA2 || '''';
							W_SQL := W_SQL || '    AND CODE_VALUE = ''' || W_KDATA3 || '''';
						END IF;
						W_SQL := W_SQL || ' AND ERROR IS NULL';
						W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
						W_SQL := W_SQL || '  GROUP BY ' || W_GRPINF || ')';
						DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA5);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA4);
						W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
					ELSE
						EXIT;
					END IF;
				END LOOP;
				/* �G���[6�`�F�b�N */
				W_SQL := 'SELECT COUNT(*) COEFFICIENT';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE ERROR = 6';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
				IF W_DATA1 > 0 THEN
					P_ERR := 6;
				END IF;
			ELSIF W_CHKFLG = 2 THEN
				W_SQL := 'SELECT COUNT(*)';
				W_SQL := W_SQL || '   FROM ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || '      , ' || W_TABLE1 || ' B';
				W_SQL := W_SQL || '  WHERE A.IDENTIFIER = 0';
				W_SQL := W_SQL || '    AND B.IDENTIFIER <> 0';
				W_SQL := W_SQL || '    AND B.IDENTIFIER <> ' || P_SID;
				W_SQL := W_SQL || '    AND B.DELETE_DIV IS NULL';
				W_SQL := W_SQL || '    AND ((A.BEGIN_DAY >= B.BEGIN_DAY';
				W_SQL := W_SQL || '    AND  A.BEGIN_DAY <= NVL(B.END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
				W_SQL := W_SQL || '     OR (NVL(A.END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= B.BEGIN_DAY';
				W_SQL := W_SQL || '    AND  NVL(A.END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) <= NVL(B.END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
				W_SQL := W_SQL || '     OR (A.BEGIN_DAY <= B.BEGIN_DAY';
				W_SQL := W_SQL || '    AND  NVL(A.END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= NVL(B.END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))))';
				IF W_MSTID = 200 THEN
					W_SQL := W_SQL || '    AND A.GRADE_CODE = B.GRADE_CODE';
					W_SQL := W_SQL || '    AND A.GRADE = B.GRADE';
				ELSIF W_MSTID = 201 THEN
					W_SQL := W_SQL || '    AND A.GRADE = B.GRADE';
				ELSIF P_MSTID = 7 THEN
					W_SQL := W_SQL || '    AND A.MASTER_DIV = B.MASTER_DIV';
					W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE';
				ELSE
					W_SQL := W_SQL || '    AND A.MASTER_DIV_CODE = B.MASTER_DIV_CODE';
					W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE';
				END IF;
				DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_CNT);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR2);
				DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_CNT);

				IF W_CNT > 0 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=6';
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER = 0';
					DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR2);

					P_ERR := 6;
				ELSE
					/* �G���[��Ԃ��N���A */
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
					W_SQL := W_SQL || ' WHERE ERROR = 6';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					/* �ύX�ɂ�鑼�̏��d������ */
					W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE IDENTIFIER <> 0';
					W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
					W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* �h�c*/
					IF W_MSTID = 200 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* �E���R�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* ���� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
					ELSIF W_MSTID = 201 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* ���� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* �I���� */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* �}�X�^�敪�R�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* �R�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* �h�c */
							IF W_MSTID = 200 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* �E���R�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* ���� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
							ELSIF W_MSTID = 201 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* ���� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* �I���� */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* �}�X�^�敪�R�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �R�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
							END IF;
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=6';
							W_SQL := W_SQL || ' WHERE ERROR IS NULL';
							W_SQL := W_SQL || '   AND IDENTIFIER = (';
							W_SQL := W_SQL || ' SELECT ' || W_KDATA1 || ' FROM ' || W_TABLE1;
							W_SQL := W_SQL || '  WHERE IDENTIFIER <> ' || P_SID;
							W_SQL := W_SQL || '    AND DELETE_DIV IS NULL';
							W_SQL := W_SQL || '    AND ((BEGIN_DAY >= :ORA_0';
							W_SQL := W_SQL || '    AND  BEGIN_DAY <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
							W_SQL := W_SQL || '     OR (NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_0';
							W_SQL := W_SQL || '    AND  NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
							W_SQL := W_SQL || '     OR (BEGIN_DAY <= :ORA_0';
							W_SQL := W_SQL || '    AND  NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))))';

							IF W_MSTID = 200 THEN
								W_SQL := W_SQL || '    AND GRADE_CODE = ''' || W_KDATA3 || '''';
								W_SQL := W_SQL || '    AND GRADE = ' || W_KDATA6; 
							ELSIF W_MSTID = 201 THEN
								W_SQL := W_SQL || '    AND GRADE = ' || W_KDATA6; 
							ELSIF P_MSTID = 7 THEN
								W_SQL := W_SQL || '    AND MASTER_DIV = ''' || W_KDATA2 || '''';
								W_SQL := W_SQL || '    AND CODE_VALUE = ''' || W_KDATA3 || ''''; 
							ELSE
								W_SQL := W_SQL || '    AND MASTER_DIV_CODE = ''' || W_KDATA2 || '''';
								W_SQL := W_SQL || '    AND CODE_VALUE = ''' || W_KDATA3 || ''''; 
							END IF;
							W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
							W_SQL := W_SQL || '  GROUP BY ' || W_GRPINF || ')';
							DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA4);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA5);
							W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
						ELSE
							EXIT;
						END IF;
					END LOOP;
				END IF;
			END IF;
		END IF;

	/**********************************************************************/
	/* ���������ԏd��(�����f�[�^)                                         */
	/**********************************************************************/
		W_CHKFLG := 1;
		IF W_RIREKI = 1 THEN
			-- �Ώ۔��f
			IF P_UPDKBN IN (1,2) THEN
				IF P_SKBN IN (2,6) THEN		/* �񗚗���=0�� */
					IF P_MSTID = 1 THEN
						IF P_MSTKBN NOT IN ('11','30','32','33','S7','SL') THEN
							W_CHKFLG := 0;
						END IF;
					ELSIF P_MSTID NOT IN (2,3,7) THEN
						W_CHKFLG := 0;
					END IF;
				ELSIF P_SKBN = 5 THEN		/* �񗚗���=0 ������=2�� */
					IF P_MSTID = 1 THEN
						IF P_MSTKBN NOT IN ('11','30','32','33','S7','SL') THEN
							W_CHKFLG := 0;
						ELSE
							W_CHKFLG := 2;
						END IF;
					ELSIF P_MSTID IN (2,3,7) THEN
						W_CHKFLG := 2;
					ELSE
						W_CHKFLG := 0;
					END IF;
				ELSE
					W_CHKFLG := 0;
				END IF;
			ELSE
				W_CHKFLG := 0;
			END IF;

			IF W_CHKFLG = 1 THEN
				W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* �h�c*/
				IF W_MSTID = 200 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* �E���R�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* ���� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
				ELSIF W_MSTID = 201 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* ���� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* �I���� */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* �}�X�^�敪�R�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* �R�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* �h�c */
						IF W_MSTID = 200 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* �E���R�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* ���� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
						ELSIF W_MSTID = 201 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* ���� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* �I���� */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* �}�X�^�敪�R�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �R�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
						END IF;
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=7';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER = (';
						W_SQL := W_SQL || ' SELECT ' || W_KDATA1;
						W_SQL := W_SQL || '   FROM ' || W_TABLE2 || ' A';
						W_SQL := W_SQL || '      , ' || W_TABLE1 || ' B';
						W_SQL := W_SQL || '  WHERE A.KAISYACD = :ORA_2';
						W_SQL := W_SQL || '    AND ((A.BEGIN_DAY > :ORA_0';
						W_SQL := W_SQL || '    AND  A.BEGIN_DAY <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
						W_SQL := W_SQL || '     OR (NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_0';
						W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
						W_SQL := W_SQL || '     OR (A.BEGIN_DAY < :ORA_0';
						W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))))';
						IF P_UPDKBN = '2' THEN
							W_SQL := W_SQL || '    AND A.BEGIN_DAY <> :ORA_0';
						END IF;
						IF W_MSTID = 200 THEN
							W_SQL := W_SQL || '    AND A.GRADE_CODE = ''' || W_KDATA3 || '''';
							W_SQL := W_SQL || '    AND A.GRADE = ' || W_KDATA6; 
						ELSIF W_MSTID = 201 THEN
							W_SQL := W_SQL || '    AND A.GRADE = ' || W_KDATA6; 
						ELSIF P_MSTID = 7 THEN
							W_SQL := W_SQL || '    AND A.MASTER_DIV = ''' || W_KDATA2 || '''';
							W_SQL := W_SQL || '    AND A.CODE_VALUE = ''' || W_KDATA3 || ''''; 
						ELSE
							W_SQL := W_SQL || '    AND A.MASTER_DIV_CODE = ''' || W_KDATA2 || '''';
							W_SQL := W_SQL || '    AND A.CODE_VALUE = ''' || W_KDATA3 || ''''; 
						END IF;
						W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> 0';
						W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> ' || W_KDATA1;
						W_SQL := W_SQL || '    AND B.DELETE_DIV(+) IS NULL';
						W_SQL := W_SQL || '    AND B.ERROR(+) IS NULL';
						W_SQL := W_SQL || '    AND A.BEGIN_DAY = B.BEGIN_DAY(+)';
						IF W_MSTID = 200 THEN
							W_SQL := W_SQL || '    AND A.GRADE_CODE = B.GRADE_CODE(+)';
							W_SQL := W_SQL || '    AND A.GRADE = B.GRADE(+)'; 
						ELSIF W_MSTID = 201 THEN
							W_SQL := W_SQL || '    AND A.GRADE = B.GRADE(+)'; 
						ELSIF P_MSTID = 7 THEN
							W_SQL := W_SQL || '    AND A.MASTER_DIV = B.MASTER_DIV(+)';
							W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE(+)'; 
						ELSE
							W_SQL := W_SQL || '    AND A.MASTER_DIV_CODE = B.MASTER_DIV_CODE(+)';
							W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE(+)'; 
						END IF;

						W_SQL := W_SQL || ' HAVING COUNT(*) > 0';
						W_SQL := W_SQL || '  GROUP BY ';
						IF W_MSTID = 200 THEN
							W_SQL := W_SQL || ' A.GRADE_CODE,A.GRADE)'; 
						ELSIF W_MSTID = 201 THEN
							W_SQL := W_SQL || ' A.GRADE)'; 
						ELSIF P_MSTID = 7 THEN
							W_SQL := W_SQL || ' A.MASTER_DIV,A.CODE_VALUE)'; 
						ELSE
							W_SQL := W_SQL || ' A.MASTER_DIV_CODE,A.CODE_VALUE)'; 
						END IF;

						DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA4);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA5);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',P_KAISYA);
						W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
					ELSE
						EXIT;
					END IF;
				END LOOP;
				/* �G���[7�`�F�b�N */
				W_SQL := 'SELECT COUNT(*) COEFFICIENT';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE ERROR = 7';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
				IF W_DATA1 > 0 THEN
					P_ERR := 7;
				END IF;
			ELSIF W_CHKFLG = 2 THEN
				W_SQL := 'SELECT COUNT(*)';
				W_SQL := W_SQL || '   FROM ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || '      , ' || W_TABLE2 || ' B';
				W_SQL := W_SQL || '      , ' || W_TABLE1 || ' C';
				W_SQL := W_SQL || '  WHERE A.IDENTIFIER = 0';
				IF P_UPDKBN = '2' THEN
					W_SQL := W_SQL || '    AND A.BEGIN_DAY <> B.BEGIN_DAY';
				END IF;
				W_SQL := W_SQL || '    AND ((A.BEGIN_DAY > B.BEGIN_DAY';
				W_SQL := W_SQL || '    AND  A.BEGIN_DAY <= NVL(NVL(C.END_DAY,B.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
				W_SQL := W_SQL || '     OR (NVL(A.END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= B.BEGIN_DAY';
				W_SQL := W_SQL || '    AND  NVL(A.END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) <= NVL(NVL(C.END_DAY,B.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
				W_SQL := W_SQL || '     OR (A.BEGIN_DAY < B.BEGIN_DAY';
				W_SQL := W_SQL || '    AND  NVL(A.END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= NVL(NVL(C.END_DAY,B.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD''))))';
				IF W_MSTID = 200 THEN
					W_SQL := W_SQL || '    AND A.GRADE_CODE = B.GRADE_CODE';
					W_SQL := W_SQL || '    AND A.GRADE = B.GRADE';
				ELSIF W_MSTID = 201 THEN
					W_SQL := W_SQL || '    AND A.GRADE = B.GRADE';
				ELSIF P_MSTID = 7 THEN
					W_SQL := W_SQL || '    AND A.MASTER_DIV = B.MASTER_DIV';
					W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE';
				ELSE
					W_SQL := W_SQL || '    AND A.MASTER_DIV_CODE = B.MASTER_DIV_CODE';
					W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE';
				END IF;
				W_SQL := W_SQL || '    AND B.KAISYACD = ' || P_KAISYA;
				W_SQL := W_SQL || '    AND C.IDENTIFIER(+) <> 0';
				W_SQL := W_SQL || '    AND C.IDENTIFIER(+) <> ' || P_SID;
				W_SQL := W_SQL || '    AND C.DELETE_DIV(+) IS NULL';
				W_SQL := W_SQL || '    AND B.BEGIN_DAY = C.BEGIN_DAY(+)';
				IF W_MSTID = 200 THEN
					W_SQL := W_SQL || '    AND B.GRADE_CODE = C.GRADE_CODE(+)';
					W_SQL := W_SQL || '    AND B.GRADE = C.GRADE(+)';
				ELSIF W_MSTID = 201 THEN
					W_SQL := W_SQL || '    AND B.GRADE = C.GRADE(+)';
				ELSIF P_MSTID = 7 THEN
					W_SQL := W_SQL || '    AND B.MASTER_DIV = C.MASTER_DIV(+)';
					W_SQL := W_SQL || '    AND B.CODE_VALUE = C.CODE_VALUE(+)';
				ELSE
					W_SQL := W_SQL || '    AND B.MASTER_DIV_CODE = C.MASTER_DIV_CODE(+)';
					W_SQL := W_SQL || '    AND B.CODE_VALUE = C.CODE_VALUE(+)';
				END IF;

				DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_CNT);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR2);
				DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_CNT);

				IF W_CNT > 0 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=7';
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER = 0';
					DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR2);

					P_ERR := 7;
				ELSE
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
					W_SQL := W_SQL || ' WHERE ERROR = 7';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE IDENTIFIER <> 0';
					W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
					W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* �h�c*/
					IF W_MSTID = 200 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* �E���R�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* ���� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
					ELSIF W_MSTID = 201 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* ���� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* �I���� */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* �}�X�^�敪�R�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* �R�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* �h�c */
							IF W_MSTID = 200 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* �E���R�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* ���� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
							ELSIF W_MSTID = 201 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* ���� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* �I���� */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* �}�X�^�敪�R�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �R�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
							END IF;
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=7';
							W_SQL := W_SQL || ' WHERE ERROR IS NULL';
							W_SQL := W_SQL || '   AND IDENTIFIER = (';
							W_SQL := W_SQL || ' SELECT ' || W_KDATA1;
							W_SQL := W_SQL || '   FROM ' || W_TABLE2 || ' A';
							W_SQL := W_SQL || '      , ' || W_TABLE1 || ' B';
							W_SQL := W_SQL || '  WHERE A.KAISYACD = :ORA_2';
							W_SQL := W_SQL || '    AND ((A.BEGIN_DAY > :ORA_0';
							W_SQL := W_SQL || '    AND  A.BEGIN_DAY <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
							W_SQL := W_SQL || '     OR (NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_0';
							W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
							W_SQL := W_SQL || '     OR (A.BEGIN_DAY < :ORA_0';
							W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))))';
							W_SQL := W_SQL || '    AND A.BEGIN_DAY <> :ORA_0';
							IF W_MSTID = 200 THEN
								W_SQL := W_SQL || '    AND A.GRADE_CODE = ''' || W_KDATA3 || '''';
								W_SQL := W_SQL || '    AND A.GRADE = ' || W_KDATA6; 
							ELSIF W_MSTID = 201 THEN
								W_SQL := W_SQL || '    AND A.GRADE = ' || W_KDATA6; 
							ELSIF P_MSTID = 7 THEN
								W_SQL := W_SQL || '    AND A.MASTER_DIV = ''' || W_KDATA2 || '''';
								W_SQL := W_SQL || '    AND A.CODE_VALUE = ''' || W_KDATA3 || ''''; 
							ELSE
								W_SQL := W_SQL || '    AND A.MASTER_DIV_CODE = ''' || W_KDATA2 || '''';
								W_SQL := W_SQL || '    AND A.CODE_VALUE = ''' || W_KDATA3 || ''''; 
							END IF;
							W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> ' || P_SID;
							W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> ' || W_KDATA1;
							W_SQL := W_SQL || '    AND B.DELETE_DIV(+) IS NULL';
							W_SQL := W_SQL || '    AND B.ERROR(+) IS NULL';
							W_SQL := W_SQL || '    AND A.BEGIN_DAY = B.BEGIN_DAY(+)';
							IF W_MSTID = 200 THEN
								W_SQL := W_SQL || '    AND A.GRADE_CODE = B.GRADE_CODE(+)';
								W_SQL := W_SQL || '    AND A.GRADE = B.GRADE(+)'; 
							ELSIF W_MSTID = 201 THEN
								W_SQL := W_SQL || '    AND A.GRADE = B.GRADE(+)'; 
							ELSIF P_MSTID = 7 THEN
								W_SQL := W_SQL || '    AND A.MASTER_DIV = B.MASTER_DIV(+)';
								W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE(+)'; 
							ELSE
								W_SQL := W_SQL || '    AND A.MASTER_DIV_CODE = B.MASTER_DIV_CODE(+)';
								W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE(+)'; 
							END IF;

							W_SQL := W_SQL || ' HAVING COUNT(*) > 0';
							W_SQL := W_SQL || '  GROUP BY ';
							IF W_MSTID = 200 THEN
								W_SQL := W_SQL || ' A.GRADE_CODE,A.GRADE)'; 
							ELSIF W_MSTID = 201 THEN
								W_SQL := W_SQL || ' A.GRADE)'; 
							ELSIF P_MSTID = 7 THEN
								W_SQL := W_SQL || ' A.MASTER_DIV,A.CODE_VALUE)'; 
							ELSE
								W_SQL := W_SQL || ' A.MASTER_DIV_CODE,A.CODE_VALUE)'; 
							END IF;

							DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA4);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA5);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',P_KAISYA);
							W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
						ELSE
							EXIT;
						END IF;
					END LOOP;
				END IF;
			END IF;
		END IF;

	/**********************************************************************/
	/* �捞�s����(���̃}�X�^�̂�)                                       */
	/**********************************************************************/
		IF (P_SKBN = 2 OR P_SKBN = 5 OR P_SKBN = 6) AND P_MSTID = 1 THEN
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=4';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND (MASTER_DIV_CODE,CODE_VALUE) IN (';
			W_SQL := W_SQL || '  SELECT MASTER_DIV_CODE,CODE_VALUE';
			W_SQL := W_SQL || '    FROM WEB_TP0110020_M)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;

	/**********************************************************************/
	/* �}�X�^���݊m�F                                                     */
	/**********************************************************************/
		IF P_SKBN = 2 OR P_SKBN = 6 THEN
			/* ���̃}�X�^ */
			IF P_MSTID = 1 THEN
				IF P_MSTKBN = '9c' THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=20';
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND TEXT3 NOT IN (';
					W_SQL := W_SQL || '  SELECT CODE_VALUE FROM V_M_SCHOOL_DIV';
					W_SQL := W_SQL || '   WHERE KAISYACD = :ORA_1)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

			/* �E�\������ */
			IF P_MSTID = 2 THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=12';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND GRADE_CODE NOT IN (';
				IF WEB_SP0002420_F(1,17) = 0 THEN
					W_SQL := W_SQL || '  SELECT CODE_VALUE FROM V_M_JOB_GRADE';
				ELSE
					W_SQL := W_SQL || '  SELECT CODE_VALUE FROM (' || WEB_SP0002430_F(2,1,17,'') || ')';
				END IF;
				W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
			/* ��s�x�X */
			IF P_MSTID = 5 THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=11';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND GINKOCD NOT IN (';
				W_SQL := W_SQL || '  SELECT GINKOCD FROM GINKO_MS)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
			/* �g�D�l�� */
			IF P_MSTID = 8 THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=13';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND (RANK,CODE_VALUE) NOT IN (';
				W_SQL := W_SQL || '  SELECT RANK,CODE_VALUE FROM DEPT_MS_DISP_ORDER';
				W_SQL := W_SQL || '   WHERE KAISYACD = :ORA_1';
				W_SQL := W_SQL || '     AND AGE_NUMBER = ' || W_SEDAI || ')';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;

			/* �\������ */
			IF (P_MSTID IN (1,7) AND W_YOBI = '2') OR P_MSTID = 8 THEN
				FOR C_001_REC IN C_001(W_MSTID) LOOP
					IF C_001_REC.ITEM_ID > 300 AND C_001_REC.REFERENCE_DIV = '1' OR C_001_REC.REFERENCE_DIV = '2' OR C_001_REC.REFERENCE_DIV = '3' THEN
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (100 + C_001_REC.ITEM_ID - 300);
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER IN (';
						W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
						W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';

						IF C_001_REC.REFERENCE_DIV='1' OR C_001_REC.REFERENCE_DIV='3' THEN
							IF WEB_SP0002420_F(1,C_001_REC.MASTER_ID) = 0 THEN
								W_SQL := W_SQL || ',' || C_001_REC.MASTER_NAME || ' B';
							ELSE
								W_SQL := W_SQL || ',(' || WEB_SP0002430_F(2,1,C_001_REC.MASTER_ID,'') || ') B';
							END IF;
							W_SQL := W_SQL || ' WHERE ';
							IF W_KFLG = '1' THEN
								IF C_001_REC.CORP_DIV = 1 THEN
									W_SQL := W_SQL || ' B.KAISYACD(+) = :ORA_1 AND';
								ELSIF C_001_REC.CORP_DIV = 2 THEN
									W_SQL := W_SQL || ' B.KAISYACD(+) = :ORA_1 AND';
								END IF;
							END IF;
						ELSE
							W_SQL := W_SQL || ' WHERE ';
						END IF;

						IF P_SKBN = 5 THEN
							W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
						END IF;
						W_SQL := W_SQL || '       A.' || C_001_REC.ITEM_NAME || ' IS NOT NULL';

						IF C_001_REC.REFERENCE_DIV='1' THEN
							IF C_001_REC.DATA_TYPE = 'VARCHAR2' OR C_001_REC.DATA_TYPE = 'CHAR' THEN
								W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '=TO_CHAR(B.' || C_001_REC.MASTER_CODE_ITEM || '(+))';
							ELSE
								W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '=B.' || C_001_REC.MASTER_CODE_ITEM || '(+)';
							END IF;
							W_SQL := W_SQL || '   AND B.' || C_001_REC.MASTER_CODE_ITEM || ' IS NULL)';
						ELSIF C_001_REC.REFERENCE_DIV='2' THEN
							W_SQL := W_SQL || '   AND DECODE(A.' || C_001_REC.ITEM_NAME || ',' || C_001_REC.LITERAL_CONTENT || ') IS NULL)';
						END IF;
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						IF C_001_REC.REFERENCE_DIV='1' OR C_001_REC.REFERENCE_DIV='3' THEN
							IF W_KFLG = '1' AND C_001_REC.CORP_DIV IN (1,2) THEN
								DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
							END IF;
						END IF;
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				END LOOP;
			END IF;

			/* �}�b�s���O���� */
			IF P_MSTID IN (1,2,3,7) THEN
				FOR C_011_REC IN C_011(P_KAISYA,W_MSTID) LOOP
					IF C_011_REC.DATA_TYPE_DIV = '4' THEN
						W_MAPFI := 'MAP_' || C_011_REC.KAISYA_DIV || '_' ||  C_011_REC.MAPPING_ID;
					
						IF C_011_REC.KAISYA_DIV = '0' THEN
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (1000 + C_011_REC.MAPPING_ID);
						ELSIF C_011_REC.KAISYA_DIV = '1' THEN
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (2000 + C_011_REC.MAPPING_ID);
						END IF;
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER IN (';
						W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
						W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A,';
						W_SQL := W_SQL || '       WEB_TP0110430_M B';
						W_SQL := W_SQL || ' WHERE 1=1';
						IF P_SKBN = 5 THEN
							W_SQL := W_SQL || ' AND A.IDENTIFIER=0 AND';
						END IF;
						W_SQL := W_SQL || ' AND A.' || W_MAPFI || ' IS NOT NULL';
						W_SQL := W_SQL || ' AND B.KAISYACD(+)  = :ORA_KAISYA';
						W_SQL := W_SQL || ' AND B.MASTER_ID(+) = :ORA_MASTER_ID';
						W_SQL := W_SQL || ' AND B.MAPPING_ID(+)= :ORA_MAPPING_ID';
						W_SQL := W_SQL || ' AND A.' || W_MAPFI || ' = B.CODE_ITEM(+)';
						W_SQL := W_SQL || ' AND B.CODE_ITEM IS NULL)';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA'    ,C_011_REC.KAISYACD);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MASTER_ID' ,W_MSTID);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MAPPING_ID',C_011_REC.MAPPING_ID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				END LOOP;
			END IF;

			/* ��s�{�x�X(�S�⋦) */
			IF P_MSTID = 13 THEN
				/* 14:�x�X�R�[�hNULL */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=14';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND SITENCD IS NULL';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				/* 15:��s������30���ȏ� */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=15';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND LENGTHB(CONVERT(GINKOJME,''JA16SJISTILDE'')) > 30';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				/* 16:�x�X������30���ȏ� */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=16';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND LENGTHB(CONVERT(SITENJME,''JA16SJISTILDE'')) > 30';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				/* 17:��s���J�i���ꕶ���g�p�A18:�x�X���J�i���ꕶ���g�p */
				W_RTN := FNCL_ZENBANK_CHK();
				/* 19:��s�R�[�h����ŋ�s���������Ⴄ */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A SET ERROR=19';
				W_SQL := W_SQL || ' WHERE (A.IDENTIFIER) IN';
				W_SQL := W_SQL || ' (SELECT B.IDENTIFIER FROM ' || W_TABLE1 || ' B';
				W_SQL := W_SQL || ' WHERE B.GINKOCD IN (SELECT C.GINKOCD FROM ' || W_TABLE1 || ' C';
				W_SQL := W_SQL || ' WHERE B.GINKOCD = C.GINKOCD AND CMN_SJIS.SUBSTRB(B.GINKOJME,1,30) <> CMN_SJIS.SUBSTRB(C.GINKOJME,1,30)))';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				/* 20:��s�R�[�h����ŋ�s���������Ⴄ */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A SET ERROR=20';
				W_SQL := W_SQL || ' WHERE (A.IDENTIFIER) IN';
				W_SQL := W_SQL || ' (SELECT B.IDENTIFIER FROM ' || W_TABLE1 || ' B';
				W_SQL := W_SQL || ' WHERE B.GINKOCD IN (SELECT C.GINKOCD FROM ' || W_TABLE1 || ' C';
				W_SQL := W_SQL || ' WHERE B.GINKOCD = C.GINKOCD AND CMN_SJIS.SUBSTRB(B.GINKOKME,1,30) <> CMN_SJIS.SUBSTRB(C.GINKOKME,1,30)))';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
		END IF;

	/**********************************************************************/
	/* �G���[���݊m�F                                                     */
	/**********************************************************************/
		IF P_MSTID <> 11 THEN
			W_SQL := 'SELECT COUNT(*) COEFFICIENT';
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE ';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' IDENTIFIER=0 AND';
			END IF;
			W_SQL := W_SQL || ' ERROR IS NOT NULL';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				IF W_RVL > 0 THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
					IF W_DATA1 > 0 THEN
						P_ERR := 1;
					END IF;
					EXIT;
				END IF;
			END LOOP;
		END IF;
	ELSIF P_SKBN = 5 AND (P_WKKBN = 2 OR P_WKKBN = 3) THEN

		W_CHKFLG := 0;
		-- �����Ǘ����f
		IF W_RIREKI = 1 THEN
			-- �Ώ۔��f
			IF P_MSTID = 1 THEN
				IF P_MSTKBN IN ('11','30','32','33','S7','SL') THEN
					W_CHKFLG := 1;
				END IF;
			ELSIF P_MSTID IN (2,3,7) THEN
				W_CHKFLG := 1;
			END IF;

			IF W_CHKFLG = 1 THEN
				W_SQL := 'SELECT COUNT(*) COEFFICIENT';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER<>' || P_SID;
				W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
				W_SQL := W_SQL || '   AND ERROR = 2';
				W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				W_SQL := W_SQL || '    FROM ' || W_TABLE1;
				W_SQL := W_SQL || '   WHERE IDENTIFIER = ' || P_SID || ')';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP 
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
						W_CNT := W_DATA1;
						EXIT;
					END IF;
				END LOOP;

				IF W_CNT = 1 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
					W_SQL := W_SQL || ' WHERE IDENTIFIER<>' || P_SID;
					W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
					W_SQL := W_SQL || '   AND ERROR = 2';
					W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
					W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
					W_SQL := W_SQL || '    FROM ' || W_TABLE1;
					W_SQL := W_SQL || '   WHERE IDENTIFIER = ' || P_SID || ')';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				/**********************************************************************/
				/* ���������ԏd��(�捞�f�[�^)                                         */
				/**********************************************************************/
				/* �G���[��Ԃ��N���A */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
				W_SQL := W_SQL || ' WHERE ERROR = 6';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �ύX�ɂ�鑼�̏��d������ */
				W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
				W_SQL := W_SQL || '  FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE DELETE_DIV IS NULL';
				W_SQL := W_SQL || '   AND IDENTIFIER <> 0';
				W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* �h�c*/
				IF W_MSTID = 200 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* �E���R�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* ���� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
				ELSIF W_MSTID = 201 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* ���� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* �I���� */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* �}�X�^�敪�R�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* �R�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* �h�c */
						IF W_MSTID = 200 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* �E���R�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* ���� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
						ELSIF W_MSTID = 201 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* ���� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* �I���� */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* �}�X�^�敪�R�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �R�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
						END IF;
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=6';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER = (';
						W_SQL := W_SQL || ' SELECT ' || W_KDATA1 || ' FROM ' || W_TABLE1;
						W_SQL := W_SQL || '  WHERE DELETE_DIV IS NULL';
						W_SQL := W_SQL || '    AND IDENTIFIER <> 0';
						W_SQL := W_SQL || '    AND IDENTIFIER <> ' || P_SID;
						W_SQL := W_SQL || '    AND ((BEGIN_DAY >= :ORA_0';
						W_SQL := W_SQL || '    AND  BEGIN_DAY <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
						W_SQL := W_SQL || '     OR (NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_0';
						W_SQL := W_SQL || '    AND  NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
						W_SQL := W_SQL || '     OR (BEGIN_DAY <= :ORA_0';
						W_SQL := W_SQL || '    AND  NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))))';

						IF W_MSTID = 200 THEN
							W_SQL := W_SQL || '    AND GRADE_CODE = ''' || W_KDATA3 || '''';
							W_SQL := W_SQL || '    AND GRADE = ' || W_KDATA6; 
						ELSIF W_MSTID = 201 THEN
							W_SQL := W_SQL || '    AND GRADE = ' || W_KDATA6; 
						ELSIF P_MSTID = 7 THEN
							W_SQL := W_SQL || '    AND MASTER_DIV = ''' || W_KDATA2 || '''';
							W_SQL := W_SQL || '    AND CODE_VALUE = ''' || W_KDATA3 || ''''; 
						ELSE
							W_SQL := W_SQL || '    AND MASTER_DIV_CODE = ''' || W_KDATA2 || '''';
							W_SQL := W_SQL || '    AND CODE_VALUE = ''' || W_KDATA3 || ''''; 
						END IF;
						W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
						W_SQL := W_SQL || '  GROUP BY ' || W_GRPINF || ')';
						DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA4);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA5);
						W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
					ELSE
						EXIT;
					END IF;
				END LOOP;

				IF P_UPDKBN <> '3' THEN
					/**********************************************************************/
					/* ���������ԏd��(�����f�[�^)                                         */
					/**********************************************************************/
					W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE DELETE_DIV IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER <> 0';
					W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* �h�c*/
					IF W_MSTID = 200 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* �E���R�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* ���� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
					ELSIF W_MSTID = 201 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* ���� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* �I���� */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* �}�X�^�敪�R�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* �R�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* �I���� */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* �h�c */
							IF W_MSTID = 200 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* �E���R�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* ���� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
							ELSIF W_MSTID = 201 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* ���� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* �I���� */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* �}�X�^�敪�R�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �R�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* �I���� */
							END IF;
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=7';
							W_SQL := W_SQL || ' WHERE ERROR IS NULL';
							W_SQL := W_SQL || '   AND IDENTIFIER = (';
							W_SQL := W_SQL || ' SELECT ' || W_KDATA1;
							W_SQL := W_SQL || '   FROM ' || W_TABLE2 || ' A';
							W_SQL := W_SQL || '      , ' || W_TABLE1 || ' B';
							W_SQL := W_SQL || '  WHERE A.KAISYACD = :ORA_2';
							W_SQL := W_SQL || '    AND ((A.BEGIN_DAY > :ORA_0';
							W_SQL := W_SQL || '    AND  A.BEGIN_DAY <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
							W_SQL := W_SQL || '     OR (NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_0';
							W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
							W_SQL := W_SQL || '     OR (A.BEGIN_DAY < :ORA_0';
							W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))))';
							IF P_UPDKBN = '2' THEN
								W_SQL := W_SQL || '    AND A.BEGIN_DAY <> :ORA_0';
							END IF;
							IF W_MSTID = 200 THEN
								W_SQL := W_SQL || '    AND A.GRADE_CODE = ''' || W_KDATA3 || '''';
								W_SQL := W_SQL || '    AND A.GRADE = ' || W_KDATA6; 
							ELSIF W_MSTID = 201 THEN
								W_SQL := W_SQL || '    AND A.GRADE = ' || W_KDATA6; 
							ELSIF P_MSTID = 7 THEN
								W_SQL := W_SQL || '    AND A.MASTER_DIV = ''' || W_KDATA2 || '''';
								W_SQL := W_SQL || '    AND A.CODE_VALUE = ''' || W_KDATA3 || ''''; 
							ELSE
								W_SQL := W_SQL || '    AND A.MASTER_DIV_CODE = ''' || W_KDATA2 || '''';
								W_SQL := W_SQL || '    AND A.CODE_VALUE = ''' || W_KDATA3 || ''''; 
							END IF;
							W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> ' || P_SID;
							W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> ' || W_KDATA1;
							W_SQL := W_SQL || '    AND B.ERROR(+) IS NULL';
							W_SQL := W_SQL || '    AND B.DELETE_DIV(+) IS NULL';
							W_SQL := W_SQL || '    AND A.BEGIN_DAY = B.BEGIN_DAY(+)';
							IF W_MSTID = 200 THEN
								W_SQL := W_SQL || '    AND A.GRADE_CODE = B.GRADE_CODE(+)';
								W_SQL := W_SQL || '    AND A.GRADE = B.GRADE(+)';
							ELSIF W_MSTID = 201 THEN
								W_SQL := W_SQL || '    AND A.GRADE = B.GRADE(+)';
							ELSIF P_MSTID = 7 THEN
								W_SQL := W_SQL || '    AND A.MASTER_DIV = B.MASTER_DIV(+)';
								W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE(+)';
							ELSE
								W_SQL := W_SQL || '    AND A.MASTER_DIV_CODE = B.MASTER_DIV_CODE(+)';
								W_SQL := W_SQL || '    AND A.CODE_VALUE = B.CODE_VALUE(+)';
							END IF;

							W_SQL := W_SQL || ' HAVING COUNT(*) > 0';
							W_SQL := W_SQL || '  GROUP BY ';
							IF W_MSTID = 200 THEN
								W_SQL := W_SQL || ' A.GRADE_CODE,A.GRADE)';
							ELSIF W_MSTID = 201 THEN
								W_SQL := W_SQL || ' A.GRADE)';
							ELSIF P_MSTID = 7 THEN
								W_SQL := W_SQL || ' A.MASTER_DIV,A.CODE_VALUE)';
							ELSE
								W_SQL := W_SQL || ' A.MASTER_DIV_CODE,A.CODE_VALUE)';
							END IF;

							DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA4);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA5);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',P_KAISYA);
							W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
						ELSE
							EXIT;
						END IF;
					END LOOP;
				END IF;
			END IF;
		END IF;
	END IF;

/**********************************************************************/
/* �G���[���e�o�^                                                     */
/**********************************************************************/
	IF P_SKBN = 6 THEN
		/**********************************************************************/
		/* �G���[�f�[�^�o�^                                                   */
		/**********************************************************************/
		W_SQL := 'INSERT INTO WEB_TPA020040_T(';
		W_SQL := W_SQL || ' KAISYACD';
		W_SQL := W_SQL || ',PROCESS_YMD';
		W_SQL := W_SQL || ',FUNCTION_DIV';
		W_SQL := W_SQL || ',TARGET_DIV';
		W_SQL := W_SQL || ',EXECUTE_ID';
		W_SQL := W_SQL || ',ROW_NUMBER';
		W_SQL := W_SQL || ',ERROR_DIV';
		W_SQL := W_SQL || ',ERROR_CONTENT';
		W_SQL := W_SQL || ',UPDATE_DATE';
		W_SQL := W_SQL || ',UPDATE_USER)';
		W_SQL := W_SQL || ' SELECT';
		W_SQL := W_SQL || ' :ORA_1';
		W_SQL := W_SQL || ',TO_DATE(''' || P_SDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
		W_SQL := W_SQL || ',' || P_MSTID;
		W_SQL := W_SQL || ',' || W_MSTID;
		W_SQL := W_SQL || ',' || P_EXEID;
		W_SQL := W_SQL || ',IDENTIFIER';
		W_SQL := W_SQL || ',ERROR';
		W_SQL := W_SQL || ',DECODE(ERROR';
		W_SQL := W_SQL || ',2,''�L�[���d�����Ă��܂��B''';
		W_SQL := W_SQL || ',3,''�����f�[�^�ɃL�[�d��������܂��B''';
		W_SQL := W_SQL || ',4,''�V�X�e���ŗL�Ŏg�p����Ă���ׁA�捞�s�ł��B''';
		W_SQL := W_SQL || ',8,''�L�[�d���̏��O�f�[�^�ł��B''';
		W_SQL := W_SQL || ',11,''��s�R�[�h=�}�X�^������''';
		W_SQL := W_SQL || ')';
		W_SQL := W_SQL || ',SYSDATE';
		W_SQL := W_SQL || ',:ORA_2';
		W_SQL := W_SQL || '  FROM ' || W_TABLE1;
		W_SQL := W_SQL || ' WHERE ERROR IS NOT NULL';
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
		DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);

		/**********************************************************************/
		/* �G���[�f�[�^�폜                                                   */
		/**********************************************************************/
		W_SQL := 'DELETE FROM ' || W_TABLE1;
		W_SQL := W_SQL || ' WHERE ERROR IS NOT NULL';
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);

		/**********************************************************************/
		/* �捞�G���[����                                                     */
		/**********************************************************************/
		W_SQL := 'SELECT COUNT(*) COEFFICIENT';
		W_SQL := W_SQL || ' FROM WEB_TPA020040_T';
		W_SQL := W_SQL || ' WHERE KAISYACD=:ORA_1';
		W_SQL := W_SQL || '   AND PROCESS_YMD=TO_DATE(''' || P_SDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
		W_SQL := W_SQL || '   AND FUNCTION_DIV=' || P_MSTID;
		W_SQL := W_SQL || '   AND TARGET_DIV=' || W_MSTID;
		W_SQL := W_SQL || '   AND EXECUTE_ID=' || P_EXEID;
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
		DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_ERRCNT);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
		DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_ERRCNT);

		/**********************************************************************/
		/* �o�^����                                                           */
		/**********************************************************************/
		W_SQL := 'SELECT COUNT(*) COEFFICIENT';
		W_SQL := W_SQL || ' FROM ' || W_TABLE1;
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_UPDCNT);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
		DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_UPDCNT);

		/**********************************************************************/
		/* �捞����                                                           */
		/**********************************************************************/
		W_INCNT := W_ERRCNT + W_UPDCNT;

		/**********************************************************************/
		/* �捞����                                                           */
		/**********************************************************************/
		IF P_ERREXE = 3 AND W_ERRCNT > 0 THEN
			W_UPDCNT := 0;
		END IF;
	END IF;

/**********************************************************************/
/* �o�^                                                               */
/**********************************************************************/
	IF P_SKBN = 3 OR (P_SKBN = 6 AND W_UPDCNT > 0) THEN
	/**********************************************************************/
	/* �e�[�u�����b�N����                                                 */
	/**********************************************************************/
		W_SQL := 'LOCK TABLE ' || W_TABLE2 || ' IN EXCLUSIVE MODE';
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		IF P_MSTID IN (4,5,6,12,13) THEN
			W_DATE := SYSDATE;
		END IF;
	/**********************************************************************/
	/* �ύX�����X�V����                                                   */
	/**********************************************************************/
		/* �Z���Ŕ[�t��(�W���`��) , �[�t��(�n�������c�̏���) */
		IF P_MSTID IN (6,12) THEN
			/* �ǉ� */
			W_SQL := 'SELECT B.JMZNHSCD,B.NOHSKJME,B.NOHSKKME';
			IF P_MSTID = 6 THEN
				W_SQL := W_SQL || ',B.NOHSKRME';	--* �ύX��Z���Ŕ[�t�於�i���[�}���j
			ELSE
				W_SQL := W_SQL || ',NULL';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			W_SQL := W_SQL || ' WHERE A.JMZNHSCD(+) = B.JMZNHSCD';
			W_SQL := W_SQL || '   AND A.JMZNHSCD IS NULL';
			W_SQL := W_SQL || '   AND B.DELETE_DIV IS NULL';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA4,12);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_DATA5,80);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_DATA6,122);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_DATA7,44);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA4);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_DATA5);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_DATA6);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_DATA7);
				INSERT INTO JMZNHSK_RK (UPDDATE,UPDKBN,JMZNHSCD,NOHSKJME_B,NOHSKKME_B,NOHSKRME_B,NOHSKJME_A,NOHSKKME_A,NOHSKRME_A)
					VALUES(W_DATE,1,W_DATA4,NULL,NULL,NULL,W_DATA5,W_DATA6,W_DATA7);
			END LOOP;
			
			/* �ύX */
			W_SQL := 'SELECT B.JMZNHSCD,B.NOHSKJME,B.NOHSKKME,A.NOHSKJME,A.NOHSKKME';
			IF P_MSTID = 6 THEN
				W_SQL := W_SQL || ',B.NOHSKRME';	--* �ύX��Z���Ŕ[�t�於�i���[�}���j
				W_SQL := W_SQL || ',A.NOHSKRME';	--* �ύX�O�Z���Ŕ[�t�於�i���[�}���j
			ELSE
				W_SQL := W_SQL || ',NULL';
				W_SQL := W_SQL || ',NULL';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			W_SQL := W_SQL || ' WHERE A.JMZNHSCD = B.JMZNHSCD';
			IF P_MSTID = 6 THEN
				W_SQL := W_SQL || '   AND (A.NOHSKJME <> B.NOHSKJME OR A.NOHSKKME <> B.NOHSKKME OR A.NOHSKRME <> B.NOHSKRME)';
			ELSE
				W_SQL := W_SQL || '   AND (A.NOHSKJME <> B.NOHSKJME OR A.NOHSKKME <> B.NOHSKKME)';
			END IF;
			W_SQL := W_SQL || '   AND B.DELETE_DIV IS NULL';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA4,12);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_DATA5,80);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_DATA6,122);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_DATA7,80);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_DATA8,122);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,6,W_DATA9,44);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,7,W_DATA10,44);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA4);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_DATA5);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_DATA6);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_DATA7);
				DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_DATA8);
				DBMS_SQL.COLUMN_VALUE(W_CSR,6,W_DATA9);
				DBMS_SQL.COLUMN_VALUE(W_CSR,7,W_DATA10);
				INSERT INTO JMZNHSK_RK (UPDDATE,UPDKBN,JMZNHSCD,NOHSKJME_B,NOHSKKME_B,NOHSKRME_B,NOHSKJME_A,NOHSKKME_A,NOHSKRME_A)
					VALUES(W_DATE,2,W_DATA4,W_DATA7,W_DATA8,W_DATA10,W_DATA5,W_DATA6,W_DATA9);
			END LOOP;

			/* �_���폜 Or �����폜 */
			W_SQL := 'SELECT A.JMZNHSCD,A.NOHSKJME,A.NOHSKKME';
			IF P_MSTID = 6 THEN
				W_SQL := W_SQL || ',A.NOHSKRME';	--* �ύX�O�Z���Ŕ[�t�於�i���[�}���j
			ELSE
				W_SQL := W_SQL || ',NULL';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			W_SQL := W_SQL || ' WHERE A.JMZNHSCD = B.JMZNHSCD(+)';
			W_SQL := W_SQL || '   AND DECODE(B.DELETE_DIV,NULL,B.JMZNHSCD,NULL) IS NULL';

			/* �W���`���͓���s���{���폜�E�ǉ����l�� */
			IF P_MSTID = 6 AND P_MSTKBN IS NOT NULL THEN
				W_SQL := W_SQL || '   AND CMN_SJIS.SUBSTRB(A.JMZNHSCD,1,2)=' || P_MSTKBN;
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA4,12);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_DATA5,80);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_DATA6,122);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_DATA7,44);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA4);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_DATA5);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_DATA6);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_DATA7);
				IF P_UPDKBN = 2 THEN
					/* �W���`���Ȃ� */
					IF P_MSTID = 12 THEN
						/* �_���폜 */
						INSERT INTO JMZNHSK_RK (UPDDATE,UPDKBN,JMZNHSCD,NOHSKJME_B,NOHSKKME_B,NOHSKRME_B,NOHSKJME_A,NOHSKKME_A,NOHSKRME_A)
							VALUES(W_DATE,4,W_DATA4,W_DATA5,W_DATA6,W_DATA7,NULL,NULL,NULL);
					END IF;
				ELSIF P_UPDKBN = 3 THEN
					/* �����폜 */
					INSERT INTO JMZNHSK_RK (UPDDATE,UPDKBN,JMZNHSCD,NOHSKJME_B,NOHSKKME_B,NOHSKRME_B,NOHSKJME_A,NOHSKKME_A,NOHSKRME_A)
						VALUES(W_DATE,3,W_DATA4,W_DATA5,W_DATA6,W_DATA7,NULL,NULL,NULL);
				END IF;
			END LOOP;
		END IF;

		/* ��s , ��s�{�x�X(�S�⋦) */
		IF P_MSTID IN (4,13) THEN
			/* �ǉ� */
			IF P_MSTID = 13 THEN
				W_SQL := 'SELECT B.GINKOCD,CMN_SJIS.SUBSTRB(B.GINKOJME,1,30),B.GINKOKME,NULL FROM ' || W_TABLE3 || ' A,' || W_TABLE1 || ' B';
			ELSE
				W_SQL := 'SELECT B.GINKOCD,B.GINKOJME,B.GINKOKME,B.GINKOAME FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			END IF;
			W_SQL := W_SQL || ' WHERE A.GINKOCD(+) = B.GINKOCD';
			W_SQL := W_SQL || '   AND A.GINKOCD IS NULL';
			W_SQL := W_SQL || '   AND B.DELETE_DIV IS NULL';
			IF P_MSTID = 13 THEN
				W_SQL := W_SQL || ' GROUP BY B.GINKOCD,CMN_SJIS.SUBSTRB(B.GINKOJME,1,30),B.GINKOKME';
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_NDATA4);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_DATA9,120);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_DATA10,180);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_DATA11,60);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_NDATA4);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_DATA9);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_DATA10);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_DATA11);
				INSERT INTO GINKO_RK (UPDDATE,UPDKBN,GINKOCD,GINKOJME_B,GINKOKME_B,GINKOAME_B,GINKOJME_A,GINKOKME_A,GINKOAME_A)
					VALUES(W_DATE,1,W_NDATA4,NULL,NULL,NULL,W_DATA9,W_DATA10,W_DATA11);
			END LOOP;

			/* �ύX */
			IF P_MSTID = 13 THEN
				W_SQL := 'SELECT B.GINKOCD,CMN_SJIS.SUBSTRB(B.GINKOJME,1,30),B.GINKOKME,A.GINKOJME,A.GINKOKME,NULL,NULL FROM ' || W_TABLE3 || ' A,' || W_TABLE1 || ' B';
			ELSE
				W_SQL := 'SELECT B.GINKOCD,B.GINKOJME,B.GINKOKME,A.GINKOJME,A.GINKOKME,B.GINKOAME,A.GINKOAME FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			END IF;
			W_SQL := W_SQL || ' WHERE A.GINKOCD = B.GINKOCD';
			IF P_MSTID = 13 THEN
				W_SQL := W_SQL || '   AND (A.GINKOJME <> CMN_SJIS.SUBSTRB(B.GINKOJME,1,30) OR A.GINKOKME <> B.GINKOKME)';
			ELSE
				W_SQL := W_SQL || '   AND (A.GINKOJME <> CMN_SJIS.SUBSTRB(B.GINKOJME,1,30) OR A.GINKOKME <> B.GINKOKME OR A.GINKOAME <> B.GINKOAME)';
			END IF;
			W_SQL := W_SQL || '   AND B.DELETE_DIV IS NULL';
			IF P_MSTID = 13 THEN
				W_SQL := W_SQL || ' GROUP BY B.GINKOCD,CMN_SJIS.SUBSTRB(B.GINKOJME,1,30),B.GINKOKME,A.GINKOJME,A.GINKOKME';
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_NDATA4);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_DATA9,120);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_DATA10,180);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_DATA11,120);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_DATA12,180);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,6,W_DATA13,60);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,7,W_DATA14,60);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_NDATA4);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_DATA9);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_DATA10);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_DATA11);
				DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_DATA12);
				DBMS_SQL.COLUMN_VALUE(W_CSR,6,W_DATA13);
				DBMS_SQL.COLUMN_VALUE(W_CSR,7,W_DATA14);
				INSERT INTO GINKO_RK (UPDDATE,UPDKBN,GINKOCD,GINKOJME_B,GINKOKME_B,GINKOAME_B,GINKOJME_A,GINKOKME_A,GINKOAME_A)
					VALUES(W_DATE,2,W_NDATA4,W_DATA11,W_DATA12,W_DATA14,W_DATA9,W_DATA10,W_DATA13);
			END LOOP;

			/* �_���폜 Or �����폜 */
			IF P_MSTID = 13 THEN
				W_SQL := 'SELECT A.GINKOCD,A.GINKOJME,A.GINKOJME,NULL FROM ' || W_TABLE3 || ' A,' || W_TABLE1 || ' B';
			ELSE
				W_SQL := 'SELECT A.GINKOCD,A.GINKOJME,A.GINKOJME,A.GINKOAME FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			END IF;
			W_SQL := W_SQL || ' WHERE A.GINKOCD = B.GINKOCD(+)';
			W_SQL := W_SQL || '   AND DECODE(B.DELETE_DIV,NULL,B.GINKOCD,NULL) IS NULL';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_NDATA4);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_DATA9,120);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_DATA10,180);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_DATA11,60);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_NDATA4);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_DATA9);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_DATA10);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_DATA11);
				IF P_UPDKBN = 2 THEN
					/* �W���`���Ȃ� */
					IF P_MSTID = 13 THEN
						/* �_���폜 */
						INSERT INTO GINKO_RK (UPDDATE,UPDKBN,GINKOCD,GINKOJME_B,GINKOKME_B,GINKOAME_B,GINKOJME_A,GINKOKME_A,GINKOAME_A)
							VALUES(W_DATE,4,W_NDATA4,W_DATA9,W_DATA10,NULL,NULL,NULL,NULL);
					END IF;
				ELSIF P_UPDKBN = 3 THEN
					/* �����폜 */
					INSERT INTO GINKO_RK (UPDDATE,UPDKBN,GINKOCD,GINKOJME_B,GINKOKME_B,GINKOAME_B,GINKOJME_A,GINKOKME_A,GINKOAME_A)
						VALUES(W_DATE,3,W_NDATA4,W_DATA9,W_DATA10,W_DATA11,NULL,NULL,NULL);
				END IF;
			END LOOP;
		END IF;

		/* ��s�x�X , ��s�{�x�X(�S�⋦) */
		IF P_MSTID IN (5,13) THEN
			/* �ǉ� */
			W_SQL := 'SELECT B.GINKOCD,B.SITENCD,CMN_SJIS.SUBSTRB(B.SITENJME,1,30),B.SITENKME';
			IF P_MSTID = 5 THEN
				W_SQL := W_SQL || ',B.SITENAME';
			ELSE
				W_SQL := W_SQL || ',NULL';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			W_SQL := W_SQL || ' WHERE A.GINKOCD(+) = B.GINKOCD';
			W_SQL := W_SQL || '   AND A.SITENCD(+) = B.SITENCD';
			W_SQL := W_SQL || '   AND A.GINKOCD IS NULL';
			W_SQL := W_SQL || '   AND A.SITENCD IS NULL';
			W_SQL := W_SQL || '   AND B.DELETE_DIV IS NULL';
			IF P_MSTID = 13 THEN
				W_SQL := W_SQL || '   AND B.SITENCD IS NOT NULL';
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_NDATA4);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_NDATA5);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_DATA9,120);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_DATA10,180);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_DATA11,60);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_NDATA4);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_NDATA5);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_DATA9);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_DATA10);
				DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_DATA11);
				INSERT INTO GINKSTN_RK (UPDDATE,UPDKBN,GINKOCD,SITENCD,SITENJME_B,SITENKME_B,SITENAME_B,SITENJME_A,SITENKME_A,SITENAME_A)
					VALUES(W_DATE,1,W_NDATA4,W_NDATA5,NULL,NULL,NULL,W_DATA9,W_DATA10,W_DATA11);
			END LOOP;

			/* �ύX */
			W_SQL := 'SELECT B.GINKOCD,B.SITENCD,CMN_SJIS.SUBSTRB(B.SITENJME,1,30),B.SITENKME,A.SITENJME,A.SITENKME';
			IF P_MSTID = 5 THEN
				W_SQL := W_SQL || ',B.SITENAME,A.SITENAME';
			ELSE
				W_SQL := W_SQL || ',NULL,NULL';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			W_SQL := W_SQL || ' WHERE A.GINKOCD = B.GINKOCD';
			W_SQL := W_SQL || '   AND A.SITENCD = B.SITENCD';
			IF P_MSTID = 5 THEN
				W_SQL := W_SQL || '   AND (A.SITENJME <> CMN_SJIS.SUBSTRB(B.SITENJME,1,30) OR A.SITENKME <> B.SITENKME OR A.SITENAME <> B.SITENAME)';
			ELSE
				W_SQL := W_SQL || '   AND (A.SITENJME <> CMN_SJIS.SUBSTRB(B.SITENJME,1,30) OR A.SITENKME <> B.SITENKME)';
			END IF;
			W_SQL := W_SQL || '   AND B.DELETE_DIV IS NULL';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_NDATA4);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_NDATA5);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_DATA9,120);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_DATA10,180);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_DATA11,120);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,6,W_DATA12,180);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,7,W_DATA13,60);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,8,W_DATA14,60);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_NDATA4);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_NDATA5);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_DATA9);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_DATA10);
				DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_DATA11);
				DBMS_SQL.COLUMN_VALUE(W_CSR,6,W_DATA12);
				DBMS_SQL.COLUMN_VALUE(W_CSR,7,W_DATA13);
				DBMS_SQL.COLUMN_VALUE(W_CSR,8,W_DATA14);
				INSERT INTO GINKSTN_RK (UPDDATE,UPDKBN,GINKOCD,SITENCD,SITENJME_B,SITENKME_B,SITENAME_B,SITENJME_A,SITENKME_A,SITENAME_A)
					VALUES(W_DATE,2,W_NDATA4,W_NDATA5,W_DATA11,W_DATA12,W_DATA14,W_DATA9,W_DATA10,W_DATA13);
			END LOOP;

			/* �_���폜 Or �����폜 */
			W_SQL := 'SELECT A.GINKOCD,A.SITENCD,A.SITENJME,A.SITENKME';
			IF P_MSTID = 5 THEN
				W_SQL := W_SQL || ',A.SITENAME';
			ELSE
				W_SQL := W_SQL || ',NULL';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			W_SQL := W_SQL || ' WHERE A.GINKOCD = B.GINKOCD(+)';
			W_SQL := W_SQL || '   AND A.SITENCD = B.SITENCD(+)';
			W_SQL := W_SQL || '   AND DECODE(B.DELETE_DIV,NULL,B.GINKOCD,NULL) IS NULL';
			W_SQL := W_SQL || '   AND DECODE(B.DELETE_DIV,NULL,B.SITENCD,NULL) IS NULL';
			/* �W���`���͓����s�폜�E�ǉ����l�� */
			IF P_MSTID = 5 AND P_MSTKBN IS NOT NULL THEN
				W_SQL := W_SQL || '   AND A.GINKOCD = ' || P_MSTKBN;
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_NDATA4);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_NDATA5);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_DATA9,120);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_DATA10,180);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_DATA11,60);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_NDATA4);
				DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_NDATA5);
				DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_DATA9);
				DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_DATA10);
				DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_DATA11);
				IF P_UPDKBN = 2 THEN
					/* �W���`���Ȃ� */
					IF P_MSTID = 13 THEN
						/* �_���폜 */
						INSERT INTO GINKSTN_RK (UPDDATE,UPDKBN,GINKOCD,SITENCD,SITENJME_B,SITENKME_B,SITENAME_B,SITENJME_A,SITENKME_A,SITENAME_A)
							VALUES(W_DATE,4,W_NDATA4,W_NDATA5,W_DATA9,W_DATA10,NULL,NULL,NULL,NULL);
					END IF;
				ELSIF P_UPDKBN = 3 THEN
					/* �����폜 */
					INSERT INTO GINKSTN_RK (UPDDATE,UPDKBN,GINKOCD,SITENCD,SITENJME_B,SITENKME_B,SITENAME_B,SITENJME_A,SITENKME_A,SITENAME_A)
						VALUES(W_DATE,3,W_NDATA4,W_NDATA5,W_DATA9,W_DATA10,W_DATA11,NULL,NULL,NULL);
				END IF;
			END LOOP;
		END IF;

	/**********************************************************************/
	/* �o�^����                                                           */
	/**********************************************************************/
		W_J := 1;
		IF W_KFLG = '1' THEN
			OPEN C_002;
		ELSE
			OPEN C_003;
		END IF;

		LOOP
			IF W_KFLG = '1' THEN
				FETCH C_002 INTO C_002_REC;
				EXIT WHEN C_002%NOTFOUND;
			ELSE
				FETCH C_003 INTO C_002_REC;
				EXIT WHEN C_003%NOTFOUND;
			END IF;

--		FOR C_002_REC IN C_002 LOOP
			/* �������̑���Гo�^(�����ް��͍폜) */
			IF P_UPDKBN = 1 AND P_MSTID IN (1,7) AND W_J > 1 THEN
				W_SQL := 'SELECT COUNT(*) COEFFICIENT';
				W_SQL := W_SQL || ' FROM ' || W_TABLE2;
				W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
				W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				W_SQL := W_SQL || '    FROM ' || W_TABLE1;
				W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_CNT);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_CNT);
				IF W_CNT <> 0 THEN
					W_SQL := 'DELETE FROM ' || W_TABLE2;
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
					W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
					W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
					W_SQL := W_SQL || '    FROM ' || W_TABLE1;
					W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
				W_SQL := 'SELECT COUNT(*) COEFFICIENT';
				W_SQL := W_SQL || ' FROM ' || W_TABLE3;
				W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
				W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				W_SQL := W_SQL || '    FROM ' || W_TABLE1;
				W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_CNT);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_CNT);
				IF W_CNT <> 0 THEN
					W_SQL := 'DELETE FROM ' || W_TABLE3;
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
					W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
					W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
					W_SQL := W_SQL || '    FROM ' || W_TABLE1;
					W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;
			/* �u�����ǉ��� */
			IF P_UPDKBN = 2 THEN
				W_SQL := 'DELETE FROM ' || W_TABLE2;
				IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
					/* 1:���̃}�X�^�E2:�E�\�������E3:�{�������E7:���R�}�X�^�E8:�g�D�l�� */
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
					W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
				ELSE
					/* 4:��s�E5:��s�x�X�E6:�Z���Ŕ[�t��E11:�X�֔ԍ��E12:�Z���Ŕ[�t��(�n�������c�̏���)�E13:��s�{�x�X(�S�⋦) */
					W_SQL := W_SQL || ' WHERE (' || W_KEYINF || ') IN (';
				END IF;
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				W_SQL := W_SQL || '    FROM ' || W_TABLE1;
				W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ��s�{�x�X(�S�⋦) */
				IF P_MSTID = 13 THEN
					W_SQL := 'DELETE FROM ' || W_TABLE3;
					W_SQL := W_SQL || ' WHERE (' || W_KEYINF2 || ') IN (';
					W_SQL := W_SQL || '  SELECT ' || W_KEYINF2;
					W_SQL := W_SQL || '    FROM ' || W_TABLE1;
					W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				IF W_YOBI = '2' THEN
					W_SQL := 'DELETE FROM ' || W_TABLE3;
					IF P_MSTID IN (1,7) THEN
						W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
						W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
					ELSE
						W_SQL := W_SQL || ' WHERE (' || W_KEYINF || ') IN (';
					END IF;
					W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
					W_SQL := W_SQL || '    FROM ' || W_TABLE1;
					W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

			/* �폜���ǉ��� */
			IF P_UPDKBN = 3 THEN
				W_SQL := 'DELETE FROM ' || W_TABLE2;
				IF P_MSTID = 1 THEN
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
					W_SQL := W_SQL || '   AND MASTER_DIV_CODE=''' || P_MSTKBN || ''' AND';
					W_SQL := W_SQL || ' (MASTER_DIV_CODE,CODE_VALUE) NOT IN (';
					W_SQL := W_SQL || '  SELECT MASTER_DIV_CODE,CODE_VALUE';
					W_SQL := W_SQL || '    FROM WEB_TP0110020_M)';
				ELSIF P_MSTID = 2 THEN
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
					IF P_MSTKBN IS NOT NULL THEN
						W_SQL := W_SQL || '   AND GRADE_CODE=''' || P_MSTKBN || '''';
					END IF;
				ELSIF P_MSTID = 3 THEN
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
				ELSIF P_MSTID = 5 THEN
					IF P_MSTKBN IS NOT NULL THEN
						W_SQL := W_SQL || ' WHERE GINKOCD=' || P_MSTKBN;
					END IF;
				ELSIF P_MSTID = 6 THEN
					IF P_MSTKBN IS NOT NULL THEN
						W_SQL := W_SQL || ' WHERE CMN_SJIS.SUBSTRB(JMZNHSCD,1,2)=' || P_MSTKBN;
					END IF;
				ELSIF P_MSTID = 7 THEN
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
					W_SQL := W_SQL || '   AND MASTER_DIV=' || P_MSTKBN;
				ELSIF P_MSTID = 8 THEN
					W_SQL := W_SQL || ' WHERE (KAISYACD,FISCAL_YEAR,PERIOD_DIV) IN (';
					W_SQL := W_SQL || '  SELECT DISTINCT :ORA_1,FISCAL_YEAR,PERIOD_DIV FROM ' || W_TABLE1 || ')';
				ELSIF P_MSTID = 12 THEN
					IF P_MSTKBN IS NOT NULL THEN
						W_SQL := W_SQL || ' WHERE CMN_SJIS.SUBSTRB(JMZNHSCD,1,2)=' || P_MSTKBN;
					END IF;
				END IF;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				IF W_KFLG = '0' THEN
					IF P_MSTID = 1 THEN
						W_SQL := 'DELETE FROM MASTER_CONTROL';
						W_SQL := W_SQL || ' WHERE MASTER_DIV_CODE=''' || P_MSTKBN || ''' AND';
						W_SQL := W_SQL || ' (MASTER_DIV_CODE,CODE_VALUE) NOT IN (';
						W_SQL := W_SQL || '  SELECT MASTER_DIV_CODE,CODE_VALUE';
						W_SQL := W_SQL || '    FROM WEB_TP0110020_M)';
						W_SQL := W_SQL || '   AND MASTER_DIV_CODE IN (''11'',''30'',''32'',''33'',''S7'',''SL'')';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				END IF;

				/* ��s�{�x�X(�S�⋦) */
				IF P_MSTID = 13 THEN
					W_SQL := 'DELETE FROM ' || W_TABLE3;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				IF W_YOBI = '2' THEN
					W_SQL := 'DELETE FROM ' || W_TABLE3;
					IF P_MSTID = 1 THEN
						W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
						W_SQL := W_SQL || '   AND MASTER_DIV_CODE=''' || P_MSTKBN || ''' AND';
						W_SQL := W_SQL || ' (MASTER_DIV_CODE,CODE_VALUE) NOT IN (';
						W_SQL := W_SQL || '  SELECT MASTER_DIV_CODE,CODE_VALUE';
						W_SQL := W_SQL || '    FROM WEB_TP0110020_M)';
					ELSIF P_MSTID = 7 THEN
						W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
						W_SQL := W_SQL || '   AND MASTER_DIV=' || P_MSTKBN;
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

			/**********************************************************************/
			/* �ǉ�����                                                           */
			/**********************************************************************/
			IF P_MSTID <> 8 THEN
				IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
					W_SQL := 'INSERT INTO ' || W_TABLE2 || '(KAISYACD,';
				ELSE
					W_SQL := 'INSERT INTO ' || W_TABLE2 || '(';
				END IF;
				IF P_MSTID = 1 THEN
					W_SQL := W_SQL || ' ' || W_FIELD || ',CODE_TEXT,UPDATE_DATE,UPDATE_USER)';
					W_SQL := W_SQL || ' SELECT';
					W_SQL := W_SQL || ' :ORA_1,' || W_FIELD || ',CODE_VALUE || ''.'' || TEXT1';
				ELSE
					W_SQL := W_SQL || ' ' || W_FIELD;

					/* �X�V���E�X�V�҃R�[�h */
					W_COLUMN := WEB_SP0001270_F(1,W_TABLE2);
					IF W_COLUMN <> 'NO-COLUMN' THEN
						W_SQL := W_SQL || ',' || W_COLUMN;
					END IF;
					W_COLUMN := WEB_SP0001270_F(2,W_TABLE2);
					IF W_COLUMN <> 'NO-COLUMN' THEN
						W_SQL := W_SQL || ',' || W_COLUMN;
					END IF;

					W_SQL := W_SQL || ')';
					W_SQL := W_SQL || ' SELECT';
					IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
						W_SQL := W_SQL || ' :ORA_1,';
					END IF;
					W_SQL := W_SQL || ' ' || W_FIELD;
				END IF;
				W_SQL := W_SQL || ',SYSDATE';
				W_SQL := W_SQL || ',:ORA_UPDID';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || '  WHERE DELETE_DIV IS NULL';
				IF P_MSTID = 13 THEN
					W_SQL := W_SQL || '    AND SITENCD IS NOT NULL';
				END IF;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
				END IF;
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_UPDID',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				IF W_KFLG = '0' THEN
					IF P_MSTID = 1 THEN
						W_SQL := 'DELETE FROM MASTER_CONTROL';
						W_SQL := W_SQL || ' WHERE (MASTER_DIV_CODE,CODE_VALUE) IN (';
						W_SQL := W_SQL || '  SELECT MASTER_DIV_CODE,CODE_VALUE';
						W_SQL := W_SQL || '    FROM ' || W_TABLE1;
						W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL';
						W_SQL := W_SQL || '     AND MASTER_DIV_CODE IN (''11'',''30'',''32'',''33'',''S7'',''SL''))';
						W_SQL := W_SQL || '   AND KAISYACD = 0';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						W_SQL := 'INSERT INTO MASTER_CONTROL (MASTER_DIV_CODE,CODE_VALUE,KAISYACD,UPDATE_DATE,UPDATE_USER)';
						W_SQL := W_SQL || ' SELECT DISTINCT MASTER_DIV_CODE,CODE_VALUE,0,SYSDATE,:ORA_UPDID';
						W_SQL := W_SQL || '   FROM ' || W_TABLE1;
						W_SQL := W_SQL || '  WHERE DELETE_DIV IS NULL';
						W_SQL := W_SQL || '    AND MASTER_DIV_CODE IN (''11'',''30'',''32'',''33'',''S7'',''SL'')';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_UPDID',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				END IF;

				/* �X�֔ԍ� */
				IF P_MSTID = 11 THEN
					W_SQL := 'UPDATE ' || W_TABLE2 || ' SET';
					W_SQL := W_SQL || ' PREFECTURE_CODE = SUBSTR(AREA_CODE,1,2),';
					W_SQL := W_SQL || ' RESIDENT_TAX_PAYEE=LPAD(LTRIM(RTRIM(AREA_CODE)),5,''0'') || MOD((11-MOD(';
					W_SQL := W_SQL || ' TO_NUMBER(SUBSTR(LPAD(LTRIM(RTRIM(AREA_CODE)),5,''0''),1,1))*6';
					W_SQL := W_SQL || ' +TO_NUMBER(SUBSTR(LPAD(LTRIM(RTRIM(AREA_CODE)),5,''0''),2,1))*5';
					W_SQL := W_SQL || ' +TO_NUMBER(SUBSTR(LPAD(LTRIM(RTRIM(AREA_CODE)),5,''0''),3,1))*4';
					W_SQL := W_SQL || ' +TO_NUMBER(SUBSTR(LPAD(LTRIM(RTRIM(AREA_CODE)),5,''0''),4,1))*3';
					W_SQL := W_SQL || ' +TO_NUMBER(SUBSTR(LPAD(LTRIM(RTRIM(AREA_CODE)),5,''0''),5,1))*2';
					W_SQL := W_SQL || ' ,11)),10)';
					W_SQL := W_SQL || ',UPDATE_DATE = SYSDATE';
					W_SQL := W_SQL || ',UPDATE_USER = :ORA_UPDID';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_UPDID',P_UPDID);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				/* ��s�{�x�X(�S�⋦) */
				IF P_MSTID = 13 THEN
					W_SQL := 'INSERT INTO ' || W_TABLE3 || '(';
					W_SQL := W_SQL || ' ' || W_FIELD2 || ',UPDATDAT,UPDATMAN)';
					W_SQL := W_SQL || ' SELECT';
					W_SQL := W_SQL || ' ' || W_FIELD2 || ',SYSDATE,:ORA_UPDID';
					W_SQL := W_SQL || ' FROM ' || W_TABLE1;
					W_SQL := W_SQL || '  WHERE DELETE_DIV IS NULL';
					W_SQL := W_SQL || '  GROUP BY ' || W_FIELD2;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_UPDID',P_UPDID);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

			IF W_YOBI = '2' OR P_MSTID = 8 THEN
				W_SQL := 'INSERT INTO ' || W_TABLE3 || '(';
				W_SQL := W_SQL || ' KAISYACD';
				IF P_MSTID = 1 THEN
					W_SQL := W_SQL || ',MASTER_DIV_CODE,CODE_VALUE';
				ELSIF P_MSTID = 7 THEN
					W_SQL := W_SQL || ',MASTER_DIV,CODE_VALUE';
				ELSIF P_MSTID = 8 THEN
					W_SQL := W_SQL || ',FISCAL_YEAR,PERIOD_DIV,RANK,CODE_VALUE';
				END IF;
				IF W_RIREKI = 1 THEN
					W_SQL := W_SQL || ',BEGIN_DAY,END_DAY';
				END IF;

				FOR C_001_REC IN C_001(W_MSTID) LOOP
					IF C_001_REC.ITEM_ID <= 200 THEN
						W_SQL := W_SQL || ',AUX_NUMBER' || TO_CHAR(C_001_REC.ITEM_ID-100,'FM00');
					ELSIF C_001_REC.ITEM_ID <= 300 THEN
						W_SQL := W_SQL || ',AUX_DATE' || TO_CHAR(C_001_REC.ITEM_ID-200,'FM00');
					ELSIF C_001_REC.ITEM_ID <= 400 THEN
						W_SQL := W_SQL || ',AUX_CHAR' || TO_CHAR(C_001_REC.ITEM_ID-300,'FM00');
					END IF;
				END LOOP;

				W_SQL := W_SQL || ',UPDATE_DATE,UPDATE_USER) SELECT';
				W_SQL := W_SQL || ' :ORA_1';
				IF P_MSTID = 1 THEN
					W_SQL := W_SQL || ',MASTER_DIV_CODE,CODE_VALUE';
				ELSIF P_MSTID = 7 THEN
					W_SQL := W_SQL || ',MASTER_DIV,CODE_VALUE';
				ELSIF P_MSTID = 8 THEN
					W_SQL := W_SQL || ',FISCAL_YEAR,PERIOD_DIV,RANK,CODE_VALUE';
				END IF;
				IF W_RIREKI = 1 THEN
					W_SQL := W_SQL || ',BEGIN_DAY,END_DAY';
				END IF;

				FOR C_001_REC IN C_001(W_MSTID) LOOP
					IF C_001_REC.ITEM_ID <= 200 THEN
						W_SQL := W_SQL || ',AUX_NUMBER' || TO_CHAR(C_001_REC.ITEM_ID-100,'FM00');
					ELSIF C_001_REC.ITEM_ID <= 300 THEN
						W_SQL := W_SQL || ',AUX_DATE' || TO_CHAR(C_001_REC.ITEM_ID-200,'FM00');
					ELSIF C_001_REC.ITEM_ID <= 400 THEN
						W_SQL := W_SQL || ',AUX_CHAR' || TO_CHAR(C_001_REC.ITEM_ID-300,'FM00');
					END IF;
				END LOOP;
				W_SQL := W_SQL || ',SYSDATE,:ORA_2';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || '  WHERE DELETE_DIV IS NULL';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
			IF W_DOUKI <> '1' THEN
				EXIT;
			END IF;
			W_J := W_J + 1;
		END LOOP;

		IF W_KFLG = '1' THEN
			CLOSE C_002;
		ELSE
			CLOSE C_003;
		END IF;

		/**********************************************************************/
		/* �R�Â��Ă���}�X�^�̍폜����                                       */
		/**********************************************************************/
		/* �폜���ǉ��� */
		IF P_UPDKBN = 3 THEN
			IF P_MSTID = 4 THEN
				DELETE FROM GINKSTN_MS
				 WHERE GINKOCD NOT IN (
					SELECT GINKOCD
					  FROM GINKO_MS)
				;
			END IF;
		END IF;


	/**********************************************************************/
	/* �}�b�s���O����                                                     */
	/**********************************************************************/
		IF P_MSTID IN (1,2,3,7) THEN
			FOR C_011_REC IN C_011(P_KAISYA,W_MSTID) LOOP
				IF C_011_REC.KAISYA_DIV = '1' OR (C_011_REC.KAISYA_DIV = '0' AND (C_011_REC.TARGET_KAISYA_DIV = '1' OR (C_011_REC.TARGET_KAISYA_DIV = '2' AND C_011_REC.TARGET_KAISYACD = P_KAISYA))) THEN
					IF C_011_REC.KAISYA_DIV = '1' OR (C_011_REC.KAISYA_DIV = '0' AND (W_KAISYA_L = 0 OR (W_KAISYA_L <> 0 AND C_011_REC.LOCAL_UPDATE_DIV = '1'))) THEN

					/**********************************************************************/
					/* �e�[�u�����A���ږ��擾����                                         */
					/**********************************************************************/
						W_MAPTB  := WEB_SP0002610_F(4,0,W_MSTID,'2',C_011_REC.KAISYACD,C_011_REC.MAPPING_ID,0);
						W_MAPTBL := WEB_SP0002610_F(4,0,W_MSTID,'2',C_011_REC.KAISYACD,C_011_REC.MAPPING_ID,1);
						W_MAPFI  := 'MAP_' || C_011_REC.KAISYA_DIV || '_' ||  C_011_REC.MAPPING_ID;

					/**********************************************************************/
					/* �폜����                                                           */
					/**********************************************************************/
						IF P_UPDKBN IN (2,3) THEN
							W_SQL := 'DELETE FROM ' || W_MAPTB;
							W_SQL := W_SQL || ' WHERE KAISYACD   = :ORA_KAISYA';
							W_SQL := W_SQL || '   AND MASTER_ID  = :ORA_MASTER_ID';
							W_SQL := W_SQL || '   AND MAPPING_ID = :ORA_MAPPING_ID';
							W_SQL := W_SQL || '   AND DATA_KAISYACD = :ORA_DATA_KAISYACD';
							IF P_UPDKBN = '2' THEN
								IF W_MSTID = 200 THEN
									IF P_MSTKBN IS NOT NULL THEN
										W_SQL := W_SQL || '   AND GRADE_CODE=''' || P_MSTKBN || '''';
									END IF;
									IF W_RIREKI = 0 THEN
										W_SQL := W_SQL || '   AND GRADE IN (SELECT GRADE FROM ' || W_TABLE1 || ' WHERE DELETE_DIV IS NULL)';
									ELSE
										W_SQL := W_SQL || '   AND (GRADE,BEGIN_DAY) IN (SELECT GRADE,BEGIN_DAY FROM ' || W_TABLE1 || ' WHERE DELETE_DIV IS NULL)';
									END IF;
								ELSIF W_MSTID = 201 THEN
									IF W_RIREKI = 0 THEN
										W_SQL := W_SQL || '   AND GRADE IN (SELECT GRADE FROM ' || W_TABLE1 || ' WHERE DELETE_DIV IS NULL)';
									ELSE
										W_SQL := W_SQL || '   AND (GRADE,BEGIN_DAY) IN (SELECT GRADE,BEGIN_DAY FROM ' || W_TABLE1 || ' WHERE DELETE_DIV IS NULL)';
									END IF;
								ELSE
									IF W_RIREKI = 0 THEN
										W_SQL := W_SQL || '   AND CODE_VALUE IN (SELECT CODE_VALUE FROM ' || W_TABLE1 || ' WHERE DELETE_DIV IS NULL)';
									ELSE
										W_SQL := W_SQL || '   AND (CODE_VALUE,BEGIN_DAY) IN (SELECT CODE_VALUE,BEGIN_DAY FROM ' || W_TABLE1 || ' WHERE DELETE_DIV IS NULL)';
									END IF;
								END IF;
							END IF; 
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA'    ,C_011_REC.KAISYACD);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MASTER_ID' ,W_MSTID);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MAPPING_ID',C_011_REC.MAPPING_ID);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_DATA_KAISYACD',P_KAISYA);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						END IF;
						
					/**********************************************************************/
					/* �ǉ�����                                                           */
					/**********************************************************************/
						W_SQL := 'INSERT INTO ' || W_MAPTB || ' (';
						W_SQL := W_SQL || 'KAISYACD,';
						W_SQL := W_SQL || 'MASTER_ID,';
						W_SQL := W_SQL || 'MAPPING_ID,';
						W_SQL := W_SQL || 'DATA_KAISYACD,';
						IF W_MSTID = 200 THEN
							W_SQL := W_SQL || 'GRADE_CODE,GRADE,';
						ELSIF W_MSTID = 201 THEN
							W_SQL := W_SQL || 'GRADE,';
						ELSE
							W_SQL := W_SQL || 'CODE_VALUE,';
						END IF;
						IF W_RIREKI = 1 THEN
							W_SQL := W_SQL || 'BEGIN_DAY,';
						END IF;
						IF C_011_REC.DATA_TYPE_DIV = '1' THEN
							W_SQL := W_SQL || 'NUMBER_ITEM,';
						ELSIF C_011_REC.DATA_TYPE_DIV = '2' THEN
							W_SQL := W_SQL || 'TEXT_ITEM,';
						ELSIF C_011_REC.DATA_TYPE_DIV = '3' THEN
							W_SQL := W_SQL || 'DATE_ITEM,';
						ELSIF C_011_REC.DATA_TYPE_DIV = '4' THEN
							W_SQL := W_SQL || 'CODE_ITEM,';
						END IF;
						W_SQL := W_SQL || 'UPDATE_DATE,';
						W_SQL := W_SQL || 'UPDATE_USER)';
						W_SQL := W_SQL || ' SELECT ';
						W_SQL := W_SQL || ':ORA_KAISYA,';
						W_SQL := W_SQL || ':ORA_MASTER_ID,';
						W_SQL := W_SQL || ':ORA_MAPPING_ID,';
						W_SQL := W_SQL || ':ORA_DATA_KAISYACD,';
						IF W_MSTID = 200 THEN
							W_SQL := W_SQL || 'GRADE_CODE,GRADE,';
						ELSIF W_MSTID = 201 THEN
							W_SQL := W_SQL || 'GRADE,';
						ELSE
							W_SQL := W_SQL || 'CODE_VALUE,';
						END IF;
						IF W_RIREKI = 1 THEN
							W_SQL := W_SQL || 'BEGIN_DAY,';
						END IF;
						W_SQL := W_SQL || W_MAPFI || ',';
						W_SQL := W_SQL || ':ORA_UPDATE_DATE,';
						W_SQL := W_SQL || ':ORA_UPDATE_USER';
						W_SQL := W_SQL || ' FROM ' || W_TABLE1;
						W_SQL := W_SQL || ' WHERE DELETE_DIV IS NULL';
						W_SQL := W_SQL || ' AND ' || W_MAPFI || ' IS NOT NULL';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA'    ,C_011_REC.KAISYACD);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MASTER_ID' ,W_MSTID);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MAPPING_ID',C_011_REC.MAPPING_ID);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_DATA_KAISYACD',P_KAISYA);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_UPDATE_DATE',SYSDATE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_UPDATE_USER',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						
					/**********************************************************************/
					/* �s�����O����f�[�^�폜                                             */
					/**********************************************************************/
						W_SQL := 'DELETE FROM ' || W_MAPTBL;
						W_SQL := W_SQL || ' WHERE KAISYACD   = :ORA_KAISYA';
						W_SQL := W_SQL || '   AND MASTER_ID  = :ORA_MASTER_ID';
						W_SQL := W_SQL || '   AND MAPPING_ID = :ORA_MAPPING_ID';
						W_SQL := W_SQL || '   AND DATA_KAISYACD = :ORA_DATA_KAISYACD';
						IF W_MSTID = 200 THEN
							IF W_RIREKI = 0 THEN
								W_SQL := W_SQL || '   AND (GRADE_CODE,GRADE) NOT IN (SELECT GRADE_CODE,GRADE FROM ' || W_MAPTB;
							ELSE
								W_SQL := W_SQL || '   AND (GRADE_CODE,GRADE,BEGIN_DAY) NOT IN (SELECT GRADE_CODE,GRADE,BEGIN_DAY FROM ' || W_MAPTB;
							END IF;
						ELSIF W_MSTID = 201 THEN
							IF W_RIREKI = 0 THEN
								W_SQL := W_SQL || '   AND GRADE NOT IN (SELECT GRADE FROM ' || W_MAPTB;
							ELSE
								W_SQL := W_SQL || '   AND (GRADE,BEGIN_DAY) NOT IN (SELECT GRADE,BEGIN_DAY FROM ' || W_MAPTB;
							END IF;
						ELSE
							IF W_RIREKI = 0 THEN
								W_SQL := W_SQL || '   AND CODE_VALUE IN (SELECT CODE_VALUE FROM ' || W_MAPTB;
							ELSE
								W_SQL := W_SQL || '   AND (CODE_VALUE,BEGIN_DAY) IN (SELECT CODE_VALUE,BEGIN_DAY FROM ' || W_MAPTB;
							END IF;
						END IF;
						W_SQL := W_SQL || ' WHERE KAISYACD   = :ORA_KAISYA';
						W_SQL := W_SQL || '   AND MASTER_ID  = :ORA_MASTER_ID';
						W_SQL := W_SQL || '   AND MAPPING_ID = :ORA_MAPPING_ID';
						W_SQL := W_SQL || '   AND DATA_KAISYACD = :ORA_DATA_KAISYACD)';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA'    ,C_011_REC.KAISYACD);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MASTER_ID' ,W_MSTID);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MAPPING_ID',C_011_REC.MAPPING_ID);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_DATA_KAISYACD',P_KAISYA);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				END IF;
			END LOOP;
		END IF;
	END IF;

/**********************************************************************/
/* �l�U����}�X�^�X�V����                                           */
/* �@�@���s�����P�F�o�^��                                             */
/* �@�@���s�����Q�F��s�E��s�x�X�E��s�{�x�X(�S�⋦)                 */
/* �@�@���s�����R�F�u���ǉ��E�폜�ǉ�                                 */
/**********************************************************************/
	IF P_SKBN = 3 AND P_MSTID IN (4,5,13) AND P_UPDKBN IN ('2','3') THEN
		IF P_MSTID = 4 THEN
			WEB_SP0110300_S(5,P_UPDID,P_RID,W_ERR);
		ELSIF P_MSTID = 5 THEN
			WEB_SP0110300_S(6,P_UPDID,P_RID,W_ERR);
		ELSE
			WEB_SP0110300_S(3,P_UPDID,P_RID,W_ERR);
		END IF;
		IF W_ERR <> 0 THEN
			P_ERR := -2;
		END IF;
	END IF;

/**********************************************************************/
/* ���̃}�X�^�E���R�ݒ�̓�������                                     */
/* �@���s�����P�F�f�[�^���o�͓o�^�� OR �����捞�o�^��                 */
/* �@���s�����Q�F�폜�ǉ��ȊO                                         */
/* �@���s�����R�F���̃}�X�^�E���R�ݒ�                                 */
/* �@���s�����S�F�����敪=1�i��������j                               */
/* �@���s�����T�F���������t���O=0�i���������������j                   */
/* �@���s�����U�F�}���`�J���p�j�[��                                 */
/**********************************************************************/
	IF (P_SKBN = 3 OR (P_SKBN = 6 AND W_UPDCNT > 0)) AND P_UPDKBN <> '3' AND P_MSTID IN (1,7) AND W_DOUKI = '1' AND W_DOUKIFLG = '0' AND W_KFLG = '1' THEN
		W_J := 1;
		FOR C_002_REC IN C_002 LOOP
			IF W_J = 1 THEN
				W_KAISYA := C_002_REC.KAISYACD;
			ELSE
				/* ���̃}�X�^ */
				IF P_MSTID = 1 THEN
					/* �}�X�^(����) */
					W_SQL := 'DELETE FROM ' || W_TABLE2;
					W_SQL := W_SQL || ' WHERE KAISYACD=:ORA_1';
					W_SQL := W_SQL || '   AND MASTER_DIV_CODE=:ORA_2';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_MSTKBN);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_SQL := 'INSERT INTO ' || W_TABLE2 || '(';
					W_SQL := W_SQL || 'KAISYACD';
					W_SQL := W_SQL || ',MASTER_DIV_CODE';
					W_SQL := W_SQL || ',CODE_VALUE';
					IF W_RIREKI = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY';
						W_SQL := W_SQL || ',END_DAY';
					END IF;
					W_SQL := W_SQL || ',TEXT1';
					W_SQL := W_SQL || ',TEXT2';
					W_SQL := W_SQL || ',TEXT3';
					W_SQL := W_SQL || ',NUMBER1';
					W_SQL := W_SQL || ',CODE_TEXT';
					W_SQL := W_SQL || ',UPDATE_DATE';
					W_SQL := W_SQL || ',UPDATE_USER)';
					W_SQL := W_SQL || ' SELECT :ORA_1';
					W_SQL := W_SQL || ',MASTER_DIV_CODE';
					W_SQL := W_SQL || ',CODE_VALUE';
					IF W_RIREKI = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY';
						W_SQL := W_SQL || ',END_DAY';
					END IF;
					W_SQL := W_SQL || ',TEXT1';
					W_SQL := W_SQL || ',TEXT2';
					W_SQL := W_SQL || ',TEXT3';
					W_SQL := W_SQL || ',NUMBER1';
					W_SQL := W_SQL || ',CODE_TEXT';
					W_SQL := W_SQL || ',SYSDATE';
					W_SQL := W_SQL || ',:ORA_4';
					W_SQL := W_SQL || ' FROM ' || W_TABLE2;
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_2';
					W_SQL := W_SQL || '   AND MASTER_DIV_CODE = :ORA_3';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',W_KAISYA);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_3',P_MSTKBN);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_4',P_UPDID);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					/* �}�X�^�\�����(����) */
					W_SQL := 'DELETE FROM ' || W_TABLE3;
					W_SQL := W_SQL || ' WHERE KAISYACD =:ORA_1';
					W_SQL := W_SQL || ' AND MASTER_DIV_CODE =:ORA_2';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_MSTKBN);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_SQL := 'INSERT INTO ' || W_TABLE3 || '(';
					W_SQL := W_SQL || ' KAISYACD';
					W_SQL := W_SQL || ',MASTER_DIV_CODE';
					W_SQL := W_SQL || ',CODE_VALUE';
					IF W_RIREKI = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY';
						W_SQL := W_SQL || ',END_DAY';
					END IF;
					W_SQL := W_SQL || ',AUX_NUMBER01,AUX_NUMBER02,AUX_NUMBER03,AUX_NUMBER04,AUX_NUMBER05,AUX_NUMBER06,AUX_NUMBER07,AUX_NUMBER08,AUX_NUMBER09,AUX_NUMBER10';
					W_SQL := W_SQL || ',AUX_DATE01,AUX_DATE02,AUX_DATE03,AUX_DATE04,AUX_DATE05,AUX_DATE06,AUX_DATE07,AUX_DATE08,AUX_DATE09,AUX_DATE10';
					W_SQL := W_SQL || ',AUX_CHAR01,AUX_CHAR02,AUX_CHAR03,AUX_CHAR04,AUX_CHAR05,AUX_CHAR06,AUX_CHAR07,AUX_CHAR08,AUX_CHAR09,AUX_CHAR10';
					W_SQL := W_SQL || ',UPDATE_DATE';
					W_SQL := W_SQL || ',UPDATE_USER)';
					W_SQL := W_SQL || ' SELECT :ORA_1';
					W_SQL := W_SQL || ',MASTER_DIV_CODE';
					W_SQL := W_SQL || ',CODE_VALUE';
					IF W_RIREKI = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY';
						W_SQL := W_SQL || ',END_DAY';
					END IF;
					W_SQL := W_SQL || ',AUX_NUMBER01,AUX_NUMBER02,AUX_NUMBER03,AUX_NUMBER04,AUX_NUMBER05,AUX_NUMBER06,AUX_NUMBER07,AUX_NUMBER08,AUX_NUMBER09,AUX_NUMBER10';
					W_SQL := W_SQL || ',AUX_DATE01,AUX_DATE02,AUX_DATE03,AUX_DATE04,AUX_DATE05,AUX_DATE06,AUX_DATE07,AUX_DATE08,AUX_DATE09,AUX_DATE10';
					W_SQL := W_SQL || ',AUX_CHAR01,AUX_CHAR02,AUX_CHAR03,AUX_CHAR04,AUX_CHAR05,AUX_CHAR06,AUX_CHAR07,AUX_CHAR08,AUX_CHAR09,AUX_CHAR10';
					W_SQL := W_SQL || ',SYSDATE';
					W_SQL := W_SQL || ',:ORA_4';
					W_SQL := W_SQL || ' FROM ' || W_TABLE3;
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_2';
					W_SQL := W_SQL || '   AND MASTER_DIV_CODE = :ORA_3';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',W_KAISYA);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_3',P_MSTKBN);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_4',P_UPDID);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				/* ���R�ݒ� */
				ELSE
					/* WEB_TP000250�n(�ʏ�jor WEB_TP000252�n(�����j */
					W_SQL := 'DELETE FROM ' || W_TABLE2;
					W_SQL := W_SQL || ' WHERE KAISYACD =:ORA_1';
					W_SQL := W_SQL || ' AND MASTER_DIV =:ORA_2';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_MSTKBN);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_SQL := 'INSERT INTO ' || W_TABLE2 || '(';
					W_SQL := W_SQL || ' KAISYACD';
					W_SQL := W_SQL || ',MASTER_DIV';
					W_SQL := W_SQL || ',CODE_VALUE';
					IF W_RIREKI = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY';
						W_SQL := W_SQL || ',END_DAY';
					END IF;
					W_SQL := W_SQL || ',CHAR1';
					W_SQL := W_SQL || ',NUMBER1';
					W_SQL := W_SQL || ',UPDATE_DATE';
					W_SQL := W_SQL || ',UPDATE_USER)';
					W_SQL := W_SQL || ' SELECT :ORA_1';
					W_SQL := W_SQL || ',MASTER_DIV';
					W_SQL := W_SQL || ',CODE_VALUE';
					IF W_RIREKI = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY';
						W_SQL := W_SQL || ',END_DAY';
					END IF;
					W_SQL := W_SQL || ',CHAR1';
					W_SQL := W_SQL || ',NUMBER1';
					W_SQL := W_SQL || ',SYSDATE';
					W_SQL := W_SQL || ',:ORA_4';
					W_SQL := W_SQL || ' FROM ' || W_TABLE2;
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_2';
					W_SQL := W_SQL || '   AND MASTER_DIV = :ORA_3';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',W_KAISYA);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_3',P_MSTKBN);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_4',P_UPDID);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					/* WEB_TP000251�n�i�ʏ�j or WEB_TP000253�n�i�����j */
					W_SQL := 'DELETE FROM ' || W_TABLE3;
					W_SQL := W_SQL || ' WHERE KAISYACD =:ORA_1';
					W_SQL := W_SQL || ' AND MASTER_DIV =:ORA_2';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_MSTKBN);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_SQL := 'INSERT INTO ' || W_TABLE3 || '(';
					W_SQL := W_SQL || ' KAISYACD';
					W_SQL := W_SQL || ',MASTER_DIV';
					W_SQL := W_SQL || ',CODE_VALUE';
					IF W_RIREKI = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY';
						W_SQL := W_SQL || ',END_DAY';
					END IF;
					W_SQL := W_SQL || ',AUX_NUMBER01,AUX_NUMBER02,AUX_NUMBER03,AUX_NUMBER04,AUX_NUMBER05,AUX_NUMBER06,AUX_NUMBER07,AUX_NUMBER08,AUX_NUMBER09,AUX_NUMBER10';
					W_SQL := W_SQL || ',AUX_DATE01,AUX_DATE02,AUX_DATE03,AUX_DATE04,AUX_DATE05,AUX_DATE06,AUX_DATE07,AUX_DATE08,AUX_DATE09,AUX_DATE10';
					W_SQL := W_SQL || ',AUX_CHAR01,AUX_CHAR02,AUX_CHAR03,AUX_CHAR04,AUX_CHAR05,AUX_CHAR06,AUX_CHAR07,AUX_CHAR08,AUX_CHAR09,AUX_CHAR10';
					W_SQL := W_SQL || ',UPDATE_DATE';
					W_SQL := W_SQL || ',UPDATE_USER)';
					W_SQL := W_SQL || ' SELECT :ORA_1';
					W_SQL := W_SQL || ',MASTER_DIV';
					W_SQL := W_SQL || ',CODE_VALUE';
					IF W_RIREKI = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY';
						W_SQL := W_SQL || ',END_DAY';
					END IF;
					W_SQL := W_SQL || ',AUX_NUMBER01,AUX_NUMBER02,AUX_NUMBER03,AUX_NUMBER04,AUX_NUMBER05,AUX_NUMBER06,AUX_NUMBER07,AUX_NUMBER08,AUX_NUMBER09,AUX_NUMBER10';
					W_SQL := W_SQL || ',AUX_DATE01,AUX_DATE02,AUX_DATE03,AUX_DATE04,AUX_DATE05,AUX_DATE06,AUX_DATE07,AUX_DATE08,AUX_DATE09,AUX_DATE10';
					W_SQL := W_SQL || ',AUX_CHAR01,AUX_CHAR02,AUX_CHAR03,AUX_CHAR04,AUX_CHAR05,AUX_CHAR06,AUX_CHAR07,AUX_CHAR08,AUX_CHAR09,AUX_CHAR10';
					W_SQL := W_SQL || ',SYSDATE';
					W_SQL := W_SQL || ',:ORA_4';
					W_SQL := W_SQL || ' FROM ' || W_TABLE3;
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_2';
					W_SQL := W_SQL || '   AND MASTER_DIV = :ORA_3';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',C_002_REC.KAISYACD);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',W_KAISYA);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_3',P_MSTKBN);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_4',P_UPDID);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;
			W_J := W_J + 1;
		END LOOP;
		IF P_MSTID = 1 THEN
			UPDATE WEB_TP0110210_M SET SYNC_PROCESS_FLAG = '1',UPDATE_DATE = SYSDATE,UPDATE_USER = P_UPDID WHERE MASTER_KIND = '1' AND MASTER_DIV1 = P_MSTKBN;
		ELSE
			UPDATE WEB_TP0110210_M SET SYNC_PROCESS_FLAG = '1',UPDATE_DATE = SYSDATE,UPDATE_USER = P_UPDID WHERE MASTER_KIND = '2' AND MASTER_DIV2 = P_MSTKBN;
		END IF;
	END IF;

/**********************************************************************/
/* �O����s�v�f�[�^�폜                                               */
/**********************************************************************/
	IF P_SKBN = 3 OR P_SKBN = 6 THEN
		IF P_MSTID = 1 THEN
			W_SQL := 'DELETE FROM ' || W_TABLE2 || '_L';
			W_SQL := W_SQL || ' WHERE (KAISYACD,' || W_KEYINF || ') NOT IN (';
			W_SQL := W_SQL || ' SELECT KAISYACD,' || W_KEYINF;
			W_SQL := W_SQL || '   FROM '|| W_TABLE2 || ')';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			W_SQL := 'DELETE FROM ' || W_TABLE3 || '_L';
			W_SQL := W_SQL || ' WHERE (KAISYACD,' || W_KEYINF || ') NOT IN (';
			W_SQL := W_SQL || ' SELECT KAISYACD,' || W_KEYINF;
			W_SQL := W_SQL || '   FROM '|| W_TABLE2 || ')';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		ELSIF P_MSTID IN (2,3) THEN
			W_SQL := 'DELETE FROM ' || W_TABLE2 || '_L';
			W_SQL := W_SQL || ' WHERE (KAISYACD,' || W_KEYINF || ') NOT IN (';
			W_SQL := W_SQL || ' SELECT KAISYACD,' || W_KEYINF;
			W_SQL := W_SQL || '   FROM '|| W_TABLE2 || ')';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		ELSIF P_MSTID IN (7) THEN
			IF WEB_SP0002420_F(1,W_MSTID) = 0 THEN
				W_TABLE4 := 'WEB_TP000255' || MOD(P_MSTKBN,10) || '_T';
			ELSE
				W_TABLE4 := 'WEB_TP000257' || MOD(P_MSTKBN,10) || '_T';
			END IF;

			W_SQL := 'DELETE FROM ' || W_TABLE4;
			W_SQL := W_SQL || ' WHERE (KAISYACD,' || W_KEYINF || ') NOT IN (';
			W_SQL := W_SQL || ' SELECT KAISYACD,' || W_KEYINF;
			W_SQL := W_SQL || '   FROM '|| W_TABLE2 || ')';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			IF WEB_SP0002420_F(1,W_MSTID) = 0 THEN
				W_TABLE4 := 'WEB_TP000256' || MOD(P_MSTKBN,10) || '_T';
			ELSE
				W_TABLE4 := 'WEB_TP000258' || MOD(P_MSTKBN,10) || '_T';
			END IF;
			W_SQL := 'DELETE FROM ' || W_TABLE4;
			W_SQL := W_SQL || ' WHERE (KAISYACD,' || W_KEYINF || ') NOT IN (';
			W_SQL := W_SQL || ' SELECT KAISYACD,' || W_KEYINF;
			W_SQL := W_SQL || '   FROM '|| W_TABLE2 || ')';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;
	END IF;

/**********************************************************************/
/* �e�[�u���폜                                                       */
/**********************************************************************/
	IF P_SKBN = 4 OR P_SKBN = 6 THEN
		/* ���[�N�e�[�u���폜 */
		WEB_SP0003020_S(1,W_TABLE1);
	END IF;

/**********************************************************************/
/* ���[�N�ύX                                                         */
/**********************************************************************/
	IF P_SKBN = 5 AND (P_WKKBN = 2 OR P_WKKBN = 3) THEN

		/* 13:��s�{�x�X(�S�⋦)�̓��[�N�����ύX */
		IF P_MSTID = 13 THEN

			W_SQL := 'SELECT COUNT(*) COEFFICIENT FROM ' || W_TABLE1 || ' WHERE ERROR IN (14,15,16)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				IF W_RVL > 0 THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
					W_CNT := W_DATA1;
					EXIT;
				END IF;
			END LOOP;

			IF W_CNT = 0 THEN

				SELECT MAX(CONF_VALUE) INTO W_SET FROM WEB_TP0001020_M
				 WHERE DIV1 = 0 AND DIV2 = 0 AND DIV3 = 0 AND IDENTIFIER = 18;

				IF W_SET = '1' THEN
					/* 17:��s���J�i���ꕶ���g�p�A18:�x�X���J�i���ꕶ���g�p */
					W_SQL := 'SELECT IDENTIFIER, KEY_ITEM, GINKOKME, SITENKME';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE ERROR IN (17,18)';
					W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_ADATA1);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_ADATA2);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_ADATA3,180);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_ADATA4,180);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP 
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_ADATA1);
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_ADATA2);
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_ADATA3);
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_ADATA4);
							W_ASC_ERR := 0;

							W_CADATA := W_ADATA3;
							SELECT REGEXP_REPLACE(W_ADATA3,'[��@]','�')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[��B]','�')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[��D]','�')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[��F]','�')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[��H]','�')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[���]','�')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[���]','�')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[���]','�')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[��b]','�')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[^ (),./\��0-9A-Z�-���\-]',' ')
							INTO W_ADATA3 FROM DUAL;
							
							IF NOT W_CADATA = W_ADATA3 THEN
								W_ASC_ERR := 1;
							END IF;

							IF W_ASC_ERR = 1 THEN
								W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR = NULL, GINKOKME = ''' || W_ADATA3 || '''';
								W_SQL := W_SQL || ' WHERE IDENTIFIER = ' || W_ADATA1;
								DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
								W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
							END IF;

							W_CADATA := W_ADATA4;
							SELECT REGEXP_REPLACE(W_ADATA4,'[��@]','�')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[��B]','�')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[��D]','�')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[��F]','�')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[��H]','�')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[���]','�')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[���]','�')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[���]','�')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[��b]','�')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[^ (),./\��0-9A-Z�-���\-]',' ')
							INTO W_ADATA4 FROM DUAL;

							IF NOT W_CADATA = W_ADATA4 THEN
								W_ASC_ERR := 2;
							END IF;

							IF W_ASC_ERR = 2 THEN
								W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR = NULL, SITENKME = ''' || W_ADATA4 || '''';
								W_SQL := W_SQL || ' WHERE IDENTIFIER = ' || W_ADATA1;
								DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
								W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
							END IF;
						ELSE
							EXIT;
						END IF;
					END LOOP;
				END IF;
			END IF;

			--14:�x�X�R�[�hNULL
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR = NULL';
			W_SQL := W_SQL || ' WHERE ERROR = 14';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			--15:��s������30���ȏ�
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR = NULL';
			W_SQL := W_SQL || ',GINKOJME = CMN_SJIS.SUBSTRB(GINKOJME,1,30)';
			W_SQL := W_SQL || ' WHERE ERROR = 15';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			--16:�x�X������30���ȏ�
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR = NULL';
			W_SQL := W_SQL || ',SITENJME = CMN_SJIS.SUBSTRB(SITENJME,1,30)';
			W_SQL := W_SQL || ' WHERE ERROR = 16';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/* 17:��s���J�i���ꕶ���g�p�A18:�x�X���J�i���ꕶ���g�p */
			W_RTN := FNCL_ZENBANK_CHK();
		ELSE
		/**********************************************************************/
		/* �L�[�d������                                                       */
		/**********************************************************************/
			W_CNT := 0;
			W_SQL := 'SELECT COUNT(*) COEFFICIENT';
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE IDENTIFIER<>' || P_SID;
			W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
			W_SQL := W_SQL || '   AND ERROR = 2';
			W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
			W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
			W_SQL := W_SQL || '    FROM ' || W_TABLE1;
			W_SQL := W_SQL || '   WHERE IDENTIFIER = ' || P_SID || ')';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP 
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				IF W_RVL > 0 THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
					W_CNT := W_DATA1;
					EXIT;
				END IF;
			END LOOP;

			IF W_CNT = 1 THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
				W_SQL := W_SQL || ' WHERE IDENTIFIER<>' || P_SID;
				W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
				W_SQL := W_SQL || '   AND ERROR = 2';
				W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				W_SQL := W_SQL || '    FROM ' || W_TABLE1;
				W_SQL := W_SQL || '   WHERE IDENTIFIER = ' || P_SID || ')';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;

		/**********************************************************************/
		/* �ύX����                                                           */
		/**********************************************************************/
			IF P_WKKBN = '2' THEN
				/* �O��f�[�^�폜 */
				W_SQL := 'DELETE FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER=' || P_SID;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* �ύX�f�[�^�ǉ� */
				W_SQL := 'INSERT INTO ' || W_TABLE1 || ' (';
				W_SQL := W_SQL || ' IDENTIFIER,' || W_FIELD || ')';
				W_SQL := W_SQL || ' SELECT';
				W_SQL := W_SQL || ' ' || P_SID || ',' || W_FIELD;
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER=0';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ���[�N�f�[�^�폜 */
				W_SQL := 'DELETE FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER=0';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

		/**********************************************************************/
		/* �폜����                                                           */
		/**********************************************************************/
			ELSIF P_WKKBN = '3' THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET DELETE_DIV=''1'',ERROR=NULL';
				W_SQL := W_SQL || ' WHERE IDENTIFIER=' || P_SID;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
		END IF;
	END IF;

/**********************************************************************/
/* �ꊇ�捞�������O�X�V                                               */
/**********************************************************************/
	IF P_SKBN = 6 THEN
		W_SQL := 'INSERT INTO WEB_TPA020030_T(';
		W_SQL := W_SQL || 'KAISYACD,PROCESS_YMD,FUNCTION_DIV,TARGET_DIV,EXECUTE_ID,BEGIN_DT,END_DT,TARGET_COUNT,ERROR_COUNT,REGISTER_COUNT,ERROR_DIV,ERROR_CONTENT,UPDATE_DATE,UPDATE_USER)';
		W_SQL := W_SQL || 'VALUES(:ORA_1,TO_DATE(''' || P_SDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
		W_SQL := W_SQL || ',' || P_MSTID || ',' || W_MSTID || ',' || P_EXEID;
		W_SQL := W_SQL || ',TO_DATE(''' || P_KDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
		W_SQL := W_SQL || ',SYSDATE';
		W_SQL := W_SQL || ',' || W_INCNT;
		W_SQL := W_SQL || ',' || W_ERRCNT;
		W_SQL := W_SQL || ',' || W_UPDCNT;
		W_SQL := W_SQL || ',DECODE(' || W_ERRCNT || ',0,''0'',''3'')';
		W_SQL := W_SQL || ',DECODE(' || W_ERRCNT || ',0,'''',''�捞�f�[�^�ɃG���[�����݂��܂��B'')';
		W_SQL := W_SQL || ',SYSDATE';
		W_SQL := W_SQL || ',:ORA_2)';
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
		DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		P_ERR :=0;
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
		0,
		'WEB_SP0110030_S',
		'1',
		W_ERRCODE,
		W_ERRMSG,
		SUBSTRB(W_SQL,1,4000))
	;

	IF P_SKBN = 6 THEN
		W_SQL := 'INSERT INTO WEB_TPA020030_T(';
		W_SQL := W_SQL || 'KAISYACD,PROCESS_YMD,FUNCTION_DIV,TARGET_DIV,EXECUTE_ID,BEGIN_DT,END_DT,ERROR_DIV,ERROR_CONTENT,UPDATE_DATE,UPDATE_USER)';
		W_SQL := W_SQL || 'VALUES(:ORA_1,TO_DATE(''' || P_SDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
		W_SQL := W_SQL || ',' || P_MSTID || ',' || W_MSTID || ',' || P_EXEID;
		W_SQL := W_SQL || ',TO_DATE(''' || P_KDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
		W_SQL := W_SQL || ',SYSDATE,2,''' || W_ERRMSG || ''',SYSDATE,:ORA_2)';
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
		DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		P_ERR :=0;
	END IF;

 END;
/

