/**********************************************************************************/
/*  ���сF�l��WEB                                                                 */
/*  �@�\�F�V�X�e���Ǘ�                                                            */
/*  �����F�f�[�^����                                                              */
/*  ���e�F�捞����                                                                */
/*  ���́FWEB_SP0061220_S                                                         */
/*  FILE�FP0061220.SQL                                                            */
/*  ���l�F                                                                        */
/*                                                                                */
/*  �쐬�FVer6.3  2002/02/01 T.M                                                  */
/*  �����FVer7.0  2002/10/01 T.M �g�D�}�X�^,�ٓ��Ή�                              */
/*  �����FVer8.0  2002/12/01 T.M ����ꊇ�捞�Ή�                                 */
/*  �����FVer8.1  2002/02/01 T.M �d���Ή�,�����捞�Ή�                            */
/*  �����FVer8.0  2002/04/04 K.T �g�D�����d���G���[�s���\���Ή�                   */
/*  �����FVer8.0.6 2003/05/01 K.T �g�D�ꗗ�捞�Ή�                                */
/*  �����FVer9.0   2003/05/01 T.M �p�����Ή�                                      */
/*  �����FVer9.0   2003/05/01 T.M ���[�N�e�[�u���X�y�[�X�Ή�                      */
/*  �����FVerP1.2b 2003/11/25 T.M �g�D����捞���̕�����Ў��̕s��Ή�          */
/*  �����FVerP2.11 2004/06/08 S.B �}�g���b�N�X�g�D�Ή�                            */
/*  �����FVerP2.21 2004/10/28 T.M �}�X�^�������Ή�(���_�}�X�^)                    */
/*  �����FVerP2.32 2005/01/14 T.M ���_�}�X�^����o�^�s��Ή�                    */
/*  �����FVerP2.32 2005/01/14 T.M ���_�}�X�^�����`�F�b�N�s��Ή�                */
/*  �����FVerP2.32 2005/01/14 T.M �}�X�^�������Ή��R��(�}�X�^�`�F�b�N����)        */
/*  �����FVerP2.32 2005/01/14 T.M �����d����s�ݒ�}�X�^�[�Ή�                    */
/*  �����FVerP2.33 2005/01/18 T.M �d�����Z�@�ֈ˗��l���׃}�X�^�[�Ή�              */
/*  �����FVerP2.35 2005/05/04 T.M �l�ۖڕW�Ǘ����ڒǉ��ɂ��s��Ή�            */
/*  �����FVerP2.41 2005/05/11 T.M �g�D�⏕���̓}�X�^�`�F�b�N�Ή�                  */
/*  �����FVerP2.42 2005/06/28 T.M �g�D�֘A�T�C�Y�擾�s��Ή�                    */
/*  �����FVerP3.01 2005/07/29 I.H D100001 �}���`�J���p�j�[�Ή�(�g�D�}�X�^�E���Ə��̂�) */
/*  �����FVerP3.01 2005/07/29 I.H D100004 �g�D�}�X�^�Q�O�K�w�Ή�                  */
/*  �����FVerP3.01 2005/08/10 T.M E100038 �\���g�D�ł̑g�D�i�ꗗ�j�X�V�s�      */
/*  �����FVerP3.01 2005/08/11 I.H E100042 �g�D�捞���A�����R�[�h�d���s��Ή�    */
/*  �����FVerP3.01 2005/08/11 I.H E100043 �g�D�i����j�捞���A�����R�[�h�d���s��Ή� */
/*  �����FVerP2.44 2005/08/31 I.H E100062 �⏕���̓}�X�^�`�F�b�N���f�s��Ή�    */
/*  �����FVerP3.04 2006/02/28 Y.Y D100001 �}���`�J���p�j�[�Ή�                    */
/*  �����FVerP3.0a 2006/03/29 M.I E100174 E100174 �������ư�Ή��R��(��к��ޔ�\���Ή�) */
/*  �����FVerP3.0b 2006/04/25 Y.Y D100090 ��Q�Ҍٗp�[�t���@�\�Ή�                */
/*  �����FVerP3.0b 2006/05/02 Y.Y E100174 �������ư�Ή��R��(��к���)             */
/*  �����FVerP3.0c 2006/05/25 Y.Y D100090 ��Q�Ҍٗp�[�t���@�\�Ή�                */
/*  �����FVerP3.0d 2006/08/09 Y.Y D100138 ��]���Ґݒ�̌l����Ή�              */
/*  �����FVerP3.1  2006/11/28 I.H D100207 �g�D�}�X�^-�\�����ړo�^���̑g���Ή�     */
/*  �����FVerP3.1a 2007/07/24 M.I E100212 �ٓ��|����K�{�`�F�b�N�����Ή�(�K�p�R��)*/
/*  �����FVerP4.0  2007/12/20 M.I D100351 �P���Љ^�p�Ή�                        */
/*  �����FVerP4.0  2007/12/26 M.I D100379 TDE�Ή�                                 */
/*  �����FVerP4.0a 2008/03/16 Y.Y D100427 �]���g���Ή�                            */
/*  �����FVerP4.0c 2008/11/07 Y.Y E101082 �V���O���J���p�j�[�Ή��R��Ή�          */
/*  �����FVerP4.0c 2008/08/06 Y.Y D100473 ���_�}�X�^�[�e�ЊǗ��Ή�                */
/*  �����FVerP4.0c 2008/11/20 Y.Y E101101 �V���O���J���p�j�[�Ή��R��Ή�(�ڕW�Ǘ�)*/
/*  �����FVerP4.0c 2008/12/10 Y.Y D100512 �g�D�}�X�^�[�\�����ڊg���Ή�            */
/*  �����FVerP4.0c 2009/02/25 Y.Y E101192 �ύX���̗��������ԏd�������s��Ή�    */
/*  �����FVerP4.0f 2010/03/24 M.I�y�C��568�zE101426 ���Ə�Ͻ���捞���̕s��Ή�  */
/*  �����FVerP4.0f 2010/05/10 Y.Y�y���P�zD100557 ���R�}�X�^�[�̗������Ή�         */
/*  �����FVerP4.0g 2010/09/14 M.K�y�C��693�zE101557 �X�V���X�V�Һ��ޓo�^�R��Ή�  */
/*  �����FVerP4.0g 2010/10/19 M.K�y�C��706�zE101570 �ٓ��ē��e�ύX��ʎd�l�ύX    */
/*  �����FVer.2    2011/04/15 Y.Y�y���P�zD100641                                  */
/*  �����FVer.2    2011/09/24 T.M�y���PP-11-004�z                                 */
/*  �����FVer.2    2011/11/30 Y.Y�y�C��P11250�z                                   */
/*  �����FVer.3    2012/02/16 M.I�y�C��P11970�z                                   */
/*  �����FVer.3a   2012/10/24 M.K�y�C��P14530�z                                   */
/*  �����FVerP6.0  2014/06/26 T.M�y���PP-14-044�z                                 */
/*  �����FVerP6.0  2014/09/03 T.M�y���PP-14-053�z                                 */
/*  �����FVerP6.0  2014/10/08 T.M�y���PP-14-055�z                                 */
/*  �����FVerP6.0  2014/10/29 SHSC�yP-14-208�z�֑����������Ή��i��s�j            */
/*  �����FVerP6.0  2015/02/04 T.M�y�C��P17720�z                                   */
/*  �����FVerP6.0  2015/10/20 ICOM�y���P�z�}�C�i���o�[�Ή�2��                     */
/*  �����FVerP6.1  2015/1/27 SHSC�y���PP-14-086�z                                 */
/*  �����FVerP6.1  2015/02/05 MSSD�y���PP-14-101�z                                */
/*  �����FVerP6.1  2016/06/06 ISID�yP16320�z�����R�[�h�d���G���[�Ή�              */
/*  �����FVer6.1   2018/10/15 ISID�y�C��P26640�z                                  */
/*  �����FVer6.1   2020/11/23 ISID�y�C��P32190�z                                  */
/**********************************************************************************/
DROP PROCEDURE WEB_SP0061220_S;

CREATE PROCEDURE WEB_SP0061220_S(
	P_KAISYA    IN  WEB_TPFIELD.KAISYACD%TYPE,		/* ��ЃR�[�h			*/
	P_SKBN      IN  NUMBER,   /* 1:�e�[�u���쐬,2:�`�F�b�N,3:�o�^,4:�e�[�u���폜,5:���[�N�ύX,6:�ꊇ�捞 */
	P_KINOU     IN  NUMBER,   /* �@�\�敪 */
	P_KKBN      IN  NUMBER,   /* �捞�h�c */
	P_UPDKBN    IN  VARCHAR2, /* �X�V�敪(1:�ǉ�,2:�u���ǉ�,3:�폜�ǉ�,4:�u��) */
	P_WKKBN     IN  VARCHAR2, /* ܰ��ύX���敪(1:����,2:�ύX,3:�폜) */
	P_KID       IN  VARCHAR2, /* �X�V��Ώۋ敪(0:�ʏ�,���̑�:���ڒP��(�e�r�b�g=0:�ΏۊO,1:�Ώ�)) */
	P_SID       IN  WEB_TPFIELD.SYAINCD%TYPE,   /* �X�V�ҎЈ��R�[�h,ܰ��ύX��(���R�[�h�h�c) */
	P_RID       IN  NUMBER,   /* ���p�҂h�c */
	P_HOSOKU1   IN  VARCHAR2, /* �⑫�敪�P */
	P_HOSOKU2   IN  VARCHAR2, /* �⑫�敪�Q */
	P_HOSOKU3   IN  VARCHAR2, /* �⑫�敪�R */
	P_HOSOKU4   IN  VARCHAR2, /* �⑫�敪�S */
	P_HOSOKU5   IN  VARCHAR2, /* �⑫�敪�T */
	P_SDATE     IN  VARCHAR2, /* �������� */
	P_EXEID     IN  NUMBER,   /* ���s�h�c */
	P_KDATE     IN  VARCHAR2, /* �J�n���� */
	P_ERREXE    IN  VARCHAR2, /* �G���[�Ή� */
	P_UNIQUE    IN  VARCHAR2, /* �d���Ή�(1:��.2:�擪�D��,3:�ŏI�D��) */
	P_YOBI      IN  VARCHAR2, /* �\���t���O */
	P_SYUBETU   IN  NUMBER,   /* �g�D��� */
	P_UPDID     IN  WEB_TPFIELD.UPDID%TYPE, /* �X�V�҂h�c */
	P_ERR       OUT NUMBER    /* �G���[�敪(0:����,-1:�G���[) */
)

IS

TYPE T_LVAR1 IS TABLE OF VARCHAR2(100)   INDEX BY BINARY_INTEGER; /* �z��錾 */
TYPE T_LNUM1 IS TABLE OF NUMBER(5)      INDEX BY BINARY_INTEGER; /* �z��錾 */
TYPE T_LVAR2 IS TABLE OF VARCHAR2(400)  INDEX BY BINARY_INTEGER; /* �z��錾 */
W_SQL      VARCHAR2(32767);  /* �S�r�p�k */
W_SQL2     VARCHAR2(2000);  /* �S�r�p�k */
W_TABLE1   VARCHAR2(100);    /* ���[�N�e�[�u���� */
W_TABLE2   VARCHAR2(100);    /* �ۑ��e�[�u���� */
W_TABLE3   VARCHAR2(100);    /* �`�F�b�N�p�e�[�u���� */
W_TABLE4   VARCHAR2(100);    /* �O����e�[�u���� */
W_VIEW1    VARCHAR2(100);    /* ���[�N�r���[�� */
W_INDEX1   VARCHAR2(100);    /* ���[�N�e�[�u���C���f�b�N�X */
W_INDEX2   VARCHAR2(100);    /* ���[�N�e�[�u���C���f�b�N�X */
W_SKNAME   VARCHAR2(100);    /* �Ј��R�[�h�� */
W_AKNAME   VARCHAR2(100);    /* �����̔ԍ��ږ� */
W_KEYINF   VARCHAR2(400);   /* �L�[��� */
W_ETCKEY   VARCHAR2(400);   /* ���̑��L�[���� */
W_KEYFLD   T_LVAR1;         /* �L�[���(�z��) */
W_KEYCNT   NUMBER(3);       /* �L�[���ڐ� */
W_MSTK1    VARCHAR2(100);    /* �}�X�^�R�[�h����1 */
W_MSTK2    VARCHAR2(100);    /* �}�X�^�R�[�h����2 */
W_I        NUMBER(5);       /* ���[�N�J�E���g */
W_J        NUMBER(5);       /* ���[�N�J�E���g */
W_CNT      NUMBER(10);      /* ���[�N�J�E���g */
W_FCNT     NUMBER(10);      /* ���[�N�J�E���g */
W_NDATA1   NUMBER(10);      /* �J�[�\���擾�f�[�^ */
W_NDATA2   NUMBER(10);      /* �J�[�\���擾�f�[�^ */
W_NDATA3   NUMBER(10);      /* �J�[�\���擾�f�[�^ */
W_VDATA1   VARCHAR2(20);    /* �J�[�\���擾�f�[�^ */
W_VDATA2   VARCHAR2(20);    /* �J�[�\���擾�f�[�^ */
W_DATA1    NUMBER;          /* �擾�f�[�^ */
W_DATA2    NUMBER;          /* �擾�f�[�^ */
W_DATA3    VARCHAR2(20);    /* �擾�f�[�^ */
W_SID      NUMBER(10);      /* ���[�N�Ј��R�[�h */
W_BDATA1   NUMBER(10);      /* */
W_BDATA2   VARCHAR2(20);    /* */
W_BDATA3   VARCHAR2(20);    /* */
W_MSTRKB   VARCHAR2(2);     /* �}�X�^�����敪 */
W_MSTRFI   VARCHAR2(100);    /* �}�X�^�������ږ� */
W_DATE1    DATE;           /* */
W_DATE2    DATE;           /* */
W_DATE3    DATE;           /* */
W_DATE4    DATE;           /* */
W_BDATE1   DATE;           /* */
W_BDATE2   DATE;           /* */
W_SDATE    DATE;           /* */
W_EDATE    DATE;           /* */
W_ID       NUMBER(8);		/* �g�D�}�X�^ �h�c		*/
W_NAME     T_LVAR1;			/* �g�D�}�X�^ ����1�`20	*/
W_TSET     NUMBER(1);       /* �ސE�Ґݒ� */
W_NSET     NUMBER(1);       /* �N���ݒ� */
W_ERRNO    NUMBER(5);       /* ���[�N�G���[�ԍ� */
W_STR_X    NUMBER(3);       /* �����T�[�`�ϐ� */
W_EMSTCNT  NUMBER(5);       /* �}�X�^�G���[�p���� */
W_EMSTCD   T_LNUM1;         /* �}�X�^�G���[�p�i�G���[�敪�j*/
W_EMSTNA   T_LVAR2;         /* �}�X�^�G���[�p�i�G���[���ځj*/
W_INCNT    NUMBER(10);      /* �ꊇ�捞���� */
W_ERRCNT   NUMBER(10);      /* �ꊇ�捞�G���[���� */
W_UPDCNT   NUMBER(10);      /* �ꊇ�捞�o�^���� */
W_WKTBSP   VARCHAR2(100);    /* ���[�N�e�[�u���X�y�[�X */
W_STYPE    NUMBER(1);       /* �Ј��ԍ����� */
W_MSTRKBN  NUMBER(1);       /* �}�X�^�����敪 */
W_CSR      INTEGER;
W_RVL      INTEGER;
W_CSR2     INTEGER;
W_RVL2     INTEGER;
W_ERRCODE  NUMBER;          /* ORACLE�G���[�R�[�h */
W_ERRMSG   VARCHAR2(510);   /* ORACLE�G���[���b�Z�[�W */
W_ERR      NUMBER;          /* �֐��߂�l�p�G���[�敪 */
W_MATRIXTB1  VARCHAR2(200);	/* ���吢��Ǘ��e�[�u�� */
W_MATRIXTB2  VARCHAR2(200);	/* ����}�X�^ */
W_MATRIXTB3  VARCHAR2(200);	/* ����}�X�^�\���� */
W_MRNK		NUMBER(3);		/* �ő僉���N�i�萔�j			*/

W_KDATA1   NUMBER(8);       /* ���ԏd���f�[�^���[�N(�h�c) */
W_KDATA2   NUMBER(3);       /* ���ԏd���f�[�^���[�N(���_�R�[�h) */
W_KDATA3   DATE;            /* ���ԏd���f�[�^���[�N(�J�n��) */
W_KDATA4   DATE;            /* ���ԏd���f�[�^���[�N(�I����) */
W_KDATA5   NUMBER(8);       /* ���ԏd���f�[�^���[�N(��ЃR�[�h) */

W_SDATA1   NUMBER(8);       /* ���ԏd���f�[�^���[�N(�h�c) */
W_SDATA2   VARCHAR2(20);    /* ���ԏd���f�[�^���[�N(�Ј��R�[�h) */
W_SDATA3   NUMBER(3);       /* ���ԏd���f�[�^���[�N(��Q���x��) */
W_SDATA4   DATE;            /* ���ԏd���f�[�^���[�N(�J�n��) */
W_SDATA5   DATE;            /* ���ԏd���f�[�^���[�N(�I����) */
W_GRPINF   VARCHAR2(400);   /* �O���[�v��� */
W_KFLG     VARCHAR2(2);     /* �P���Љ^�p�t���O */
W_KKFLG    NUMBER(1);       /* ���_�}�X�^�[��ЊǗ����f */

W_MID       NUMBER(8);      /* �}�X�^�h�c */
W_KKBN      NUMBER(1);      /* ��Ћ敪 */
W_KNAME     VARCHAR2(100);   /* ���ږ� */
W_CKOMOKU   VARCHAR2(100);   /* �R�[�h���� */
W_ONAME     VARCHAR2(400);  /* �}�X�^���� */
W_GNAME     VARCHAR2(100);   /* ��ʖ��� */
W_CID       NUMBER(3);      /* ���ڂh�c */
W_KAISYA    NUMBER(8);      /* �}�X�^�����p��ЃR�[�h�i�S�Ў��l���j */

W_UPDFLG    T_LNUM1;        /* �X�V���E�X�V�҃R�[�h�X�V�t���O */
W_COLUMN    VARCHAR2(60);   /* ���[�N���ږ��ϐ� */
W_NULLCD   VARCHAR2(200);   /* ��(NULL)���͔��f�R�[�h(NULL:�ύX�Ȃ�,NULL�ȊO:��(NULL)����) */
W_MSTERRINI NUMBER(5);      /* �}�X�^�[�����ݎ���ERRID�����l */
W_NRENKEI  VARCHAR2(50);    /* �}�C�i���o�[�Ǘ��A�g�ݒ�				*/

W_POST_KAISYA   NUMBER(8);  /* �|�X�g�̉�ЃR�[�h */
W_GROUP_KAISYA  NUMBER(8);  /* �Ǘ��O���[�v��ЃR�[�h */
W_GROUP_NUMBER  NUMBER(5);  /* �Ǘ��O���[�v�Ǘ��ԍ�*/
W_POST_FLG      NUMBER(1);  /* �|�X�g�Ǘ��t���O */

/* ���ڏ�� */
CURSOR C_001 IS
	SELECT
		A.ITEM_ID,         /* ���ڂh�c */
		A.ITEM_NAME,           /* ���ږ� */
		A.DATA_TYPE,           /* �^�C�v */
		A.DATA_SIZE,           /* �T�C�Y */
		A.FRACTION_SIZE,       /* �����T�C�Y */
		A.REFERENCE_DIV,         /* �Q�Ƌ敪 */
		B.OBJECT_NAME MASTER_NAME,   /* �}�X�^�� */
		A.MASTER_LINK_ITEM, /* �}�X�^�����N���� */
		B.CODE_ITEM MASTER_CODE_ITEM, /* �}�X�^�R�[�h���� */
		A.LITERAL_CONTENT,     /* ���e�������e */
		A.MASTER_ID,       /* �}�X�^�h�c */
		NVL(C.MANAGEMENT_NAME,A.MANAGEMENT_NAME) MANAGEMENT_NAME, /* �Ǘ����� */
		B.CORP_DIV,         /* ��Ћ敪 */
		A.TAKE_DIV,         /* �捞�敪 */
	    0   SO_CLS_ID,      /* �g�D���ދ敪 */
	    '0' SO_CLS_USE,     /* �g�D���ގg�p�敪 */
	    ''  SO_CLS_NAME     /* �g�D���ޖ� */
	  FROM WEB_TP0060720_M A,
	       WEB_TP0110210_M B,
	       WEB_TP0060721_M C
	 WHERE A.FUNCTION_DIV = P_KINOU
	   AND A.TAKE_ID=P_KKBN
	   AND A.MASTER_ID=B.IDENTIFIER(+)
	   AND C.KAISYACD(+)=P_KAISYA
	   AND A.FUNCTION_DIV=C.FUNCTION_DIV(+)
	   AND A.TAKE_ID=C.TAKE_ID(+)
	   AND A.ITEM_ID=C.ITEM_ID(+)
	 ORDER BY A.ITEM_ID;

C_001_REC C_001%ROWTYPE;

CURSOR C_101 IS
	SELECT
	    A.ITEM_ID,                                             /* ���ڂh�c */
	    A.ITEM_NAME,                                               /* ���ږ� */
	    A.DATA_TYPE,                                               /* �^�C�v */
	    NVL(D.MAX_SIZE,A.DATA_SIZE),                             /* �T�C�Y */
	    A.FRACTION_SIZE,                                           /* �����T�C�Y */
	    DECODE(NVL(D.MASTER_ID,0),0,A.REFERENCE_DIV,1),             /* �Q�Ƌ敪 */
	    NVL(E.OBJECT_NAME,B.OBJECT_NAME) MASTER_NAME,        /* �}�X�^�� */
	    A.MASTER_LINK_ITEM,                                     /* �}�X�^�����N���� */
	    NVL(E.CODE_ITEM,B.CODE_ITEM) MASTER_CODE_ITEM,        /* �}�X�^�R�[�h���� */
	    A.LITERAL_CONTENT,                                         /* ���e�������e */
	    NVL(D.MASTER_ID,A.MASTER_ID),                         /* �}�X�^�h�c */
	    NVL(D.SCREEN_NAME,NVL(C.MANAGEMENT_NAME,A.MANAGEMENT_NAME)) MANAGEMENT_NAME,    /* �Ǘ����� */
	    NVL(E.CORP_DIV,B.CORP_DIV),                             /* ��Ћ敪 */
	    NVL(D.USAGE_DIV,A.TAKE_DIV),                              /* �捞�敪 */
	    NVL(F.IDENTIFIER,0)   SO_CLS_ID,                          /* �g�D���ދ敪 */
	    NVL(F.USAGE_DIV,'0')  SO_CLS_USE,                         /* �g�D���ގg�p�敪 */
		F.CLS_NAME            SO_CLS_NAME                         /* �g�D���ޖ� */
	  FROM WEB_TP0060720_M A,
	       WEB_TP0110210_M B,
	       WEB_TP0060721_M C,
	       WEB_TC0000040_M D,
	       WEB_TP0110210_M E,
	       WEB_TC0000210_M F
	 WHERE A.FUNCTION_DIV      = P_KINOU
	   AND A.TAKE_ID      = P_KKBN
	   AND A.MASTER_ID    = B.IDENTIFIER(+)
	   AND C.KAISYACD(+) = P_KAISYA
	   AND A.FUNCTION_DIV      = C.FUNCTION_DIV(+)
	   AND A.TAKE_ID      = C.TAKE_ID(+)
	   AND A.ITEM_ID      = C.ITEM_ID(+)
	   AND D.ORGANIZATION_ID(+)   = P_SYUBETU
	   AND D.MASTER_ID    = E.IDENTIFIER(+)
	   AND (A.ITEM_ID - DECODE(P_KKBN,2,26,3,7,17,25)) = D.IDENTIFIER(+)
	   AND F.ORGANIZATION_ID(+)   = P_SYUBETU
	   AND (A.ITEM_ID - DECODE(P_KKBN,2,75,3,56,17,74)) = F.IDENTIFIER(+)
	   AND NOT (A.ITEM_ID = DECODE(P_KKBN,2,24,3,4,17,23) AND W_POST_FLG = 0)
	 ORDER BY A.ITEM_ID;

C_101_REC C_101%ROWTYPE;

CURSOR C_102 IS
	SELECT
		A.ITEM_ID,                    /* ���ڂh�c */
		A.ITEM_NAME,                  /* ���ږ� */
		A.DATA_TYPE,                  /* �^�C�v */
		A.DATA_SIZE,                  /* �T�C�Y */
		A.FRACTION_SIZE,              /* �����T�C�Y */
		A.REFERENCE_DIV,              /* �Q�Ƌ敪 */
		B.OBJECT_NAME MASTER_NAME,    /* �}�X�^�� */
		A.MASTER_LINK_ITEM,           /* �}�X�^�����N���� */
		B.CODE_ITEM MASTER_CODE_ITEM, /* �}�X�^�R�[�h���� */
		A.LITERAL_CONTENT,            /* ���e�������e */
		A.MASTER_ID,                  /* �}�X�^�h�c */
		A.MANAGEMENT_NAME,            /* �Ǘ����� */
		B.CORP_DIV  ,                 /* ��Ћ敪 */
		'1' TAKE_DIV,                 /* �捞�敪 */
	    0   SO_CLS_ID,                /* �g�D���ދ敪 */
	    '0' SO_CLS_USE,               /* �g�D���ގg�p�敪 */
	    ''  SO_CLS_NAME               /* �g�D���ޖ� */
	  FROM WEB_TP0009108_W A,
	       WEB_TP0110210_M B
	 WHERE A.CUSTOMER_ID = P_RID
	   AND A.MASTER_ID=B.IDENTIFIER(+)
	 ORDER BY A.ITEM_ID;

C_102_REC C_102%ROWTYPE;

/* �e�[�u����� */
CURSOR C_002 IS
	SELECT
		UPDATE_TABLE_NAME,
		OTHER_KEY
	  FROM WEB_TP0060710_M
	 WHERE FUNCTION_DIV = P_KINOU
	   AND TAKE_ID = P_KKBN;

/* �o�^���ڏ�� */
CURSOR C_003 IS
	SELECT
		A.ITEM_NAME,
		A.TAKE_DIV
	  FROM WEB_TP0060720_M A
	 WHERE A.FUNCTION_DIV = P_KINOU
	   AND A.TAKE_ID = P_KKBN
	   AND (A.TAKE_DIV <> '0'
	    OR  (A.FUNCTION_DIV = 11 AND A.TAKE_ID IN (1,4,5,6,7,8,9) AND A.ITEM_NAME IN ('KAISYACD','KAISYACD'))
	    OR  (A.FUNCTION_DIV = 214 AND A.TAKE_ID IN (2,4,6,7) AND A.TAKE_DIV = '0')
	    OR  (A.FUNCTION_DIV = 432 AND A.TAKE_ID IN (1,2) AND A.TAKE_DIV = '0'))
	   AND A.ITEM_NAME <> 'EMP_KAISYACD'
	ORDER BY A.ITEM_ID
;

/* �L�[��� */
CURSOR C_011 IS
	SELECT
		A.ITEM_NAME F001  /* ���ږ� */
	  FROM WEB_TP0060720_M A
	 WHERE A.FUNCTION_DIV = P_KINOU
	   AND A.TAKE_ID=P_KKBN
	   AND A.KEY_ITEM IS NOT NULL
 ORDER BY A.ITEM_ID;

/* �Ј��ԍ����ڃ`�F�b�N */
CURSOR C_021 IS
	SELECT
		A.ITEM_ID,   /* ���ڂh�c */
		A.ITEM_NAME      /* ���ږ� */
	  FROM WEB_TP0060720_M A
	 WHERE A.FUNCTION_DIV = P_KINOU
	   AND A.TAKE_ID = P_KKBN
	   AND A.TAKE_DIV = '5'
 ORDER BY A.ITEM_ID;

/* ��Џ�� */
CURSOR C_031 IS
	SELECT
		A.KAISYACD
	  FROM KAISYA_MS A
 ORDER BY A.KAISYACD;

 /**********************************************************************/
/* �w�胉���N����SQL������擾                                        */
/**********************************************************************/
FUNCTION GET_SQLRANKFLD
(
	 FP_MRNK	IN NUMBER					/* �����N�� */
	,FP_TBL		IN VARCHAR2					/* �e�[�u���E�f���~�^ */
	,FP_FLD		IN VARCHAR2					/* ���ږ� */
) RETURN VARCHAR2
IS
	FW_I			INTEGER;				/* ���[�v�p					*/
	FW_SQL			VARCHAR2(2000);			/* SQL������				*/
	FW_TBL			VARCHAR2(2000);			/* �e�[�u���E�f���~�^		*/
BEGIN
	FW_SQL := NULL;

	IF FP_TBL IS NOT NULL THEN
		FW_TBL := FP_TBL || '.';
	ELSE
		FW_TBL := NULL;
	END IF;

	FOR FW_I IN 1..FP_MRNK LOOP
		FW_SQL := FW_SQL || ',' || FW_TBL || FP_FLD || FW_I;
	END LOOP;

	RETURN FW_SQL;
END;

BEGIN

/**********************************************************************/
/* �⑫�L�[���                                                       */
/*  �ٓ�(P_HOSOKU1:�V����ԍ�,P_HOSOKU2:�����h�c,P_HOSOKU3:���J�h�c)  */
/*  �g�D�E�g�D(����)�E�g�D(�ꗗ)(P_HOSOKU3:�L�����t)                  */
/*  �g�D(�ꗗ)(P_HOSOKU1:����ԍ�,P_HOSOKU2:�}�X�^�`�F�b�N)           */
/*  214-1(P_HOSOKU1:����ԍ�,P_HOSOKU2:�ڕW�ԍ�)                      */
/*  213-3(P_HOSOKU1:���,P_HOSOKU2:����ԍ�,P_HOSOKU3:����ԍ�,P_HOSOKU4:�ڕW�ԍ�) */
/*  213-4(P_HOSOKU1:���,P_HOSOKU2:����ԍ�,P_HOSOKU3:�J�n�����N,P_HOSOKU4:�I�������N) */
/*  214-5(P_HOSOKU1:����ԍ�,P_HOSOKU2:�ڕW�ԍ�)                      */
/**********************************************************************/
/**********************************************************************/
/* �s�G���[���e(�̗pSP�Q�Ƃ��蒍��)                                   */
/*    1000�`:�Ј��ԍ�������                                           */
/*    2000�`:�Ј��ԍ��ΏۊO�i�ڕW�Ǘ��j                               */
/*    3000�`:�}�X�^�����݁i�ڕW�Ǘ��j                                 */
/*    2:�L�[�d��(�捞��)                                              */
/*    3:�L�[�d��(�����f�[�^)                                          */
/*    4:�u���f�[�^������(���ڎw�莞�A�u���捞��)                      */
/*    8:���ԏd��(�捞��)                                              */
/*    9:���ԏd��(�����f�[�^)                                          */
/*   100�`199:�}�X�^������                                            */
/*   201:�l�ۓ_���捞����l�ێ�������                                 */
/*   202:�{�l�捞�s��                                                 */
/*   301:���ߖ{�l�ΏۊO����                                           */
/*   401:���Ə��}�X�^(���Ə��R�[�h�d��)                               */
/*   402:���Ə��}�X�^(�\�����d��)                                     */
/*   403:���Ə��}�X�^(�܂Ƃߎ��Ə��R�[�h������)                       */
/*   404:���Ə��}�X�^(�܂Ƃߎ��Ə��K�w�s��)                           */
/*   405:���Ə��}�X�^(����Г������U�R�[�h�d��)                       */
/*   406:���Ə��Еۃ}�X�^(���^���Ə����I��)                           */
/*   411:�g�D�}�X�^(�����敪)                                         */
/*   412:�g�D�}�X�^(���喼�̏d��)                                     */
/*   413:�g�D�}�X�^(�����R�[�h�d��)                                   */
/*   414:�g�D�}�X�^(���喼�̓o�^��)                                   */
/*   415:�g�D�}�X�^(���喼�̖��o�^)                                   */
/*   416:�g�D�}�X�^(�폜���ǉ����A�����敪)                           */
/*   417:�g�D�}�X�^(�����敪�d��)                                     */
/*   418:�g�D�}�X�^(��ʕ���������)                                   */
/*   421:��Q�ҏ��(�}�X�^�֘A�`�F�b�N)                               */
/*   431:�ڕW�Ǘ�(�V�[�g������)                                       */
/*   441:�ڕW�Ǘ�-�g�D(�����A�V�[�g�֘A�`�F�b�N)                      */
/*   442:�ڕW�Ǘ�-�g�D(���僉���N�A����R�[�h������)                  */
/*   443:�ڕW�Ǘ�-�g�D(���僉���N�A����R�[�h�ΏۊO)                  */
/*   444:�ڕW�Ǘ�-����(�]���ҋ敪�ƕ]���҃R�[�h�̊֘A�`�F�b�N)        */
/*   445:�ڕW�Ǘ�-����(���ʕ]����]���Ґݒ�̑��݃`�F�b�N)            */
/*   446:�ڕW�Ǘ�-����(���ʕ]�����͎Ґݒ�̑��݃`�F�b�N)              */
/*   447:�ڕW�Ǘ�-�g�D(��]���Ґݒ�̑ΏۊO�̎Ј����݃`�F�b�N)        */
/*   451:�ڕW�Ǘ��|��]���Ґݒ�(�S���O���[�v�͈̓`�F�b�N)             */
/*   452:�ڕW�Ǘ��|��]���Ґݒ�(���w��E�w��L��̑��݃`�F�b�N)       */
/**********************************************************************/
/**********************************************************************/
/* ��������                                                           */
/**********************************************************************/
	P_ERR := 0;
	W_WKTBSP := WEB_SP0002000_F(10);
	W_STYPE := WEB_SP0002000_F(1);
	W_KFLG := WEB_SP0002000_F(30);
	W_NRENKEI := WEB_SP0002000_F(300);
	W_NULLCD := WEB_SP0002260_F(999,1,1,64);
	W_EMSTCNT :=0;
	W_CSR := DBMS_SQL.OPEN_CURSOR;
	W_CSR2 := DBMS_SQL.OPEN_CURSOR;
	W_TABLE1 := 'WEB_TP0060700_W_' || P_RID;
	W_INDEX1 := 'WEB_IP0060700_W1_' || P_RID;
	W_INDEX2 := 'WEB_IP0060700_W2_' || P_RID;

	/* �g�D�}�X�^�ő僉���N�擾 */
	W_MRNK := WEB_SP0002000_F(8);

	/* ���吢��Ǘ��e�[�u���̃e�[�u�������擾���� */
	W_MATRIXTB1 := WEB_SP0001240_F(1, P_SYUBETU);

	/* ����}�X�^�̃e�[�u�������擾���� */
	W_MATRIXTB2 := WEB_SP0001240_F(2, P_SYUBETU);

	/* ����}�X�^�\�����̃e�[�u�������擾���� */
	W_MATRIXTB3 := WEB_SP0001240_F(3, P_SYUBETU);

	/* �}�X�^�����敪 */
	IF P_KINOU = 11 AND P_KKBN = 9 THEN
		W_MSTRKBN := WEB_SP0002420_F(1,253);
		W_KKFLG := WEB_SP0002000_F(33);
	ELSE
		W_MSTRKBN := 0;
		W_KKFLG := 1;
	END IF;

/**********************************************************************/
/* �L�[���擾                                                       */
/**********************************************************************/
	W_KEYCNT := 0;
	IF P_SKBN = 2 OR P_SKBN = 3 OR P_SKBN = 5  OR P_SKBN = 6 THEN
		W_KEYINF := '';
		FOR C_011_REC IN C_011 LOOP
			IF W_KKFLG = 0 THEN
				IF C_011_REC.F001 <> 'KAISYACD' THEN
					W_KEYCNT := W_KEYCNT + 1;
					W_KEYFLD(W_KEYCNT) := C_011_REC.F001;
					W_KEYINF := W_KEYINF || ',' || C_011_REC.F001;
				END IF;
			ELSE
				W_KEYCNT := W_KEYCNT + 1;
				W_KEYFLD(W_KEYCNT) := C_011_REC.F001;
				W_KEYINF := W_KEYINF || ',' || C_011_REC.F001;
			END IF;
		END LOOP;
		W_KEYINF := SUBSTR(W_KEYINF,2);
		IF P_KINOU = 11 AND P_KKBN = 9 THEN
			IF W_MSTRKBN = 1 THEN
				W_KEYCNT := W_KEYCNT + 1;
				W_KEYFLD(W_KEYCNT) := 'BEGIN_DAY';
				W_GRPINF := W_KEYINF;
				W_KEYINF := W_KEYINF || ',BEGIN_DAY';
			END IF;
		ELSIF P_KINOU = 451 AND P_KKBN = 1 THEN
			W_GRPINF := 'EMP_CODE,FAULT_LEVEL';
		END IF;
	END IF;

/**********************************************************************/
/* �e�[�u�����擾����                                               */
/**********************************************************************/
	FOR C_002_REC IN C_002 LOOP
		W_TABLE2 := C_002_REC.UPDATE_TABLE_NAME;
		W_ETCKEY := C_002_REC.OTHER_KEY;
		IF P_KINOU = 11 AND P_KKBN = 9 THEN
			IF W_MSTRKBN = 1 THEN
				W_TABLE2 := 'BASE_MS_HISTORY';
			END IF;
		END IF;
	END LOOP;

/**********************************************************************/
/* �e�[�u���쐬                                                       */
/**********************************************************************/
	IF P_SKBN = 1 THEN
		/* �O��e�[�u���폜 */
		WEB_SP0003020_S(1,W_TABLE1);

		W_I := 1;

		/* �e�[�u���쐬 */
		W_SQL := 'CREATE TABLE ' || W_TABLE1 || ' (';
		W_SQL := W_SQL || ' IDENTIFIER NUMBER(8)';
		W_SQL := W_SQL || ',ERROR NUMBER(5)';
		W_SQL := W_SQL || ',DELETE_DIV VARCHAR2(2)';
		FOR C_001_REC IN C_001 LOOP
			W_SQL := W_SQL || ',' || C_001_REC.ITEM_NAME || ' ' || C_001_REC.DATA_TYPE;
			IF P_KINOU = 11 AND P_KKBN IN (2,3,17) AND SUBSTR(C_001_REC.ITEM_NAME,1,8) = 'AUX_CHAR' THEN
				W_SQL := W_SQL || '(255)';
			ELSIF C_001_REC.DATA_TYPE = 'VARCHAR2' OR C_001_REC.DATA_TYPE = 'CHAR' THEN
				W_SQL := W_SQL || '(' || C_001_REC.DATA_SIZE || ')';
			ELSIF C_001_REC.DATA_TYPE = 'NUMBER' THEN
				W_SQL := W_SQL || '(' || C_001_REC.DATA_SIZE || '';
				IF C_001_REC.FRACTION_SIZE IS NOT NULL THEN
					W_SQL := W_SQL || ',' || C_001_REC.FRACTION_SIZE || '';
				END IF;
				W_SQL := W_SQL || ')';
			END IF;
			IF C_001_REC.TAKE_DIV = '5' THEN
				W_SQL := W_SQL || ',SYAINCD' || W_I || ' VARCHAR2(20)';
				W_I := W_I + 1;
			END IF;
		END LOOP;
		IF W_MSTRKBN = 1 THEN
			W_SQL := W_SQL || ',BEGIN_DAY DATE';
			W_SQL := W_SQL || ',END_DAY DATE';
		END IF;
		IF P_KINOU = 214 AND (P_KKBN = 3 OR P_KKBN = 4) AND W_KFLG = '0' THEN
			W_SQL := W_SQL || ',KAISYACD2 NUMBER(8)';
		END IF;
		W_SQL := W_SQL || ',AUX1 VARCHAR2(100)';
		W_SQL := W_SQL || ')';
		W_SQL := W_SQL || ' PCTFREE 10';
		W_SQL := W_SQL || ' PCTUSED 80';
		IF W_WKTBSP IS NOT NULL THEN
			W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' ';
		END IF;
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);

		/* TDE */
		WEB_SP0003230_S('WEB_SP0061220_S',41,W_TABLE1,P_RID,P_ERR);
		IF P_ERR <> 0 THEN
			GOTO L_EXIT;
		END IF;

	END IF;

/**********************************************************************/
/* �����ϊ�����                                                       */
/**********************************************************************/
	IF P_SKBN = 2 OR (P_SKBN=5 AND P_WKKBN=1) OR P_SKBN = 6 THEN
	/**********************************************************************/
	/* �ڕW�Ǘ��|�g�D(�����R�[�h�����僉���N�E����R�[�h�ϊ�����)         */
	/**********************************************************************/
		IF P_KINOU = 214 AND (P_KKBN = 3 OR P_KKBN = 4) THEN
			IF W_KFLG = '0' THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A SET';
				W_SQL := W_SQL || ' (A.DEPT_RANK,A.DEPT_CODE)=(';
				W_SQL := W_SQL || ' SELECT B.RANK,B.CODE_VALUE';
				W_SQL := W_SQL || '   FROM (SELECT B1.AGE_NUMBER,B1.RANK,B1.CODE_VALUE,B3.LINK_CORP_CODE KAISYACD,B1.SALARY_BELONG_CODE';
				W_SQL := W_SQL || '           FROM ' || WEB_SP0002290_F(1,P_KKBN,3) || ' B1'; /* ����}�X�^�\���� */
				W_SQL := W_SQL || '               ,' || WEB_SP0002290_F(1,P_KKBN,2) || ' B2'; /* ����}�X�^ */
				W_SQL := W_SQL || '               ,' || WEB_SP0002290_F(1,P_KKBN,4) || ' B3'; /* �����ИA�g�}�X�^ */
				W_SQL := W_SQL || '  WHERE B1.RANK=B2.RANK';
				W_SQL := W_SQL || '    AND B1.CODE_VALUE=B2.CODE_VALUE';
				W_SQL := W_SQL || '    AND B2.CODE_VALUE1=B3.DEPT_CODE) B';
				W_SQL := W_SQL || '  WHERE B.AGE_NUMBER=WEB_SP0002021_F(' || WEB_SP0002290_F(1,P_KKBN,0) || ',1,:ORA_1)';
				W_SQL := W_SQL || '    AND B.KAISYACD=A.KAISYACD2';
				W_SQL := W_SQL || '    AND B.SALARY_BELONG_CODE=A.BELONG_CODE)';
				W_SQL := W_SQL || ' WHERE A.DEPT_RANK IS NULL';
			ELSE
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A SET';
				W_SQL := W_SQL || ' (A.DEPT_RANK,A.DEPT_CODE)=(';
				W_SQL := W_SQL || ' SELECT B.RANK,B.CODE_VALUE';
				W_SQL := W_SQL || '   FROM ' || WEB_SP0002290_F(1,P_KKBN,3) || ' B'; /* ����}�X�^�\���� */
				W_SQL := W_SQL || '  WHERE B.KAISYACD=:ORA_2';
				W_SQL := W_SQL || '    AND B.AGE_NUMBER=WEB_SP0002022_F(:ORA_2,' || WEB_SP0002290_F(1,P_KKBN,0) || ',1,:ORA_1)';
				W_SQL := W_SQL || '    AND B.SALARY_BELONG_CODE=A.BELONG_CODE)';
				W_SQL := W_SQL || ' WHERE A.DEPT_RANK IS NULL';
			END IF;
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' AND A.IDENTIFIER=0';
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_HOSOKU1);
			IF W_KFLG = '1' THEN
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_KAISYA);
			END IF;
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;
	END IF;

/**********************************************************************/
/* �`�F�b�N����                                                       */
/**********************************************************************/
	IF P_SKBN = 2 OR (P_SKBN=5 AND P_WKKBN=1) OR P_SKBN = 6 THEN

	/**********************************************************************/
	/* �C���f�b�N�X�쐬                                                   */
	/**********************************************************************/
		IF P_SKBN = 2 OR P_SKBN = 6 THEN
			/* �h�c�ɑ΂��� */
			W_SQL := 'CREATE INDEX ' || W_INDEX1 || ' ON ' || W_TABLE1;
			W_SQL :=  W_SQL || '(IDENTIFIER)'; 
			W_SQL :=  W_SQL || ' PCTFREE 5'; 
			IF W_WKTBSP IS NOT NULL THEN
				W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' '; 
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/* �L�[���ڂɑ΂��� */
			IF W_KEYINF IS NOT NULL THEN
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
	/* �Ј��ԍ�������                                                     */
	/**********************************************************************/
		IF P_SKBN = 2 OR P_SKBN = 6 THEN
			FOR C_021_REC IN C_021 LOOP
				IF P_KINOU = 214 AND P_KKBN IN (1,2,6) AND P_KAISYA = 0 AND W_KFLG = '1' THEN
					W_ERRNO := 1000 + C_021_REC.ITEM_ID;
				ELSIF P_KINOU = 214 AND P_KKBN IN (5,7) AND P_KAISYA = 0 AND W_KFLG = '1' THEN
					IF C_021_REC.ITEM_ID = 3 THEN
						W_ERRNO := 1003;
					ELSIF C_021_REC.ITEM_ID = 5 THEN
						W_ERRNO := 1006;
					END IF;
				ELSE
					W_ERRNO := 1000 + C_021_REC.ITEM_ID -1;
				END IF;
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || W_ERRNO;
				W_SQL := W_SQL || ' WHERE ' || C_021_REC.ITEM_NAME || ' IS NULL';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END LOOP;
		END IF;

	/**********************************************************************/
	/* �L�[�d��(�捞��)                                                   */
	/**********************************************************************/
		IF W_KEYINF IS NOT NULL THEN
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
					IF W_AKNAME IS NOT NULL THEN
						W_SQL := W_SQL || ' WHERE ' || W_AKNAME || ' IS NOT NULL';
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
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=7';
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
						IF W_AKNAME IS NOT NULL THEN
							W_SQL := W_SQL || ' AND ' || W_AKNAME || ' IS NOT NULL';
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
		END IF;

	/**********************************************************************/
	/* �L�[�d��(�����f�[�^)                                               */
	/**********************************************************************/
		IF P_UPDKBN = 1 AND W_KEYINF IS NOT NULL AND W_TABLE2 IS NOT NULL THEN
			IF P_SKBN = 2 OR P_SKBN = 6 THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=3';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				W_SQL := W_SQL || '    FROM ' || W_TABLE2 || ')';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			ELSIF P_SKBN = 5 THEN
				IF P_ERR = 0 THEN
					W_SQL := 'SELECT COUNT(*) COEFFICIENT';
					W_SQL := W_SQL || ' FROM ' || W_TABLE2;
					W_SQL := W_SQL || ' WHERE (' || W_KEYINF || ') IN (';
					W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
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

	/**********************************************************************/
	/* �����f�[�^������(���ڒP�ʎ捞�E�u���̂�)                           */
	/**********************************************************************/
		IF P_KID <> '0' OR P_UPDKBN = 4 THEN
			IF P_SKBN = 2 OR P_SKBN = 6 THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=4';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND (' || W_KEYINF || ') NOT IN (';
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				IF P_KINOU = 11 AND P_KKBN = 3 THEN
					W_SQL := W_SQL || '    FROM ' || W_MATRIXTB3;
					W_SQL := W_SQL || '   WHERE AGE_NUMBER = :ORA_HOSOKU1';
					W_SQL := W_SQL || '     AND KAISYACD = :ORA_KAISYA';
				ELSE
					W_SQL := W_SQL || '    FROM ' || W_TABLE2;
				END IF;
				W_SQL := W_SQL || '  )';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				IF P_KINOU = 11 AND P_KKBN = 3 THEN
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_HOSOKU1',P_HOSOKU1);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA',P_KAISYA);
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			ELSIF P_SKBN = 5 THEN
				IF P_ERR = 0 THEN
					W_SQL := 'SELECT COUNT(*) COEFFICIENT';
					W_SQL := W_SQL || ' FROM ' || W_TABLE2;
					W_SQL := W_SQL || ' WHERE (' || W_KEYINF || ') IN (';
					W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
					W_SQL := W_SQL || '    FROM ' || W_TABLE1;
					W_SQL := W_SQL || '   WHERE IDENTIFIER = 0)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
					IF W_DATA1 = 0 THEN
						P_ERR := 1;
					END IF;
					IF P_ERR = 1 THEN
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=4';
						W_SQL := W_SQL || ' WHERE IDENTIFIER = 0';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				END IF;
			END IF;
		END IF;

	/**********************************************************************/
	/* ���������ԏd��                                                     */
	/**********************************************************************/
		IF W_MSTRKBN = 1 THEN
			IF P_SKBN = 5 AND P_WKKBN = 1 THEN
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
				W_SQL := W_SQL || '    AND A.BASE_CODE = B.BASE_CODE';
				IF W_KKFLG = 1 THEN
					W_SQL := W_SQL || '    AND A.KAISYACD = B.KAISYACD';
				END IF;
				DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_CNT);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR2);
				DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_CNT);

				IF W_CNT > 0 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=8';
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER = 0';
					DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR2);

					P_ERR := 8;
				ELSE
					/* �G���[��Ԃ��N���A */
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
					W_SQL := W_SQL || ' WHERE ERROR = 8';
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
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* ���_�R�[�h */
					IF W_KKFLG = 1 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* ��ЃR�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* �I���� */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* �I���� */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* �h�c */
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* ���_�R�[�h */
							IF W_KKFLG = 1 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* ��ЃR�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* �I���� */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �I���� */
							END IF;
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=8';
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
							W_SQL := W_SQL || '    AND BASE_CODE = :ORA_2';
							IF W_KKFLG = 1 THEN
								W_SQL := W_SQL || '    AND KAISYACD = :ORA_3';
							END IF;
							W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
							W_SQL := W_SQL || '  GROUP BY ' || W_GRPINF || ')';
							DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA3);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA4);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',W_KDATA2);
							IF W_KKFLG = 1 THEN
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_3',W_KDATA5);
							END IF;
							W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
						ELSE
							EXIT;
						END IF;
					END LOOP;
				END IF;
			ELSE
				W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* �h�c*/
				DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* ���_�R�[�h */
				IF W_KKFLG = 1 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* ��ЃR�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* �I���� */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* �I���� */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);	/* �h�c */
						DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* ���_�R�[�h */
						IF W_KKFLG = 1 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* ��ЃR�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* �I���� */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �I���� */
						END IF;
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=8';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER = (';
						W_SQL := W_SQL || ' SELECT ' || W_KDATA1 || ' FROM ' || W_TABLE1;
						W_SQL := W_SQL || '  WHERE BEGIN_DAY <= :ORA_0';
						W_SQL := W_SQL || '    AND NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_1';
						W_SQL := W_SQL || '    AND BASE_CODE = :ORA_2';
						IF W_KKFLG = 1 THEN
							W_SQL := W_SQL || '    AND KAISYACD = :ORA_3';
						END IF;
						W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
						W_SQL := W_SQL || '  GROUP BY ' || W_GRPINF || ')';
						DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA4);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA3);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',W_KDATA2);
						IF W_KKFLG = 1 THEN
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_3',W_KDATA5);
						END IF;
						W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
					ELSE
						EXIT;
					END IF;
				END LOOP;
				/* �G���[8�`�F�b�N */
				W_SQL := 'SELECT COUNT(*) COEFFICIENT';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE ERROR = 8';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
				IF W_DATA1 > 0 THEN
					P_ERR := 8;
				END IF;
			END IF;
		END IF;

	/**********************************************************************/
	/* ���������ԏd��(�����f�[�^)                                         */
	/**********************************************************************/
		IF W_MSTRKBN = 1 THEN
			IF P_UPDKBN IN (1,2) THEN
				IF P_SKBN = 5 AND P_WKKBN = 1 THEN
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
					W_SQL := W_SQL || '    AND A.BASE_CODE = B.BASE_CODE';
					IF W_KKFLG = 1 THEN
						W_SQL := W_SQL || '    AND A.KAISYACD = B.KAISYACD';
						W_SQL := W_SQL || '    AND B.KAISYACD = C.KAISYACD(+)';
					END IF;
					W_SQL := W_SQL || '    AND C.IDENTIFIER(+) <> 0';
					W_SQL := W_SQL || '    AND C.IDENTIFIER(+) <> ' || P_SID;
					W_SQL := W_SQL || '    AND C.DELETE_DIV(+) IS NULL';
					W_SQL := W_SQL || '    AND B.BEGIN_DAY = C.BEGIN_DAY(+)';
					W_SQL := W_SQL || '    AND B.BASE_CODE = C.BASE_CODE(+)';

					DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_CNT);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR2);
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR2);
					DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_CNT);

					IF W_CNT > 0 THEN
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=9';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER = 0';
						DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR2);

						P_ERR := 9;
					ELSE
						/* �G���[��Ԃ��N���A */
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
						W_SQL := W_SQL || ' WHERE ERROR = 9';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);

						W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
						W_SQL := W_SQL || '  FROM ' || W_TABLE1;
						W_SQL := W_SQL || ' WHERE IDENTIFIER <> 0';
						W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
						W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* �h�c*/
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* ���_�R�[�h */
						IF W_KKFLG = 1 THEN
							DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* ��ЃR�[�h */
							DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* �J�n�� */
							DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* �I���� */
						ELSE
							DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* �J�n�� */
							DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* �I���� */
						END IF;
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						LOOP
							W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
							IF W_RVL > 0 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* �h�c */
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* ���_�R�[�h */
								IF W_KKFLG = 1 THEN
									DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* ��ЃR�[�h */
									DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* �J�n�� */
									DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* �I���� */
								ELSE
									DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �J�n�� */
									DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �I���� */
								END IF;
								W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=9';
								W_SQL := W_SQL || ' WHERE ERROR IS NULL';
								W_SQL := W_SQL || '   AND IDENTIFIER = (';
								W_SQL := W_SQL || ' SELECT ' || W_KDATA1;
								W_SQL := W_SQL || '   FROM ' || W_TABLE2 || ' A';
								W_SQL := W_SQL || '      , ' || W_TABLE1 || ' B';
								W_SQL := W_SQL || '  WHERE ((A.BEGIN_DAY > :ORA_0';
								W_SQL := W_SQL || '    AND  A.BEGIN_DAY <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
								W_SQL := W_SQL || '     OR (NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_0';
								W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
								W_SQL := W_SQL || '     OR (A.BEGIN_DAY < :ORA_0';
								W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))))';
								W_SQL := W_SQL || '    AND A.BEGIN_DAY <> :ORA_0';
								W_SQL := W_SQL || '    AND A.BASE_CODE = :ORA_2';
								W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> :ORA_3';
								W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> :ORA_4';
								W_SQL := W_SQL || '    AND B.DELETE_DIV(+) IS NULL';
								W_SQL := W_SQL || '    AND B.ERROR(+) IS NULL';
								IF W_KKFLG = 1 THEN
									W_SQL := W_SQL || '    AND A.KAISYACD = :ORA_5';
									W_SQL := W_SQL || '    AND A.KAISYACD = B.KAISYACD(+)';
								END IF;
								W_SQL := W_SQL || '    AND A.BEGIN_DAY = B.BEGIN_DAY(+)';
								W_SQL := W_SQL || '    AND A.BASE_CODE = B.BASE_CODE(+)';

								W_SQL := W_SQL || ' HAVING COUNT(*) > 0';
								W_SQL := W_SQL || '  GROUP BY A.BASE_CODE)';

								DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA3);
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA4);
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',W_KDATA2);
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_3',P_SID);
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_4',W_KDATA1);
								IF W_KKFLG = 1 THEN
									DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_5',W_KDATA5);
								END IF;
								W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
							ELSE
								EXIT;
							END IF;
						END LOOP;
					END IF;
				ELSE
					W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
					W_SQL := W_SQL || ' FROM ' || W_TABLE1;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* �h�c*/
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* ���_�R�[�h */
					IF W_KKFLG = 1 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* ��ЃR�[�h */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* �I���� */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* �J�n�� */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* �I���� */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);	/* �h�c */
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* ���_�R�[�h */
							IF W_KKFLG = 1 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* ��ЃR�[�h */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* �I���� */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �J�n�� */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �I���� */
							END IF;
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=9';
							W_SQL := W_SQL || ' WHERE ERROR IS NULL';
							W_SQL := W_SQL || '   AND IDENTIFIER = (';
							W_SQL := W_SQL || ' SELECT ' || W_KDATA1 || ' FROM ' || W_TABLE2;
							W_SQL := W_SQL || '  WHERE BEGIN_DAY < :ORA_0';
							W_SQL := W_SQL || '    AND NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) > :ORA_1';
							W_SQL := W_SQL || '    AND BASE_CODE = :ORA_2';
							IF W_KKFLG = 1 THEN
								W_SQL := W_SQL || '    AND KAISYACD = :ORA_3';
								IF P_UPDKBN IN (2) THEN
									W_SQL := W_SQL || '    AND (KAISYACD,BASE_CODE,BEGIN_DAY) NOT IN (';
									W_SQL := W_SQL || '    SELECT KAISYACD,BASE_CODE,BEGIN_DAY';
									W_SQL := W_SQL || '      FROM ' || W_TABLE1 || ')';
								END IF;
							ELSE
								IF P_UPDKBN IN (2) THEN
									W_SQL := W_SQL || '    AND (BASE_CODE,BEGIN_DAY) NOT IN (';
									W_SQL := W_SQL || '    SELECT BASE_CODE,BEGIN_DAY';
									W_SQL := W_SQL || '      FROM ' || W_TABLE1 || ')';
								END IF;
							END IF;
							W_SQL := W_SQL || ' HAVING COUNT(*) > 0';
							W_SQL := W_SQL || '  GROUP BY ' || W_GRPINF || ')';
							DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA4);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA3);
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',W_KDATA2);
							IF W_KKFLG = 1 THEN
								DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_3',W_KDATA5);
							END IF;
							W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
						ELSE
							EXIT;
						END IF;
					END LOOP;
					/* �G���[9�`�F�b�N */
					W_SQL := 'SELECT COUNT(*) COEFFICIENT';
					W_SQL := W_SQL || ' FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE ERROR = 9';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
					IF W_DATA1 > 0 THEN
						P_ERR := 9;
					END IF;
				END IF;
			END IF;
		END IF;

	/**********************************************************************/
	/* ���̑��`�F�b�N                                                     */
	/**********************************************************************/
		/**********************************************************************/
		/* �Ј��ԍ��ΏۊO�i�ڕW�Ǘ��j                                         */
		/**********************************************************************/
		IF P_KINOU = 214 AND (P_KKBN = 1 OR P_KKBN = 2 OR P_KKBN = 4 OR P_KKBN = 5 OR P_KKBN = 6 OR P_KKBN = 7) THEN
			IF P_SKBN = 2 OR P_SKBN = 5 OR P_SKBN = 6 THEN
				IF P_HOSOKU5 IS NOT NULL THEN
					W_TABLE3 := '';
					IF INSTR(P_HOSOKU5, '|||') = 0 THEN
						W_TABLE3 := P_HOSOKU5;
					ELSIF INSTR(P_HOSOKU5, '|||') > 16 THEN
						W_TABLE3 := SUBSTR(P_HOSOKU5, 0, INSTR(P_HOSOKU5, '|||')-1);
					END IF;
					IF W_TABLE3 IS NOT NULL THEN
						FOR C_021_REC IN C_021 LOOP
							W_ERRNO := 2000 + C_021_REC.ITEM_ID -1;
							W_SQL := 'UPDATE ' || W_TABLE1 || ' A SET A.ERROR=' || W_ERRNO;
							W_SQL := W_SQL || ' WHERE NOT EXISTS (SELECT *';
							W_SQL := W_SQL ||					'   FROM ' || W_TABLE3 || ' B';
							W_SQL := W_SQL ||					'  WHERE A.' || C_021_REC.ITEM_NAME || ' = B.EMP_CODE)';
							IF P_SKBN = 5 THEN
								W_SQL := W_SQL || ' AND A.IDENTIFIER = 0';
							END IF;
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						END LOOP;
					END IF;
				END IF;
			END IF;
		END IF;

		/**********************************************************************/
		/* �l�ۓ_���捞(�l�ێ����d��)                                         */
		/**********************************************************************/
		IF P_KINOU = 200 AND P_KKBN = 1 THEN
			IF P_SKBN = 2 OR P_SKBN = 6 THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=201';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND (EMP_CODE) IN (';
				W_SQL := W_SQL || '  SELECT A.EMP_CODE';
				W_SQL := W_SQL || '    FROM ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || '        ,' || W_TABLE2 || ' B';
				W_SQL := W_SQL || '   WHERE A.EMP_CODE=B.EMP_CODE';
				W_SQL := W_SQL || '     AND B.EVAL_PATTERN<>''' || P_HOSOKU1 || '''';
				W_SQL := W_SQL || '     AND B.EVAL_PERIOD=''' || P_HOSOKU2 || ''')';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			ELSIF P_SKBN = 5 THEN
				IF P_ERR = 0 THEN
					W_SQL := 'SELECT COUNT(*) COEFFICIENT';
					W_SQL := W_SQL || ' FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || '     ,' || W_TABLE2 || ' B';
					W_SQL := W_SQL || ' WHERE A.IDENTIFIER = 0';
					W_SQL := W_SQL || '   AND A.EMP_CODE=B.EMP_CODE';
					W_SQL := W_SQL || '   AND B.EVAL_PATTERN<>''' || P_HOSOKU1 || '''';
					W_SQL := W_SQL || '   AND B.EVAL_PERIOD=''' || P_HOSOKU2 || '''';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
					IF W_DATA1 > 0 THEN
						P_ERR := 1;
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=201';
						W_SQL := W_SQL || ' WHERE IDENTIFIER = 0';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				END IF;
			END IF;
		END IF;

		/**********************************************************************/
		/* �l�ۓ_���捞(�{�l�s��)                                             */
		/**********************************************************************/
		IF P_KINOU = 200 AND P_KKBN = 1 THEN
			IF P_SKBN = 2 OR P_SKBN = 6 THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=202';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				IF W_STYPE = 0 THEN
					W_SQL := W_SQL || '   AND EMP_CODE = ' || P_HOSOKU3;
				ELSE
					W_SQL := W_SQL || '   AND EMP_CODE = ''' || P_HOSOKU3 || '''';
				END IF;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			ELSIF P_SKBN = 5 THEN
				IF P_ERR = 0 THEN
					W_SQL := 'SELECT COUNT(*) COEFFICIENT';
					W_SQL := W_SQL || ' FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || ' WHERE A.IDENTIFIER = 0';
					IF W_STYPE = 0 THEN
						W_SQL := W_SQL || '   AND A.EMP_CODE=' || P_HOSOKU3;
					ELSE
						W_SQL := W_SQL || '   AND A.EMP_CODE=''' || P_HOSOKU3 || '''';
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
					IF W_DATA1 > 0 THEN
						P_ERR := 1;
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=202';
						W_SQL := W_SQL || ' WHERE IDENTIFIER = 0';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				END IF;
			END IF;
		END IF;

		/**********************************************************************/
		/* ���Ə��}�X�^�捞                                                   */
		/**********************************************************************/
		IF P_KINOU = 11 AND P_KKBN = 1 THEN

			/* FROM��쐬 */
			IF P_UPDKBN = 1 OR P_UPDKBN = 2 THEN
				W_SQL := ' FROM ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || ',(SELECT T1.INTERNAL_ASSIGN_CODE,T1.KAISYACD,T1.OFFICE_CODE,T1.BEGIN_DATE,T1.END_DATE,T1.DISP_ORDER,T1.SUMMARY_OFFICE_CODE';
				W_SQL := W_SQL || '    FROM ' || W_TABLE1 || ' T1';
				W_SQL := W_SQL || '  UNION SELECT T2.INTERNAL_ASSIGN_CODE,T2.KAISYACD,T2.OFFICE_CODE,T2.BEGIN_DATE,T2.END_DATE,T2.DISP_ORDER,T2.SUMMARY_OFFICE_CODE';
				W_SQL := W_SQL || '   FROM OFFICE_MS T2';
				W_SQL := W_SQL || '  WHERE T2.INTERNAL_ASSIGN_CODE NOT IN (SELECT INTERNAL_ASSIGN_CODE FROM ' || W_TABLE1 || ')) B';
			ELSIF P_UPDKBN = 3 THEN
				W_SQL := ' FROM ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || '      ,' || W_TABLE1 || ' B';
			END IF;
			W_SQL2 := W_SQL;

			/**********************************************************************/
			/* ���Ə��R�[�h�̏d��                                                 */
			/**********************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=401';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' AND IDENTIFIER=0';
			END IF;
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || ' ' || W_SQL2;
			W_SQL := W_SQL || ' WHERE A.INTERNAL_ASSIGN_CODE<>B.INTERNAL_ASSIGN_CODE';
			W_SQL := W_SQL || '   AND A.KAISYACD=B.KAISYACD';
			W_SQL := W_SQL || '   AND A.OFFICE_CODE=B.OFFICE_CODE';
			W_SQL := W_SQL || '   AND A.BEGIN_DATE <= NVL(B.END_DATE,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
			W_SQL := W_SQL || '   AND NVL(A.END_DATE,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= B.BEGIN_DATE)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/**********************************************************************/
			/* �\�����̏d��                                                       */
			/**********************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=402';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' AND IDENTIFIER=0';
			END IF;
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || ' ' || W_SQL2;
			W_SQL := W_SQL || ' WHERE A.INTERNAL_ASSIGN_CODE<>B.INTERNAL_ASSIGN_CODE';
			W_SQL := W_SQL || '   AND A.KAISYACD=B.KAISYACD';
			W_SQL := W_SQL || '   AND A.DISP_ORDER=B.DISP_ORDER';
			W_SQL := W_SQL || '   AND A.BEGIN_DATE <= NVL(B.END_DATE,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
			W_SQL := W_SQL || '   AND NVL(A.END_DATE,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= B.BEGIN_DATE)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/**********************************************************************/
			/* �܂Ƃߎ��Ə����݃`�F�b�N                                           */
			/**********************************************************************/
			/* ���݃`�F�b�N */
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=403';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' AND IDENTIFIER=0';
			END IF;
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || ' ' || W_SQL2;
			W_SQL := W_SQL || ' WHERE A.SUMMARY_OFFICE_CODE IS NOT NULL';
		--	W_SQL := W_SQL || '   AND A.�������U�R�[�h<>B.�������U�R�[�h';
			W_SQL := W_SQL || '   AND A.KAISYACD=B.KAISYACD(+)';
			W_SQL := W_SQL || '   AND A.SUMMARY_OFFICE_CODE=B.OFFICE_CODE(+)';
			W_SQL := W_SQL || '   AND B.KAISYACD IS NULL)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/* ���ԃ`�F�b�N */
			W_SQL := 'SELECT A.IDENTIFIER';
			W_SQL := W_SQL || ',A.BEGIN_DATE';
			W_SQL := W_SQL || ',NVL(A.END_DATE,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
			W_SQL := W_SQL || ',B.BEGIN_DATE';
			W_SQL := W_SQL || ',NVL(B.END_DATE,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
			W_SQL := W_SQL || W_SQL2;
			W_SQL := W_SQL || ' WHERE A.ERROR IS NULL';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' AND A.IDENTIFIER=0';
			END IF;
			W_SQL := W_SQL || '   AND A.SUMMARY_OFFICE_CODE IS NOT NULL';
			W_SQL := W_SQL || '   AND A.INTERNAL_ASSIGN_CODE<>B.INTERNAL_ASSIGN_CODE';
			W_SQL := W_SQL || '   AND A.KAISYACD=B.KAISYACD';
			W_SQL := W_SQL || '   AND A.SUMMARY_OFFICE_CODE=B.OFFICE_CODE';
			W_SQL := W_SQL || ' ORDER BY 1,2,4';
			DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_I);
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,2,W_DATE1);
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,3,W_DATE2);
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,4,W_DATE3);
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,5,W_DATE4);
			W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
			W_I   := 0;
			W_J   := 0;
			W_CNT := 0;
			LOOP 
				W_RVL2 := DBMS_SQL.FETCH_ROWS(W_CSR2);
				IF W_RVL2 > 0 THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_I);
					DBMS_SQL.COLUMN_VALUE(W_CSR2,2,W_DATE1);
					DBMS_SQL.COLUMN_VALUE(W_CSR2,3,W_DATE2);
					DBMS_SQL.COLUMN_VALUE(W_CSR2,4,W_DATE3);
					DBMS_SQL.COLUMN_VALUE(W_CSR2,5,W_DATE4);
				ELSE
					IF W_J = 0 THEN
						EXIT;
					END IF;
					W_I := 0;
				END IF;

				IF W_I <> W_J AND W_J <> 0 THEN
					IF W_BDATE1 < W_SDATE OR W_BDATE2 > W_EDATE THEN
						W_CNT := 1;
					END IF;

					IF W_CNT = 1 THEN
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=403';
						W_SQL := W_SQL || ' WHERE IDENTIFIER = ' || W_J;
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						W_CNT := 0;
					END IF;
					IF W_RVL2<=0 THEN
						EXIT;
					END IF;
				ELSIF W_J <> 0 THEN
					IF W_EDATE + 1 < W_DATE3 THEN
						IF W_DATE2 >= W_DATE3 THEN
							W_CNT := 1;
						END IF;
					END IF;
				END IF;
				IF W_J = 0 OR W_I <> W_J THEN
					W_SDATE := W_DATE3;
				END IF;
				W_EDATE := W_DATE4;
				W_BDATE1 := W_DATE1;
				W_BDATE2 := W_DATE2;
				W_J := W_I;
			END LOOP;

			/**********************************************************************/
			/* �܂Ƃߎ��Ə��K�w�`�F�b�N                                           */
			/**********************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=404';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' AND IDENTIFIER=0';
			END IF;
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || ' ' || W_SQL2;
			W_SQL := W_SQL || ' WHERE A.SUMMARY_OFFICE_CODE IS NOT NULL';
			W_SQL := W_SQL || '   AND A.INTERNAL_ASSIGN_CODE<>B.INTERNAL_ASSIGN_CODE';
			W_SQL := W_SQL || '   AND A.KAISYACD=B.KAISYACD';
			W_SQL := W_SQL || '   AND A.SUMMARY_OFFICE_CODE=B.OFFICE_CODE';
			W_SQL := W_SQL || '   AND B.SUMMARY_OFFICE_CODE IS NOT NULL)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/**********************************************************************/
			/* ����Г������U�R�[�h�d���`�F�b�N�i�u�����ǉ��E�폜���ǉ��j         */
			/**********************************************************************/
			IF W_KFLG = '1' THEN
				IF P_UPDKBN IN (2,3) THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=405';
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					IF P_SKBN = 5 THEN
						W_SQL := W_SQL || ' AND IDENTIFIER=0';
					END IF;
					W_SQL := W_SQL || '   AND IDENTIFIER IN (';
					W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
					W_SQL := W_SQL || ' FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || '     ,' || W_TABLE2 || ' B';
					W_SQL := W_SQL || ' WHERE A.INTERNAL_ASSIGN_CODE=B.INTERNAL_ASSIGN_CODE';
					W_SQL := W_SQL || '   AND A.KAISYACD<>B.KAISYACD)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

		END IF;

		/**********************************************************************/
		/* �g�D�}�X�^�捞                                                     */
		/**********************************************************************/
		IF P_KINOU = 11 AND P_KKBN = 2 THEN
			FOR W_I IN 1..W_MRNK LOOP
				W_NAME(W_I) := NULL;
			END LOOP;
			/**********************************************************************/
			/* �����敪�`�F�b�N                                                   */
			/**********************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1;
			W_SQL := W_SQL || ' SET ERROR = 411';
			W_SQL := W_SQL || ' WHERE PROCESS_DIV <> ''1''';
			W_SQL := W_SQL || ' AND PROCESS_DIV <> ''2''';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/**********************************************************************/
			/* ���喼�̏d���`�F�b�N                                               */
			/**********************************************************************/
			W_SQL := 'SELECT ';
			W_SQL := W_SQL || ' ' || SUBSTR(GET_SQLRANKFLD(W_MRNK,'','NAME'),2) || ',MIN(IDENTIFIER)';
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE PROCESS_DIV = ''1''';
			W_SQL := W_SQL || ' GROUP BY ' || SUBSTR(GET_SQLRANKFLD(W_MRNK,'','NAME'),2);
			W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
			DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
			FOR W_I IN 1..W_MRNK LOOP
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,W_I,W_NAME(W_I),100);
			END LOOP;
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,W_MRNK+1,W_ID);
			W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR2) = 0;
				FOR W_I IN 1..W_MRNK LOOP
					DBMS_SQL.COLUMN_VALUE(W_CSR2,W_I,W_NAME(W_I));
				END LOOP;
				DBMS_SQL.COLUMN_VALUE(W_CSR2,W_MRNK+1,W_ID);
				W_SQL := 'UPDATE ' || W_TABLE1;
				W_SQL := W_SQL || ' SET ERROR = 412';
				W_SQL := W_SQL || ' , AUX1 = ' || W_ID;
				W_SQL := W_SQL || ' WHERE PROCESS_DIV = ''1''';
				FOR W_I IN 1..W_MRNK LOOP
					W_SQL := W_SQL || ' AND NVL(NAME' || W_I || ','' '') = :ORA_' || W_I;
				END LOOP;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				FOR W_I IN 1..W_MRNK LOOP
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_' || W_I,NVL(W_NAME(W_I),' '));
				END LOOP;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END LOOP;

			/**********************************************************************/
			/* �����R�[�h�d���`�F�b�N                                             */
			/**********************************************************************/
			W_SQL := 'SELECT DISTINCT';
			W_SQL := W_SQL || ' BELONG_CODE';
			IF W_KFLG = '0' THEN
				W_SQL := W_SQL || ',NAME1';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE PROCESS_DIV = ''1''';
			W_SQL := W_SQL || ' GROUP BY BELONG_CODE';
			IF W_KFLG = '0' THEN
				W_SQL := W_SQL || ',NAME1';
			END IF;
			W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
			DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_NAME(1),100);
			IF W_KFLG = '0' THEN
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,2,W_NAME(2),100);
			END IF;
			W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR2) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_NAME(1));
				IF W_KFLG = '0' THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR2,2,W_NAME(2));
				END IF;
				IF W_NAME(1) IS NOT NULL THEN
					W_SQL := 'UPDATE ' || W_TABLE1;
					W_SQL := W_SQL || ' SET ERROR = 413';
					W_SQL := W_SQL || ' WHERE PROCESS_DIV = ''1''';
					W_SQL := W_SQL || ' AND NVL(BELONG_CODE,'' '') = :ORA_0';
					IF W_KFLG = '0' THEN
						W_SQL := W_SQL || ' AND NVL(NAME1,'' '') = ''' || NVL(W_NAME(2),' ') || '''';
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_0',NVL(W_NAME(1),' '));
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END LOOP;

			/**********************************************************************/
			/* �����f�[�^�Ƃ̃`�F�b�N                                             */
			/**********************************************************************/
			IF P_UPDKBN = '1' THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || ' SET ERROR = 414';
				W_SQL := W_SQL || ' WHERE A.PROCESS_DIV = ''1''';
				W_SQL := W_SQL || ' AND EXISTS (SELECT *';
				W_SQL := W_SQL || ' FROM ' || W_MATRIXTB2 || ' B';
				W_SQL := W_SQL || ' WHERE';
				FOR W_I IN 1..W_MRNK LOOP
					IF W_I > 1 THEN
						W_SQL := W_SQL || ' AND';
					END IF;
					W_SQL := W_SQL || ' NVL(A.NAME' || W_I || ','' '') = NVL(B.NAME' || W_I || ','' '')';
				END LOOP;
				W_SQL := W_SQL || ' AND B.BEGIN_AGE <= :ORA_HOSOKU1';
				W_SQL := W_SQL || ' AND B.END_AGE > :ORA_HOSOKU1';
				W_SQL := W_SQL || ' AND B.KAISYACD = :ORA_KAISYA';
				W_SQL := W_SQL || ' )';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA',P_KAISYA);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_HOSOKU1',P_HOSOKU1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'UPDATE ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || ' SET ERROR = 415';
				W_SQL := W_SQL || ' WHERE A.PROCESS_DIV = ''2''';
				W_SQL := W_SQL || ' AND NOT EXISTS (SELECT *';
				W_SQL := W_SQL || ' FROM ' || W_MATRIXTB2 || ' B';
				W_SQL := W_SQL || ' WHERE';
				FOR W_I IN 1..W_MRNK LOOP
					IF W_I > 1 THEN
						W_SQL := W_SQL || ' AND';
					END IF;
					W_SQL := W_SQL || ' NVL(A.NAME' || W_I || ','' '') = NVL(B.NAME' || W_I || ','' '')';
				END LOOP;
				W_SQL := W_SQL || ' AND B.BEGIN_AGE <= :ORA_HOSOKU1';
				W_SQL := W_SQL || ' AND B.END_AGE > :ORA_HOSOKU1';
				W_SQL := W_SQL || ' AND B.KAISYACD = :ORA_KAISYA';
				W_SQL := W_SQL || ' )';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA',P_KAISYA);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_HOSOKU1',P_HOSOKU1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'SELECT IDENTIFIER';
				W_SQL := W_SQL || GET_SQLRANKFLD(W_MRNK,'','NAME');
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE PROCESS_DIV = ''2''';
				DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_ID);
				FOR W_I IN 1..W_MRNK LOOP
					DBMS_SQL.DEFINE_COLUMN(W_CSR2,W_I+1,W_NAME(W_I),100);
				END LOOP;
				W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
				LOOP 
					EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR2) = 0;
					DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_ID);
					FOR W_I IN 1..W_MRNK LOOP
						DBMS_SQL.COLUMN_VALUE(W_CSR2,W_I+1,W_NAME(W_I));
					END LOOP;
					<<LOOPI>>
					FOR W_I IN REVERSE 1..W_MRNK LOOP
						IF W_NAME(W_I) IS NOT NULL THEN
							W_J := W_I;
							EXIT LOOPI;
						END IF;
					END LOOP LOOPI;
					W_SQL := 'SELECT COUNT(*)';
					W_SQL := W_SQL || ' FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE PROCESS_DIV = ''1''';
					FOR W_I IN 1..W_J LOOP
						W_SQL := W_SQL || ' AND NAME' || W_I || ' = :ORA_' || W_I;
					END LOOP;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					FOR W_I IN 1..W_J LOOP
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_' || W_I,W_NAME(W_I));
					END LOOP;
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_CNT);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_CNT);
					IF W_CNT > 0 THEN
						W_SQL := 'UPDATE ' || W_TABLE1;
						W_SQL := W_SQL || ' SET ERROR = 417';
						W_SQL := W_SQL || ' WHERE IDENTIFIER = ' || W_ID;
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
				END LOOP;

			/**********************************************************************/
			/* �����R�[�h�d���`�F�b�N                                             */
			/**********************************************************************/
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || ' SET ERROR = 413';
				W_SQL := W_SQL || ' WHERE PROCESS_DIV = ''1''';
				IF W_KFLG = '0' THEN
					W_SQL := W_SQL || '   AND (BELONG_CODE,NAME1) IN';
					W_SQL := W_SQL || ' (';
					W_SQL := W_SQL || ' 	SELECT A.SALARY_BELONG_CODE,B.NAME1';
				ELSE
					W_SQL := W_SQL || '   AND BELONG_CODE IN';
					W_SQL := W_SQL || ' (';
					W_SQL := W_SQL || ' 	SELECT A.SALARY_BELONG_CODE';
				END IF;
				W_SQL := W_SQL || ' 	FROM ' || W_MATRIXTB3 || ' A';
				W_SQL := W_SQL || ' 	,(';
				W_SQL := W_SQL || ' 		SELECT A.KAISYACD,A.RANK,A.CODE_VALUE,A.NAME1';
				W_SQL := W_SQL || ' 		FROM ' || W_MATRIXTB2 || ' A';
				W_SQL := W_SQL || ' 		    ,' || W_TABLE1 || ' B';
				W_SQL := W_SQL || ' 		WHERE A.KAISYACD = :ORA_KAISYA';
				W_SQL := W_SQL || ' 		  AND A.BEGIN_AGE <= :ORA_HOSOKU1';
				W_SQL := W_SQL || ' 		  AND A.END_AGE >  :ORA_HOSOKU1';
				FOR W_I IN 1..W_MRNK LOOP
					W_SQL := W_SQL || ' 	  AND NVL(A.NAME' || W_I || ','' '') = NVL(B.NAME' || W_I || '(+),'' '')';
				END LOOP;
				W_SQL := W_SQL || ' 		  AND B.IDENTIFIER IS NULL';
				W_SQL := W_SQL || ' 	) B';
				W_SQL := W_SQL || ' 	WHERE A.KAISYACD = :ORA_KAISYA';
				W_SQL := W_SQL || ' 	  AND A.AGE_NUMBER = :ORA_HOSOKU1-1';
				W_SQL := W_SQL || ' 	  AND A.RANK = B.RANK';
				W_SQL := W_SQL || ' 	  AND A.CODE_VALUE = B.CODE_VALUE';
				W_SQL := W_SQL || ' )';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA',P_KAISYA);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_HOSOKU1',P_HOSOKU1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			ELSE
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || ' SET ERROR = 416';
				W_SQL := W_SQL || ' WHERE A.PROCESS_DIV = ''2''';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
		END IF;

		/**********************************************************************/
		/* �g�D�}�X�^�ꗗ���͎捞                                             */
		/**********************************************************************/
		IF P_KINOU = 11 AND P_KKBN = 3 THEN
			W_NAME(1) := NULL;
			W_SQL := 'SELECT ';
			W_SQL := W_SQL || 'DECODE(C.BELONG_CODE,NULL,A.SALARY_BELONG_CODE,C.BELONG_CODE)';
			IF W_KFLG = '0' THEN
				W_SQL := W_SQL || ',B.CODE_VALUE1';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_MATRIXTB3 || ' A';
			IF W_KFLG = '0' THEN
				W_SQL := W_SQL || ' ,' || W_MATRIXTB2 || ' B';
			END IF;
			W_SQL := W_SQL || ' ,' || W_TABLE1 || ' C';
			W_SQL := W_SQL || ' WHERE A.KAISYACD = :ORA_KAISYA';
			W_SQL := W_SQL || ' AND A.AGE_NUMBER = :ORA_HOSOKU1';
			IF W_KFLG = '0' THEN
				W_SQL := W_SQL || ' AND A.KAISYACD = B.KAISYACD';
				W_SQL := W_SQL || ' AND A.RANK = B.RANK';
				W_SQL := W_SQL || ' AND A.CODE_VALUE = B.CODE_VALUE';
			END IF;
			W_SQL := W_SQL || ' AND A.RANK = C.RANK(+)';
			W_SQL := W_SQL || ' AND A.CODE_VALUE = C.CODE_VALUE(+)';
			W_SQL := W_SQL || ' GROUP BY DECODE(C.BELONG_CODE,NULL,A.SALARY_BELONG_CODE,C.BELONG_CODE)';
			IF W_KFLG = '0' THEN
				W_SQL := W_SQL || ',B.CODE_VALUE1';
			END IF;
			W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
			DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_KAISYA',P_KAISYA);
			DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_HOSOKU1',P_HOSOKU1);
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_NAME(1),100);			/* �����R�[�h	*/
			IF W_KFLG = '0' THEN
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,2,W_BDATA1);			/* �R�[�h1	*/
			END IF;	
			W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR2) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_NAME(1));
				IF W_KFLG = '0' THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR2,2,W_BDATA1);
				END IF;
				IF W_NAME(1) IS NOT NULL THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || ' SET ERROR = 413';
					W_SQL := W_SQL || ' WHERE A.BELONG_CODE = :ORA_NAME';
					W_SQL := W_SQL || ' AND EXISTS (SELECT *';
					W_SQL := W_SQL || ' FROM ' || W_MATRIXTB2;
					W_SQL := W_SQL || ' WHERE RANK = A.RANK';
					W_SQL := W_SQL || ' AND CODE_VALUE = A.CODE_VALUE';
					W_SQL := W_SQL || ' AND KAISYACD = :ORA_KAISYA';
					IF W_KFLG = '0' THEN
						W_SQL := W_SQL || ' AND CODE_VALUE1 = :ORA_CODE1';
					END IF;
					W_SQL := W_SQL || ' )';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA',P_KAISYA);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_NAME',W_NAME(1));
					IF W_KFLG = '0' THEN
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_CODE1',W_BDATA1);
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END LOOP;

			/**********************************************************************/
			/* �⏕���̓}�X�^�`�F�b�N                                             */
			/**********************************************************************/
			IF P_HOSOKU2 = '1' THEN
				W_SQL := 'SELECT A.ITEM_ID,A.MASTER_ID,TO_CHAR(C.VALID_DATE,''YYYY/MM/DD''),B.USAGE_DIV';
				W_SQL := W_SQL || ' FROM WEB_TC0000040_M B';
				W_SQL := W_SQL || '     ,WEB_TP0002830_T A';
				W_SQL := W_SQL || '     ,' || W_MATRIXTB1 || ' C';
				W_SQL := W_SQL || ' WHERE B.ORGANIZATION_ID = :ORA_SYUBETU';
				W_SQL := W_SQL || '   AND A.ORGANIZATION_ID(+) = :ORA_SYUBETU';
				W_SQL := W_SQL || '   AND A.BEGIN_AGE(+) <= :ORA_HOSOKU1';
				W_SQL := W_SQL || '   AND A.END_AGE(+) >= :ORA_HOSOKU1';
				W_SQL := W_SQL || '   AND C.KAISYACD = :ORA_KAISYA';
				W_SQL := W_SQL || '   AND C.AGE_NUMBER = :ORA_HOSOKU1';
				W_SQL := W_SQL || '   AND B.IDENTIFIER=A.ITEM_ID(+)';
				W_SQL := W_SQL || ' ORDER BY B.IDENTIFIER';
				DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_KAISYA',P_KAISYA);
				DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_HOSOKU1',P_HOSOKU1);
				DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_SYUBETU',P_SYUBETU);
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_NDATA1);
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,2,W_NDATA2);
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,3,W_VDATA1,20);
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,4,W_VDATA2,2);
				W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
				W_CNT := 4;
				LOOP
					W_CNT := W_CNT + 1;
					W_RVL2 := DBMS_SQL.FETCH_ROWS(W_CSR2);
					IF W_RVL2 > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_NDATA1);
						DBMS_SQL.COLUMN_VALUE(W_CSR2,2,W_NDATA2);
						DBMS_SQL.COLUMN_VALUE(W_CSR2,3,W_VDATA1);
						DBMS_SQL.COLUMN_VALUE(W_CSR2,4,W_VDATA2);
						IF W_NDATA1 IS NOT NULL AND W_VDATA2 = '1' THEN
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (100 + W_CNT);
							W_SQL := W_SQL || ' WHERE ERROR IS NULL';
							W_SQL := W_SQL || '   AND IDENTIFIER IN (';
							W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
							W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
							IF W_NDATA2 = 0 THEN
								W_SQL := W_SQL || ',WEB_TP0002830_T B';
							ELSE
								W_SQL := W_SQL || ',WEB_TP0002820_T B';
							END IF;
							W_SQL := W_SQL || ' WHERE A.AUX_CHAR' || TO_CHAR(W_NDATA1,'FM00') || ' IS NOT NULL';
							IF W_NDATA2 = 0 THEN
								W_SQL := W_SQL || ' AND B.ORGANIZATION_ID(+) = ' || P_SYUBETU;
								W_SQL := W_SQL || ' AND B.BEGIN_AGE(+) <= ' || P_HOSOKU1;
								W_SQL := W_SQL || ' AND B.END_AGE(+) >= ' || P_HOSOKU1;
								W_SQL := W_SQL || ' AND B.MASTER_ID(+) > 0';
								W_SQL := W_SQL || ' AND A.AUX_CHAR' || TO_CHAR(W_NDATA1,'FM00') || '=TO_CHAR(B.MASTER_ID(+))';
								W_SQL := W_SQL || ' AND B.MASTER_ID IS NULL)';
							ELSE
								W_SQL := W_SQL || ' AND NVL(TO_CHAR(B.BEGIN_DAY(+),''YYYY/MM/DD''),''1900/01/01'') <= ''' || W_VDATA1 || '''';
								W_SQL := W_SQL || ' AND NVL(TO_CHAR(B.END_DAY(+),''YYYY/MM/DD''),''3999/01/01'') >= ''' || W_VDATA1 || '''';
								W_SQL := W_SQL || ' AND B.MASTER_ID(+) =' || W_NDATA2;
								W_SQL := W_SQL || ' AND A.AUX_CHAR' || TO_CHAR(W_NDATA1,'FM00') || '=B.CODE_VALUE(+)';
								W_SQL := W_SQL || ' AND B.CODE_VALUE IS NULL)';
							END IF;
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						END IF;
					ELSE
						EXIT;
					END IF;
				END LOOP;
			END IF;
		END IF;

		/**********************************************************************/
		/* ���Ə��Еۃ}�X�^�捞�i���N�ی��L���E�����N���L���j                 */
		/**********************************************************************/
		IF P_KINOU = 11 AND (P_KKBN = 6 OR P_KKBN = 7) THEN
			/**********************************************************************/
			/* ���^���Ə��`�F�b�N                                                 */
			/**********************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=406';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' AND IDENTIFIER=0';
			END IF;
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || ' SELECT A.IDENTIFIER';
			W_SQL := W_SQL || '   FROM ' || W_TABLE1 || ' A';
			W_SQL := W_SQL || '       ,OFFICE_MS B';
			W_SQL := W_SQL || '  WHERE A.KAISYACD = B.KAISYACD';
			W_SQL := W_SQL || '    AND A.OFFICE_CODE = B.OFFICE_CODE';
			W_SQL := W_SQL || '    AND B.SALARY_OFFICE_FLAG = 0';
			W_SQL := W_SQL || '    AND B.BEGIN_DATE <= TRUNC(SYSDATE,''DD'')';
			W_SQL := W_SQL || '    AND B.END_DATE >= TRUNC(SYSDATE,''DD''))';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;

		/**********************************************************************/
		/* �g�D�}�X�^����捞                                                 */
		/**********************************************************************/
		IF P_KINOU = 11 AND P_KKBN = 17 THEN
			FOR W_I IN 1..W_MRNK LOOP
				W_NAME(W_I) := NULL;
			END LOOP;
			/**********************************************************************/
			/* ���喼�̏d���`�F�b�N                                               */
			/**********************************************************************/
			W_SQL := 'SELECT ';
			W_SQL := W_SQL || ' ' || SUBSTR(GET_SQLRANKFLD(W_MRNK,'','NAME'),2) || ',MIN(IDENTIFIER)';
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' GROUP BY ' || SUBSTR(GET_SQLRANKFLD(W_MRNK,'','NAME'),2);
			W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
			DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
			FOR W_I IN 1..W_MRNK LOOP
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,W_I,W_NAME(W_I),100);
			END LOOP;
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,W_MRNK+1,W_ID);
			W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR2) = 0;
				FOR W_I IN 1..W_MRNK LOOP
					DBMS_SQL.COLUMN_VALUE(W_CSR2,W_I,W_NAME(W_I));
				END LOOP;
				DBMS_SQL.COLUMN_VALUE(W_CSR2,W_MRNK+1,W_ID);
				W_SQL := 'UPDATE ' || W_TABLE1;
				W_SQL := W_SQL || ' SET ERROR = 412';
				W_SQL := W_SQL || ' , AUX1 = ' || W_ID;
				W_SQL := W_SQL || ' WHERE NVL(NAME1,'' '') = :ORA_NAME1';
				FOR W_I IN 2..W_MRNK LOOP
					W_SQL := W_SQL || ' AND NVL(NAME' || W_I || ','' '') = :ORA_' || W_I;
				END LOOP;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_NAME1',NVL(W_NAME(1),' '));
				FOR W_I IN 2..W_MRNK LOOP
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_' || W_I,NVL(W_NAME(W_I),' '));
				END LOOP;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END LOOP;

			/**********************************************************************/
			/* ��ʕ��������݃`�F�b�N(�P�s�ڂ͉�Ђł��邱��)                     */
			/**********************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1;
			W_SQL := W_SQL || ' SET ERROR = 418';
			W_SQL := W_SQL || ' WHERE IDENTIFIER = 1';
			W_SQL := W_SQL || '   AND (';
			W_SQL := W_SQL || '       NAME1 IS NULL';
			FOR W_I IN 2..W_MRNK LOOP
				W_SQL := W_SQL || ' OR NAME' || W_I || ' IS NOT NULL';
			END LOOP;
			W_SQL := W_SQL || ' )';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/**********************************************************************/
			/* ��ʕ��������݃`�F�b�N                                             */
			/**********************************************************************/
			W_SQL := 'SELECT';
			W_SQL := W_SQL || ' IDENTIFIER' || GET_SQLRANKFLD(W_MRNK,'','NAME');
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE NAME2 IS NOT NULL';
			FOR W_I IN 3..W_MRNK LOOP
				W_SQL := W_SQL || ' OR NAME' || W_I || ' IS NOT NULL';
			END LOOP;
--			W_SQL := W_SQL || ' WHERE �h�c > 1';
			W_SQL := W_SQL || ' ORDER BY IDENTIFIER';
			DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_ID);
			FOR W_I IN 1..W_MRNK LOOP
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,W_I+1,W_NAME(W_I),100);
			END LOOP;
			W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR2) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_ID);
				FOR W_I IN 1..W_MRNK LOOP
					DBMS_SQL.COLUMN_VALUE(W_CSR2,W_I+1,W_NAME(W_I));
				END LOOP;
				<<LOOP_I>>
				FOR W_I IN REVERSE 1..W_MRNK LOOP
					IF W_NAME(W_I) IS NOT NULL THEN
						W_J := W_I - 1;
						EXIT LOOP_I;
					END IF;
				END LOOP;
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || ' SET A.ERROR = 418';
				W_SQL := W_SQL || ' WHERE A.IDENTIFIER = ' || W_ID;
				W_SQL := W_SQL || ' AND NOT EXISTS (SELECT * FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER < ' || W_ID;
				FOR W_I IN 1..W_J LOOP
					W_SQL := W_SQL || ' AND NVL(NAME' || W_I || ','' '') = :ORA_' || W_I;
				END LOOP;
				FOR W_I IN W_J+1..W_MRNK LOOP
					W_SQL := W_SQL || ' AND NAME' || W_I || ' IS NULL';
				END LOOP;
				W_SQL := W_SQL || ')';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				FOR W_I IN 1..W_J LOOP
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_' || W_I,NVL(W_NAME(W_I),' '));
				END LOOP;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END LOOP;

			/**********************************************************************/
			/* �����R�[�h�d���`�F�b�N                                             */
			/**********************************************************************/
			W_SQL := 'SELECT DISTINCT';
			W_SQL := W_SQL || ' BELONG_CODE';
			IF W_KFLG = '0' THEN
				W_SQL := W_SQL || ',NAME1';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' GROUP BY BELONG_CODE';
			IF W_KFLG = '0' THEN
				W_SQL := W_SQL || ',NAME1';
			END IF;
			W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
			DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_NAME(1),100);
			IF W_KFLG = '0' THEN
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,2,W_NAME(2),100);
			END IF;
			W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
			LOOP 
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR2) = 0;
				DBMS_SQL.COLUMN_VALUE(W_CSR2,1,W_NAME(1));
				IF W_KFLG = '0' THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR2,2,W_NAME(2));
				END IF;
				IF W_NAME(1) IS NOT NULL THEN
					W_SQL := 'UPDATE ' || W_TABLE1;
					W_SQL := W_SQL || ' SET ERROR = 413';
					W_SQL := W_SQL || ' WHERE NVL(BELONG_CODE,'' '') = :ORA_0';
					IF W_KFLG = '0' THEN
						W_SQL := W_SQL || ' AND NVL(NAME1,'' '') = ''' || NVL(W_NAME(2),' ') || '''';
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_0',NVL(W_NAME(1),' '));
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END LOOP;
		END IF;

		/**********************************************************************/
		/* ��Q�ҏ��捞                                                     */
		/**********************************************************************/
		IF P_KINOU = 451 AND P_KKBN = 1 THEN
			/******************************************************************/
			/*���ԏd��                                                        */
			/******************************************************************/
			W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_SDATA1);		/* �h�c*/
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_SDATA2,20);	/* �Ј��R�[�h */
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_SDATA3);		/* ��Q���x�� */
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_SDATA4);		/* �J�n�� */
			DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_SDATA5);		/* �I���� */
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				IF W_RVL > 0 THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_SDATA1);	/* �h�c */
					DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_SDATA2);	/* �Ј��R�[�h */
					DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_SDATA3);	/* ��Q���x�� */
					DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_SDATA4);	/* �J�n�� */
					DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_SDATA5);	/* �I���� */
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=8';
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER = (';
					W_SQL := W_SQL || ' SELECT ' || W_SDATA1 || ' FROM ' || W_TABLE1;
					W_SQL := W_SQL || '  WHERE EMP_CODE = :ORA_0';
					W_SQL := W_SQL || '    AND FAULT_LEVEL = :ORA_1';
					W_SQL := W_SQL || '    AND BEGIN_DAY <= :ORA_2';
					W_SQL := W_SQL || '    AND NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_3';
					W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
					W_SQL := W_SQL || '  GROUP BY ' || W_GRPINF || ')';
					DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_SDATA2);
					DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_SDATA3);
					DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',W_SDATA5);
					DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_3',W_SDATA4);
					W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
				ELSE
					EXIT;
				END IF;
			END LOOP;

			/**************************************************************/
			/* ���ԏd��(�����f�[�^)                                       */
			/**************************************************************/
			IF P_UPDKBN IN (1,2) THEN
				W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_SDATA1);		/* �h�c*/
				DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_SDATA2,20);	/* �Ј��R�[�h */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_SDATA3);		/* ��Q���x�� */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_SDATA4);		/* �J�n�� */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_SDATA5);		/* �I���� */
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_SDATA1);	/* �h�c */
						DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_SDATA2);	/* �Ј��R�[�h */
						DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_SDATA3);	/* ��Q���x�� */
						DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_SDATA4);	/* �J�n�� */
						DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_SDATA5);	/* �I���� */
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=9';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER = (';
						W_SQL := W_SQL || ' SELECT ' || W_SDATA1 || ' FROM ' || W_TABLE2;
						W_SQL := W_SQL || '  WHERE EMP_CODE = :ORA_0';
						W_SQL := W_SQL || '    AND FAULT_LEVEL = :ORA_1';
						W_SQL := W_SQL || '    AND BEGIN_DAY < :ORA_2';
						W_SQL := W_SQL || '    AND NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) > :ORA_3';
						IF P_UPDKBN IN (2) THEN
							W_SQL := W_SQL || '    AND (EMP_CODE,FAULT_LEVEL,BEGIN_DAY) NOT IN (';
							W_SQL := W_SQL || '    SELECT EMP_CODE,FAULT_LEVEL,BEGIN_DAY';
							W_SQL := W_SQL || '      FROM ' || W_TABLE1 || ')';
						END IF;
						W_SQL := W_SQL || ' HAVING COUNT(*) > 0';
						W_SQL := W_SQL || '  GROUP BY ' || W_GRPINF || ')';
						DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_SDATA2);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_SDATA3);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',W_SDATA5);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_3',W_SDATA4);
						W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
					ELSE
						EXIT;
					END IF;
				END LOOP;
			END IF;

			/******************************************************************/
			/* �}�X�^�֘A�`�F�b�N                                             */
			/******************************************************************/
			IF P_UPDKBN IN (1,2) THEN
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_SDATA1);		/* �h�c*/
				DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_SDATA2,20);	/* �Ј��R�[�h */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_SDATA3);		/* ��Q���x�� */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_SDATA4);		/* �J�n�� */
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_SDATA1);	/* �h�c */
						DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_SDATA2);	/* �Ј��R�[�h */
						DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_SDATA3);	/* ��Q���x�� */
						DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_SDATA4);	/* �J�n�� */
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=421';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER = (';
						W_SQL := W_SQL || ' SELECT ' || W_SDATA1 || ' FROM ' || W_TABLE1;
						W_SQL := W_SQL || '  WHERE EMP_CODE = :ORA_0';
						W_SQL := W_SQL || '    AND FAULT_LEVEL = :ORA_1';
						W_SQL := W_SQL || '    AND BEGIN_DAY = :ORA_2';
						W_SQL := W_SQL || '    AND ((FAULT_LEVEL IN (1,2,3,4,5,6)';
						W_SQL := W_SQL || '      AND FAULT_IDENTIFICATION_METHOD NOT IN (1,2,3))';
						W_SQL := W_SQL || '     OR (FAULT_LEVEL IN (11,12)';
						W_SQL := W_SQL || '      AND FAULT_IDENTIFICATION_METHOD NOT IN (11,12,13,14,15,16,17,18)))';
						W_SQL := W_SQL || ' HAVING COUNT(*) > 0';
						W_SQL := W_SQL || '  GROUP BY ' || W_KEYINF || ')';
						DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_SDATA2);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_SDATA3);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',W_SDATA4);
						W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
					ELSE
						EXIT;
					END IF;
				END LOOP;
			END IF;
		END IF;

		/**********************************************************************/
		/* �ڕW�Ǘ��|��]���Ґݒ�捞                                         */
		/**********************************************************************/
		IF P_KINOU = 214 AND P_KKBN IN (1,2,5) THEN
			/******************************************************************/
			/* �S���O���[�v�͈̓`�F�b�N(�S�В�`��)                           */
			/******************************************************************/
			IF P_KAISYA = 0 AND W_KFLG = '1' THEN
				W_SQL := 'SELECT TARGET_KAISYA_DIV FROM WEB_TP2140120_M';
				W_SQL := W_SQL || ' WHERE KAISYACD = 0 AND STAFF_CODE = :1';
				EXECUTE IMMEDIATE W_SQL INTO W_VDATA1 USING P_YOBI;
			
				IF W_VDATA1 = '2' THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=451';
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER IN (';
					W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || '      ,EMP_BASIC_INFO B';
					W_SQL := W_SQL || '      ,WEB_TP2140140_M C';
					W_SQL := W_SQL || ' WHERE ';
					IF P_SKBN = 5 THEN
						W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
					END IF;
					W_SQL := W_SQL || ' A.EMP_CODE = B.EMP_CODE';
					W_SQL := W_SQL || ' AND C.KAISYACD(+) = 0';
					W_SQL := W_SQL || ' AND C.STAFF_CODE(+) = :ORA_STAFF';
					W_SQL := W_SQL || ' AND B.KAISYACD = C.TARGET_KAISYACD(+)';
					W_SQL := W_SQL || ' AND C.TARGET_KAISYACD IS NULL)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_STAFF',P_YOBI);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;
		END IF;

		/**********************************************************************/
		/* �ڕW�Ǘ��捞                                                       */
		/**********************************************************************/
		IF P_KINOU = 214 AND (P_KKBN = 2 OR P_KKBN = 4 OR P_KKBN = 6) THEN
			/******************************************************************/
			/* �{�l�I���ۊm�F                                               */
			/******************************************************************/
			W_VDATA1 := '0';
			
			IF P_KINOU = 214 AND P_KKBN = 2 THEN
				W_SQL := 'SELECT MAX(NVL(A.SHEET_SELECT_DIV,''0'')) FROM WEB_TP2140110_M A,' || W_TABLE1 || ' B';
				W_SQL := W_SQL || ' WHERE A.KAISYACD = :1';
				W_SQL := W_SQL || '   AND A.KAISYACD = B.KAISYACD';
				W_SQL := W_SQL || '   AND A.HISTORY_NUMBER = B.HISTORY_NUMBER';
				EXECUTE IMMEDIATE W_SQL INTO W_VDATA1 USING P_KAISYA;
			END IF;

			/******************************************************************/
			/* �V�[�g���݊m�F                                                 */
			/******************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=431';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
			W_SQL := W_SQL || ' WHERE ';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
			END IF;
			IF W_VDATA1 = '1' THEN
				W_SQL := W_SQL || ' A.GOAL_NUMBER<>0 AND';
			END IF;
			W_SQL := W_SQL || ' A.GOAL_NUMBER NOT IN (';
			W_SQL := W_SQL || ' SELECT DISTINCT B1.GOAL_NUMBER';
			W_SQL := W_SQL || '   FROM ' || W_TABLE1 || ' A1';
			W_SQL := W_SQL || '      , WEB_TP2140210_M B1';
			W_SQL := W_SQL || '  WHERE B1.KAISYACD = :ORA_KAISYA';
			W_SQL := W_SQL || '    AND A1.GOAL_NUMBER = B1.GOAL_NUMBER';
			W_SQL := W_SQL || '    AND A1.HISTORY_NUMBER = B1.HISTORY_NUMBER';
			W_SQL := W_SQL || '    AND B1.PROCESS_FLAG <> 0))';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA',P_KAISYA);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/******************************************************************/
			/* �V�[�g�w�葶�ݎ��̖��w��L�`�F�b�N                             */
			/******************************************************************/
			IF P_KINOU = 214 AND P_KKBN = 2 AND W_VDATA1 = '1' THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=452';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND IDENTIFIER IN (';
				W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
				W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || ' WHERE ';
				IF P_SKBN = 5 THEN
					W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
				END IF;
				W_SQL := W_SQL || ' A.GOAL_NUMBER = 0 ';
				W_SQL := W_SQL || ' AND A.EMP_CODE IN (';
				W_SQL := W_SQL || ' SELECT DISTINCT B.EMP_CODE';
				W_SQL := W_SQL || '   FROM ' || W_TABLE1 || ' B';
				W_SQL := W_SQL || '  WHERE B.GOAL_NUMBER <> 0))';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
		END IF;

		/**********************************************************************/
		/* �ڕW�Ǘ��|�g�D�捞                                                 */
		/**********************************************************************/
		IF P_KINOU = 214 AND (P_KKBN = 3 OR P_KKBN = 4) THEN
			/******************************************************************/
			/* ���僉���N�E����R�[�h�����̓`�F�b�N����                       */
			/******************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=442';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' AND IDENTIFIER=0';
			END IF;
			W_SQL := W_SQL || ' AND (DEPT_RANK IS NULL OR DEPT_CODE IS NULL)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=442';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
			W_SQL := W_SQL || '       ,' || W_MATRIXTB2 || ' B';
			W_SQL := W_SQL || '  WHERE ';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
			END IF;
			W_SQL := W_SQL || '     (A.DEPT_RANK IS NOT NULL OR A.DEPT_CODE IS NOT NULL)';
			W_SQL := W_SQL || ' AND A.DEPT_RANK=B.RANK(+)';
			W_SQL := W_SQL || ' AND A.DEPT_CODE=B.CODE_VALUE(+)';
			W_SQL := W_SQL || ' AND B.BEGIN_AGE (+)<=' || P_HOSOKU2;
			W_SQL := W_SQL || ' AND B.END_AGE (+)>' || P_HOSOKU2;
			W_SQL := W_SQL || ' AND B.SALARY_ONLY_FLAG (+)= 0';
			W_SQL := W_SQL || ' AND B.RANK IS NULL)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			IF P_KKBN = 3 THEN
				/**************************************************************/
				/* �V�[�g���݃`�F�b�N����                                     */
				/**************************************************************/
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=441';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND IDENTIFIER IN (';
				W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
				W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || ' WHERE ';
				IF P_SKBN = 5 THEN
					W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
				END IF;
				W_SQL := W_SQL || ' (A.DEPT_RANK,A.DEPT_CODE) NOT IN (';
				W_SQL := W_SQL || ' SELECT DISTINCT B1.DEPT_RANK,B1.DEPT_CODE';
				W_SQL := W_SQL || '   FROM ' || W_TABLE1 || ' A1';
				W_SQL := W_SQL || '      , WEB_TP2142210_T B1';
				W_SQL := W_SQL || '  WHERE B1.KAISYACD = :ORA_KAISYA';
				W_SQL := W_SQL || '    AND A1.HISTORY_NUMBER = B1.HISTORY_NUMBER';
				W_SQL := W_SQL || '    AND A1.GOAL_NUMBER = B1.GOAL_NUMBER';
				W_SQL := W_SQL || '    AND A1.DEPT_RANK = B1.DEPT_RANK';
				W_SQL := W_SQL || '    AND A1.DEPT_CODE = B1.DEPT_CODE))';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA',P_KAISYA);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			ELSE
				/**************************************************************/
				/* �ΏۊO�����`�F�b�N����                                     */
				/**************************************************************/
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=443';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND IDENTIFIER IN (';
				W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
				W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
				W_SQL := W_SQL || '  WHERE ';
				IF P_SKBN = 5 THEN
					W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
				END IF;
				W_SQL := W_SQL || '     A.DEPT_RANK IS NOT NULL';
				W_SQL := W_SQL || ' AND (A.DEPT_RANK <' || P_HOSOKU3;
				W_SQL := W_SQL || '   OR A.DEPT_RANK >' || P_HOSOKU4 || '))';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;

				IF P_HOSOKU5 IS NOT NULL THEN
					IF INSTR(P_HOSOKU5, '|||') > 0 THEN
						W_TABLE3 := SUBSTR(P_HOSOKU5, INSTR(P_HOSOKU5, '|||')+3);

						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=443';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER IN (';
						W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
						W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
						W_SQL := W_SQL || '  WHERE ';
						IF P_SKBN = 5 THEN
							W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
						END IF;
						W_SQL := W_SQL || '     A.DEPT_RANK IS NOT NULL';
						W_SQL := W_SQL || ' AND NOT EXISTS (SELECT * FROM ' || W_TABLE3 || ' B';
						W_SQL := W_SQL || '                        WHERE A.DEPT_RANK = B.RANK';
						W_SQL := W_SQL || '                          AND A.DEPT_CODE = B.CODE_VALUE';
						W_SQL := W_SQL || '                          AND B.CUSTOMER_ID = ' || P_RID || '))';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;

--					W_TABLE3 := '';
--					IF INSTR(P_HOSOKU5, '|||') = 0 THEN
--						W_TABLE3 := P_HOSOKU5;
--					ELSIF INSTR(P_HOSOKU5, '|||') > 16 THEN
--						W_TABLE3 := SUBSTR(P_HOSOKU5, 0, INSTR(P_HOSOKU5, '|||')-1);
--					END IF;
--					IF W_TABLE3 IS NOT NULL THEN
--						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET �G���[=447';
--						W_SQL := W_SQL || ' WHERE �G���[ IS NULL';
--						W_SQL := W_SQL || '   AND �h�c IN (';
--						W_SQL := W_SQL || '  SELECT A.�h�c';
--						W_SQL := W_SQL || '    FROM ' || W_TABLE1 || ' A';
--						W_SQL := W_SQL || '       , ' || W_TABLE2 || ' B';
--						W_SQL := W_SQL || '   WHERE A.��ЃR�[�h = B.��ЃR�[�h';
--						W_SQL := W_SQL || '     AND A.����ԍ� = B.����ԍ�';
--						W_SQL := W_SQL || '     AND A.���僉���N = B.���僉���N';
--						W_SQL := W_SQL || '     AND A.����R�[�h = B.����R�[�h';
--						W_SQL := W_SQL || '     AND A.���僉���N IS NOT NULL';
--						W_SQL := W_SQL || '     AND NOT EXISTS (SELECT * FROM ' || W_TABLE3 || ' C';
--						W_SQL := W_SQL || '                      WHERE B.�Ј��R�[�h = C.�Ј��R�[�h))';
--						IF P_SKBN = 5 THEN
--							W_SQL := W_SQL || ' AND A.�h�c = 0';
--						END IF;
--						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
--						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
--					END IF;
				END IF;
			END IF;

		/**********************************************************************/
		/* �ڕW�Ǘ��|���ʕ]��                                                 */
		/**********************************************************************/
		IF P_KINOU = 214 AND P_KKBN = 5 THEN
			/******************************************************************/
			/* �V�[�g�֘A�t���`�F�b�N����                                     */
			/******************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=445';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
			W_SQL := W_SQL || ' WHERE ';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
			END IF;
			W_SQL := W_SQL || ' A.EMP_CODE NOT IN (';
			W_SQL := W_SQL || ' SELECT EMP_CODE';
			W_SQL := W_SQL || ' FROM  WEB_TP2142310_T';
			W_SQL := W_SQL || ' WHERE KAISYACD = A.KAISYACD';
			W_SQL := W_SQL || ' AND HISTORY_NUMBER = A.HISTORY_NUMBER';
			W_SQL := W_SQL || ' AND GOAL_NUMBER = :ORA_1))';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_HOSOKU2);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/******************************************************************/
			/* ���͑ΏێҊ֘A�t���`�F�b�N����                                 */
			/******************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=446';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
			W_SQL := W_SQL || ' WHERE ';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
			END IF;
			W_SQL := W_SQL || ' NOT EXISTS (';
			W_SQL := W_SQL || ' SELECT *';
			W_SQL := W_SQL || ' FROM  WEB_TP2142320_T';
			W_SQL := W_SQL || ' WHERE KAISYACD = A.KAISYACD';
			W_SQL := W_SQL || ' AND HISTORY_NUMBER = A.HISTORY_NUMBER';
			W_SQL := W_SQL || ' AND EMP_CODE = A.EMP_CODE';
			W_SQL := W_SQL || ' AND EVAL_USER_DIV = A.EVAL_USER_DIV';
			W_SQL := W_SQL || ' AND EVAL_USER_CODE = A.EVAL_USER_CODE))';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

		END IF;

		/**********************************************************************/
		/* �ڕW�Ǘ��|���ʕ]���i���͑ΏێҐݒ�j                               */
		/**********************************************************************/
		IF P_KINOU = 214 AND P_KKBN = 7 THEN
			/******************************************************************/
			/* �{�l�`�F�b�N����                                               */
			/******************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=444';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
			W_SQL := W_SQL || '  WHERE ';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
			END IF;
			W_SQL := W_SQL || '     A.EMP_CODE <> A.EVAL_USER_CODE';
			W_SQL := W_SQL || ' AND A.EVAL_USER_DIV = 1)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/******************************************************************/
			/* �{�l�w��`�F�b�N����                                           */
			/******************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=444';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
			W_SQL := W_SQL || '  WHERE ';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
			END IF;
			W_SQL := W_SQL || '     A.EMP_CODE = A.EVAL_USER_CODE';
			W_SQL := W_SQL || ' AND A.EVAL_USER_DIV <> 1)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;

		/**********************************************************************/
		/* ���E��                                                             */
		/**********************************************************************/
		IF P_KINOU = 432 THEN
			/******************************************************************/
			/* �|�X�g�̑��݃`�F�b�N                                           */
			/******************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=501';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND IDENTIFIER NOT IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A,';
			W_SQL := W_SQL || '  WEB_TP4310140_T B';
			W_SQL := W_SQL || '  WHERE ';
			W_SQL := W_SQL || '      A.POST_KAISYACD = B.KAISYACD';
			W_SQL := W_SQL || '  AND A.POST_MANAGEMENT_NUMBER = B.MANAGEMENT_NUMBER)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/******************************************************************/
			/* �Ǘ��O���[�v�ɑ΂��āA�|�X�g���Q�Ɣ͈͊O                       */
			/******************************************************************/
			W_SQL := 'SELECT POST_KAISYACD, MNG_KAISYACD, MNG_MANAGEMENT_NUMBER ';
			W_SQL := W_SQL || '  FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE IDENTIFIER = (SELECT MIN(IDENTIFIER) FROM ' || W_TABLE1 || ')';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR, 1, W_POST_KAISYA);
			DBMS_SQL.DEFINE_COLUMN(W_CSR, 2, W_GROUP_KAISYA);
			DBMS_SQL.DEFINE_COLUMN(W_CSR, 3, W_GROUP_NUMBER);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP
				EXIT WHEN DBMS_SQL.FETCH_ROWS(W_CSR)<=0;
				DBMS_SQL.COLUMN_VALUE(W_CSR, 1, W_POST_KAISYA);
				DBMS_SQL.COLUMN_VALUE(W_CSR, 2, W_GROUP_KAISYA);
				DBMS_SQL.COLUMN_VALUE(W_CSR, 3, W_GROUP_NUMBER);
			END LOOP;

			W_SQL := 'BEGIN WEB_SP4312210_S(';
			W_SQL := W_SQL || ' :ORA_KAISYA ,:ORA_SEDAI ,:ORA_SYUBETU ,:ORA_GROUP_KAISYA ,:ORA_GROUP_NUMBER';
			W_SQL := W_SQL || ',:ORA_OPERATION ,:ORA_PAGEKB,''1'',:ORA_LANGID,:ORA_RID,:ORA_ERR';
			W_SQL := W_SQL || '); END;';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA' ,W_POST_KAISYA);          /* ��ЃR�[�h */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_SEDAI' ,-1);                      /* ����ԍ� */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_SYUBETU' ,'');                    /* �g�D��� */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_GROUP_KAISYA' ,W_GROUP_KAISYA);   /* �Ǘ��O���[�v��ЃR�[�h */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_GROUP_NUMBER' ,W_GROUP_NUMBER);   /* �Ǘ��O���[�v�Ǘ��ԍ� */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_OPERATION' ,'0');                 /* �^�p�� */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_PAGEKB' ,'0');                    /* ��ʋ敪 */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_LANGID' ,0);                      /* ����敪 */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_RID' ,P_RID);                     /* ���p�҂h�c */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_ERR' ,P_ERR);                     /* �G���[�敪(0:����,-1:�G���[) */
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			DBMS_SQL.VARIABLE_VALUE(W_CSR,':ORA_ERR',P_ERR);
			IF P_ERR <> 0 THEN
				GOTO L_EXIT;
			END IF;

			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=502';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND IDENTIFIER NOT IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A,';
			W_SQL := W_SQL || '  WEB_TP4313010_W B';
			W_SQL := W_SQL || '  WHERE ';
			W_SQL := W_SQL || '      B.CUSTOMER_ID = :ORA_CUSTOMER_ID';
			W_SQL := W_SQL || '  AND B.KAISYACD = A.POST_KAISYACD';
			W_SQL := W_SQL || '  AND B.MANAGEMENT_NUMBER = A.POST_MANAGEMENT_NUMBER';
			W_SQL := W_SQL || '  AND B.ANKAFLG = :ORA_ANKAFLG)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_CUSTOMER_ID',P_RID);
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_ANKAFLG','1');
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;
	/**********************************************************************/
	/* �}�X�^���݊m�F                                                     */
	/**********************************************************************/
		IF P_ERR = 0 THEN
			W_CNT := 0;
			W_EMSTCNT :=0;
			W_KAISYA := P_KAISYA;
			W_MSTERRINI := 100;
			IF P_KINOU = '11' AND (P_KKBN = 2 OR P_KKBN = 3 OR P_KKBN = 17) THEN
				/* �|�X�g�Ǘ������`�F�b�N */
				SELECT COUNT(*) INTO W_POST_FLG FROM WEB_TP0060010_M WHERE DIV1 = 431;
				OPEN C_101;
			ELSIF P_KINOU = 214 AND P_KKBN IN (1,3,5) THEN
				W_MSTERRINI := 3000;

				DELETE FROM WEB_TP0009108_W
				 WHERE CUSTOMER_ID = P_RID;
				 
				W_SQL := 'INSERT INTO WEB_TP0009108_W(CUSTOMER_ID,ITEM_ID,MANAGEMENT_NAME,ITEM_NAME,REFERENCE_DIV,MASTER_ID,LITERAL_CONTENT)';
				W_SQL := W_SQL || ' SELECT :ORA_RID,A.ITEM_ID,A.MANAGEMENT_NAME,A.ITEM_NAME,A.REFERENCE_DIV,A.MASTER_ID,A.LITERAL_CONTENT';
				W_SQL := W_SQL || ' FROM WEB_TP2140220_M A';
				W_SQL := W_SQL || ' WHERE A.KAISYACD = :ORA_KAISYA';
				W_SQL := W_SQL || '   AND A.HISTORY_NUMBER = :ORA_RIREKI';
				W_SQL := W_SQL || '   AND A.GOAL_NUMBER = :ORA_MOKUHYO';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_RID',P_RID);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA',P_KAISYA);
				IF P_KKBN = 3 THEN
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_RIREKI',P_HOSOKU3);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MOKUHYO',P_HOSOKU4);
				ELSE
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_RIREKI',P_HOSOKU1);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_MOKUHYO',P_HOSOKU2);
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				OPEN C_102;
				IF P_KAISYA = 0 AND W_KFLG = '1' THEN
					SELECT MIN(KAISYACD) INTO W_KAISYA FROM KAISYA_MS;
					IF P_KKBN = 1 THEN
						W_CNT := 2;
					ELSIF P_KKBN = 5 THEN
						W_CNT := 7;
					END IF;
				ELSE
					IF P_KKBN = 1 THEN
						W_CNT := 1;
					ELSIF P_KKBN = 3 THEN
						W_CNT := 7;
					ELSIF P_KKBN = 5 THEN
						W_CNT := 5;
					END IF;
				END IF;
			ELSE
				OPEN C_001;
			END IF;

			LOOP
				IF P_KINOU = '11' AND (P_KKBN = 2 OR P_KKBN = 3 OR P_KKBN = 17) THEN
					FETCH C_101 INTO C_001_REC;
					EXIT WHEN C_101%NOTFOUND;
				ELSIF P_KINOU = 214 AND P_KKBN IN (1,3,5) THEN
					FETCH C_102 INTO C_001_REC;
					EXIT WHEN C_102%NOTFOUND;
				ELSE
					FETCH C_001 INTO C_001_REC;
					EXIT WHEN C_001%NOTFOUND;
				END IF;

--			FOR C_001_REC IN C_001 LOOP
				W_CNT := W_CNT + 1;
				/* �g�D���� */
				IF C_001_REC.SO_CLS_ID >=1 AND C_001_REC.SO_CLS_USE = '1' THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (W_MSTERRINI + W_CNT - 1);
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER IN (';
					W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || '      ,WEB_TC0000220_M B';
					W_SQL := W_SQL || ' WHERE ';
					IF P_SKBN = 5 THEN
						W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
					END IF;
					W_SQL := W_SQL || '       A.' || C_001_REC.ITEM_NAME || ' IS NOT NULL';
					W_SQL := W_SQL || '   AND B.ORGANIZATION_ID(+)=' || P_SYUBETU;
					W_SQL := W_SQL || '   AND B.IDENTIFIER(+)=' || C_001_REC.SO_CLS_ID;
					W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '=B.CODE_VALUE(+)';
					W_SQL := W_SQL || '   AND B.CODE_VALUE IS NULL)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_EMSTCNT := W_EMSTCNT + 1;
					W_EMSTCD(W_EMSTCNT) := W_MSTERRINI + W_CNT - 1;
					W_EMSTNA(W_EMSTCNT) := TRIM(C_001_REC.SO_CLS_NAME);
				/* ����}�X�^(���ߎ�) */
				ELSIF (P_KINOU = 300 AND C_001_REC.ITEM_ID = 3) THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (W_MSTERRINI + W_CNT - 1);
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER IN (';
					W_SQL := W_SQL || '  SELECT IDENTIFIER';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || '       ,' || W_MATRIXTB2 || ' B';
					W_SQL := W_SQL || '  WHERE ';
					IF P_SKBN = 5 THEN
						W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
					END IF;
					W_SQL := W_SQL || '     (A.DEPT_RANK IS NOT NULL OR A.DEPT_CODE IS NOT NULL OR A.BELONG_CODE IS NOT NULL OR A.BELONG_NAME IS NOT NULL)';
					W_SQL := W_SQL || ' AND A.DEPT_RANK=B.RANK(+)';
					W_SQL := W_SQL || ' AND A.DEPT_CODE=B.CODE_VALUE(+)';
					W_SQL := W_SQL || ' AND B.BEGIN_AGE (+)<=' || P_HOSOKU1;
					W_SQL := W_SQL || ' AND B.END_AGE (+)>' || P_HOSOKU1;
					W_SQL := W_SQL || ' AND B.SALARY_ONLY_FLAG (+)= 0';
					W_SQL := W_SQL || ' AND B.RANK IS NULL)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					/* �Q�Ɖ\���� */
					IF P_HOSOKU3 <> 0 THEN
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=301';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						IF P_SKBN = 5 THEN
							W_SQL := W_SQL || ' AND IDENTIFIER=0';
						END IF;
						W_SQL := W_SQL || '   AND IDENTIFIER NOT IN (';
						W_SQL := W_SQL || ' SELECT A.IDENTIFIER';
						W_SQL := W_SQL || ' FROM ' || W_TABLE1 || ' A';
						W_SQL := W_SQL || ' WHERE (A.DEPT_RANK IS NOT NULL OR A.DEPT_CODE IS NOT NULL OR A.BELONG_CODE IS NOT NULL OR A.BELONG_NAME IS NOT NULL)';
						W_SQL := W_SQL || ' AND (A.DEPT_RANK,A.DEPT_CODE) IN (';
						W_SQL := W_SQL || ' SELECT B.RANK,B.CODE_VALUE';
						W_SQL := W_SQL || ' FROM ' || W_MATRIXTB2 || ' B';
						W_SQL := W_SQL || ' WHERE ';
						W_I := 0;

						W_SQL2 := 'SELECT RANK,CODE_VALUE';
						W_SQL2 := W_SQL2 || ' FROM WEB_TP3000130_M A';
						W_SQL2 := W_SQL2 || ' WHERE A.PROCESS_ID=' || P_HOSOKU2;
						W_SQL2 := W_SQL2 || '   AND A.OPEN_ID=' || P_HOSOKU3;
						W_SQL2 := W_SQL2 || '   AND A.NEW_OLD_DIV=''2''';
						W_SQL2 := W_SQL2 || ' ORDER BY A.RANK,A.CODE_VALUE';
						DBMS_SQL.PARSE(W_CSR,W_SQL2,DBMS_SQL.NATIVE);
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_DATA1);
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_DATA2);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						LOOP 
							W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
							IF W_RVL > 0 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_DATA1);
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_DATA2);
								W_I := W_I + 1;
								IF W_I > 1 THEN
									W_SQL := W_SQL || ' OR ';
								END IF;
								W_SQL := W_SQL || ' CODE_VALUE' || W_DATA1 || '=' || W_DATA2;
							ELSE
								EXIT;
							END IF;
						END LOOP;
						W_SQL := W_SQL || '))';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					END IF;
					W_EMSTCNT := W_EMSTCNT + 1;
					W_EMSTCD(W_EMSTCNT) := W_MSTERRINI + W_CNT - 1;
					W_EMSTNA(W_EMSTCNT) := C_001_REC.MANAGEMENT_NAME;

				/* ���Ə��}�X�^ */
				ELSIF C_001_REC.MASTER_ID = 202 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (W_MSTERRINI + W_CNT - 1);
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER IN (';
					W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || '      ,OFFICE_MS B';
					W_SQL := W_SQL || ' WHERE ';
					IF P_SKBN = 5 THEN
						W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
					END IF;
					W_SQL := W_SQL || '        A.INTERNAL_CODE = B.INTERNAL_ASSIGN_CODE(+)';
					W_SQL := W_SQL || '    AND A.ISSUE_DATE >= B.BEGIN_DATE(+)';
					W_SQL := W_SQL || '    AND A.ISSUE_DATE <= B.END_DATE(+)';
					IF P_KKBN = 4 THEN
						W_SQL := W_SQL || '    AND B.SALARY_OFFICE_FLAG (+)= -1';
					END IF;
					W_SQL := W_SQL || '    AND B.INTERNAL_ASSIGN_CODE IS NULL)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_EMSTCNT := W_EMSTCNT + 1;
					W_EMSTCD(W_EMSTCNT) := W_MSTERRINI + W_CNT - 1;
					W_EMSTNA(W_EMSTCNT) := C_001_REC.MANAGEMENT_NAME;

				/* ���_�}�X�^ */
				ELSIF C_001_REC.MASTER_ID = 253 AND P_KINOU = 11 AND P_KKBN = 1 THEN
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (W_MSTERRINI + W_CNT - 1);
					W_SQL := W_SQL || ' WHERE ERROR IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER IN (';
					W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
					IF C_001_REC.REFERENCE_DIV='1' OR C_001_REC.REFERENCE_DIV='3' THEN
						IF WEB_SP0002420_F(1,C_001_REC.MASTER_ID) = 1 THEN
							W_SQL := W_SQL || ',(' || WEB_SP0002430_F(2,1,C_001_REC.MASTER_ID,'') || ') B';
						ELSE
							W_SQL := W_SQL || ',' || C_001_REC.MASTER_NAME || ' B';
						END IF;
					END IF;
					W_SQL := W_SQL || ' WHERE A.KAISYACD = B.KAISYACD(+) AND';
					IF P_SKBN = 5 THEN
						W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
					END IF;
					W_SQL := W_SQL || '       A.' || C_001_REC.ITEM_NAME || ' IS NOT NULL';
					IF C_001_REC.REFERENCE_DIV='1' OR C_001_REC.REFERENCE_DIV='3' THEN
						IF WEB_SP0002420_F(1,C_001_REC.MASTER_ID) = 1 THEN
							IF P_KINOU = 11 AND P_KKBN = 1 THEN
								W_SQL := W_SQL || ' AND A.BEGIN_DATE>=B.BEGIN_DAY(+)';
								W_SQL := W_SQL || ' AND A.BEGIN_DATE<=B.END_DAY(+)';
							END IF;
						END IF;
					END IF;

					IF C_001_REC.REFERENCE_DIV='1' THEN
						IF C_001_REC.DATA_TYPE = 'VARCHAR2' OR C_001_REC.DATA_TYPE = 'CHAR' THEN
							W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '=TO_CHAR(B.' || C_001_REC.MASTER_CODE_ITEM || '(+))';
						ELSE
							W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '=B.' || C_001_REC.MASTER_CODE_ITEM || '(+)';
						END IF;
						W_SQL := W_SQL || '   AND B.' || C_001_REC.MASTER_CODE_ITEM || ' IS NULL)';
					ELSIF C_001_REC.REFERENCE_DIV='2' THEN
						W_SQL := W_SQL || '   AND DECODE(A.' || C_001_REC.ITEM_NAME || ',' || C_001_REC.LITERAL_CONTENT || ') IS NULL)';
					ELSIF C_001_REC.REFERENCE_DIV='3' THEN
						W_I := 1;
						W_STR_X := INSTR(C_001_REC.MASTER_CODE_ITEM,',',W_I);
						W_MSTK1 := SUBSTR(C_001_REC.MASTER_CODE_ITEM,1,W_STR_X-1);
						W_MSTK2 := SUBSTR(C_001_REC.MASTER_CODE_ITEM,W_STR_X+1);
						W_SQL := W_SQL || '   AND A.' || C_001_REC.MASTER_LINK_ITEM || '=B.' || W_MSTK1 || ' (+)';
						W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '=B.' || W_MSTK2 || ' (+)';
						W_SQL := W_SQL || '   AND B.' || W_MSTK1 || ' IS NULL)';
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					W_EMSTCNT := W_EMSTCNT + 1;
					W_EMSTCD(W_EMSTCNT) := W_MSTERRINI + W_CNT - 1;
					W_EMSTNA(W_EMSTCNT) := C_001_REC.MANAGEMENT_NAME;
					
				/* �@�l�ԍ��}�X�^ */
				ELSIF C_001_REC.MASTER_ID = 99990 AND P_KINOU = 11 AND (P_KKBN = 1 OR P_KKBN = 9) THEN
					IF W_NRENKEI = '1' THEN
						IF P_KINOU = 11 AND P_KKBN = 9 AND WEB_SP0002420_F(1,253) = 1 THEN
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (100 + W_CNT + 1);
						ELSE
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (100 + W_CNT - 1);
						END IF;
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER IN (';
						W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
						W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
						W_SQL := W_SQL || '     ,NCL_CORPORATION_NUMBER_MS B';
						W_SQL := W_SQL || ' WHERE A.CORPORATION_NUMBER IS NOT NULL';
						W_SQL := W_SQL || '   AND A.KAISYACD = B.KAISYACD(+)';
						W_SQL := W_SQL || '   AND A.CORPORATION_NUMBER = B.CORPORATION_NUMBER(+)';
						IF P_SKBN = 5 THEN
							W_SQL := W_SQL || ' AND A.IDENTIFIER=0';
						END IF;
						W_SQL := W_SQL || '   AND B.CORPORATION_NUMBER IS NULL)';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						W_EMSTCNT := W_EMSTCNT + 1;
						IF P_KINOU = 11 AND P_KKBN = 9 AND WEB_SP0002420_F(1,253) = 1 THEN
							W_EMSTCD(W_EMSTCNT) := W_MSTERRINI + W_CNT + 1;
						ELSE
							W_EMSTCD(W_EMSTCNT) := W_MSTERRINI + W_CNT - 1;
						END IF;
						W_EMSTNA(W_EMSTCNT) := 'CORPORATION_NUMBER';
					END IF;
				ELSE
					IF P_KINOU = 214 AND (P_KKBN = 3 OR P_KKBN = 4 OR P_KKBN = 5 OR P_KKBN = 6 OR P_KKBN = 7) AND (W_KFLG = '0' OR (W_KFLG = '1' AND P_KAISYA = 0)) AND C_001_REC.MASTER_ID = 206 THEN
					/* �V���O���J���p�j�[�ŁA�ڕW�Ǘ��i�g�D�ڕW�E���ʕ]���j�͉�Ѓ}�X�^�̃`�F�b�N���s��Ȃ� */
						W_J := 0;					/* �_�~�[ */
					ELSIF P_KINOU = 432 AND (P_KKBN = 1 OR P_KKBN = 2) AND W_KFLG = '0' AND (C_001_REC.MASTER_ID = 206 OR C_001_REC.MASTER_ID = 432) THEN
					/* �V���O���J���p�j�[�ŁA���E�ҁi�f�[�^�捞�j�͉�Ѓ}�X�^�̃`�F�b�N���s��Ȃ� */
						W_J := 0;					/* �_�~�[ */
					ELSIF P_KINOU = 432 AND (P_KKBN = 1 OR P_KKBN = 2) AND C_001_REC.MASTER_ID = 219 THEN
					/* ���E�ҁi�f�[�^�捞�j�̃|�X�g���݃`�F�b�N�͕ʓr�ōs�����߁A�����ł͍s��Ȃ� */
						W_J := 0;					/* �_�~�[ */
					ELSE
						IF C_001_REC.REFERENCE_DIV = '1' OR C_001_REC.REFERENCE_DIV = '2' OR C_001_REC.REFERENCE_DIV = '3' THEN
							W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=' || (W_MSTERRINI + W_CNT - 1);
							W_SQL := W_SQL || ' WHERE ERROR IS NULL';
							W_SQL := W_SQL || '   AND IDENTIFIER IN (';
							W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
							W_SQL := W_SQL || '  FROM ' || W_TABLE1 || ' A';
							IF C_001_REC.REFERENCE_DIV='1' OR C_001_REC.REFERENCE_DIV='3' THEN
								IF WEB_SP0002420_F(1,C_001_REC.MASTER_ID) = 1 THEN
									W_SQL := W_SQL || ',(' || WEB_SP0002430_F(2,1,C_001_REC.MASTER_ID,'') || ') B';
								ELSE
									W_SQL := W_SQL || ',' || C_001_REC.MASTER_NAME || ' B';
								END IF;
							END IF;
							IF W_KFLG = '0' THEN
								W_SQL := W_SQL || ' WHERE ';
							ELSE
								IF C_001_REC.CORP_DIV = 1 THEN
									W_SQL := W_SQL || ' WHERE B.KAISYACD(+) = :ORA_1 AND';
								ELSIF C_001_REC.CORP_DIV = 2 THEN
									W_SQL := W_SQL || ' WHERE B.KAISYACD(+) = :ORA_1 AND';
								ELSE
									W_SQL := W_SQL || ' WHERE ';
								END IF;
							END IF;
							IF P_SKBN = 5 THEN
								W_SQL := W_SQL || ' A.IDENTIFIER=0 AND';
							END IF;
							W_SQL := W_SQL || '       A.' || C_001_REC.ITEM_NAME || ' IS NOT NULL';
							IF C_001_REC.REFERENCE_DIV='1' OR C_001_REC.REFERENCE_DIV='3' THEN
								IF WEB_SP0002420_F(1,C_001_REC.MASTER_ID) = 1 THEN
									IF P_KINOU = 11 AND P_KKBN = 1 THEN
										W_SQL := W_SQL || ' AND A.BEGIN_DATE>=B.BEGIN_DAY(+)';
										W_SQL := W_SQL || ' AND A.BEGIN_DATE<=B.END_DAY(+)';
									ELSIF P_KINOU = 11 AND (P_KKBN = 2 OR P_KKBN = 3 OR P_KKBN = 17) THEN
										W_SQL := W_SQL || ' AND TO_DATE(''' || P_HOSOKU3 || ''',''YYYY/MM/DD'')>=B.BEGIN_DAY(+)';
										W_SQL := W_SQL || ' AND TO_DATE(''' || P_HOSOKU3 || ''',''YYYY/MM/DD'')<=B.END_DAY(+)';
									END IF;
								END IF;
							END IF;
							IF W_NULLCD IS NOT NULL AND P_KINOU = 300 AND C_001_REC.MASTER_ID = 200 THEN
							/* �ٓ��̐E�\�������}�X�^(���ݒ�̒l�ƃ��[�N�̐E�\�������̒l���قȂ�Ƃ��G���[�Ƃ���) */
								W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '<>:ORA_2';
							END IF;
							IF C_001_REC.REFERENCE_DIV='1' THEN
								IF C_001_REC.DATA_TYPE = 'VARCHAR2' OR C_001_REC.DATA_TYPE = 'CHAR' THEN
									W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '=TO_CHAR(B.' || C_001_REC.MASTER_CODE_ITEM || '(+))';
								ELSE
									W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '=B.' || C_001_REC.MASTER_CODE_ITEM || '(+)';
								END IF;
								W_SQL := W_SQL || '   AND B.' || C_001_REC.MASTER_CODE_ITEM || ' IS NULL)';
							ELSIF C_001_REC.REFERENCE_DIV='2' THEN
								W_SQL := W_SQL || '   AND DECODE(A.' || C_001_REC.ITEM_NAME || ',' || C_001_REC.LITERAL_CONTENT || ') IS NULL)';
							ELSIF C_001_REC.REFERENCE_DIV='3' THEN
								W_I := 1;
								W_STR_X := INSTR(C_001_REC.MASTER_CODE_ITEM,',',W_I);
								W_MSTK1 := SUBSTR(C_001_REC.MASTER_CODE_ITEM,1,W_STR_X-1);
								W_MSTK2 := SUBSTR(C_001_REC.MASTER_CODE_ITEM,W_STR_X+1);
								W_SQL := W_SQL || '   AND A.' || C_001_REC.MASTER_LINK_ITEM || '=B.' || W_MSTK1 || ' (+)';
								W_SQL := W_SQL || '   AND A.' || C_001_REC.ITEM_NAME || '=B.' || W_MSTK2 || ' (+)';
								W_SQL := W_SQL || '   AND B.' || W_MSTK1 || ' IS NULL)';
							END IF;
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							IF W_KFLG <> '0' AND C_001_REC.CORP_DIV IN (1,2) THEN
								DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KAISYA);
							END IF;
							IF W_NULLCD IS NOT NULL AND P_KINOU = 300 AND C_001_REC.MASTER_ID = 200 THEN
								DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',TO_NUMBER(W_NULLCD));
							END IF;
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
							W_EMSTCNT := W_EMSTCNT + 1;
							W_EMSTCD(W_EMSTCNT) := W_MSTERRINI + W_CNT - 1;
							W_EMSTNA(W_EMSTCNT) := C_001_REC.MANAGEMENT_NAME;
						END IF;
					END IF;
				END IF;
			END LOOP;

			IF P_KINOU = '11' AND (P_KKBN = 2 OR P_KKBN = 3 OR P_KKBN = 17) THEN
				CLOSE C_101;
			ELSIF P_KINOU = 214 AND P_KKBN IN (1,3,5) THEN
				CLOSE C_102;
			ELSE
				CLOSE C_001;
			END IF;
		END IF;

	/**********************************************************************/
	/* �G���[���݊m�F                                                     */
	/**********************************************************************/
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

	/**********************************************************************/
	/* ���R�g����ďo����(�㏈��)                                         */
	/**********************************************************************/
		IF P_ERR = 0 THEN
			SELECT COUNT(*) INTO W_CNT FROM USER_OBJECTS WHERE OBJECT_NAME = 'WEB_SP0061223_S';
			IF W_CNT > 0 THEN
				W_SQL := 'BEGIN WEB_SP0061223_S(';
				W_SQL := W_SQL || ' :ORA_1 ,:ORA_2 ,:ORA_3 ,:ORA_4 ,:ORA_5 ,:ORA_6 ,:ORA_7 ,:ORA_8 ,:ORA_9 ,:ORA_10';
				W_SQL := W_SQL || ',:ORA_11,:ORA_12,:ORA_13,:ORA_14,:ORA_15,:ORA_16,:ORA_17,:ORA_18,:ORA_19,:ORA_20';
				W_SQL := W_SQL || ',:ORA_21,:ORA_22';
				W_SQL := W_SQL || '); END;';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1' ,P_KAISYA);		/* ��ЃR�[�h */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2' ,P_SKBN);			/* 1:�e�[�u���쐬,2:�`�F�b�N,3:�o�^,4:�e�[�u���폜,5:���[�N�ύX,6:�ꊇ�捞 */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_3' ,P_KINOU);		/* �@�\�敪 */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_4' ,P_KKBN);			/* �捞�h�c */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_5' ,P_UPDKBN);		/* �X�V�敪(1:�ǉ�,2:�u���ǉ�,3:�폜�ǉ�,4:�u��) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_6' ,P_WKKBN);		/* ܰ��ύX���敪(1:����,2:�ύX,3:�폜) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_7' ,P_KID);			/* �X�V��Ώۋ敪(0:�ʏ�,���̑�:���ڒP��(�e�r�b�g=0:�ΏۊO,1:�Ώ�)) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_8' ,P_SID);			/* �X�V�ҎЈ��R�[�h,ܰ��ύX��(���R�[�h�h�c) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_9' ,P_RID);			/* ���p�҂h�c */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_10',P_HOSOKU1);		/* �⑫�敪�P */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_11',P_HOSOKU2);		/* �⑫�敪�Q */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_12',P_HOSOKU3);		/* �⑫�敪�R */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_13',P_HOSOKU4);		/* �⑫�敪�S */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_14',P_HOSOKU5);		/* �⑫�敪�T */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_15',P_SDATE);		/* �������� */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_16',P_EXEID);		/* ���s�h�c */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_17',P_KDATE);		/* �J�n���� */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_18',P_ERREXE);		/* �G���[�Ή� */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_19',P_UNIQUE);		/* �d���Ή�(1:��.2:�擪�D��,3:�ŏI�D��) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_20',P_YOBI);			/* �\���t���O */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_21',P_SYUBETU);		/* �g�D��� */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_22',W_ERR);			/* �G���[�敪(0:����,-1:�G���[) */
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				DBMS_SQL.VARIABLE_VALUE(W_CSR,':ORA_22',W_ERR);
				IF W_ERR <> 0 THEN
					P_ERR := -1;
				END IF;
			END IF;
		END IF;
	ELSIF P_SKBN = 5 AND (P_WKKBN = 2 OR P_WKKBN = 3) THEN
		-- �����Ǘ����f
		IF W_MSTRKBN = 1 THEN
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
			W_SQL := W_SQL || ' WHERE ERROR = 8';
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
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* ���_�R�[�h */
			IF W_KKFLG = 1 THEN
				DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* ��ЃR�[�h */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* �J�n�� */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* �I���� */
			ELSE
				DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* �J�n�� */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* �I���� */
			END IF;
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				IF W_RVL > 0 THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);	/* �h�c */
					DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* ���_�R�[�h */
					IF W_KKFLG = 1 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* ��ЃR�[�h */
						DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* �J�n�� */
						DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* �I���� */
					ELSE
						DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �J�n�� */
						DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �I���� */
					END IF;

					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=8';
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
					W_SQL := W_SQL || '    AND BASE_CODE = :ORA_2';
					IF W_KKFLG = 1 THEN
						W_SQL := W_SQL || '    AND KAISYACD = :ORA_3';
					END IF;
					W_SQL := W_SQL || ' HAVING COUNT(*) > 1';
					W_SQL := W_SQL || '  GROUP BY ' || W_GRPINF || ')';
					DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA3);
					DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA4);
					DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',W_KDATA2);
					IF W_KKFLG = 1 THEN
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_3',W_KDATA5);
					END IF;
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
				DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* ���_�R�[�h */
				IF W_KKFLG = 1 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* ��ЃR�[�h */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* �I���� */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* �J�n�� */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* �I���� */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);	/* �h�c */
						DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* ���_�R�[�h */
						IF W_KKFLG = 1 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* ��ЃR�[�h */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* �I���� */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* �J�n�� */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* �I���� */
						END IF;

						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=9';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER = (';
						W_SQL := W_SQL || ' SELECT ' || W_KDATA1;
						W_SQL := W_SQL || '   FROM ' || W_TABLE2 || ' A';
						W_SQL := W_SQL || '      , ' || W_TABLE1 || ' B';
						W_SQL := W_SQL || '  WHERE ((A.BEGIN_DAY > :ORA_0';
						W_SQL := W_SQL || '    AND  A.BEGIN_DAY <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
						W_SQL := W_SQL || '     OR (NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_0';
						W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) <= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')))';
						W_SQL := W_SQL || '     OR (A.BEGIN_DAY < :ORA_0';
						W_SQL := W_SQL || '    AND  NVL(NVL(B.END_DAY,A.END_DAY),TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= NVL(:ORA_1,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))))';
						IF P_UPDKBN = '2' THEN
							W_SQL := W_SQL || '    AND A.BEGIN_DAY <> :ORA_0';
						END IF;
						W_SQL := W_SQL || '    AND A.BASE_CODE = :ORA_2';
						W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> :ORA_3';
						W_SQL := W_SQL || '    AND B.IDENTIFIER(+) <> :ORA_4';
						W_SQL := W_SQL || '    AND B.ERROR(+) IS NULL';
						W_SQL := W_SQL || '    AND B.DELETE_DIV(+) IS NULL';
						W_SQL := W_SQL || '    AND A.BEGIN_DAY = B.BEGIN_DAY(+)';
						W_SQL := W_SQL || '    AND A.BASE_CODE = B.BASE_CODE(+)';
						IF W_KKFLG = 1 THEN
							W_SQL := W_SQL || '    AND A.KAISYACD = :ORA_5';
							W_SQL := W_SQL || '    AND A.KAISYACD = B.KAISYACD(+)';
						END IF;
						W_SQL := W_SQL || ' HAVING COUNT(*) > 0';
						W_SQL := W_SQL || '  GROUP BY A.BASE_CODE)';

						DBMS_SQL.PARSE(W_CSR2,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_0',W_KDATA3);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_1',W_KDATA4);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_2',W_KDATA2);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_3',P_SID);
						DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_4',W_KDATA1);
						IF W_KKFLG = 1 THEN
							DBMS_SQL.BIND_VARIABLE(W_CSR2,':ORA_5',W_KDATA5);
						END IF;
						W_RVL2 := DBMS_SQL.EXECUTE(W_CSR2);
					ELSE
						EXIT;
					END IF;
				END LOOP;
			END IF;
		END IF;
	END IF;

/**********************************************************************/
/* �G���[���e�o�^                                                     */
/**********************************************************************/
	IF P_SKBN = 6 THEN
		/**********************************************************************/
		/* ����Ј��ɃG���[������ꍇ�̓���Ј��̐�����G���[�Ƃ���           */
		/**********************************************************************/
		IF P_ERREXE = 2 THEN
			/* �G���[�f�[�^ */
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=5';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND ' || W_SKNAME || ' IN (';
			W_SQL := W_SQL || ' SELECT DISTINCT EMP_CODE';
			W_SQL := W_SQL || '  FROM WEB_TPA020040_T';
			W_SQL := W_SQL || ' WHERE KAISYACD=:ORA_1';
			W_SQL := W_SQL || '   AND FUNCTION_DIV=' || P_HOSOKU1;
			W_SQL := W_SQL || '   AND TARGET_DIV=' || P_HOSOKU2;
			W_SQL := W_SQL || '   AND EXECUTE_ID=' || P_EXEID;
			W_SQL := W_SQL || '   AND PROCESS_YMD=TO_DATE(''' || P_SDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
			W_SQL := W_SQL || '   AND EMP_CODE IS NOT NULL)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/* �捞�f�[�^ */
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=5';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			W_SQL := W_SQL || '   AND ' || W_SKNAME || ' IN (';
			W_SQL := W_SQL || ' SELECT DISTINCT ' || W_SKNAME;
			W_SQL := W_SQL || '  FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE ERROR IS NOT NULL)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;

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
		W_SQL := W_SQL || ',' || P_HOSOKU1;
		W_SQL := W_SQL || ',' || P_HOSOKU2;
		W_SQL := W_SQL || ',' || P_EXEID;
		W_SQL := W_SQL || ',IDENTIFIER';
		W_SQL := W_SQL || ',ERROR';
		W_SQL := W_SQL || ',DECODE(ERROR';
		W_SQL := W_SQL || ',1,''�Ј��ԍ��͑��݂��܂���B''';
		W_SQL := W_SQL || ',2,''�L�[���d�����Ă��܂��B''';
		W_SQL := W_SQL || ',3,''�����f�[�^�ɃL�[�d��������܂��B''';
		W_SQL := W_SQL || ',4,''�u������f�[�^�����݂��܂���B''';
		W_SQL := W_SQL || ',7,''�L�[�d���̏��O�f�[�^�ł��B''';
		W_SQL := W_SQL || ',201,''����l�ێ����ɑ��݂��܂��B''';
		W_SQL := W_SQL || ',202,''�{�l�̃f�[�^�͎捞�ł��܂���B''';
		W_SQL := W_SQL || ',301,''�{�l�o�^�ΏۊO�̑g�D���w�肳��Ă��܂��B''';
		W_SQL := W_SQL || ',401,''������ԓ��Ɏ��Ə��R�[�h���d�����Ă��܂��B''';
		W_SQL := W_SQL || ',402,''������ԓ��ɕ\�������d�����Ă��܂��B''';
		W_SQL := W_SQL || ',403,''������ԓ��ɂ܂Ƃߎ��Ə��R�[�h�����݂��܂���B''';
		W_SQL := W_SQL || ',404,''�w�肳�ꂽ�܂Ƃߎ��Ə��R�[�h�́A���̎��Ə��ɂ܂Ƃ߂��Ă��܂��B''';
		FOR W_I IN 1..W_EMSTCNT LOOP
			IF W_I = 1 THEN
				W_SQL := W_SQL || ',DECODE(ERROR';
			END IF;
			W_SQL := W_SQL || ',' || W_EMSTCD(W_I) || ',''�u' || W_EMSTNA(W_I) || '�v''';
			IF W_I = W_EMSTCNT THEN
				W_SQL := W_SQL || ') || ''=�}�X�^������''';
			END IF;
		END LOOP;
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
		W_SQL := W_SQL || '   AND FUNCTION_DIV=' || P_HOSOKU1;
		W_SQL := W_SQL || '   AND TARGET_DIV=' || P_HOSOKU2;
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

	/**********************************************************************/
	/* �ʏ�o�^��                                                         */
	/**********************************************************************/
		IF P_KID = '0' THEN
		/**********************************************************************/
		/* �폜����                                                           */
		/**********************************************************************/
			/* �ڕW�Ǘ��|�g�D�i��]���Ґݒ�j */
			IF P_KINOU = 214 AND P_KKBN = 4 THEN
				/* �g�D�ڕW���̓t�@�C���̍폜 */
				/* �폜���ǉ��� */
				IF P_UPDKBN = 3 THEN
					W_SQL := 'DELETE FROM WEB_TP2141050_T A';
					W_SQL := W_SQL || ' WHERE (A.KAISYACD,A.HISTORY_NUMBER) IN ';
					W_SQL := W_SQL || '                  (SELECT DISTINCT KAISYACD,HISTORY_NUMBER';
					W_SQL := W_SQL || '                     FROM ' || W_TABLE1 || ')';
					W_SQL := W_SQL || '   AND NOT EXISTS (SELECT *';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE DELETE_DIV IS NULL';
					W_SQL := W_SQL || '   AND KAISYACD = A.KAISYACD';
					W_SQL := W_SQL || '   AND HISTORY_NUMBER = A.HISTORY_NUMBER';
					W_SQL := W_SQL || '   AND DEPT_RANK = A.DEPT_RANK';
					W_SQL := W_SQL || '   AND DEPT_CODE = A.DEPT_CODE)';

					IF P_HOSOKU5 IS NOT NULL THEN
						IF INSTR(P_HOSOKU5, '|||') > 0 THEN
							W_TABLE3 := SUBSTR(P_HOSOKU5, INSTR(P_HOSOKU5, '|||')+3);

							W_SQL := W_SQL || '   AND EXISTS (SELECT *';
							W_SQL := W_SQL || '                 FROM ' || W_TABLE3 || ' B';
							W_SQL := W_SQL || '                WHERE A.DEPT_RANK = B.RANK';
							W_SQL := W_SQL || '                  AND A.DEPT_CODE = B.CODE_VALUE';
							W_SQL := W_SQL || '                  AND B.CUSTOMER_ID = ' || P_RID || ')';
						END IF;
					END IF;

					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				/* �u�����ǉ����E�폜���ǉ����E�u�� */
				IF P_UPDKBN = 2 OR P_UPDKBN = 3 OR P_UPDKBN = 4 THEN
					W_SQL := 'DELETE FROM WEB_TP2141050_T D';
					W_SQL := W_SQL || ' WHERE (D.KAISYACD,D.HISTORY_NUMBER,D.DEPT_RANK,D.DEPT_CODE,D.HISTORY_ID) IN (';
					W_SQL := W_SQL || '  SELECT A.KAISYACD,A.HISTORY_NUMBER,A.DEPT_RANK,A.DEPT_CODE,0';
					W_SQL := W_SQL || '    FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || '       , ' || W_TABLE2 || ' B';
					W_SQL := W_SQL || '   WHERE A.DELETE_DIV IS NULL';
					W_SQL := W_SQL || '     AND A.KAISYACD = B.KAISYACD';
					W_SQL := W_SQL || '     AND A.HISTORY_NUMBER = B.HISTORY_NUMBER';
					W_SQL := W_SQL || '     AND A.DEPT_RANK = B.DEPT_RANK';
					W_SQL := W_SQL || '     AND A.DEPT_CODE = B.DEPT_CODE';
					W_SQL := W_SQL || '     AND A.GOAL_NUMBER <> B.GOAL_NUMBER)';
					IF P_HOSOKU5 IS NOT NULL THEN
						IF INSTR(P_HOSOKU5, '|||') > 0 THEN
							W_TABLE3 := SUBSTR(P_HOSOKU5, INSTR(P_HOSOKU5, '|||')+3);

							W_SQL := W_SQL || '   AND EXISTS (SELECT *';
							W_SQL := W_SQL || '                 FROM ' || W_TABLE3 || ' C';
							W_SQL := W_SQL || '                WHERE D.DEPT_RANK = C.RANK';
							W_SQL := W_SQL || '                  AND D.DEPT_CODE = C.CODE_VALUE';
							W_SQL := W_SQL || '                  AND C.CUSTOMER_ID = ' || P_RID || ')';
						END IF;
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

			/* �ڕW�Ǘ��|���ʁi��]���Ґݒ�j */
			IF P_KINOU = 214 AND P_KKBN = 6 THEN
				/* ���ʓ��̓t�@�C���̍폜 */
				/* �폜���ǉ��� */
				IF P_UPDKBN = 3 THEN
					W_SQL := 'DELETE FROM WEB_TP2141060_T A';
					W_SQL := W_SQL || ' WHERE (A.KAISYACD,A.HISTORY_NUMBER) IN ';
					W_SQL := W_SQL || '                  (SELECT DISTINCT KAISYACD,HISTORY_NUMBER';
					W_SQL := W_SQL || '                     FROM ' || W_TABLE1 || ')';
					W_SQL := W_SQL || '   AND NOT EXISTS (SELECT *';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE DELETE_DIV IS NULL';
					W_SQL := W_SQL || '   AND KAISYACD = A.KAISYACD';
					W_SQL := W_SQL || '   AND HISTORY_NUMBER = A.HISTORY_NUMBER';
					W_SQL := W_SQL || '   AND EMP_CODE = A.EMP_CODE)';
					IF P_HOSOKU5 IS NOT NULL THEN
						W_TABLE3 := '';
						IF INSTR(P_HOSOKU5, '|||') = 0 THEN
							W_TABLE3 := P_HOSOKU5;
						ELSIF INSTR(P_HOSOKU5, '|||') > 16 THEN
							W_TABLE3 := SUBSTR(P_HOSOKU5, 0, INSTR(P_HOSOKU5, '|||')-1);
						END IF;
						IF W_TABLE3 IS NOT NULL THEN
							W_SQL := W_SQL || ' AND EXISTS (SELECT *';
							W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' B';
							W_SQL := W_SQL || '              WHERE A.EMP_CODE = B.EMP_CODE)';
						END IF;
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					W_SQL := 'UPDATE WEB_TP2142320_T A SET ';
					W_SQL := W_SQL || ' INPUT_DIV = 0';
					W_SQL := W_SQL || ',INPUT_DATE = NULL';
					W_SQL := W_SQL || ',INPUT_EMP_CODE = NULL';
					W_SQL := W_SQL || ',UPDATE_DATE = SYSDATE';
					W_SQL := W_SQL || ',UPDATE_USER = :ORA_1';
					W_SQL := W_SQL || ' WHERE (A.KAISYACD,A.HISTORY_NUMBER) IN ';
					W_SQL := W_SQL || '                  (SELECT DISTINCT KAISYACD,HISTORY_NUMBER';
					W_SQL := W_SQL || '                     FROM ' || W_TABLE1 || ')';
					W_SQL := W_SQL || '   AND NOT EXISTS (SELECT *';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE DELETE_DIV IS NULL';
					W_SQL := W_SQL || '   AND KAISYACD = A.KAISYACD';
					W_SQL := W_SQL || '   AND HISTORY_NUMBER = A.HISTORY_NUMBER';
					W_SQL := W_SQL || '   AND EMP_CODE = A.EMP_CODE)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				/* �u�����ǉ����E�폜���ǉ����E�u�� */
				IF P_UPDKBN = 2 OR P_UPDKBN = 3 OR P_UPDKBN = 4 THEN
					W_SQL := 'DELETE FROM WEB_TP2141060_T D';
					W_SQL := W_SQL || ' WHERE (D.KAISYACD,D.HISTORY_NUMBER,D.EMP_CODE) IN (';
					W_SQL := W_SQL || '  SELECT A.KAISYACD,A.HISTORY_NUMBER,A.EMP_CODE';
					W_SQL := W_SQL || '    FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || '       , ' || W_TABLE2 || ' B';
					W_SQL := W_SQL || '   WHERE A.DELETE_DIV IS NULL';
					W_SQL := W_SQL || '     AND A.KAISYACD = B.KAISYACD';
					W_SQL := W_SQL || '     AND A.HISTORY_NUMBER = B.HISTORY_NUMBER';
					W_SQL := W_SQL || '     AND A.EMP_CODE = B.EMP_CODE';
					W_SQL := W_SQL || '     AND A.GOAL_NUMBER <> B.GOAL_NUMBER)';
					IF P_HOSOKU5 IS NOT NULL THEN
						W_TABLE3 := '';
						IF INSTR(P_HOSOKU5, '|||') = 0 THEN
							W_TABLE3 := P_HOSOKU5;
						ELSIF INSTR(P_HOSOKU5, '|||') > 16 THEN
							W_TABLE3 := SUBSTR(P_HOSOKU5, 0, INSTR(P_HOSOKU5, '|||')-1);
						END IF;
						IF W_TABLE3 IS NOT NULL THEN
							W_SQL := W_SQL || ' AND EXISTS (SELECT *';
							W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' C1';
							W_SQL := W_SQL || '              WHERE D.EMP_CODE = C1.EMP_CODE)';
--							W_SQL := W_SQL || ' AND EXISTS (SELECT *';
--							W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' C2';
--							W_SQL := W_SQL || '              WHERE D.�]���҃R�[�h = C2.�Ј��R�[�h)';
						END IF;
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					W_SQL := 'UPDATE WEB_TP2142320_T A SET ';
					W_SQL := W_SQL || ' INPUT_DIV = 0';
					W_SQL := W_SQL || ',INPUT_DATE = NULL';
					W_SQL := W_SQL || ',INPUT_EMP_CODE = NULL';
					W_SQL := W_SQL || ',UPDATE_DATE = SYSDATE';
					W_SQL := W_SQL || ',UPDATE_USER = :ORA_1';
					W_SQL := W_SQL || ' WHERE (KAISYACD,HISTORY_NUMBER,EMP_CODE) IN (';
					W_SQL := W_SQL || '  SELECT A.KAISYACD,A.HISTORY_NUMBER,A.EMP_CODE';
					W_SQL := W_SQL || '    FROM ' || W_TABLE1 || ' A';
					W_SQL := W_SQL || '       , ' || W_TABLE2 || ' B';
					W_SQL := W_SQL || '   WHERE A.DELETE_DIV IS NULL';
					W_SQL := W_SQL || '     AND A.KAISYACD = B.KAISYACD';
					W_SQL := W_SQL || '     AND A.HISTORY_NUMBER = B.HISTORY_NUMBER';
					W_SQL := W_SQL || '     AND A.EMP_CODE = B.EMP_CODE';
					W_SQL := W_SQL || '     AND A.GOAL_NUMBER <> B.GOAL_NUMBER)';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

			/* �ڕW�Ǘ��|���ʁi���͑ΏێҐݒ�j */
			IF P_KINOU = 214 AND P_KKBN = 7 THEN
				/* ���ʓ��̓t�@�C���̍폜 */
				/* �폜���ǉ��� */
				IF P_UPDKBN = 3 THEN
					W_SQL := 'DELETE FROM WEB_TP2141060_T A';
					W_SQL := W_SQL || ' WHERE (A.KAISYACD,A.HISTORY_NUMBER) IN ';
					W_SQL := W_SQL || '                  (SELECT DISTINCT KAISYACD,HISTORY_NUMBER';
					W_SQL := W_SQL || '                     FROM ' || W_TABLE1 || ')';
					IF P_HOSOKU5 IS NOT NULL THEN
						W_TABLE3 := '';
						IF INSTR(P_HOSOKU5, '|||') = 0 THEN
							W_TABLE3 := P_HOSOKU5;
						ELSIF INSTR(P_HOSOKU5, '|||') > 16 THEN
							W_TABLE3 := SUBSTR(P_HOSOKU5, 0, INSTR(P_HOSOKU5, '|||')-1);
						END IF;
						IF W_TABLE3 IS NOT NULL THEN
							W_SQL := W_SQL || ' AND EXISTS (SELECT *';
							W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' B';
							W_SQL := W_SQL || '              WHERE A.EMP_CODE = B.EMP_CODE)';
--							W_SQL := W_SQL || ' AND EXISTS (SELECT *';
--							W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' C';
--							W_SQL := W_SQL || '              WHERE A.�]���҃R�[�h = C.�Ј��R�[�h)';
						END IF;
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

			/* �u�����ǉ��� */
			IF P_UPDKBN = 2 OR P_UPDKBN = 4 THEN
				W_SQL := 'DELETE FROM ' || W_TABLE2;
				W_SQL := W_SQL || ' WHERE (' || W_KEYINF || ') IN (';
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				W_SQL := W_SQL || '    FROM ' || W_TABLE1;
				W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;

			/* �폜���ǉ��� */
			IF P_UPDKBN = 3 THEN
				W_SQL := 'DELETE FROM ' || W_TABLE2;
				IF W_KFLG = '0' THEN
					IF P_KINOU = 214 AND (P_KKBN = 2 OR P_KKBN = 4 OR P_KKBN = 6 OR P_KKBN = 7) THEN
						W_SQL := W_SQL || ' WHERE HISTORY_NUMBER = (SELECT DISTINCT HISTORY_NUMBER';
						W_SQL := W_SQL || '                     FROM ' || W_TABLE1 || ')';

						IF P_HOSOKU5 IS NOT NULL THEN
							IF P_KKBN = 4 THEN
								IF INSTR(P_HOSOKU5, '|||') > 0 THEN
									W_TABLE3 := SUBSTR(P_HOSOKU5, INSTR(P_HOSOKU5, '|||')+3);

									W_SQL := W_SQL || '   AND EXISTS (SELECT *';
									W_SQL := W_SQL || '                 FROM ' || W_TABLE3 || ' C';
									W_SQL := W_SQL || '                WHERE A.DEPT_RANK = C.RANK';
									W_SQL := W_SQL || '                  AND A.DEPT_CODE = C.CODE_VALUE';
									W_SQL := W_SQL || '                  AND C.CUSTOMER_ID = ' || P_RID || ')';
								END IF;
							ELSE
								W_TABLE3 := '';
								IF INSTR(P_HOSOKU5, '|||') = 0 THEN
									W_TABLE3 := P_HOSOKU5;
								ELSIF INSTR(P_HOSOKU5, '|||') > 16 THEN
									W_TABLE3 := SUBSTR(P_HOSOKU5, 0, INSTR(P_HOSOKU5, '|||')-1);
								END IF;

								IF W_TABLE3 IS NOT NULL THEN
									W_SQL := W_SQL || ' AND EXISTS (SELECT *';
									W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' B';
									W_SQL := W_SQL || '              WHERE A.EMP_CODE = B.EMP_CODE)';
								END IF;
--							ELSIF P_KKBN = 7 THEN
--								IF W_TABLE3 IS NOT NULL THEN
--									W_SQL := W_SQL || ' AND EXISTS (SELECT *';
--									W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' C';
--									W_SQL := W_SQL || '              WHERE A.�]���҃R�[�h = C.�Ј��R�[�h)';
--								END IF;
							END IF;
						END IF;
					ELSIF P_KINOU = 432 AND (P_KKBN = 1 OR P_KKBN = 2) THEN
						W_SQL := W_SQL || ' WHERE (MNG_KAISYACD, MNG_MANAGEMENT_NUMBER, APPLICATION_PERIOD_NO) IN';
						W_SQL := W_SQL || ' (SELECT MNG_KAISYACD, MNG_MANAGEMENT_NUMBER, APPLICATION_PERIOD_NO';
						W_SQL := W_SQL || ' FROM ' || W_TABLE1;
						W_SQL := W_SQL || ' WHERE IDENTIFIER = 1)';
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				ELSE
					IF (P_KINOU = 11 AND P_KKBN IN (1,3,6,7)) OR (P_KINOU = 200 AND P_KKBN = 1) THEN
						W_SQL := W_SQL || ' WHERE KAISYACD=:ORA_1';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
					ELSIF P_KINOU = 11 AND P_KKBN IN (4,5,8) THEN
						W_SQL := W_SQL || ' WHERE KAISYACD=:ORA_1';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
					ELSIF P_KINOU = 11 AND P_KKBN = 9 THEN
						IF W_KKFLG = 0 THEN
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						ELSE
							W_SQL := W_SQL || ' WHERE KAISYACD=:ORA_1';
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
						END IF;
					ELSIF P_KINOU = 451 AND P_KKBN = 1 THEN
						W_SQL := W_SQL || ' WHERE EMP_CODE IN (SELECT EMP_CODE';
						W_SQL := W_SQL || '                       FROM EMP_BASIC_INFO';
						W_SQL := W_SQL || '                      WHERE KAISYACD = :ORA_1)';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
					ELSIF P_KINOU = 214 AND P_KKBN = 2 THEN
						W_SQL := W_SQL || ' A WHERE A.HISTORY_NUMBER = (SELECT DISTINCT HISTORY_NUMBER';
						W_SQL := W_SQL || '                     FROM ' || W_TABLE1 || ')';
						W_SQL := W_SQL || '     AND A.KAISYACD = :ORA_1';

						IF P_HOSOKU5 IS NOT NULL THEN
							W_TABLE3 := '';
							IF INSTR(P_HOSOKU5, '|||') = 0 THEN
								W_TABLE3 := P_HOSOKU5;
							ELSIF INSTR(P_HOSOKU5, '|||') > 16 THEN
								W_TABLE3 := SUBSTR(P_HOSOKU5, 0, INSTR(P_HOSOKU5, '|||')-1);
							END IF;
							IF W_TABLE3 IS NOT NULL THEN
								W_SQL := W_SQL || ' AND EXISTS (SELECT *';
								W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' B';
								W_SQL := W_SQL || '              WHERE A.EMP_CODE = B.EMP_CODE)';
							END IF;
						END IF;

						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
					ELSIF P_KINOU = 214 AND (P_KKBN = 4 OR P_KKBN = 6 OR P_KKBN = 7) THEN
						W_SQL := W_SQL || ' A WHERE (A.KAISYACD,A.HISTORY_NUMBER) IN ';
						W_SQL := W_SQL || '                  (SELECT DISTINCT KAISYACD,HISTORY_NUMBER';
						W_SQL := W_SQL || '                     FROM ' || W_TABLE1 || ')';

						IF P_HOSOKU5 IS NOT NULL THEN
							IF P_KKBN = 4 THEN
								IF INSTR(P_HOSOKU5, '|||') > 0 THEN
									W_TABLE3 := SUBSTR(P_HOSOKU5, INSTR(P_HOSOKU5, '|||')+3);

									W_SQL := W_SQL || '   AND EXISTS (SELECT *';
									W_SQL := W_SQL || '                 FROM ' || W_TABLE3 || ' C';
									W_SQL := W_SQL || '                WHERE A.DEPT_RANK = C.RANK';
									W_SQL := W_SQL || '                  AND A.DEPT_CODE = C.CODE_VALUE';
									W_SQL := W_SQL || '                  AND C.CUSTOMER_ID = ' || P_RID || ')';
								END IF;
							ELSE
								W_TABLE3 := '';
								IF INSTR(P_HOSOKU5, '|||') = 0 THEN
									W_TABLE3 := P_HOSOKU5;
								ELSIF INSTR(P_HOSOKU5, '|||') > 16 THEN
									W_TABLE3 := SUBSTR(P_HOSOKU5, 0, INSTR(P_HOSOKU5, '|||')-1);
								END IF;
								IF W_TABLE3 IS NOT NULL THEN
									W_SQL := W_SQL || ' AND EXISTS (SELECT *';
									W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' B';
									W_SQL := W_SQL || '              WHERE A.EMP_CODE = B.EMP_CODE)';
								END IF;

--							ELSIF P_KKBN = 7 THEN
--								IF W_TABLE3 IS NOT NULL THEN
--									W_SQL := W_SQL || ' AND EXISTS (SELECT *';
--									W_SQL := W_SQL || '               FROM ' || W_TABLE3 || ' C';
--									W_SQL := W_SQL || '              WHERE A.�]���҃R�[�h = C.�Ј��R�[�h)';
--								END IF;
							END IF;
						END IF;

						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					ELSIF P_KINOU = 432 AND (P_KKBN = 1 OR P_KKBN = 2) THEN
						W_SQL := W_SQL || ' WHERE (MNG_KAISYACD, MNG_MANAGEMENT_NUMBER, APPLICATION_PERIOD_NO) IN';
						W_SQL := W_SQL || ' (SELECT MNG_KAISYACD, MNG_MANAGEMENT_NUMBER, APPLICATION_PERIOD_NO';
						W_SQL := W_SQL || ' FROM ' || W_TABLE1;
						W_SQL := W_SQL || ' WHERE IDENTIFIER = 1)';
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					ELSE
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					END IF;
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;

			/* ���[�N�f�[�^�폜 */
			W_SQL := 'DELETE FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE IDENTIFIER=0';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		/**********************************************************************/
		/* �ǉ�����                                                           */
		/**********************************************************************/
			IF W_KKFLG = 0 THEN
				FOR C_031_REC IN C_031 LOOP
					W_SQL := 'INSERT INTO ' || W_TABLE2 || '(';
					W_CNT := 0;
					FOR C_003_REC IN C_003 LOOP
						IF P_KINOU <> 214 OR P_KKBN <> 4 OR C_003_REC.ITEM_NAME <> 'BELONG_CODE' THEN
							W_CNT := W_CNT + 1;
							IF W_CNT > 1 THEN
								W_SQL := W_SQL || ',';
							END IF;
							W_SQL := W_SQL || C_003_REC.ITEM_NAME;
						END IF;
					END LOOP;
					IF W_MSTRKBN = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY,END_DAY';
					END IF;

					/* �X�V���E�X�V�҃R�[�h */
					W_UPDFLG(0) := 0;
					W_UPDFLG(1) := 0;
					W_COLUMN := WEB_SP0001270_F(1,W_TABLE2);
					IF W_COLUMN <> 'NO-COLUMN' THEN
						W_UPDFLG(0) := 1;
						W_SQL := W_SQL || ',' || W_COLUMN;
					END IF;
					W_COLUMN := WEB_SP0001270_F(2,W_TABLE2);
					IF W_COLUMN <> 'NO-COLUMN' THEN
						W_UPDFLG(1) := 1;
						W_SQL := W_SQL || ',' || W_COLUMN;
					END IF;

					W_SQL := W_SQL || ')';
					W_CNT := 0;
					W_SQL := W_SQL || ' SELECT ';
					FOR C_003_REC IN C_003 LOOP
						IF P_KINOU <> 214 OR P_KKBN <> 4 OR C_003_REC.ITEM_NAME <> 'BELONG_CODE' THEN
							W_CNT := W_CNT + 1;
							IF W_CNT > 1 THEN
								W_SQL := W_SQL || ',';
							END IF;
							IF C_003_REC.ITEM_NAME = 'KAISYACD' THEN
								W_SQL := W_SQL || C_031_REC.KAISYACD;
							ELSE
								IF C_003_REC.TAKE_DIV = '2' THEN
									W_SQL := W_SQL || 'SYSDATE';
								ELSIF C_003_REC.TAKE_DIV = '3' THEN
									W_SQL := W_SQL || P_SID;
								ELSE
									W_SQL := W_SQL || C_003_REC.ITEM_NAME;
								END IF;
							END IF;
						END IF;
					END LOOP;
					IF W_MSTRKBN = 1 THEN
						W_SQL := W_SQL || ',BEGIN_DAY,NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
					END IF;
					IF W_UPDFLG(0) = 1 THEN
						W_SQL := W_SQL || ',SYSDATE';
					END IF;
					IF W_UPDFLG(1) = 1 THEN
						W_SQL := W_SQL || ',:ORA_UPDID';
					END IF;
					W_SQL := W_SQL || ' FROM ' || W_TABLE1;
					W_SQL := W_SQL || '  WHERE DELETE_DIV IS NULL';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					IF W_UPDFLG(1) = 1 THEN
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_UPDID',P_UPDID);
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END LOOP;
			ELSE
				W_SQL := 'INSERT INTO ' || W_TABLE2 || '(';
				W_CNT := 0;
				FOR C_003_REC IN C_003 LOOP
					IF P_KINOU <> 214 OR P_KKBN <> 4 OR C_003_REC.ITEM_NAME <> 'BELONG_CODE' THEN
						W_CNT := W_CNT + 1;
						IF W_CNT > 1 THEN
							W_SQL := W_SQL || ',';
						END IF;
						W_SQL := W_SQL || C_003_REC.ITEM_NAME;
					END IF;
				END LOOP;
				IF W_MSTRKBN = 1 THEN
					W_SQL := W_SQL || ',BEGIN_DAY,END_DAY';
				END IF;

				/* �X�V���E�X�V�҃R�[�h */
				W_UPDFLG(0) := 0;
				W_UPDFLG(1) := 0;
				W_COLUMN := WEB_SP0001270_F(1,W_TABLE2);
				IF W_COLUMN <> 'NO-COLUMN' THEN
					W_UPDFLG(0) := 1;
					W_SQL := W_SQL || ',' || W_COLUMN;
				END IF;
				W_COLUMN := WEB_SP0001270_F(2,W_TABLE2);
				IF W_COLUMN <> 'NO-COLUMN' THEN
					W_UPDFLG(1) := 1;
					W_SQL := W_SQL || ',' || W_COLUMN;
				END IF;

				W_SQL := W_SQL || ')';
				W_CNT := 0;
				W_SQL := W_SQL || ' SELECT ';
				FOR C_003_REC IN C_003 LOOP
					IF P_KINOU <> 214 OR P_KKBN <> 4 OR C_003_REC.ITEM_NAME <> 'BELONG_CODE' THEN
						W_CNT := W_CNT + 1;
						IF W_CNT > 1 THEN
							W_SQL := W_SQL || ',';
						END IF;
						IF C_003_REC.TAKE_DIV = '2' THEN
							W_SQL := W_SQL || 'SYSDATE';
						ELSIF C_003_REC.TAKE_DIV = '3' THEN
							W_SQL := W_SQL || P_SID;
						ELSE
							W_SQL := W_SQL || C_003_REC.ITEM_NAME;
						END IF;
					END IF;
				END LOOP;
				IF W_MSTRKBN = 1 THEN
					W_SQL := W_SQL || ',BEGIN_DAY,NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
				END IF;
				IF W_UPDFLG(0) = 1 THEN
					W_SQL := W_SQL || ',SYSDATE';
				END IF;
				IF W_UPDFLG(1) = 1 THEN
					W_SQL := W_SQL || ',:ORA_UPDID';
				END IF;
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || '  WHERE DELETE_DIV IS NULL';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				IF W_UPDFLG(1) = 1 THEN
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_UPDID',P_UPDID);
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;

		/**********************************************************************/
		/* �ڕW�Ǘ��|��]���Ґݒ�捞                                         */
		/**********************************************************************/
		IF P_KINOU = 214 AND P_KKBN IN (2) THEN
			/**********************************************************************/
			/* �s�v���w��f�[�^�̍폜                                             */
			/**********************************************************************/
			W_SQL := 'DELETE FROM WEB_TP2142010_T';
			W_SQL := W_SQL || ' WHERE (KAISYACD,HISTORY_NUMBER) IN ';
			W_SQL := W_SQL || '    (SELECT DISTINCT KAISYACD,HISTORY_NUMBER FROM ' || W_TABLE1 || ')';
			W_SQL := W_SQL || '   AND GOAL_NUMBER = 0';
			W_SQL := W_SQL || '   AND EMP_CODE IN (';
			W_SQL := W_SQL || '  SELECT EMP_CODE';
			W_SQL := W_SQL || '    FROM WEB_TP2142010_T';
			W_SQL := W_SQL || ' WHERE (KAISYACD,HISTORY_NUMBER) IN ';
			W_SQL := W_SQL || '    (SELECT DISTINCT KAISYACD,HISTORY_NUMBER FROM ' || W_TABLE1 || ')';
			W_SQL := W_SQL || '   AND GOAL_NUMBER <> 0)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;

	/**********************************************************************/
	/* ���ڒP�ʓo�^��                                                     */
	/**********************************************************************/
		ELSE
			W_SQL := 'UPDATE ' || W_TABLE2 || ' A SET (';
			W_CNT := 0;
			W_FCNT := 0;
			FOR C_003_REC IN C_003 LOOP
				W_CNT := W_CNT + 1;
				IF C_003_REC.TAKE_DIV = '2' OR C_003_REC.TAKE_DIV = '3' OR SUBSTR(P_KID,W_CNT,1) = '1' THEN
					W_FCNT := W_FCNT + 1;
					IF W_FCNT > 1 THEN
						W_SQL := W_SQL || ',';
					END IF;
					W_SQL := W_SQL || 'A.' || C_003_REC.ITEM_NAME;
				END IF;
			END LOOP;

			/* �X�V���E�X�V�҃R�[�h */
			W_UPDFLG(0) := 0;
			W_UPDFLG(1) := 0;
			W_COLUMN := WEB_SP0001270_F(1,W_TABLE2);
			IF W_COLUMN <> 'NO-COLUMN' THEN
				W_UPDFLG(0) := 1;
				W_SQL := W_SQL || ',A.' || W_COLUMN;
			END IF;
			W_COLUMN := WEB_SP0001270_F(2,W_TABLE2);
			IF W_COLUMN <> 'NO-COLUMN' THEN
				W_UPDFLG(1) := 1;
				W_SQL := W_SQL || ',A.' || W_COLUMN;
			END IF;

			W_SQL := W_SQL || ')=(';
			W_CNT := 0;
			W_FCNT := 0;
			W_SQL := W_SQL || ' SELECT ';
			FOR C_003_REC IN C_003 LOOP
				W_CNT := W_CNT + 1;
				IF C_003_REC.TAKE_DIV = '2' OR C_003_REC.TAKE_DIV = '3' OR SUBSTR(P_KID,W_CNT,1) = '1' THEN
					W_FCNT := W_FCNT + 1;
					IF W_FCNT > 1 THEN
						W_SQL := W_SQL || ',';
					END IF;
					IF C_003_REC.TAKE_DIV = '2' THEN
						W_SQL := W_SQL || 'SYSDATE';
					ELSIF C_003_REC.TAKE_DIV = '3' THEN
						W_SQL := W_SQL || P_SID;
					ELSE
						W_SQL := W_SQL || 'B.' || C_003_REC.ITEM_NAME;
					END IF;
				END IF;
			END LOOP;
			IF W_UPDFLG(0) = 1 THEN
				W_SQL := W_SQL || ',SYSDATE';
			END IF;
			IF W_UPDFLG(1) = 1 THEN
				W_SQL := W_SQL || ',:ORA_UPDID';
			END IF;
	
			W_SQL := W_SQL || ' FROM ' || W_TABLE1 || ' B';
			W_SQL := W_SQL || ' WHERE B.DELETE_DIV IS NULL';
			FOR W_I IN 1..W_KEYCNT LOOP
				W_SQL := W_SQL || ' AND A.' || W_KEYFLD(W_I) || '=B.' || W_KEYFLD(W_I);
			END LOOP;
			W_SQL := W_SQL || ')';
			W_SQL := W_SQL || ' WHERE (';
			FOR W_I IN 1..W_KEYCNT LOOP
				IF W_I > 1 THEN
					W_SQL := W_SQL || ',';
				END IF;
				W_SQL := W_SQL || 'A.' || W_KEYFLD(W_I);
			END LOOP;
			W_SQL := W_SQL || ') IN (';
			W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
			W_SQL := W_SQL || '    FROM ' || W_TABLE1;
			W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
			IF W_FCNT > 0 THEN
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				IF W_UPDFLG(1) = 1 THEN
					DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_UPDID',P_UPDID);
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
		END IF;

	/**********************************************************************/
	/* ���̑�����                                                         */
	/**********************************************************************/
	/**********************************************************************/
	/* �d�������Z�@�փ}�X�^                                               */
	/**********************************************************************/
		IF P_KINOU = 11 AND P_KKBN = 8 THEN
			DELETE FROM DFTSMKGK_MS
			 WHERE (KAISYACD,SMKGNKCD) NOT IN (
				SELECT
					KAISYACD,SMKGNKCD
				  FROM SMKGINK_MS)
			;

			DELETE FROM SMGKIRMS_MS
			 WHERE (KAISYACD,SMKGNKCD) NOT IN (
				SELECT
					KAISYACD,SMKGNKCD
				  FROM SMKGINK_MS)
			;

			DELETE FROM SMGKIRMSD_MS
			 WHERE (KAISYACD,SMKGNKCD) NOT IN (
				SELECT
					KAISYACD,SMKGNKCD
				  FROM SMKGINK_MS)
			;
		END IF;
	END IF;

/**********************************************************************/
/* �O����s�v�f�[�^�폜                                               */
/**********************************************************************/
	IF P_SKBN = 3 OR P_SKBN = 6 THEN
		IF P_KINOU = 11 AND P_KKBN IN (1,4,5,8,9) THEN
			IF P_KKBN = 1 THEN
				W_TABLE4 := W_TABLE2 || '_L';
			ELSIF P_KKBN = 4 THEN
				W_TABLE4 := 'KUMIAIKB_L_MS';
				W_KEYINF := 'KAISYACD,' || W_KEYINF;
			ELSIF P_KKBN = 5 THEN
				W_TABLE4 := 'KIKINKB_L_MS';
				W_KEYINF := 'KAISYACD,' || W_KEYINF;
			ELSIF P_KKBN = 8 THEN
				W_TABLE4 := 'SMKGINK_L_MS';
				W_KEYINF := 'KAISYACD,' || W_KEYINF;
			ELSIF P_KKBN = 9 THEN
				W_TABLE4 := W_TABLE2 || '_L';
				W_KEYINF := 'KAISYACD,' || W_KEYINF;
			END IF;
			
			W_SQL := 'DELETE FROM ' || W_TABLE4;
			W_SQL := W_SQL || ' WHERE (' || W_KEYINF || ') NOT IN (';
			W_SQL := W_SQL || ' SELECT ' || W_KEYINF;
			W_SQL := W_SQL || '   FROM '|| W_TABLE2 || ')';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		END IF;
	END IF;

/**********************************************************************/
/* �e�[�u���폜                                                       */
/**********************************************************************/
--	IF P_SKBN = 4 OR P_SKBN = 6 THEN
--		/* ���[�N�e�[�u���폜 */
--		WEB_SP0003020_S(1,W_TABLE1);
--	END IF;

/**********************************************************************/
/* ���[�N�ύX                                                         */
/**********************************************************************/
	IF P_SKBN = 5 AND (P_WKKBN = 2 OR P_WKKBN = 3) THEN

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
			W_I := 1;

			/* �O��f�[�^�폜 */
			W_SQL := 'DELETE FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE IDENTIFIER=' || P_SID;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/* �ύX�f�[�^�ǉ� */
			W_SQL := 'INSERT INTO ' || W_TABLE1 || ' (';
			W_SQL := W_SQL || ' IDENTIFIER';
			IF W_MSTRKBN = 1 THEN
				W_SQL := W_SQL || ',BEGIN_DAY,END_DAY';
			END IF;
			FOR C_001_REC IN C_001 LOOP
				W_SQL := W_SQL || ',' || C_001_REC.ITEM_NAME;

				IF C_001_REC.TAKE_DIV = '5' THEN
					W_SQL := W_SQL || ',SYAINCD' || W_I;
					W_I := W_I + 1;
				END IF;
			END LOOP;
			W_SQL := W_SQL || ')';
			W_I := 1;
			W_SQL := W_SQL || ' SELECT ' || P_SID;
			IF W_MSTRKBN = 1 THEN
				W_SQL := W_SQL || ',BEGIN_DAY,END_DAY';
			END IF;
			FOR C_001_REC IN C_001 LOOP
				W_SQL := W_SQL || ',' || C_001_REC.ITEM_NAME;

				IF C_001_REC.TAKE_DIV = '5' THEN
					W_SQL := W_SQL || ',SYAINCD' || W_I;
					W_I := W_I + 1;
				END IF;
			END LOOP;
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

/**********************************************************************/
/* �ꊇ�捞�������O�X�V                                               */
/**********************************************************************/
	IF P_SKBN = 6 THEN
		W_SQL := 'INSERT INTO WEB_TPA020030_T(';
		W_SQL := W_SQL || 'KAISYACD,PROCESS_YMD,FUNCTION_DIV,TARGET_DIV,EXECUTE_ID,BEGIN_DT,END_DT,TARGET_COUNT,ERROR_COUNT,REGISTER_COUNT,ERROR_DIV,ERROR_CONTENT,UPDATE_DATE,UPDATE_USER)';
		W_SQL := W_SQL || 'VALUES(:ORA_1,TO_DATE(''' || P_SDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
		W_SQL := W_SQL || ',' || P_HOSOKU1 || ',' || P_HOSOKU2 || ',' || P_EXEID;
		W_SQL := W_SQL || ',TO_DATE(''' || P_KDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
		W_SQL := W_SQL || ',SYSDATE';
		W_SQL := W_SQL || ',' || W_INCNT;
		W_SQL := W_SQL || ',' || W_ERRCNT;
		W_SQL := W_SQL || ',' || W_UPDCNT;
		W_SQL := W_SQL || ',DECODE(' || W_ERRCNT || ',0,''0'',''3'')';
		W_SQL := W_SQL || ',DECODE(' || W_ERRCNT || ',0,'''',''�捞�f�[�^�ɃG���[�����݂��܂��B''),SYSDATE,:ORA_2)';
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
	DBMS_SQL.CLOSE_CURSOR(W_CSR2);
	DBMS_SQL.CLOSE_CURSOR(W_CSR);

/**********************************************************************/
/* �G���[����������                                                   */
/**********************************************************************/
EXCEPTION
WHEN OTHERS THEN
	ROLLBACK;
	DBMS_SQL.CLOSE_CURSOR(W_CSR2);
	DBMS_SQL.CLOSE_CURSOR(W_CSR);
	P_ERR :=-1;
	W_ERRCODE := SQLCODE;
	W_ERRMSG  := SQLERRM(SQLCODE);
	WEB_SP0003010_S(
		1,
		P_RID,
		0,
		'WEB_SP0061220_S',
		'1',
		W_ERRCODE,
		W_ERRMSG,
		SUBSTRB(W_SQL,1,1000))
	;

	IF P_SKBN = 6 THEN
		W_SQL := 'INSERT INTO WEB_TPA020030_T(';
		W_SQL := W_SQL || 'KAISYACD,PROCESS_YMD,FUNCTION_DIV,TARGET_DIV,EXECUTE_ID,BEGIN_DT,END_DT,ERROR_DIV,ERROR_CONTENT,UPDATE_DATE,UPDATE_USER)';
		W_SQL := W_SQL || 'VALUES(:ORA_1,TO_DATE(''' || P_SDATE || ''',''YYYY/MM/DD HH24:MI:SS'')';
		W_SQL := W_SQL || ',' || P_HOSOKU1 || ',' || P_HOSOKU2 || ',' || P_EXEID;
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

