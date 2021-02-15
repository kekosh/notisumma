/**********************************************************************************/
/*  ｼｽﾃﾑ：人事WEB                                                                 */
/*  機能：マスタ保守                                                              */
/*  処理：共通                                                                    */
/*  内容：取込処理                                                                */
/*  名称：WEB_SP0110030_S                                                         */
/*  FILE：P0110030.SQL                                                            */
/*  備考：                                                                        */
/*                                                                                */
/*  作成：Ver6.1   2001/05/01 T.M                                                 */
/*  履歴：Ver6.3   2002/02/01 T.M 採用管理対応                                    */
/*  履歴：Ver6.3   2002/02/01 T.M 一括取込対応                                    */
/*  履歴：Ver8.0   2002/02/01 T.M 重複対応,複数取込対応                           */
/*  履歴：Ver8.0.7 2002/09/16 T.M 名称マスタのコードテキスト連結文字対応          */
/*  履歴：VerP1.1  2003/05/01 T.M 英数字対応                                      */
/*  履歴：VerP1.1  2003/05/01 T.M ワークテーブルスペース対応                      */
/*  履歴：VerP1.2b 2003/11/26 T.M 職能給号級の職級コードチェック対応              */
/*  履歴：VerP2.0  2004/XX/XX T.M 名称マスタ桁数拡張対応                          */
/*  履歴：VerP2.1  2004/05/14 T.M マスタ予備対応                                  */
/*  履歴：VerP2.12 2004/08/18 T.M 世代取得不具合対応                              */
/*  履歴：VerP2.21 2004/10/26 T.M マスタ履歴化対応                                */
/*  履歴：VerP2.42 2005/06/06 M.I 納付先(地方公共団体書式)追加対応                */
/*                                銀行＋支店(全銀協)追加対応                      */
/*                                郵便番号追加対応                                */
/*  履歴：VerP3.01 2005/08/03 T.M D100001 マルチカンパニー対応                    */
/*  履歴：VerP3.01 2005/09/06 M.I E100078 一括取込エラーログ更新時不具合対応      */
/*  履歴：VerP3.01 2005/09/07 M.I E100080 履歴化期間重複(既存データ)不具合対応    */
/*  履歴：VerP3.03 2006/01/18 M.I D100059 振込口座歴対応                          */
/*  履歴：VerP3.0a 2006/03/06 M.I E100174 マルチカンパニー対応漏れ                */
/*  履歴：VerP3.0a 2006/03/07 T.M D100075 学校マスタ分離対応                      */
/*  履歴：VerP3.0a 2006/03/22 M.I E100210 同期処理漏れ対応                        */
/*  履歴：VerP3.0c 2006/05/15 Y.Y D100107 全銀協の特殊文字取込対応                */
/*  履歴：VerP3.0d 2006/06/19 M.I E100315 全銀協の不正データチェック対応          */
/*  履歴：VerP3.1  2007/01/25 M.I D100164 学校ﾏｽﾀｶﾃｺﾞﾘ分け対応                    */
/*  履歴：VerP3.1  2007/02/15 M.I D100205 小数点拡張対応                          */
/*  履歴：VerP4.0  2007/11/08 M.I D100351 単一会社運用対応                        */
/*  履歴：VerP4.0  2007/12/26 M.I D100379 TDE対応                                 */
/*  履歴：VerP4.0  2008/02/19 M.I D100423 名称マスターの会社別マスター設定対応    */
/*  履歴：VerP4.0c 2009/02/19 Y.Y E101192 変更時の履歴化期間重複ﾁｪｯｸ不具合対応    */
/*  履歴：VerP4.0f 2010/04/08 M.K 【改善】D100557 自由マスターの履歴化対応        */
/*  履歴：VerP4.0g 2010/09/30 M.K【修正693】E101557 更新日更新者ｺｰﾄﾞ登録漏れ対応  */
/*  履歴：Ver.2    2011/08/02 T.M【改善P-11-004】                                 */
/*  履歴：Ver.3    2012/01/30 M.I【修正P11870】                                   */
/*  履歴：Ver.3    2012/02/16 M.I【修正P11970】                                   */
/*  履歴：Ver.3    2012/04/09 M.K【修正P12480】                                   */
/*  履歴：VerP6.0  2014/07/15 ISID【P-14-017】                                    */
/*  履歴：VerP6.0  2014/12/18 ISID【P17520】                                      */
/*  履歴：VerP6.1  2015/05/11 T.M【改善P-14-083】                                 */
/*  履歴：VerP6.1  2016/06/06 ISID【P21610】銀行マスタ更新時のデータ更新ログ対応  */
/*  履歴：Ver6.1   2020/12/04 ISID【修正P32240】                                   */
/**********************************************************************************/
DROP PROCEDURE WEB_SP0110030_S;

CREATE PROCEDURE WEB_SP0110030_S(
	P_SKBN      IN  NUMBER,   /* 1:テーブル作成,2:チェック,3:登録,4:テーブル削除,5:ワーク変更,6:一括取込 */
	P_MSTID     IN  NUMBER,   /* 1:名称マスタ,2:職能給号級,3:本給号級,4:銀行,5:銀行支店,6:住民税納付先,7:自由マスタ,8:組織考課 */
                              /* 11:郵便番号(マスタ(P_YOBI=1),一時域(P_YOBI=2)) */
                              /* 12:納付先(地方公共団体書式) */
                              /* 13:銀行＋支店(全銀協) */
	P_MSTKBN    IN  VARCHAR2, /* マスタ区分,職級コード,銀行コード */
	P_UPDKBN    IN  VARCHAR2, /* 更新区分(1:追加,2:置換追加,3:削除追加),ﾜｰｸ変更時(1:ﾁｪｯｸ,2:変更,3:削除) */
	P_WKKBN     IN  VARCHAR2, /* ﾜｰｸ変更時区分(1:ﾁｪｯｸ,2:変更,3:削除) */
	P_KAISYA    IN  WEB_TPFIELD.KAISYACD%TYPE, /* 会社コード */
	P_SID       IN  WEB_TPFIELD.SYAINCD%TYPE, /* 更新者社員コード,ﾜｰｸ変更時(レコードＩＤ) */
	P_RID       IN  NUMBER,   /* 利用者ＩＤ */
	P_SDATE     IN  VARCHAR2, /* 処理日時 */
	P_EXEID     IN  NUMBER,   /* 実行ＩＤ */
	P_KDATE     IN  VARCHAR2, /* 開始日時 */
	P_ERREXE    IN  VARCHAR2, /* エラー対応 */
	P_UNIQUE    IN  VARCHAR2, /* 重複対応(1:無.2:先頭優先,3:最終優先) */
	P_YOBI      IN  VARCHAR2, /* 予備フラグ */
	P_UPDID     IN  WEB_TPFIELD.UPDID%TYPE, /* 更新者ＩＤ */
	P_ERR       OUT NUMBER    /* エラー区分(0:正常,-1:エラー) */
	                          /* 2:キー重複(取込内),3:キー重複(既存データ),4:取込不可項目 */
	                          /* 11:マスタ未存在(銀行マスタ),12:マスタ未存在(職能給号級) */
	                          /* 13:マスタ未存在(名称マスタ-学校) */
)

IS

TYPE T_LVAR1 IS TABLE OF VARCHAR2(100)   INDEX BY BINARY_INTEGER; /* 配列宣言 */
W_SQL      VARCHAR2(4000);  /* 全ＳＱＬ */
W_TABLE1   VARCHAR2(100);    /* ワークテーブル名 */
W_TABLE2   VARCHAR2(100);    /* 保存テーブル名 */
W_TABLE3   VARCHAR2(100);    /* 保存テーブル名(予備) */
W_TABLE4   VARCHAR2(100);    /* 処理ワークテーブル名 */
W_INDEX1   VARCHAR2(100);    /* ワークテーブルインデックス */
W_INDEX2   VARCHAR2(100);    /* ワークテーブルインデックス */
W_KEYINF   VARCHAR2(400);   /* キー情報 */
W_KEYINF2  VARCHAR2(400);   /* キー情報 */
W_FIELD    VARCHAR2(1000);   /* フィールド情報 */
W_FIELD2   VARCHAR2(1000);   /* フィールド情報 */
W_MSTSYU   VARCHAR2(2);     /* マスタ種類 */
W_INCNT    NUMBER(10);      /* 一括取込件数 */
W_ERRCNT   NUMBER(10);      /* 一括取込エラー件数 */
W_UPDCNT   NUMBER(10);      /* 一括取込登録件数 */
W_I        NUMBER(5);       /* ワークカウント */
W_J        NUMBER(5);       /* ワークカウント */
W_CNT      NUMBER(10);      /* ワークカウント */
W_NDATA1   NUMBER(10);      /* カーソル取得データ */
W_NDATA2   NUMBER(10);      /* カーソル取得データ */
W_NDATA3   NUMBER(10);      /* カーソル取得データ */
W_NDATA4   NUMBER(4);       /* カーソル取得データ(銀行コード) */
W_NDATA5   NUMBER(3);       /* カーソル取得データ(銀行支店コード) */
W_DATA1    NUMBER;          /* 取得データ */
W_DATA2    VARCHAR2(20);    /* 取得データ */
W_DATA3    VARCHAR2(20);    /* 取得データ */
W_DATA4    VARCHAR2(6);     /* 取得データ */
W_DATA5    VARCHAR2(40);    /* 取得データ */
W_DATA6    VARCHAR2(66);    /* 取得データ */
W_DATA7    VARCHAR2(44);    /* 取得データ */
W_DATA8    VARCHAR2(66);    /* 取得データ */
W_DATA9    VARCHAR2(60);    /* 取得データ */
W_DATA10   VARCHAR2(90);    /* 取得データ */
W_DATA11   VARCHAR2(60);    /* 取得データ */
W_DATA12   VARCHAR2(90);    /* 取得データ */
W_DATA13   VARCHAR2(60);    /* 取得データ */
W_DATA14   VARCHAR2(60);    /* 取得データ */
W_DATE     DATE;            /* 変更履歴更新日付 */
W_SID      NUMBER(10);      /* ワーク社員コード */
W_BDATA2   VARCHAR2(20);    /* */
W_BDATA3   VARCHAR2(20);    /* */
W_STR_X    NUMBER(3);       /* 文字サーチ変数 */
W_MSTK1    VARCHAR2(100);    /* マスタコード項目1 */
W_MSTK2    VARCHAR2(100);    /* マスタコード項目2 */
W_SEDAI    NUMBER(5);       /* 世代番号 */
W_RIREKI   NUMBER(1);       /* 履歴フラグ(0:通常,1:履歴) */
                            /* 同期区分(0:各社反映,1:全社反映) */
W_DOUKI    VARCHAR2(1) DEFAULT '0';
W_DOUKIFLG VARCHAR2(1) DEFAULT '0';
W_KAISYA   WEB_TPFIELD.KAISYACD%TYPE; /* 処理会社コード */
W_KAISYA_L WEB_TPFIELD.KAISYACD%TYPE; /* ログイン会社コード */
W_KFLG     VARCHAR2(1);     /* 単一会社運用フラグ */
W_KDATA1   NUMBER;          /* 期間重複データワーク(ＩＤ) */
W_KDATA2   VARCHAR2(6);     /* 期間重複データワーク(マスタ区分コード) */
W_KDATA3   VARCHAR2(11);    /* 期間重複データワーク(コード) */
W_KDATA4   DATE;            /* 期間重複データワーク(開始日) */
W_KDATA5   DATE;            /* 期間重複データワーク(終了日) */
W_KDATA6   NUMBER;          /* 期間重複データワーク(件数) */
W_CHKFLG   NUMBER(1);		/* 履歴化期間重複対象フラグ(0:対象外，1:対象) */
W_GRPINF   VARCHAR2(400);   /* グループ情報 */

W_YOBI     VARCHAR2(1);     /* 予備情報 */
W_MSTID    NUMBER(6);       /* マスタＩＤ */
W_MAPFI    VARCHAR2(50);    /* マッピング項目名 */
W_MAPTB    VARCHAR2(50);    /* マッピングテーブル名 */
W_MAPTBL   VARCHAR2(50);    /* マッピングテーブル名(外国語) */

W_WKTBSP   VARCHAR2(100);    /* ワークテーブルスペース */
W_CSR      INTEGER;
W_CSR2     INTEGER;
W_RVL      INTEGER;
W_RVL2     INTEGER;
W_ERRCODE  NUMBER;          /* ORACLEエラーコード */
W_ERRMSG   VARCHAR2(510);   /* ORACLEエラーメッセージ */
W_ERR      NUMBER;          /* 関数戻り値用エラー区分 */

W_LEN      NUMBER;          /* 文字サイズ */
W_ASC_CD   NUMBER;          /* アスキーコード */
W_ASC_ERR  NUMBER(1);       /* エラー判断 */
W_ADATA1   NUMBER(8);       /* ＩＤ */
W_ADATA2   NUMBER(2);       /* キー */
W_ADATA3   VARCHAR2(90);    /* 銀行名カナ */
W_ADATA4   VARCHAR2(90);    /* 支店名カナ */
W_SET      VARCHAR2(20);    /* 環境設定 */
W_RTN      VARCHAR2(20);    /* 関数戻り値 */
W_CADATA   VARCHAR2(30000); /* チェック対象文字列（一時利用） */

W_COLUMN    VARCHAR2(60);   /* ワーク項目名変数 */

/* 予備項目情報 */
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

/* 会社情報 */
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

/* マッピング項目情報 */
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

/* 銀行名カナ、支店名カナ特殊文字使用チェック */
FUNCTION FNCL_ZENBANK_CHK RETURN VARCHAR2 IS W_RET VARCHAR2(20);

BEGIN

	W_RET := '';

	SELECT MAX(CONF_VALUE) INTO W_SET FROM WEB_TP0001020_M
	 WHERE DIV1 = 0 AND DIV2 = 0 AND DIV3 = 0 AND IDENTIFIER = 18;

	IF W_SET = '1' THEN
		/* 17:銀行名カナ特殊文字使用、18:支店名カナ特殊文字使用 */
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
				/* カナ小文字チェック */
				SELECT REGEXP_REPLACE(W_ADATA3,'\-|[ (),./\｢｣]|[0-9A-Z]|[ｦｰｱ-ﾝﾞﾟ]','')
				INTO W_CADATA FROM DUAL;
				IF NOT W_CADATA IS NULL THEN
					W_ASC_ERR := 1;
				ELSE
				/* 半角文字チェック */
					SELECT REGEXP_REPLACE(W_ADATA3,'['||CHR(9)||CHR(10)||CHR(13)||']'||'|\-|\]|[ !"#$%&''()*+,./:;<=>?@[\^_`{|}~｡｢｣､･]|[0-9A-Za-z]|[ｦｧ-ｯｰｱ-ﾝﾞﾟ]','')
					INTO W_CADATA FROM DUAL;
					IF NOT W_CADATA IS NULL THEN
						W_ASC_ERR := 1;
					END IF;
				END IF;

				IF W_ASC_ERR = 0 THEN
					W_LEN := LENGTH(W_ADATA4);
					/* カナ小文字チェック */
					SELECT REGEXP_REPLACE(W_ADATA4,'\-|[ (),./\｢｣]|[0-9A-Z]|[ｦｰｱ-ﾝﾞﾟ]','')
					INTO W_CADATA FROM DUAL;
					IF NOT W_CADATA IS NULL THEN
						W_ASC_ERR := 2;
					ELSE
					/* 半角文字チェック */
						SELECT REGEXP_REPLACE(W_ADATA4,'['||CHR(9)||CHR(10)||CHR(13)||']'||'|\-|\]|[ !"#$%&''()*+,./:;<=>?@[\^_`{|}~｡｢｣､･]|[0-9A-Za-z]|[ｦｧ-ｯｰｱ-ﾝﾞﾟ]','')
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
/* 行エラー内容                                                       */
/*    2:キー重複(取込内)                                              */
/*    3:キー重複(既存データ)                                          */
/*    4:取込不可項目                                                  */
/*    5:キー未設定                                                    */
/*    6:期間重複(取込内)                                              */
/*    7:期間重複(既存データ)                                          */
/*    8:キー重複除外データ（一括取込時）                              */
/*   11:銀行マスタ未存在(銀行支店取込時)                              */
/*   12:職級マスタ未存在(職能給号級取込時)                            */
/*   13:部門マスタ未存在(組織考課取込時)                              */
/*   14:支店コードNULL(銀行＋支店(全銀協))                            */
/*   15:銀行名漢字30桁以上(銀行＋支店(全銀協))                        */
/*   16:支店名漢字30桁以上(銀行＋支店(全銀協))                        */
/*   17:銀行名カナ特殊文字使用(銀行＋支店(全銀協))                    */
/*   18:支店名カナ特殊文字使用(銀行＋支店(全銀協))                    */
/*   100～:マスタ未存在(予備項目)                                     */
/*   1000～:マスタ未存在(マッピング項目(全社))                        */
/*   2000～:マスタ未存在(マッピング項目(各社))                        */
/**********************************************************************/

/**********************************************************************/
/* 初期処理                                                           */
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
/* ログイン会社取得                                                   */
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
/* マスタＩＤ取得                                                     */
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
/* テーブル情報・キー情報設定                                         */
/**********************************************************************/
	IF P_MSTID = 1 THEN
		SELECT MAX(MASTER_KIND),NVL(MAX(AUX_INFO),0) INTO W_MSTSYU,W_YOBI
		  FROM WEB_TP0110210_M
		 WHERE MASTER_DIV1 = P_MSTKBN
		   AND MASTER_KIND IN ('1','6')
		;

		/* 全社反映(0:しない・1:する) */
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

		/* 全社反映(0:しない・1:する) */
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
		IF P_YOBI = '1' THEN		/* マスタ */
			W_TABLE2 := 'ZIP_CODE_MS';
			W_FIELD  := 'AREA_CODE,CURRENT_ZIP_CODE,NEW_ZIP_CODE,PREFECTURE_KANA,MUNICIPALITY_KANA,AREA_NAME_KANA,PREFECTURE,MUNICIPALITY_NAME,AREA_NAME,REMARKS1,REMARKS2,REMARKS3,REMARKS4,REMARKS5,REMARKS6,PREFECTURE_ROMAN,MUNICIPALITY_ROMAN,AREA_NAME_ROMAN';
		ELSE						/* 一時域 */
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
/* テーブル作成                                                       */
/**********************************************************************/
	IF P_SKBN = 1 THEN
		/* 前回テーブル削除 */
		WEB_SP0003020_S(1,W_TABLE1);

		/* テーブル作成 */
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

		/* 予備項目 */
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

		/* マッピング項目 */
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
/* チェック処理                                                       */
/**********************************************************************/
	IF P_SKBN = 2 OR (P_SKBN=5 AND P_WKKBN=1) OR P_SKBN = 6 THEN

	/**********************************************************************/
	/* 組織考課(会社コード・所属コード→部門ランク・部門コード変換処理)   */
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
	/* インデックス作成                                                   */
	/**********************************************************************/
		IF (P_SKBN = 2 OR P_SKBN = 6) THEN
			/* ＩＤに対して */
			W_SQL := 'CREATE INDEX ' || W_INDEX1 || ' ON ' || W_TABLE1;
			W_SQL :=  W_SQL || '(IDENTIFIER)'; 
			W_SQL :=  W_SQL || ' PCTFREE 5'; 
			IF W_WKTBSP IS NOT NULL THEN
				W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' '; 
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			
			IF P_MSTID <> 11 THEN
				/* キー項目に対して */
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
	/* キー未設定                                                         */
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
		/* キー重複(取込内)                                                   */
		/**********************************************************************/
			IF P_SKBN = 2 OR P_SKBN = 6 THEN
			/**********************************************************************/
			/* 自動削除なし                                                       */
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
			/* 自動削除あり                                                       */
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
				/* エラー状態をクリア */
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
		/* キー重複(既存データ)                                               */
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
					/* 銀行＋支店(全銀協) */
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
							--W_SQL := W_SQL || ' WHERE 会社コード = :ORA_1';
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
						/* 銀行＋支店(全銀協) */
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
	/* 履歴化期間重複                                                     */
	/**********************************************************************/
		W_CHKFLG := 1;
		IF W_RIREKI = 1 THEN
			-- 対象判断
			IF P_SKBN IN (2,6) THEN		/* 非履歴化=0に */
				IF P_MSTID = 1 THEN
					IF P_MSTKBN NOT IN ('11','30','32','33','S7','SL') THEN
						W_CHKFLG := 0;
					END IF;
				ELSIF P_MSTID NOT IN (2,3,7) THEN
					W_CHKFLG := 0;
				END IF;
			ELSIF P_SKBN = 5 THEN		/* 非履歴化=0 履歴化=2に */
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
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
				IF W_MSTID = 200 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* 職級コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* 号級 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
				ELSIF W_MSTID = 201 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* 号級 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* 終了日 */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* マスタ区分コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* ＩＤ */
						IF W_MSTID = 200 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* 職級コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* 号級 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
						ELSIF W_MSTID = 201 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* 号級 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* 終了日 */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* マスタ区分コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
						END IF;
						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=6';
						W_SQL := W_SQL || ' WHERE ERROR IS NULL';
						W_SQL := W_SQL || '   AND IDENTIFIER = (';
						W_SQL := W_SQL || ' SELECT ' || W_KDATA1 || ' FROM ' || W_TABLE1;
						W_SQL := W_SQL || '  WHERE BEGIN_DAY <= :ORA_0';
						W_SQL := W_SQL || '    AND NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD'')) >= :ORA_1';
						--W_SQL := W_SQL || '    AND 終了日 >= :ORA_1';
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
				/* エラー6チェック */
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
					/* エラー状態をクリア */
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
					W_SQL := W_SQL || ' WHERE ERROR = 6';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);

					/* 変更による他の情報重複解除 */
					W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE IDENTIFIER <> 0';
					W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
					W_SQL := W_SQL || '   AND DELETE_DIV IS NULL';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
					IF W_MSTID = 200 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* 職級コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* 号級 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
					ELSIF W_MSTID = 201 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* 号級 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* 終了日 */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* マスタ区分コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* ＩＤ */
							IF W_MSTID = 200 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* 職級コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* 号級 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
							ELSIF W_MSTID = 201 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* 号級 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* 終了日 */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* マスタ区分コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
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
	/* 履歴化期間重複(既存データ)                                         */
	/**********************************************************************/
		W_CHKFLG := 1;
		IF W_RIREKI = 1 THEN
			-- 対象判断
			IF P_UPDKBN IN (1,2) THEN
				IF P_SKBN IN (2,6) THEN		/* 非履歴化=0に */
					IF P_MSTID = 1 THEN
						IF P_MSTKBN NOT IN ('11','30','32','33','S7','SL') THEN
							W_CHKFLG := 0;
						END IF;
					ELSIF P_MSTID NOT IN (2,3,7) THEN
						W_CHKFLG := 0;
					END IF;
				ELSIF P_SKBN = 5 THEN		/* 非履歴化=0 履歴化=2に */
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
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
				IF W_MSTID = 200 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* 職級コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* 号級 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
				ELSIF W_MSTID = 201 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* 号級 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* 終了日 */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* マスタ区分コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* ＩＤ */
						IF W_MSTID = 200 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* 職級コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* 号級 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
						ELSIF W_MSTID = 201 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* 号級 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* 終了日 */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* マスタ区分コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
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
				/* エラー7チェック */
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
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
					IF W_MSTID = 200 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* 職級コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* 号級 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
					ELSIF W_MSTID = 201 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* 号級 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* 終了日 */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* マスタ区分コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* ＩＤ */
							IF W_MSTID = 200 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* 職級コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* 号級 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
							ELSIF W_MSTID = 201 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* 号級 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* 終了日 */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* マスタ区分コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
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
	/* 取込不可項目(名称マスタのみ)                                       */
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
	/* マスタ存在確認                                                     */
	/**********************************************************************/
		IF P_SKBN = 2 OR P_SKBN = 6 THEN
			/* 名称マスタ */
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

			/* 職能給号級 */
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
			/* 銀行支店 */
			IF P_MSTID = 5 THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=11';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND GINKOCD NOT IN (';
				W_SQL := W_SQL || '  SELECT GINKOCD FROM GINKO_MS)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;
			/* 組織考課 */
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

			/* 予備項目 */
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

			/* マッピング項目 */
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

			/* 銀行＋支店(全銀協) */
			IF P_MSTID = 13 THEN
				/* 14:支店コードNULL */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=14';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND SITENCD IS NULL';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				/* 15:銀行名漢字30桁以上 */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=15';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND LENGTHB(CONVERT(GINKOJME,''JA16SJISTILDE'')) > 30';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				/* 16:支店名漢字30桁以上 */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=16';
				W_SQL := W_SQL || ' WHERE ERROR IS NULL';
				W_SQL := W_SQL || '   AND LENGTHB(CONVERT(SITENJME,''JA16SJISTILDE'')) > 30';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				/* 17:銀行名カナ特殊文字使用、18:支店名カナ特殊文字使用 */
				W_RTN := FNCL_ZENBANK_CHK();
				/* 19:銀行コード同一で銀行名漢字が違う */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A SET ERROR=19';
				W_SQL := W_SQL || ' WHERE (A.IDENTIFIER) IN';
				W_SQL := W_SQL || ' (SELECT B.IDENTIFIER FROM ' || W_TABLE1 || ' B';
				W_SQL := W_SQL || ' WHERE B.GINKOCD IN (SELECT C.GINKOCD FROM ' || W_TABLE1 || ' C';
				W_SQL := W_SQL || ' WHERE B.GINKOCD = C.GINKOCD AND CMN_SJIS.SUBSTRB(B.GINKOJME,1,30) <> CMN_SJIS.SUBSTRB(C.GINKOJME,1,30)))';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				/* 20:銀行コード同一で銀行名漢字が違う */
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
	/* エラー存在確認                                                     */
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
		-- 履歴管理判断
		IF W_RIREKI = 1 THEN
			-- 対象判断
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
				/* 履歴化期間重複(取込データ)                                         */
				/**********************************************************************/
				/* エラー状態をクリア */
				W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
				W_SQL := W_SQL || ' WHERE ERROR = 6';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 変更による他の情報重複解除 */
				W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
				W_SQL := W_SQL || '  FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE DELETE_DIV IS NULL';
				W_SQL := W_SQL || '   AND IDENTIFIER <> 0';
				W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
				IF W_MSTID = 200 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* 職級コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* 号級 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
				ELSIF W_MSTID = 201 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* 号級 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* 終了日 */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* マスタ区分コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* ＩＤ */
						IF W_MSTID = 200 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* 職級コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* 号級 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
						ELSIF W_MSTID = 201 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* 号級 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* 終了日 */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* マスタ区分コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
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
					/* 履歴化期間重複(既存データ)                                         */
					/**********************************************************************/
					W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
					W_SQL := W_SQL || '  FROM ' || W_TABLE1;
					W_SQL := W_SQL || ' WHERE DELETE_DIV IS NULL';
					W_SQL := W_SQL || '   AND IDENTIFIER <> 0';
					W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
					IF W_MSTID = 200 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA3,22);	/* 職級コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA6);	/* 号級 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
					ELSIF W_MSTID = 201 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA6);	/* 号級 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA4);	/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA5);	/* 終了日 */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2,6);	/* マスタ区分コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3,22);	/* コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);	/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA5);	/* 終了日 */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* ＩＤ */
							IF W_MSTID = 200 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA3);	/* 職級コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA6);	/* 号級 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
							ELSIF W_MSTID = 201 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA6);	/* 号級 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA4);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA5);	/* 終了日 */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* マスタ区分コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA5);	/* 終了日 */
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
/* エラー内容登録                                                     */
/**********************************************************************/
	IF P_SKBN = 6 THEN
		/**********************************************************************/
		/* エラーデータ登録                                                   */
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
		W_SQL := W_SQL || ',2,''キーが重複しています。''';
		W_SQL := W_SQL || ',3,''既存データにキー重複があります。''';
		W_SQL := W_SQL || ',4,''システム固有で使用されている為、取込不可です。''';
		W_SQL := W_SQL || ',8,''キー重複の除外データです。''';
		W_SQL := W_SQL || ',11,''銀行コード=マスタ未存在''';
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
		/* エラーデータ削除                                                   */
		/**********************************************************************/
		W_SQL := 'DELETE FROM ' || W_TABLE1;
		W_SQL := W_SQL || ' WHERE ERROR IS NOT NULL';
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);

		/**********************************************************************/
		/* 取込エラー件数                                                     */
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
		/* 登録件数                                                           */
		/**********************************************************************/
		W_SQL := 'SELECT COUNT(*) COEFFICIENT';
		W_SQL := W_SQL || ' FROM ' || W_TABLE1;
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_UPDCNT);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
		DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_UPDCNT);

		/**********************************************************************/
		/* 取込件数                                                           */
		/**********************************************************************/
		W_INCNT := W_ERRCNT + W_UPDCNT;

		/**********************************************************************/
		/* 取込件数                                                           */
		/**********************************************************************/
		IF P_ERREXE = 3 AND W_ERRCNT > 0 THEN
			W_UPDCNT := 0;
		END IF;
	END IF;

/**********************************************************************/
/* 登録                                                               */
/**********************************************************************/
	IF P_SKBN = 3 OR (P_SKBN = 6 AND W_UPDCNT > 0) THEN
	/**********************************************************************/
	/* テーブルロック処理                                                 */
	/**********************************************************************/
		W_SQL := 'LOCK TABLE ' || W_TABLE2 || ' IN EXCLUSIVE MODE';
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		IF P_MSTID IN (4,5,6,12,13) THEN
			W_DATE := SYSDATE;
		END IF;
	/**********************************************************************/
	/* 変更履歴更新処理                                                   */
	/**********************************************************************/
		/* 住民税納付先(標準形式) , 納付先(地方公共団体書式) */
		IF P_MSTID IN (6,12) THEN
			/* 追加 */
			W_SQL := 'SELECT B.JMZNHSCD,B.NOHSKJME,B.NOHSKKME';
			IF P_MSTID = 6 THEN
				W_SQL := W_SQL || ',B.NOHSKRME';	--* 変更後住民税納付先名（ローマ字）
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
			
			/* 変更 */
			W_SQL := 'SELECT B.JMZNHSCD,B.NOHSKJME,B.NOHSKKME,A.NOHSKJME,A.NOHSKKME';
			IF P_MSTID = 6 THEN
				W_SQL := W_SQL || ',B.NOHSKRME';	--* 変更後住民税納付先名（ローマ字）
				W_SQL := W_SQL || ',A.NOHSKRME';	--* 変更前住民税納付先名（ローマ字）
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

			/* 論理削除 Or 物理削除 */
			W_SQL := 'SELECT A.JMZNHSCD,A.NOHSKJME,A.NOHSKKME';
			IF P_MSTID = 6 THEN
				W_SQL := W_SQL || ',A.NOHSKRME';	--* 変更前住民税納付先名（ローマ字）
			ELSE
				W_SQL := W_SQL || ',NULL';
			END IF;
			W_SQL := W_SQL || ' FROM ' || W_TABLE2 || ' A,' || W_TABLE1 || ' B';
			W_SQL := W_SQL || ' WHERE A.JMZNHSCD = B.JMZNHSCD(+)';
			W_SQL := W_SQL || '   AND DECODE(B.DELETE_DIV,NULL,B.JMZNHSCD,NULL) IS NULL';

			/* 標準形式は特定都道府県削除・追加を考慮 */
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
					/* 標準形式省く */
					IF P_MSTID = 12 THEN
						/* 論理削除 */
						INSERT INTO JMZNHSK_RK (UPDDATE,UPDKBN,JMZNHSCD,NOHSKJME_B,NOHSKKME_B,NOHSKRME_B,NOHSKJME_A,NOHSKKME_A,NOHSKRME_A)
							VALUES(W_DATE,4,W_DATA4,W_DATA5,W_DATA6,W_DATA7,NULL,NULL,NULL);
					END IF;
				ELSIF P_UPDKBN = 3 THEN
					/* 物理削除 */
					INSERT INTO JMZNHSK_RK (UPDDATE,UPDKBN,JMZNHSCD,NOHSKJME_B,NOHSKKME_B,NOHSKRME_B,NOHSKJME_A,NOHSKKME_A,NOHSKRME_A)
						VALUES(W_DATE,3,W_DATA4,W_DATA5,W_DATA6,W_DATA7,NULL,NULL,NULL);
				END IF;
			END LOOP;
		END IF;

		/* 銀行 , 銀行＋支店(全銀協) */
		IF P_MSTID IN (4,13) THEN
			/* 追加 */
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

			/* 変更 */
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

			/* 論理削除 Or 物理削除 */
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
					/* 標準形式省く */
					IF P_MSTID = 13 THEN
						/* 論理削除 */
						INSERT INTO GINKO_RK (UPDDATE,UPDKBN,GINKOCD,GINKOJME_B,GINKOKME_B,GINKOAME_B,GINKOJME_A,GINKOKME_A,GINKOAME_A)
							VALUES(W_DATE,4,W_NDATA4,W_DATA9,W_DATA10,NULL,NULL,NULL,NULL);
					END IF;
				ELSIF P_UPDKBN = 3 THEN
					/* 物理削除 */
					INSERT INTO GINKO_RK (UPDDATE,UPDKBN,GINKOCD,GINKOJME_B,GINKOKME_B,GINKOAME_B,GINKOJME_A,GINKOKME_A,GINKOAME_A)
						VALUES(W_DATE,3,W_NDATA4,W_DATA9,W_DATA10,W_DATA11,NULL,NULL,NULL);
				END IF;
			END LOOP;
		END IF;

		/* 銀行支店 , 銀行＋支店(全銀協) */
		IF P_MSTID IN (5,13) THEN
			/* 追加 */
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

			/* 変更 */
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

			/* 論理削除 Or 物理削除 */
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
			/* 標準形式は特定銀行削除・追加を考慮 */
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
					/* 標準形式省く */
					IF P_MSTID = 13 THEN
						/* 論理削除 */
						INSERT INTO GINKSTN_RK (UPDDATE,UPDKBN,GINKOCD,SITENCD,SITENJME_B,SITENKME_B,SITENAME_B,SITENJME_A,SITENKME_A,SITENAME_A)
							VALUES(W_DATE,4,W_NDATA4,W_NDATA5,W_DATA9,W_DATA10,NULL,NULL,NULL,NULL);
					END IF;
				ELSIF P_UPDKBN = 3 THEN
					/* 物理削除 */
					INSERT INTO GINKSTN_RK (UPDDATE,UPDKBN,GINKOCD,SITENCD,SITENJME_B,SITENKME_B,SITENAME_B,SITENJME_A,SITENKME_A,SITENAME_A)
						VALUES(W_DATE,3,W_NDATA4,W_NDATA5,W_DATA9,W_DATA10,W_DATA11,NULL,NULL,NULL);
				END IF;
			END LOOP;
		END IF;

	/**********************************************************************/
	/* 登録処理                                                           */
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
			/* 同期時の他会社登録(既存ﾃﾞｰﾀは削除) */
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
			/* 置換＆追加時 */
			IF P_UPDKBN = 2 THEN
				W_SQL := 'DELETE FROM ' || W_TABLE2;
				IF P_MSTID NOT IN (4,5,6,11,12,13) THEN
					/* 1:名称マスタ・2:職能給号級・3:本給号級・7:自由マスタ・8:組織考課 */
					W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
					W_SQL := W_SQL || '   AND (' || W_KEYINF || ') IN (';
				ELSE
					/* 4:銀行・5:銀行支店・6:住民税納付先・11:郵便番号・12:住民税納付先(地方公共団体書式)・13:銀行＋支店(全銀協) */
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

				/* 銀行＋支店(全銀協) */
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

			/* 削除＆追加時 */
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

				/* 銀行＋支店(全銀協) */
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
			/* 追加処理                                                           */
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

					/* 更新日・更新者コード */
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

				/* 郵便番号 */
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

				/* 銀行＋支店(全銀協) */
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
		/* 紐づいているマスタの削除処理                                       */
		/**********************************************************************/
		/* 削除＆追加時 */
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
	/* マッピング項目                                                     */
	/**********************************************************************/
		IF P_MSTID IN (1,2,3,7) THEN
			FOR C_011_REC IN C_011(P_KAISYA,W_MSTID) LOOP
				IF C_011_REC.KAISYA_DIV = '1' OR (C_011_REC.KAISYA_DIV = '0' AND (C_011_REC.TARGET_KAISYA_DIV = '1' OR (C_011_REC.TARGET_KAISYA_DIV = '2' AND C_011_REC.TARGET_KAISYACD = P_KAISYA))) THEN
					IF C_011_REC.KAISYA_DIV = '1' OR (C_011_REC.KAISYA_DIV = '0' AND (W_KAISYA_L = 0 OR (W_KAISYA_L <> 0 AND C_011_REC.LOCAL_UPDATE_DIV = '1'))) THEN

					/**********************************************************************/
					/* テーブル名、項目名取得処理                                         */
					/**********************************************************************/
						W_MAPTB  := WEB_SP0002610_F(4,0,W_MSTID,'2',C_011_REC.KAISYACD,C_011_REC.MAPPING_ID,0);
						W_MAPTBL := WEB_SP0002610_F(4,0,W_MSTID,'2',C_011_REC.KAISYACD,C_011_REC.MAPPING_ID,1);
						W_MAPFI  := 'MAP_' || C_011_REC.KAISYA_DIV || '_' ||  C_011_REC.MAPPING_ID;

					/**********************************************************************/
					/* 削除処理                                                           */
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
					/* 追加処理                                                           */
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
					/* 不整合外国語データ削除                                             */
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
/* 個人振込先マスタ更新処理                                           */
/* 　　実行条件１：登録時                                             */
/* 　　実行条件２：銀行・銀行支店・銀行＋支店(全銀協)                 */
/* 　　実行条件３：置換追加・削除追加                                 */
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
/* 名称マスタ・自由設定の同期処理                                     */
/* 　実行条件１：データ入出力登録時 OR 自動取込登録時                 */
/* 　実行条件２：削除追加以外                                         */
/* 　実行条件３：名称マスタ・自由設定                                 */
/* 　実行条件４：同期区分=1（同期する）                               */
/* 　実行条件５：同期処理フラグ=0（同期処理未処理）                   */
/* 　実行条件６：マルチカンパニー環境                                 */
/**********************************************************************/
	IF (P_SKBN = 3 OR (P_SKBN = 6 AND W_UPDCNT > 0)) AND P_UPDKBN <> '3' AND P_MSTID IN (1,7) AND W_DOUKI = '1' AND W_DOUKIFLG = '0' AND W_KFLG = '1' THEN
		W_J := 1;
		FOR C_002_REC IN C_002 LOOP
			IF W_J = 1 THEN
				W_KAISYA := C_002_REC.KAISYACD;
			ELSE
				/* 名称マスタ */
				IF P_MSTID = 1 THEN
					/* マスタ(履歴) */
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
					/* マスタ予備情報(履歴) */
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
				/* 自由設定 */
				ELSE
					/* WEB_TP000250系(通常）or WEB_TP000252系(履歴） */
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
					/* WEB_TP000251系（通常） or WEB_TP000253系（履歴） */
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
/* 外国語不要データ削除                                               */
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
/* テーブル削除                                                       */
/**********************************************************************/
	IF P_SKBN = 4 OR P_SKBN = 6 THEN
		/* ワークテーブル削除 */
		WEB_SP0003020_S(1,W_TABLE1);
	END IF;

/**********************************************************************/
/* ワーク変更                                                         */
/**********************************************************************/
	IF P_SKBN = 5 AND (P_WKKBN = 2 OR P_WKKBN = 3) THEN

		/* 13:銀行＋支店(全銀協)はワーク自動変更 */
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
					/* 17:銀行名カナ特殊文字使用、18:支店名カナ特殊文字使用 */
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
							SELECT REGEXP_REPLACE(W_ADATA3,'[ｧァ]','ｱ')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[ｨィ]','ｲ')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[ｩゥ]','ｳ')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[ｪェ]','ｴ')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[ｫォ]','ｵ')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[ｬャ]','ﾔ')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[ｭュ]','ﾕ')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[ｮョ]','ﾖ')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[ｯッ]','ﾂ')
							INTO W_ADATA3 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA3,'[^ (),./\｢｣0-9A-Zｦ-ﾝﾞﾟ\-]',' ')
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
							SELECT REGEXP_REPLACE(W_ADATA4,'[ｧァ]','ｱ')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[ｨィ]','ｲ')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[ｩゥ]','ｳ')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[ｪェ]','ｴ')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[ｫォ]','ｵ')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[ｬャ]','ﾔ')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[ｭュ]','ﾕ')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[ｮョ]','ﾖ')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[ｯッ]','ﾂ')
							INTO W_ADATA4 FROM DUAL;
							SELECT REGEXP_REPLACE(W_ADATA4,'[^ (),./\｢｣0-9A-Zｦ-ﾝﾞﾟ\-]',' ')
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

			--14:支店コードNULL
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR = NULL';
			W_SQL := W_SQL || ' WHERE ERROR = 14';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			--15:銀行名漢字30桁以上
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR = NULL';
			W_SQL := W_SQL || ',GINKOJME = CMN_SJIS.SUBSTRB(GINKOJME,1,30)';
			W_SQL := W_SQL || ' WHERE ERROR = 15';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			--16:支店名漢字30桁以上
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR = NULL';
			W_SQL := W_SQL || ',SITENJME = CMN_SJIS.SUBSTRB(SITENJME,1,30)';
			W_SQL := W_SQL || ' WHERE ERROR = 16';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/* 17:銀行名カナ特殊文字使用、18:支店名カナ特殊文字使用 */
			W_RTN := FNCL_ZENBANK_CHK();
		ELSE
		/**********************************************************************/
		/* キー重複解除                                                       */
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
		/* 変更処理                                                           */
		/**********************************************************************/
			IF P_WKKBN = '2' THEN
				/* 前回データ削除 */
				W_SQL := 'DELETE FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER=' || P_SID;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 変更データ追加 */
				W_SQL := 'INSERT INTO ' || W_TABLE1 || ' (';
				W_SQL := W_SQL || ' IDENTIFIER,' || W_FIELD || ')';
				W_SQL := W_SQL || ' SELECT';
				W_SQL := W_SQL || ' ' || P_SID || ',' || W_FIELD;
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER=0';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* ワークデータ削除 */
				W_SQL := 'DELETE FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE IDENTIFIER=0';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

		/**********************************************************************/
		/* 削除処理                                                           */
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
/* 一括取込処理ログ更新                                               */
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
		W_SQL := W_SQL || ',DECODE(' || W_ERRCNT || ',0,'''',''取込データにエラーが存在します。'')';
		W_SQL := W_SQL || ',SYSDATE';
		W_SQL := W_SQL || ',:ORA_2)';
		DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
		DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_KAISYA);
		DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2',P_UPDID);
		W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		P_ERR :=0;
	END IF;

/**********************************************************************/
/* 終了処理                                                           */
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
/* エラー発生時処理                                                   */
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

