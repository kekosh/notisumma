/**********************************************************************************/
/*  ｼｽﾃﾑ：人事WEB                                                                 */
/*  機能：システム管理                                                            */
/*  処理：自由項目設定                                                            */
/*  内容：登録処理・ワーク作成処理                                                */
/*  名称：WEB_SP0060910_S                                                         */
/*  FILE：P0060910.SQL                                                            */
/*  備考：                                                                        */
/*                                                                                */
/*  作成：Ver6.1  2001/05/01 T.M                                                  */
/*  履歴：Ver6.2  2001/10/01 T.M 申請項目変更,小数対応,区分任意入力               */
/*  履歴：Ver6.2a 2001/11/01 T.M 住所・郵便番号検索設定の不具合対応               */
/*  履歴：Ver6.2a 2001/11/01 T.M 項目削除時のチェック・提出文書ID変更不具合対応   */
/*  履歴：Ver6.2b 2001/12/01 T.M 届出連携時の作成区分登録漏れ対応                 */
/*  履歴：Ver6.3  2002/02/01 T.M 届出全表示順変更対応                             */
/*  履歴：Ver6.3  2002/02/01 T.M ソート項目・範囲指定対応,個人情報獲変更対応      */
/*  履歴：Ver7.0  2002/10/01 T.M 届出入力説明文書ファイル対応                     */
/*  履歴：Ver7.0  2002/10/01 T.M 初期管理名称,使用区分,名称変更区分対応           */
/*  履歴：Ver7.0a 2003/xx/xx T.M 統計検索区分の対応                               */
/*  履歴：Ver7.0a 2003/xx/xx T.M その他システム参照時のソート区分不具合対応       */
/*  履歴：Ver8.0  2002/12/01 T.M キー設定,時点設定対応                            */
/*  履歴：Ver8.0.5 2003/03/19 T.M キー設定時のソート未使用チェック                */
/*  履歴：Ver8.0.6 2003/05/02 T.M ファイル使用対応                                */
/*  履歴：Ver8.0.7 2003/08/05 T.M 時点から時点以外にした場合の不要データ削除対応  */
/*  履歴：Ver8.0.7 2003/08/28 T.M 通貨型対応                                      */
/*  履歴：VerP1.1  2003/05/01 T.M 英数字対応                                      */
/*  履歴：VerP1.1  2003/05/01 T.M ワークテーブルスペース対応                      */
/*  履歴：VerP1.2b 2003/11/25 T.M 項目追加時に届出連携時の不具合対応              */
/*  履歴：VerP1.2b 2004/01/16 T.M 届出連携時の必須区分等移行漏れ不具合対応        */
/*  履歴：VerP1.2b 2004/01/22 T.M 届出連携時の移行不具合対応                      */
/*  履歴：VerP1.3  2004/02/23 T.M 時点設定（開始・終了タイプ）の追加              */
/*  履歴：VerP2.01 2004/04/28 T.M 時点設定（開始・終了タイプ）の対応              */
/*  履歴：VerP2.11 2004/07/12 S.Z.H マスタ更新ログ対応                            */
/*  履歴：VerP2.32 2004/12/29 T.M その他システム参照時テーブル名未変更不具合対応  */
/*  履歴：VerP3.01 2005/09/07 I.H E100079 時点設定（開始・終了タイプ）の取得方法変更 */
/*  履歴：VerP3.01 2005/10/17 T.M D100001 マルチカンパニー対応                    */
/*  履歴：VerP3.02 2005/12/01 M.I D100041 ログ変更対応                            */
/*  履歴：VerP3.02 2005/12/19 T.M D100001 社別部分更新漏れ対応                    */
/*  履歴：VerP3.04 2006/02/07 T.M D100001 その他システム参照時対応漏れ            */
/*  履歴：VerP3.04 2006/02/17 T.M D100069 タイプ変更(FILEDATA LONG RAW → BLOB)   */
/*  履歴：VerP3.04 2006/02/28 T.M D100001 リカバリ時の会社コードセット漏れ        */
/*  履歴：VerP3.0a 2006/03/07 T.M E100184 管理項目の設定用のパラメータ追加対応    */
/*  履歴：VerP3.0d 2006/06/13 T.M E100306 その他参照社員＋会社選択時の不具合      */
/*  履歴：VerP3.0e 2006/10/06 M.I E100414 表示順更新漏れ不具合対応                */
/*  履歴：VerP3.0f 2006/12/08 Y.Y E100471 補助入力先（キー設定あり）不具合対応    */
/*  履歴：VerP3.0f 2006/12/08 Y.Y E100472 自由申請連携時の削除不具合対応          */
/*  履歴：VerP3.0f 2006/12/08 M.I E100473 自由申請連携時の確定不具合対応          */
/*  履歴：VerP3.0f 2007/01/16 M.I E100504 確定時のWEB_TP1000021_M更新漏れ対応     */
/*  履歴：VerP3.0f 2007/01/26 M.I E100519 社員番号タイプ時の表示書式セット漏れ    */
/*  履歴：VerP3.1  2006/09/28 I.H D100170 データ更新ログパフォーマンス改善対応    */
/*  履歴：VerP3.1  2007/02/05 M.I E100522 リスト表示項目21_M更新漏れ対応          */
/*  履歴：VerP3.1a 2007/05/17 M.I E100641 自由申請連携時の確定不具合対応          */
/*  履歴：VerP3.1a 2007/07/06 M.I E100670 確定時のWEB_TP1000021_M更新漏れ対応     */
/*  履歴：VerP4.0  2007/06/08 M.I D100288 承認数制限解除対応                      */
/*  履歴：VerP4.0  2007/08/30 T.M D100318 申請理由・却下理由サイズ拡張（200→500）*/
/*  履歴：VerP4.0  2007/12/18 Y.N D100371 文字複数行形式の高さ指定対応            */
/*  履歴：VerP4.0  2007/12/26 M.I D100379 TDE対応                                 */
/*  履歴：VerP4.0d 2009/06/26 C.O E101255 自由申請連携時の確定不具合対応漏れ対応  */
/*  履歴：VerP4.0d 2009/09/07 M.I【修正449】E101304 変更時のﾌｧｲﾙﾃﾞｰﾀ復元対応      */
/*  履歴：VerP4.0f 2010/05/19 M.I【修正599】E101458 ﾏｽﾀ履歴区分設定漏れ対応       */
/*  履歴：VerP4.0g 2010/09/14 M.I【修正693】E101557 更新日更新者ｺｰﾄﾞ登録漏れ対応  */
/*  履歴：VerP4.0g 2011/03/07 M.I【修正779】E101649 時点変更時の社別カテゴリ名不備*/
/*  履歴：Ver.2    2011/11/18 T.M【改善P-11-004】                                 */
/*  履歴：Ver.2    2011/12/08 M.I【修正P11430】                                   */
/*  履歴：Ver.3    2012/04/16 M.I【修正P12590】                                   */
/*  履歴：Ver.3a   2012/07/23 M.K【修正P13970】                                   */
/*  履歴：Ver.3a   2012/11/14 M.K【修正P14650】                                   */
/*  履歴：Ver.3a   2012/11/20 M.K【修正P14680】                                   */
/*  履歴：Ver.3a   2013/01/24 I.H【修正P14930】                                   */
/*  履歴：Ver5.0a  2013/01/25 H.N【修正P14960】                                   */
/*  履歴：Ver5.0a  2013/02/08 M.K【修正P15130】                                   */
/*  履歴：Ver5.0a  2013/02/25 M.I【修正P15180】                                   */
/*  履歴：Ver6.0   2014/10/30 SHSC【P-14-208】禁則文字解除対応（先行）            */
/*  履歴：VerP6.0  2015/01/07 T.M【修正P17970】                                   */
/*  履歴：VerP6.1  2015/03/23 T.M【改善P-14-083】                                 */
/*  履歴：VerP6.1  2015/04/10 T.M【改善P-14-084】                                 */
/*  履歴：VerP6.0  2015/07/02 ISID【修正P16860】                                  */
/*  履歴：VerP6.1  2015/07/08 ICOM【修正P16100】                                  */
/*  履歴：VerP6.1  2015/08/05 T.M【P18280】(PCS-BUG-765)                          */
/*  履歴：VerP6.1  2015/09/24 T.M【修正P19630】                                   */
/*  履歴：VerP6.1  2015/10/05 T.M【P20600】(PCS-BUG-916,917)                      */
/*  履歴：VerP6.1  2017/03/01 ISID【P24220】自由個人情報のView削除不備対応        */
/*  履歴：Ver6.1   2017/05/19 ISID【修正P24440】                                  */
/*  履歴：Ver6.1   2017/05/22 ISID【修正P23850】                                  */
/*  履歴：Ver6.1   2018/11/26 ISID【修正P27480】                                  */
/*  履歴：Ver6.1   2019/02/28 ISID【修正P27481】                                  */
/*  履歴：Ver6.1   2020/12/11 ISID【修正P32260】                                  */
/**********************************************************************************/
DROP PROCEDURE WEB_SP0060910_S;

CREATE PROCEDURE WEB_SP0060910_S(
	P_SKBN      IN  NUMBER,   /* 1:ワーク登録,2:確定登録 */
	P_TBKBN     IN  NUMBER,   /* 1:通常,2:その他情報(社員コード),3:その他情報(会社コード+表示社員コード) */
	P_UPDKBN    IN  NUMBER,   /* 1:新規,2:変更,3:削除 */
	P_UPDID     IN  WEB_TPFIELD.UPDID%TYPE,/* 更新者コード */
	P_RID       IN  NUMBER,   /* 利用者ＩＤ */
	P_KEY       IN  NUMBER,   /* 区分 */
	P_NAME      IN  VARCHAR2, /* 名称 */
	P_GROUP     IN  NUMBER,   /* グループ区分 */
	P_RKBN      IN  VARCHAR2, /* 歴区分(0:単一,1:歴) */
	P_TSORT     IN  NUMBER,   /* 登録用表示順 */
	P_SSORT     IN  NUMBER,   /* 照会用表示順 */
	P_SRTKBN    IN  VARCHAR2, /* ソート区分(0:無,1:有) */
	P_KEYUSE    IN  VARCHAR2, /* キー設定(0:無,1:有) */
	P_JITEN     IN  VARCHAR2, /* 時点設定(0:無,1:有) */
	P_FILEKBN   IN  VARCHAR2, /* ファイル区分(0:無,1:有) */
	P_OBJTYPE   IN  VARCHAR2, /* オブジェクトタイプ(1:テーブル,2:ビュー)*/
	P_OBJNAME   IN  VARCHAR2, /* オブジェクト名称 */
	P_MKAISYA   IN  WEB_TPFIELD.KAISYACD%TYPE, /* 管理会社コード */
	P_ERR       OUT NUMBER    /* エラー区分(-1:エラー,0:正常,1:項目無,2:項目重複,3:区分重複,4:範囲指定チェック) */
	                          /*             5:キー設定,7:ソート設定 */
	                          /*             11:時点設定時(キー使用ありかのチェック) */
	                          /*             12:時点設定時(時点設定を設定済かのチェック) */
	                          /*             13:時点設定時(キー項目に設定しているかのチェック) */
	                          /*             14:時点設定時(時点設定数のオーバーチェック) */
	                          /*             15:開始終了タイプ(片方のみ設定) */
	                          /*             16:開始終了タイプ(複数設定) */
)

IS

TYPE T_NUM1 IS TABLE OF NUMBER(3)                 INDEX BY BINARY_INTEGER; /* */
TYPE T_KCD  IS TABLE OF WEB_TPFIELD.KAISYACD%TYPE INDEX BY BINARY_INTEGER; /* */
TYPE T_VAR1 IS TABLE OF VARCHAR(510)              INDEX BY BINARY_INTEGER; /* */
TYPE T_NUM2 IS TABLE OF NUMBER(10)                INDEX BY BINARY_INTEGER; /* */
TYPE T_VAR2 IS TABLE OF VARCHAR(10)                INDEX BY BINARY_INTEGER; /* */

W_OLDID    T_NUM1;          /* 旧ＩＤ */
W_NEWID    T_NUM1;          /* 新ＩＤ */
W_MOTOID   NUMBER(3);       /* 旧ＩＤ */
W_MOTO1    NUMBER(3);       /* 旧申請理由ＩＤ */
W_MOTO2    NUMBER(3);       /* 旧却下理由ＩＤ */
W_MOTO3    NUMBER(3);       /* 退避申請理由ＩＤ */
W_MOTO4    NUMBER(3);       /* 退避却下理由ＩＤ */
W_CHGCNT   NUMBER(5);       /* ワークカウント */
W_SQL      VARCHAR2(10000);  /* SQL文字列 */
W_SQL_R1   VARCHAR2(10000);  /* リカバリSQL文字列 */
W_SQL_R2   VARCHAR2(10000);  /* リカバリSQL文字列 */
W_SQL_R3   VARCHAR2(10000);  /* リカバリSQL文字列(届出申請用) */
W_SQL_R4   VARCHAR2(10000);  /* リカバリSQL文字列(届出申請用) */
W_SQL_R5   VARCHAR2(10000);  /* リカバリSQL文字列(ファイル用) */
W_TABLE1   VARCHAR2(60);    /* テーブル名 */
W_TABLE2   VARCHAR2(60);    /* バックアップテーブル名 */
W_TABLE3   VARCHAR2(60);    /* 届出テーブル名 */
W_TABLE4   VARCHAR2(60);    /* 届出バックアップテーブル名 */
W_TABLE5   VARCHAR2(60);    /* ファイル用テーブル名 */
W_TABLE6   VARCHAR2(60);    /* バックアップファイル用テーブル名 */
W_VIEW1    VARCHAR2(60);    /* ビュー名 */
W_VIEW2    VARCHAR2(60);    /* ビュー名 */
W_JITENKEY1 VARCHAR2(60);   /* 時点項目キー1 */
W_JITENKEY2 VARCHAR2(60);   /* 時点項目キー2 */
W_INDEX1   VARCHAR2(60);    /* インデックス名 */
W_INDEX2   VARCHAR2(60);    /* インデックス名 */
W_INDEX3   VARCHAR2(60);    /* インデックス名(届出用) */
W_INDEX4   VARCHAR2(60);    /* インデックス名(届出用) */
W_INDEX5   VARCHAR2(60);    /* ファイル用インデックス名 */
W_SCDKEY   VARCHAR2(100);    /* 社員番号項目名 */
W_TYPE     VARCHAR2(100);    /* 先頭ソート項目タイプ */
W_TSID     NUMBER(5);       /* 登録・照会区分 */
W_TSID1    NUMBER(5);       /* 登録・照会区分(今日) */
W_TSID2    NUMBER(5);       /* 登録・照会区分(基準日) */
W_TBID     NUMBER(5);       /* 登録・照会区分 */
W_USEKBN   VARCHAR2(2);     /* 使用区分 */
W_MSIZE    NUMBER(5);       /* サイズ */
W_SSIZE    NUMBER(5);       /* 小数サイズ */
W_FIELD    VARCHAR2(10);     /* 項目名 */
W_KEY      NUMBER(5);       /* 届出区分 */
W_CNT      NUMBER(10);       /* ワークカウント */
W_I        NUMBER(5);       /* ワークカウント */
W_J        NUMBER(5);       /* ワークカウント */
W_K        NUMBER(5);       /* ワークカウント */
W_ID       NUMBER(5);       /* ワークカウント */
W_JIID1    NUMBER(5);       /* 時点ＩＤワーク */
W_JIID2    NUMBER(5);       /* 時点ＩＤワーク */
W_DCNT     NUMBER(5);       /* 削除件数 */
W_FCNT     NUMBER(5);       /* 項目カウント */
W_GCNT     NUMBER(5);       /* 画面位置カウント */
W_KCNT1    NUMBER(5);       /* 各社データ存在件数 */
W_KCNT2    NUMBER(5);       /* 各社データ存在インデックス */
W_TDKFLG   NUMBER(5);       /* 届出連携フラグ(0:無,1>=届出区分) */
W_RKBN     VARCHAR2(2);     /* 歴区分 */
W_HOJYO    VARCHAR2(200);   /* 補助区分先 */
W_SRTKBN   VARCHAR2(20);    /* ソート区分 */
W_SRTJKN   VARCHAR2(200);   /* ソート条件 */
W_STR_X    NUMBER(5);       /* ワークカウント */
W_WKTBSP   VARCHAR2(100);    /* ワークテーブルスペース */
W_STYPE    NUMBER(1);       /* 社員番号属性 */
W_SNAME    VARCHAR2(100);    /* 社員番号名称 */
W_JIRKBN   NUMBER(1);       /* 時点歴判断(0:単一,1>=:歴) */
W_WDATA1   VARCHAR2(200);   /* ワーク変数 */
W_OLDKJUN  NUMBER(5);       /* 旧項目順 */
W_NEWKJUN  NUMBER(5);       /* 新項目順 */
W_KCD      T_KCD;           /* 更新対象会社コード */
W_KEYFIELD VARCHAR2(200);   /* キー情報 */
W_SDATA    T_VAR2;          /* 申請処理設定 */
W_GET_ID   NUMBER(3);       /* ＩＤ */
W_GET_TKBN VARCHAR2(20);    /* 対象区分 */
W_KJUN     NUMBER(3);       /* 項目順 */
W_KNAME    VARCHAR2(100);   /* 項目名 */
W_NEWKBN   NUMBER(1);       /* 自由項目新範囲区分(0:従来,1:新規) */

W_CSR      INTEGER;         /* 動的カーソル変数 */
W_RVL      INTEGER;         /* 動的カーソル変数 */
W_CSR2     INTEGER;         /* 動的カーソル変数 */
W_RVL2     INTEGER;         /* 動的カーソル変数 */
W_ERRCODE  NUMBER;          /* ORACLEエラーコード */
W_ERRMSG   VARCHAR2(510);   /* ORACLEエラーメッセージ */
W_NDATA    NUMBER(5);       /* データ取得用 */
W_MITU     VARCHAR2(4000);
W_SVID     VARCHAR2(2000);
W_21REC_V  T_VAR1;
W_21REC_N  T_NUM2;

W_LGSNO    NUMBER;         /* ログ取得処理番号 */
W_LOGSET   NUMBER(1);      /* ログ取得(0:無,1:有) */
W_LGGET    VARCHAR2(2);    /* ログ取得範囲 1:しない,2:キー部のみ,3:項目履歴 */
W_LGIUD    VARCHAR2(6);    /* ログ取得条件 ビット判断(0:不要,1:要) 1:追加,2:変更,3:削除 */
W_ROWID    VARCHAR2(400);  /* ログ取得用ROWID */
W_WHERE    VARCHAR2(4000); /* 条件文 */
W_ERR      NUMBER;         /* 関数戻り値用エラー区分 */
W_DTFLG    NUMBER(1);      /* 個人情報のデータ判断フラグ */
W_DISP_TYPE VARCHAR2(10);  /* 表示書式ワーク */

W_ITM_ID1  NUMBER(3);      /* 項目ＩＤ（社員番号）*/
W_ITM_ID2  NUMBER(3);      /* 項目ＩＤ（歴ＩＤ）*/
W_ITM_ID3  NUMBER(3);      /* 項目ＩＤ（更新日）*/
W_ITM_ID4  NUMBER(3);      /* 項目ＩＤ（更新者コード）*/
W_ITM_ID5  NUMBER(3);      /* 項目ＩＤ（旧更新日）*/
W_ITM_ID6  NUMBER(3);      /* 項目ＩＤ（旧更新者コード）*/

/* 登録状況 */
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

/* 表示順状況状況 */
CURSOR C_002 IS
	SELECT
		ITEM_ID,
		PROCESS_DIV 
	 FROM WEB_TP0061140_W
	WHERE CUSTOMER_ID = P_RID
	ORDER BY DISP_ORDER,ITEM_ID
;

/* 更新後状況 */
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

/* 使用ＩＤ情報 */
CURSOR C_005 IS
	SELECT
		IDENTIFIER
	 FROM WEB_TP0061110_M
	ORDER BY IDENTIFIER
;

/* 項目情報 */
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

/* ソート区分変更用 */
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

/* ソート条件作成用 */
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

/* キー状況 */
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

/* 時点設定 */
CURSOR C_010(P_ID1 NUMBER,P_ID2 NUMBER) IS
	SELECT
		ITEM_NAME
	 FROM WEB_TP0061120_M
	WHERE IDENTIFIER = P_ID1
	  AND TIME_CONF = P_ID2
;

/* 時点設定以外のキー項目 */
CURSOR C_011(P_ID NUMBER) IS
	SELECT
		ITEM_NAME
	 FROM WEB_TP0061120_M
	WHERE IDENTIFIER = P_ID
	  AND (TIME_CONF = 0 OR TIME_CONF IS NULL)
	  AND (KEY_CONF > 0 AND KEY_CONF IS NOT NULL)
	ORDER BY KEY_CONF
;

/* 会社コード取得 */
CURSOR C_012 IS
	SELECT KAISYACD
	  FROM KAISYA_MS
;

/* 外国語用の言語ＩＤ取得 */
CURSOR C_013 IS
	SELECT LANGUAGEID
	  FROM CMN_LANGUAGE_MS
	 WHERE LANGUAGEID <> 0
	 GROUP BY LANGUAGEID
;

/* 登録情報(グループ表示順) */
CURSOR C_031(P_ID NUMBER) IS
	SELECT
		DISP_ORDER,DIV
	 FROM WEB_TP0000010_M
	WHERE GROUP_DIV = P_GROUP
	  AND DIV <> P_ID
	ORDER BY DISP_ORDER,DIV
	FOR UPDATE
;

/* 照会情報(グループ表示順) */
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
		A.DATA_TYPE            旧タイプ,
		A.DATA_SIZE-NVL(A.FRACTION_SIZE,0) 旧サイズ,
		NVL(A.FRACTION_SIZE,0) 旧小数サイズ,
		B.NEW_ITEM_ID        NEW_ID,
		B.DATA_TYPE            新タイプ,
		B.DATA_SIZE            新サイズ,
		NVL(B.FRACTION_SIZE,0) 新小数サイズ
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

/* 新・旧ＩＤ変換処理用 */
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

/* 新・旧ＩＤ変換処理(社別)用 */
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
/* 関数名：SUBL_P_UPD_TDFLDID()											*/
/* 機　能：入力チェック・提出文書設定・外国語テーブルの新ＩＤの変更処理	*/
/************************************************************************/
PROCEDURE SUBL_P_UPD_TDFLDID(
	PW_TDKBN	IN  NUMBER,			/* 届出区分 */
	PW_OLDID	IN  NUMBER,			/* 旧ＩＤ */
	PW_NEWID	IN  NUMBER			/* 新ＩＤ */
)
IS

BEGIN
	/* 参照先情報 */
	UPDATE WEB_TP0061160_M
	   SET ITEM_ID = PW_NEWID
	      ,UPDATE_DATE = SYSDATE
	      ,UPDATE_USER = P_UPDID
	 WHERE SYSTEM_DIV = 2
	   AND IDENTIFIER = PW_TDKBN
	   AND ITEM_ID = PW_OLDID
	;

	/* 条件情報(該当項目) */
	UPDATE WEB_TP0061170_M
	   SET ITEM_ID = PW_NEWID
	      ,UPDATE_DATE = SYSDATE
	      ,UPDATE_USER = P_UPDID
	 WHERE SYSTEM_DIV = 2
	   AND IDENTIFIER = PW_TDKBN
	   AND ITEM_ID = PW_OLDID
	;

	/* 条件情報(参照元) */
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

	/* 提出文書設定 */
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

	/* 外国語テーブルの更新 */
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
/* 初期処理                                                           */
/**********************************************************************/
	P_ERR := 0;
	W_LGSNO := 0;
	W_WKTBSP := WEB_SP0002000_F(10);
	W_STYPE := WEB_SP0002000_F(1);
	W_SNAME := WEB_SP0002000_F(3);

	W_TDKFLG := 0;
	/* 動的ＳＱＬカーソルオープン */
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
/* ログワーク削除処理                                                 */
/**********************************************************************/
	/* ログ取得判断フラグ定義 */
	WEB_SP0003160_S(W_LOGSET,W_LGGET,W_LGIUD);
	IF W_LOGSET = 1 THEN
		WEB_SP0003111_S(1,0,0,0,'WEB_SP0060910_S','','',0,W_LGGET,W_LGIUD,P_UPDID,P_RID,W_ERR);
		IF W_ERR <> 0 THEN
			P_ERR := -1;
			GOTO L_EXIT;
		END IF;
	END IF;

/**********************************************************************/
/* テーブルロック処理                                                 */
/**********************************************************************/
	LOCK TABLE WEB_TP0061110_M IN EXCLUSIVE MODE;

/**********************************************************************/
/* 届出システム連携情報                                               */
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
				/* 子のデータがある会社コードを格納 */
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
/* ワーク作成処理                                                     */
/**********************************************************************/
	IF P_SKBN = 1 THEN
		/* 前回ワーク削除 */
		DELETE FROM WEB_TP0061140_W
		 WHERE CUSTOMER_ID = P_RID
		;

		/* 現データ追加 */
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
/* 登録処理                                                           */
/**********************************************************************/
	ELSE
	/**********************************************************************/
	/* 入力チェック                                                       */
	/**********************************************************************/
		IF P_UPDKBN = 1 THEN
		/**********************************************************************/
		/* 同一区分チェック                                                   */
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
		/* 同一項目存在チェック                                               */
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
		/* 項目未作成チェック                                                 */
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
		/* 範囲設定チェック                                                   */
		/**********************************************************************/
--			IF P_SRTKBN = '1' THEN
--				SELECT MAX(タイプ) INTO W_SQL
--				  FROM WEB_TP0061140_W
--				 WHERE 利用者ＩＤ = P_RID
--				   AND 処理区分 <> '3'
--				   AND ソート区分 IN (
--					SELECT MIN(ソート区分)
--					  FROM WEB_TP0061140_W
--					 WHERE 利用者ＩＤ = P_RID
--					   AND 処理区分 <> '3')
--				;
		
--				IF W_SQL <> 'DATE' THEN
--					P_ERR := 4;
--					GOTO L_EXIT;
--				END IF;
--			END IF;

		/**********************************************************************/
		/* キー設定チェック                                                   */
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
		/* 時点設定チェック                                                   */
		/**********************************************************************/
			IF P_JITEN <> '0' THEN
			/**********************************************************************/
			/* 不整合データクリア処理                                             */
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
			/* キー項目を使用かのチェック                                         */
			/**********************************************************************/
				IF P_KEYUSE = '0' AND P_JITEN <> '5' THEN
					P_ERR := 11;
					GOTO L_EXIT;
				END IF;

			/**********************************************************************/
			/* 項目側の時点設定を設定済かのチェック                               */
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
			/* キー項目を対象としているかのチェック                               */
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
			/* 時点項目数チェック                                                 */
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
			/* 開始・終了タイプのチェック                                         */
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
	/* テーブル名取得処理                                                 */
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
		/* 個人情報のデータ判断                                               */
		/**********************************************************************/
		IF P_TBKBN = 1 AND P_UPDKBN = 2 THEN	/* 変更で通常時 */
			W_DTFLG := 0;
			IF P_RKBN = '1' THEN	/* 歴の場合 */
				/* 個人情報にデータが存在するかチェック */
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
	/* 追加・変更処理                                                     */
	/**********************************************************************/
		IF P_UPDKBN = 1 OR P_UPDKBN = 2 THEN
		/**********************************************************************/
		/* 表示順更新処理                                                     */
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
		/* ソート区分更新処理                                                 */
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
		/* キー設定更新処理                                                   */
		/**********************************************************************/
			IF P_KEYUSE = '0' THEN		/* キー指定使用：しない */
				UPDATE WEB_TP0061140_W SET
					KEY_CONF = NULL
				 WHERE CUSTOMER_ID = P_RID
				   AND KEY_CONF IS NOT NULL
				;
			END IF;

		/**********************************************************************/
		/* 入力チェック・提出文書・外国語情報の削除（届出連携時）             */
		/**********************************************************************/
			IF W_TDKFLG > 0 AND P_UPDKBN = 2 THEN
				/* 参照先情報 */
				DELETE FROM WEB_TP0061160_M
				 WHERE SYSTEM_DIV = 2
				   AND IDENTIFIER = W_TDKFLG
				   AND ITEM_ID IN (
					SELECT ITEM_ID
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND PROCESS_DIV = '3')
				;

				/* 条件情報(該当項目) */
				DELETE FROM WEB_TP0061170_M
				 WHERE SYSTEM_DIV = 2
				   AND IDENTIFIER = W_TDKFLG
				   AND ITEM_ID IN (
					SELECT ITEM_ID
					  FROM WEB_TP0061140_W
					 WHERE CUSTOMER_ID = P_RID
					   AND PROCESS_DIV = '3')
				;

				/* 条件情報(参照元) */
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

				/* 提出文書設定 */
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

				/* 外国語情報削除 */
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
		/* 新項目ＩＤ・項目更新処理                                           */
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
		/* 新・旧ＩＤ変更取得                                                 */
		/**********************************************************************/
			IF P_UPDKBN = 2 THEN
				W_CHGCNT := 0;
				FOR C_061_REC IN C_061 LOOP
					W_CHGCNT := W_CHGCNT + 1;
					W_OLDID(W_CHGCNT) := C_061_REC.IDENTIFIER;
					W_NEWID(W_CHGCNT) := C_061_REC.NEW_ID;
				END LOOP;
				/* 旧更新日 */
				SELECT MAX(ITEM_ORDER) INTO W_ITM_ID5 FROM WEB_TP0000020_M WHERE DIV = W_TSID AND UPDATE_DIV = '2';
				/* 旧更新者コード */
				SELECT MAX(ITEM_ORDER) INTO W_ITM_ID6 FROM WEB_TP0000020_M WHERE DIV = W_TSID AND UPDATE_DIV = '3';
			END IF;

			IF W_TDKFLG > 0 AND P_UPDKBN = 2 THEN

				/* 申請理由ＩＤ取得 */
				W_SQL := 'SELECT IDENTIFIER FROM WEB_TP1000020_M WHERE NOTIFICATION_DIV=' || W_TDKFLG || ' AND SUPPORT_DIV=102';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_MOTO1);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_MOTO1);

				/* 却下理由ＩＤ取得 */
				W_SQL := 'SELECT IDENTIFIER FROM WEB_TP1000020_M WHERE NOTIFICATION_DIV=' || W_TDKFLG || ' AND SUPPORT_DIV=100';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_MOTO2);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_MOTO2);
			END IF;

		/**********************************************************************/
		/* 補助区分先変更処理                                                 */
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
		/* リカバリ準備処理                                                   */
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
						IF C_041_REC.旧タイプ = 'DATE' THEN
							IF C_041_REC.新タイプ = 'DATE' THEN
								W_CNT := 1;
							END IF;
						ELSIF C_041_REC.旧タイプ = 'NUMBER' THEN
							IF C_041_REC.新タイプ = 'NUMBER' AND C_041_REC.新サイズ >= C_041_REC.旧サイズ AND C_041_REC.新小数サイズ >= C_041_REC.旧小数サイズ THEN
								W_CNT := 1;
							END IF;
						ELSE
							IF C_041_REC.新タイプ = 'VARCHAR2' AND C_041_REC.新サイズ >= C_041_REC.旧サイズ THEN
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
					IF W_DTFLG = 1 THEN	/* 個人情報にデータあり */
						W_SQL_R5 := 'INSERT INTO ' || W_TABLE5 || ' SELECT * FROM ' || W_TABLE6;
					END IF;
				END IF;
			END IF;

		/**********************************************************************/
		/* テーブル内容登録                                                   */
		/**********************************************************************/
			/* 追加処理 */
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
		/* 項目情報登録                                                       */
		/**********************************************************************/
			SELECT MAX(ITEM_ID) INTO W_ID
			  FROM WEB_TP0061120_M
			 WHERE IDENTIFIER = W_KEY
			;

			/* 前回データ削除処理 */
			DELETE FROM WEB_TP0061120_M
			 WHERE IDENTIFIER = W_KEY
			;

			/* 項目情報追加処理 */
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
		/* キー設定更新処理                                                   */
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
		/* 社別用テーブル変更処理(変更・削除項目の削除)                       */
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
		/* 登録系関連表示順登録(WEB_TP0000010_M)                              */
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
		/* 登録系関連登録(WEB_TP0000010_M)                                    */
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

			/* ソート条件作成 */
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
					W_SRTJKN := W_SRTJKN || '0' || SUBSTR(W_SRTKBN,2) || ',' || C_008_REC.MANAGEMENT_NAME || '(昇順)-';
					W_SRTJKN := W_SRTJKN || '1' || SUBSTR(W_SRTKBN,2) || ',' || C_008_REC.MANAGEMENT_NAME || '(降順)';
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
--				DECODE(歴区分,'0','',DECODE(P_TBKBN,'1',W_SRTKBN,'')),
				DECODE(HISTORY_DIV,'0','',W_SRTKBN),
				DECODE(P_TBKBN,1,'0','2'),
				DECODE(HISTORY_DIV,'0','1',DECODE(P_KEYUSE,'1','1','0')),	/* 単一は有,歴はキー設定時のみ有 */
				0,
				DECODE(HISTORY_DIV,'0','0','1'),
				DECODE(HISTORY_DIV,'0','1','0'),
				'0',
				W_SCDKEY,
				DECODE(W_NEWKBN,0,'WEB_VP0020' || TO_CHAR(W_TSID,'FM000'),'WEB_VP092' || TO_CHAR(W_TSID,'FM00000')),
				GROUP_DIV,
				REGISTER_DISP_ORDER,
				DECODE(W_SRTJKN,NULL,'',W_SRTJKN),
				DECODE(P_SRTKBN,'0','','1',DECODE(W_TYPE,'DATE','0,全件-1,最新(x件)-2,過去(x年)-3,期間','0,全件-1,最新(x件)')),
				FILE_DIV,
				P_MKAISYA,
				SYSDATE,
				P_UPDID
			 FROM WEB_TP0061110_M
			WHERE IDENTIFIER = W_KEY
			;

			IF P_UPDKBN = 2 THEN /* 社別用テーブルのカテゴリ名を更新 */
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
		/* 登録系関連登録(WEB_TP0000020_M)                                    */
		/**********************************************************************/
			DELETE FROM WEB_TP0000020_M
			 WHERE DIV IN (W_TSID,W_TSID1,W_TSID2);

			W_FCNT := 1;
			/* 社員番号項目 */
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

			/* ＩＤ項目 */
			IF P_TBKBN = 1 AND P_RKBN = '1' AND P_KEYUSE = '0' THEN
				W_FCNT := W_FCNT + 1;
				INSERT INTO WEB_TP0000020_M(
					DIV,ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,DATA_TYPE,DATA_SIZE,KEY_ITEM,SORT_DIV,REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
					IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,
					SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,TAKE_DIV,INPUT_DESCRIPTION,
					CONF_CONTROL_DIV,DEFAULT_CONF_INFO,DEFAULT_SCREEN_DISP_ORDER,UPDATE_DATE,UPDATE_USER)
				VALUES(
					W_TSID,W_FCNT,'HISTORY_ID','歴ＩＤ','歴ＩＤ','1','1','NUMBER',5,2,LENGTH(W_SRTKBN),'0','3','0',
					'0','1','6','5','0','0',
					W_FCNT,'0','0','0',0,'4','置換データの場合は、必ず入力して下さい。',
					'00000','1111',W_FCNT,SYSDATE,P_UPDID)
				;

				W_ITM_ID2 := W_FCNT;
			END IF;

			/* 通常項目 */
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

			/* 補助区分先変更処理 */
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

				/* 更新日項目 */
				INSERT INTO WEB_TP0000020_M(
					DIV,ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,DATA_TYPE,REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
					IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,
					SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,TAKE_DIV,
					CONF_CONTROL_DIV,DEFAULT_CONF_INFO,DEFAULT_SCREEN_DISP_ORDER,UPDATE_DATE,UPDATE_USER)
				VALUES(
					W_TSID,W_FCNT,'UPDATE_DATE','更新日','更新日','1','1','DATE','0','3','0',
					'0','0','2','2','0','0',
					W_FCNT,'0','0','0',0,'2',
					'00000','1320',W_FCNT,SYSDATE,P_UPDID)
				;

				W_ITM_ID3 := W_FCNT;

				/* 更新者コード項目 */
				W_FCNT := W_FCNT + 1;
		
				INSERT INTO WEB_TP0000020_M(
					DIV,ITEM_ORDER,ITEM_NAME,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME,USAGE_DIV,NAME_MODIFY_DIV,DATA_TYPE,DATA_SIZE,REQUIRE_DIV,MANAGEMENT_DIV,LINK_DIV,
					IME_DIV,LIST_DISP_DIV,UPDATE_DIV,INPUT_DIV,REFERENCE_DIV,MASTER_FORM,
					SCREEN_DISP_ORDER,SPECIAL_REGISTER1,SPECIAL_REGISTER2,SPECIAL_REGISTER3,EMP_ADDITION,TAKE_DIV,
					CONF_CONTROL_DIV,DEFAULT_CONF_INFO,DEFAULT_SCREEN_DISP_ORDER,UPDATE_DATE,UPDATE_USER)
				VALUES(
					W_TSID,W_FCNT,'UPDATE_USER','更新者コード','更新者コード','1','1',DECODE(W_STYPE,0,'NUMBER','VARCHAR2'),10,'0','3','0',
					'0','0','3',DECODE(W_STYPE,0,'5','0'),'0','0',
					W_FCNT,'0','0','0',0,'3',
					'00000','1330',W_FCNT,SYSDATE,P_UPDID)
				;

				W_ITM_ID4 := W_FCNT;
			END IF;

		/**********************************************************************/
		/* 照会系関連表示順登録(WEB_TP0010010_M)                              */
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
		/* 照会系関連登録(WEB_TP0010010_M)                                    */
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

			IF P_UPDKBN = 2 THEN /* 社別用テーブルのカテゴリ名を更新 */
				FOR C_092_REC IN C_092 LOOP
					UPDATE WEB_TP0010011_M SET
						 CATEGORY_NAME = C_092_REC.CATEGORY_NAME
					 WHERE CATEGORY_DIV = C_092_REC.CATEGORY_DIV
					   AND KAISYACD = C_092_REC.KAISYACD;
				END LOOP;
			END IF;

		/**********************************************************************/
		/* 照会系関連登録(WEB_TP0010020_M)                                    */
		/**********************************************************************/
			DELETE FROM WEB_TP0010020_M
			 WHERE CATEGORY_DIV IN (W_TSID,W_TSID1,W_TSID2);

			/* 社員番号項目 */
			INSERT INTO WEB_TP0010020_M(
				CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,DISP_TYPE,DEFAULT_DISP_TYPE,DISP_FORMAT,
				SCREEN_POSITION1,SCREEN_POSITION2,SCREEN_POSITION3,SCREEN_DISP_DIV,
				COMPOUND_SEARCH_DIV,STATISTICS_SEARCH_DIV,ANY_SELECT_DIV,STATISTICS_AGGREGATE_DIV,UPDATE_DATE,UPDATE_USER)
			VALUES(
				W_TSID,1,W_TSID,W_SCDKEY,'01','01','01',
				0,0,1,1,
				'0','0','0',0,SYSDATE,P_UPDID)
			;

			/* 氏名項目 */
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
				/* 表示タイプ */
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
				/* 表示書式 */
				IF C_006_REC.SUPPORT_DIV = 11 THEN	/* 社員番号 */
					W_SQL := W_SQL || '''01'',';
				ELSIF C_006_REC.SUPPORT_DIV = 18 THEN	/* 年 */
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
				/* 画面位置１,２,３ */
				W_SQL := W_SQL || '1,' || C_006_REC.DISP_ORDER || ',1,';
				/* 画面表示区分 */
				IF C_006_REC.DATA_SIZE >= 30 THEN
					W_SQL := W_SQL || '''2'',';
				ELSE
					W_SQL := W_SQL || '''1'',';
				END IF;
				/* 複合検索区分,任意選択区分 */
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

				/* 統計検索区分 */
				IF C_006_REC.STATISTICS_SEARCH_DIV = '1' THEN
					W_SQL := W_SQL || '''1'',';
				ELSE
					W_SQL := W_SQL || '''0'',';
				END IF;

				/* 統計集計区分 */
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

				/* マスタ時 */
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

					/* 統計検索区分がある場合、コード表示の場合はクリアする。 */
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
				/* 更新日項目 */
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

				/* 更新者コード項目 */
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
					W_TSID,W_FCNT,W_TSID,'EMP_CODE','ファイル','95','95',
					91,0,1,1,
					'E','0','0',0,SYSDATE,P_UPDID)
				;
			END IF;

		/**********************************************************************/
		/* 照会系関連登録(WEB_TP0010030_M)                                    */
		/**********************************************************************/
			DELETE FROM WEB_TP0010030_M WHERE CATEGORY_DIV = W_TSID;

			/* 社員番号項目 */
			INSERT INTO WEB_TP0010030_M(
				CATEGORY_DIV,ITEM_ORDER,DIV,ITEM_NAME,UPDATE_DATE,UPDATE_USER)
			VALUES(
				W_TSID,1,2,'EMP_CODE',SYSDATE,P_UPDID)
			;
			
			/* 歴の場合ＩＤ */
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
		/* 届出関連再設定                                                     */
		/**********************************************************************/
			IF W_TDKFLG > 0 THEN
				/* 前回ワーク削除 */
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
				--W_SQL := W_SQL || ',DECODE(B.処理区分,''2'',NULL,C.初期値区分)';
				--W_SQL := W_SQL || ',DECODE(B.処理区分,''2'',NULL,C.初期値)';
				--W_SQL := W_SQL || ',DECODE(B.処理区分,''2'',NULL,C.初期値テーブル)';
				--W_SQL := W_SQL || ',DECODE(B.処理区分,''2'',NULL,C.初期値項目)';
				--W_SQL := W_SQL || ',DECODE(B.処理区分,''2'',NULL,C.初期値社員番号)';
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
				/* タイプ等が変更された場合 */
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

				/* 事由発生日・歴ＩＤ・却下理由・申請理由以外の削除 */
				W_SQL := 'DELETE FROM WEB_TP1000020_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV NOT IN (100,101,102,103)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_CNT := 200;
				/* 歴ＩＤの退避 */
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

				/* 歴ＩＤの削除 */
				IF P_RKBN = 1 AND P_KEYUSE = '1' THEN
					W_SQL := 'DELETE FROM WEB_TP1000020_M';
					W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
					W_SQL := W_SQL || '   AND NVL(SUPPORT_DIV,99999) = 103';
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;

				/* 申請理由の退避 */
				W_CNT := W_CNT + 1;
				W_MOTO3 := W_CNT;

				/* 申請理由ＩＤ取得 */
				W_SQL := 'SELECT MAX(IDENTIFIER)';
				W_SQL := W_SQL || '  FROM WEB_TP1000020_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV = 102';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_MOTOID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_MOTOID);

				/* 申請理由ＩＤの変換（退避） */
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

				/* 却下理由の退避 */
				W_CNT := W_CNT + 1;
				W_MOTO4 := W_CNT;

				/* 却下理由ＩＤ取得 */
				W_SQL := 'SELECT MAX(IDENTIFIER)';
				W_SQL := W_SQL || '  FROM WEB_TP1000020_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV = 100';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_MOTOID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_MOTOID);

				/* 却下理由ＩＤの変換（退避） */
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

				/* 事由発生日の表示順変更対応 */
	            W_SQL := 'UPDATE WEB_TP1000020_M SET ';
				W_SQL := W_SQL || '   DISP_ORDER=1';
				W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
				W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV = 101';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 項目の登録 */
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

				/* 歴ＩＤ・申請理由・却下理由の採番 */
				SELECT MAX(ITEM_ID) INTO W_CNT
				  FROM WEB_TP0061120_M
				 WHERE IDENTIFIER = W_KEY;

	            W_SQL := 'UPDATE WEB_TP1000020_M SET ';
				W_SQL := W_SQL || '  IDENTIFIER=IDENTIFIER-' || (201 - W_CNT - 1);
--				W_SQL := W_SQL || '  ,表示順=ＩＤ-' || (201 - W_CNT - 1);
				W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
				W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
				W_SQL := W_SQL || '   AND SUPPORT_DIV IN (100,102,103)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 表示順の再割振り */
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

				IF P_UPDKBN = 2 AND P_RKBN = 1 THEN				/* 歴区分:歴 */
					W_KEYFIELD := '';

					/* 申請処理設定の取得 */
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

					IF P_KEYUSE = '0' THEN		/* キー設定:無 */
						/* 使用区分の変更 */
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

						/* キー項目の取得 */
						W_KEYFIELD := 'HISTORY_ID';

						/* 申請処理設定・個人情報KEYの変更 */
						W_SQL := 'UPDATE WEB_TP1000010_M SET ';
						W_SQL := W_SQL || '   APPLY_PROCESS_CONF=''' || SUBSTR(W_SDATA(1),1,1) || '1' || SUBSTR(W_SDATA(1),3,1) || '''';
						W_SQL := W_SQL || '  ,PERSONAL_INFO_KEY=''' || W_KEYFIELD || '''';
						W_SQL := W_SQL || '  ,UPDATE_DATE=SYSDATE';
						W_SQL := W_SQL || '  ,UPDATE_USER=:ORA_1';
						W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV =' || W_TDKFLG;
						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
						DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',P_UPDID);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					ELSIF P_KEYUSE = '1' THEN	/* キー設定:有 */
						/* キー項目の取得 */
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
								/* 使用区分・必須区分・対象区分の変更(キー項目) */
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

						/* 使用区分の変更(キー項目以外) */
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

						/* キー項目の取得 */
						FOR C_009_REC IN C_009(W_KEY) LOOP
							W_KEYFIELD := W_KEYFIELD || ',' || C_009_REC.ITEM_NAME;
						END LOOP;
						W_KEYFIELD := SUBSTR(W_KEYFIELD,2);

						/* 歴区分・申請処理設定・個人情報KEYの変更 */
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
			/* 入力チェック・提出文書設定・外国語テーブルの新ＩＤの変更処理       */
			/**********************************************************************/
				IF P_UPDKBN = 2 THEN
					IF P_RKBN = '1' AND P_KEYUSE = '0' THEN
						W_CNT := W_CNT + 1;
					END IF;

					/* 申請理由追加 */
					W_CNT := W_CNT + 1;
					W_CHGCNT := W_CHGCNT + 1;
					W_OLDID(W_CHGCNT) := W_MOTO1;
					W_NEWID(W_CHGCNT) := W_CNT;

					/* 却下理由追加 */
					W_CNT := W_CNT + 1;
					W_CHGCNT := W_CHGCNT + 1;
					W_OLDID(W_CHGCNT) := W_MOTO2;
					W_NEWID(W_CHGCNT) := W_CNT;

					FOR W_I IN 1..W_CHGCNT LOOP
						IF (W_NEWID(W_I) <> W_OLDID(W_I)) OR W_OLDID(W_I) = W_MOTO1 OR W_OLDID(W_I) = W_MOTO2 THEN

							IF W_OLDID(W_I) = W_MOTO1 THEN		/* 申請理由ＩＤ */
								W_MOTOID := W_MOTO3;
							ELSIF W_OLDID(W_I) = W_MOTO2 THEN	/* 却下理由ＩＤ */
								W_MOTOID := W_MOTO4;
							ELSE
								W_MOTOID := W_OLDID(W_I);
							END IF;

							SUBL_P_UPD_TDFLDID(W_TDKFLG,W_MOTOID,W_NEWID(W_I));

						END IF;
					END LOOP;

				/**********************************************************************/
				/* 各社パラメータ変更処理(変更時のみ)                                 */
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
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_21REC_V(1),510);	-- A.管理名称
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_21REC_V(2),510);   -- A.使用区分
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_21REC_V(3),510);   -- A.対象区分
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_21REC_N(1));       -- A.補助区分
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_21REC_V(4),510);   -- A.必須区分
						DBMS_SQL.DEFINE_COLUMN(W_CSR,6,W_21REC_N(2));       -- A.表示順
						DBMS_SQL.DEFINE_COLUMN(W_CSR,7,W_21REC_V(5),510);   -- A.入力説明
						DBMS_SQL.DEFINE_COLUMN(W_CSR,8,W_21REC_V(6),510);   -- A.初期値区分
						DBMS_SQL.DEFINE_COLUMN(W_CSR,9,W_21REC_V(7),510);   -- A.初期値
						DBMS_SQL.DEFINE_COLUMN(W_CSR,10,W_21REC_V(8),510);  -- A.初期値テーブル
						DBMS_SQL.DEFINE_COLUMN(W_CSR,11,W_21REC_V(9),510);  -- A.初期値項目
						DBMS_SQL.DEFINE_COLUMN(W_CSR,12,W_21REC_V(10),510);	-- A.初期値社員番号
						DBMS_SQL.DEFINE_COLUMN(W_CSR,13,W_21REC_V(11),510); -- A.ヘッダー名
						DBMS_SQL.DEFINE_COLUMN(W_CSR,14,W_21REC_V(12),510); -- A.確認表示区分
						DBMS_SQL.DEFINE_COLUMN(W_CSR,15,W_21REC_N(3));      -- C.新項目ＩＤ
						DBMS_SQL.DEFINE_COLUMN(W_CSR,16,W_21REC_V(13),510); -- B.入力区分
						DBMS_SQL.DEFINE_COLUMN(W_CSR,17,W_21REC_V(14),510); -- B.参照区分
						DBMS_SQL.DEFINE_COLUMN(W_CSR,18,W_21REC_V(15),510); -- B.入力域形式
						DBMS_SQL.DEFINE_COLUMN(W_CSR,19,W_21REC_N(4));      -- B.補助区分
						DBMS_SQL.DEFINE_COLUMN(W_CSR,20,W_21REC_V(16),510); -- B.補助区分先
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

								/* 補助区分を更新するか判断 */
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

						/* タイプ等が変更された場合 */
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
						/* 歴ＩＤの退避 */
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

						/* 歴ＩＤの削除 */
						IF P_RKBN = 1 AND P_KEYUSE = '1' THEN
							W_SQL := 'DELETE FROM WEB_TP1000021_M';
							W_SQL := W_SQL || ' WHERE KAISYACD = :ORA_1';
							W_SQL := W_SQL || '   AND NOTIFICATION_DIV =' || W_TDKFLG;
							W_SQL := W_SQL || '   AND NVL(SUPPORT_DIV,99999) = 103';
							DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
							DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1',W_KCD(W_I));
							W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						END IF;

						/* 申請理由の退避 */
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

						/* 却下理由の退避 */
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

						/* 事由発生日の表示順変更対応 */
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
						
						/* 追加項目の表示順は既存項目の末番＋１から順に設定する */
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

						/* 歴ＩＤ・申請理由・却下理由の採番 */
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

						IF P_RKBN = 1 THEN				/* 歴区分:歴 */

							FOR W_I IN 1..5 LOOP
								W_SDATA(W_I) := NULL;
							END LOOP;

							/* 申請処理設定の取得 */
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

							IF P_KEYUSE = '0' THEN		/* キー設定:無 */
								/* 使用区分の変更 */
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
							ELSIF P_KEYUSE = '1' THEN	/* キー設定:有 */
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
										/* 使用区分・必須区分・対象区分の変更(キー項目) */
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

								/* 使用区分の変更(キー項目以外) */
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

								/* 申請処理設定の変更 */
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
		/* テーブルバックアップ処理                                           */
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
					IF W_DTFLG = 1 THEN	/* 個人情報にデータあり */
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
		/* テーブル作成処理                                                   */
		/**********************************************************************/
			IF P_TBKBN = 1 THEN
			/**********************************************************************/
			/* 個人マスタ用                                                       */
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
			/* 個人ファイル用                                                     */
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
			/* 届出用                                                             */
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
		/* テーブルリカバリ処理                                               */
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
					IF W_DTFLG = 1 THEN	/* 個人情報にデータあり */
						DBMS_SQL.PARSE(W_CSR,W_SQL_R5,DBMS_SQL.NATIVE);
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						WEB_SP0003020_S(1,W_TABLE6);
					END IF;
				END IF;
			END IF;

		/**********************************************************************/
		/* 時点情報作成処理                                                   */
		/**********************************************************************/
			IF P_JITEN IN ('1','2','3','4','5') THEN

			/**********************************************************************/
			/* 歴判断処理                                                         */
			/**********************************************************************/
				W_JIRKBN := 0;
				FOR C_011_REC IN C_011(W_KEY) LOOP
					W_JIRKBN := W_JIRKBN + 1;
				END LOOP;

			/**********************************************************************/
			/* VIEW作成処理                                                       */
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
				ELSIF P_JITEN = '4' THEN	/* 	年度・期の場合は今日は存在しない */
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
			/* 情報追加処理                                                       */
			/**********************************************************************/
				FOR W_I IN W_JIID1..W_JIID2 LOOP
				/**********************************************************************/
				/* 登録情報追加処理                                                   */
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
							 DECODE(W_I,1,'(今日)',
								DECODE(P_JITEN,4,'(基準年度・期)',1,'(基準日)',2,'(基準年月)',3,'(基準年)',5,'(基準日)')),
						DECODE(W_JIRKBN,0,'0','1'),DECODE(W_JIRKBN,0,NULL,W_SRTKBN),
						'2','0',0,
						'0','0','0',W_SCDKEY,GROUP_DIV,DISP_ORDER,'0',P_MKAISYA,
						SYSDATE,P_UPDID
					 FROM WEB_TP0000010_M
					WHERE DIV = W_TSID
					;
					IF P_UPDKBN = 2 THEN	/* 時点設定の変更を考慮し、社別用テーブルのカテゴリ名を更新 */
						FOR C_081_REC IN C_081(W_TSID) LOOP
							UPDATE WEB_TP0000011_M
							   SET CATEGORY_NAME = C_081_REC.CATEGORY_NAME || DECODE(W_I,1,'(今日)',
												DECODE(P_JITEN,4,'(基準年度・期)',1,'(基準日)',2,'(基準年月)',3,'(基準年)',5,'(基準日)'))
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

					/* その他キーの設定 */
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
				/* 照会系関連登録                                                     */
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
							DECODE(W_I,1,'(今日)',
								DECODE(P_JITEN,4,'(基準年度・期)',1,'(基準日)',2,'(基準年月)',3,'(基準年)',5,'(基準日)')),
						DECODE(W_I,1,W_VIEW1,W_VIEW2),W_SCDKEY,
						DECODE(W_NEWKBN,0,'WEB_VP0010' || TO_CHAR(DECODE(W_I,1,W_TSID1,2,W_TSID),'FM000'),'WEB_VP093' || TO_CHAR(DECODE(W_I,1,W_TSID1,2,W_TSID),'FM00000')),
						DECODE(W_JIRKBN,0,'1','2'),'0',0,'0',GROUP_DIV,DISP_ORDER,DECODE(W_I,1,0,2,P_JITEN),P_MKAISYA,
						SYSDATE,P_UPDID
					  FROM WEB_TP0010010_M
					 WHERE CATEGORY_DIV = W_TSID
					;

					IF P_UPDKBN = 2 THEN	/* 時点設定の変更を考慮し、社別用テーブルのカテゴリ名を更新 */
						FOR C_091_REC IN C_091(W_TSID) LOOP
							UPDATE WEB_TP0010011_M
							   SET CATEGORY_NAME = C_091_REC.CATEGORY_NAME || DECODE(W_I,1,'(今日)',
												DECODE(P_JITEN,4,'(基準年度・期)',1,'(基準日)',2,'(基準年月)',3,'(基準年)',5,'(基準日)'))
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

					/* その他キーの設定 */
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
		/* 登録系関連表示順登録(WEB_TP0000010_M)                              */
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
		/* マスタ履歴関連登録(WEB_TP0000010_M)                                */
		/* 時点設定「日付」「開始・終了日付」                                 */
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
		/* 照会系関連表示順登録(WEB_TP0010010_M)                              */
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
		/* 社別・外国語用テーブル変更処理(項目ＩＤ付け替え処理)               */
		/**********************************************************************/
			IF P_UPDKBN = 2 THEN
				FOR W_I IN 0..2 LOOP
				/**********************************************************************/
				/* 登録用(WEB_TP0000022_M,WEB_TP0000023_M) 更新日削除                 */
				/**********************************************************************/
					DELETE FROM WEB_TP0000022_M
					 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER = W_ITM_ID5;
					DELETE FROM WEB_TP0000023_M
					 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER = W_ITM_ID5;

				/**********************************************************************/
				/* 登録用(WEB_TP0000022_M,WEB_TP0000023_M) 更新者コード削除           */
				/**********************************************************************/
					DELETE FROM WEB_TP0000022_M
					 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER = W_ITM_ID6;
					DELETE FROM WEB_TP0000023_M
					 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
					   AND ITEM_ORDER = W_ITM_ID6;

					FOR W_J IN 1..W_CHGCNT LOOP
					/**********************************************************************/
					/* 登録用(WEB_TP0000021_M,WEB_TP0000022_M,WEB_TP0000023_M)            */
					/**********************************************************************/
						/* 新項目順 */
						SELECT MAX(ITEM_ORDER) INTO W_NEWKJUN
						  FROM WEB_TP0000020_M
						 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_NAME = 'F' || TO_CHAR(W_NEWID(W_J),'FM000')
						;
	
						/* 旧項目順 */
						SELECT MAX(ITEM_ORDER) INTO W_OLDKJUN
						  FROM WEB_TP0061141_W
						 WHERE CUSTOMER_ID = P_RID
						   AND TBL_DIV = 1
						   AND CATEGORY_DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2)
						   AND ITEM_NAME = 'F' || TO_CHAR(W_OLDID(W_J),'FM000')
						;

						/* 更新処理 */
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
					/* 照会用(WEB_TP0010021_M,WEB_TP0010022_M,WEB_TP0010023_M)            */
					/**********************************************************************/
						/* 新項目順 */
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
		/* 外国語用データセット処理                                           */
		/**********************************************************************/
			FOR W_I IN 0..2 LOOP
				SELECT COUNT(*) INTO W_CNT
				  FROM WEB_TP0000010_M
				 WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2);

				/* 社員番号項目 */
				DELETE FROM WEB_TP0000022_M WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2) AND ITEM_ORDER = W_ITM_ID1;
				IF W_CNT > 0 THEN
					INSERT INTO WEB_TP0000022_M(DIV,ITEM_ORDER,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME)
					SELECT DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2),W_ITM_ID1,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME
					  FROM WEB_TP0000022_M
					 WHERE DIV = 2 AND ITEM_ORDER = 1;
				END IF;

				IF P_TBKBN = 1 THEN
					/* ＩＤ項目 */
					IF P_TBKBN = 1 AND P_RKBN = '1' AND P_KEYUSE = '0' THEN
						DELETE FROM WEB_TP0000022_M WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2) AND ITEM_ORDER = W_ITM_ID2;
						IF W_CNT > 0 THEN
							INSERT INTO WEB_TP0000022_M(DIV,ITEM_ORDER,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME)
							SELECT DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2),W_ITM_ID2,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME
							  FROM WEB_TP0000022_M
							 WHERE DIV = 87 AND ITEM_ORDER = 2;
						END IF;
					END IF;

					/* 更新日項目 */
					DELETE FROM WEB_TP0000022_M WHERE DIV = DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2) AND ITEM_ORDER = W_ITM_ID3;
					IF W_CNT > 0 THEN
						INSERT INTO WEB_TP0000022_M(DIV,ITEM_ORDER,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME)
						SELECT DECODE(W_I,0,W_TSID,1,W_TSID1,2,W_TSID2),W_ITM_ID3,LANG_ID,MANAGEMENT_NAME,DEFAULT_CONTROL_NAME
						  FROM WEB_TP0000022_M
						 WHERE DIV = 2 AND ITEM_ORDER = 22;
					END IF;

					/* 更新者コード項目 */
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
		/* 登録用ビューの作成                                                 */
		/**********************************************************************/
			WEB_SP0060020_S(1,P_RID);

		/**********************************************************************/
		/* 照会用ビューの作成                                                 */
		/**********************************************************************/
			WEB_SP0060010_S(1,P_RID);

	/**********************************************************************/
	/* 削除処理                                                           */
	/**********************************************************************/
		ELSIF P_UPDKBN = 3 THEN
		/**********************************************************************/
		/* 自由項目設定関連                                                   */
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
		/* 権限関連                                                           */
		/**********************************************************************/
			/* 権限情報 */
			DELETE FROM WEB_TP0050030_M
			 WHERE SUB_DIV = 2
			   AND DIV IN (W_TSID,W_TSID1,W_TSID2)
			;
			DELETE FROM WEB_TP0050030_M
			 WHERE SUB_DIV = 4
			   AND DIV IN (W_TSID,W_TSID1,W_TSID2)
			;

		/**********************************************************************/
		/* 登録関連                                                           */
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

			/* 登録ビュー削除 */
			IF W_NEWKBN = 0 THEN
				WEB_SP0003020_S(2,'WEB_VP0020' || TO_CHAR(W_TSID,'FM000'));
				WEB_SP0003020_S(2,'WEB_VP00050' || TO_CHAR(W_KEY,'FM00'));
			ELSE
				WEB_SP0003020_S(2,'WEB_VP092' || TO_CHAR(W_TSID,'FM00000'));
				WEB_SP0003020_S(2,'WEB_VP091' || TO_CHAR(W_KEY,'FM0000'));
			END IF;

		/**********************************************************************/
		/* 照会関連                                                           */
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

			/* 照会ビュー削除 */
			IF W_NEWKBN = 0 THEN
			 WEB_SP0003020_S(2,'WEB_VP0010' || TO_CHAR(W_TSID,'FM000'));
			 WEB_SP0003020_S(2,'WEB_VP0010' || TO_CHAR(W_TSID+100,'FM000'));
			ELSE
			 WEB_SP0003020_S(2,'WEB_VP093' || TO_CHAR(W_TSID,'FM00000'));
			 WEB_SP0003020_S(2,'WEB_VP093' || TO_CHAR(W_TSID1,'FM00000'));
			END IF;

		/**********************************************************************/
		/* 個人情報関連                                                       */
		/**********************************************************************/
		--	DELETE FROM WEB_TP0010430_M
		--	 WHERE 分類区分 = W_TSID
		--	;

		/**********************************************************************/
		/* 個人データの削除                                                   */
		/**********************************************************************/
			IF P_TBKBN = 1 THEN
				WEB_SP0003020_S(1,W_TABLE1);
			END IF;

		/**********************************************************************/
		/* ファイルデータの削除                                               */
		/**********************************************************************/
			WEB_SP0003020_S(1,W_TABLE5);

		/**********************************************************************/
		/* 届出申請関連の削除                                                 */
		/**********************************************************************/
			IF W_TDKFLG > 0 THEN
				/* 入力チェック情報の削除 */
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

				/* 届出情報の削除 */
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

				/* 届出項目情報の削除 */
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

				/* 届出説明情報の削除 */
				W_SQL := 'DELETE FROM WEB_TP1000040_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000041_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 提出文書設定の削除 */
				W_SQL := 'DELETE FROM WEB_TP1000050_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 提出文書ファイルの削除 */
				W_SQL := 'DELETE FROM WEB_TP1000060_T';
				W_SQL := W_SQL || ' WHERE TDKKBN=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000061_T';
				W_SQL := W_SQL || ' WHERE TDKKBN=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 入力説明文書ファイルの削除 */
				W_SQL := 'DELETE FROM WEB_TP1000070_T';
				W_SQL := W_SQL || ' WHERE TDKKBN=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000071_T';
				W_SQL := W_SQL || ' WHERE TDKKBN=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 届出説明ＵＲＬ情報の削除 */
				W_SQL := 'DELETE FROM WEB_TP1000080_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000081_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* こんな時は */
				W_SQL := 'DELETE FROM WEB_TP1000520_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				W_SQL := 'DELETE FROM WEB_TP1000521_T';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* イベント情報  */
				W_SQL := 'DELETE FROM WEB_TP0140050_T';
				W_SQL := W_SQL || ' WHERE DIV=1';
				W_SQL := W_SQL || '   AND TARGET_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 権限情報の削除 */
				W_SQL := 'DELETE FROM WEB_TP1000320_M';
				W_SQL := W_SQL || ' WHERE NOTIFICATION_DIV=' || W_TDKFLG;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);

				/* 承認情報の削除 */
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

				/* 届出申請データの削除 */
				WEB_SP0003020_S(1,W_TABLE3);
			END IF;
		END IF;
	END IF;

/**********************************************************************/
/* 個人マスタ更新ログテーブル項目情報の再作成                         */
/**********************************************************************/
	IF P_SKBN = 2 THEN
		WEB_SP0060090_S(1,0,P_RID,P_UPDID);
	END IF;

/**********************************************************************/
/* 個人カテゴリ情報の再作成(外国語)                                   */
/**********************************************************************/
	IF P_SKBN IN (1,2) THEN
		FOR C_013_REC IN C_013 LOOP
			/* ソート条件(全社) */
			WEB_SP0060140_S(1,0,W_TSID,C_013_REC.LANGUAGEID,0,P_RID,P_UPDID,W_ERR);
			/* ソート条件(各社) */
			FOR C_012_REC IN C_012 LOOP
				WEB_SP0060140_S(2,C_012_REC.KAISYACD,W_TSID,C_013_REC.LANGUAGEID,0,P_RID,P_UPDID,W_ERR);
			END LOOP;
			/* 出力条件 */
			WEB_SP0060140_S(3,0,W_TSID,C_013_REC.LANGUAGEID,0,P_RID,P_UPDID,W_ERR);
		END LOOP;
	END IF;

/**********************************************************************/
/* ログ取得最終更新処理                                               */
/**********************************************************************/
	IF W_LOGSET = 1 THEN
		WEB_SP0003111_S(3,0,0,0,'WEB_SP0060910_S','','',0,W_LGGET,W_LGIUD,P_UPDID,P_RID,W_ERR);
		IF W_ERR <> 0 THEN
			P_ERR := -1;
			GOTO L_EXIT;
		END IF;
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
		P_UPDID,
		'WEB_SP0060910_S',
		'1',
		W_ERRCODE,
		W_ERRMSG,
		SUBSTR(W_SQL,1,1333))
	;
 END;
/

