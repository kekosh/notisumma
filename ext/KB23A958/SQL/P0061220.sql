/**********************************************************************************/
/*  ｼｽﾃﾑ：人事WEB                                                                 */
/*  機能：システム管理                                                            */
/*  処理：データ入力                                                              */
/*  内容：取込処理                                                                */
/*  名称：WEB_SP0061220_S                                                         */
/*  FILE：P0061220.SQL                                                            */
/*  備考：                                                                        */
/*                                                                                */
/*  作成：Ver6.3  2002/02/01 T.M                                                  */
/*  履歴：Ver7.0  2002/10/01 T.M 組織マスタ,異動対応                              */
/*  履歴：Ver8.0  2002/12/01 T.M 世代一括取込対応                                 */
/*  履歴：Ver8.1  2002/02/01 T.M 重複対応,複数取込対応                            */
/*  履歴：Ver8.0  2002/04/04 K.T 組織部署重複エラー行数表示対応                   */
/*  履歴：Ver8.0.6 2003/05/01 K.T 組織一覧取込対応                                */
/*  履歴：Ver9.0   2003/05/01 T.M 英数字対応                                      */
/*  履歴：Ver9.0   2003/05/01 T.M ワークテーブルスペース対応                      */
/*  履歴：VerP1.2b 2003/11/25 T.M 組織世代取込時の複数会社時の不具合対応          */
/*  履歴：VerP2.11 2004/06/08 S.B マトリックス組織対応                            */
/*  履歴：VerP2.21 2004/10/28 T.M マスタ履歴化対応(拠点マスタ)                    */
/*  履歴：VerP2.32 2005/01/14 T.M 拠点マスタ履歴登録不具合対応                    */
/*  履歴：VerP2.32 2005/01/14 T.M 拠点マスタ履歴チェック不具合対応                */
/*  履歴：VerP2.32 2005/01/14 T.M マスタ履歴化対応漏れ(マスタチェック部分)        */
/*  履歴：VerP2.32 2005/01/14 T.M 初期仕向銀行設定マスター対応                    */
/*  履歴：VerP2.33 2005/01/18 T.M 仕向金融機関依頼人明細マスター対応              */
/*  履歴：VerP2.35 2005/05/04 T.M 考課目標管理項目追加による不具合対応            */
/*  履歴：VerP2.41 2005/05/11 T.M 組織補助入力マスタチェック対応                  */
/*  履歴：VerP2.42 2005/06/28 T.M 組織関連サイズ取得不具合対応                    */
/*  履歴：VerP3.01 2005/07/29 I.H D100001 マルチカンパニー対応(組織マスタ・事業所のみ) */
/*  履歴：VerP3.01 2005/07/29 I.H D100004 組織マスタ２０階層対応                  */
/*  履歴：VerP3.01 2005/08/10 T.M E100038 予備組織での組織（一覧）更新不具合      */
/*  履歴：VerP3.01 2005/08/11 I.H E100042 組織取込時、所属コード重複不具合対応    */
/*  履歴：VerP3.01 2005/08/11 I.H E100043 組織（世代）取込時、所属コード重複不具合対応 */
/*  履歴：VerP2.44 2005/08/31 I.H E100062 補助入力マスタチェック判断不具合対応    */
/*  履歴：VerP3.04 2006/02/28 Y.Y D100001 マルチカンパニー対応                    */
/*  履歴：VerP3.0a 2006/03/29 M.I E100174 E100174 ﾏﾙﾁｶﾝﾊﾟﾆｰ対応漏れ(会社ｺｰﾄﾞ非表示対応) */
/*  履歴：VerP3.0b 2006/04/25 Y.Y D100090 障害者雇用納付金機能対応                */
/*  履歴：VerP3.0b 2006/05/02 Y.Y E100174 ﾏﾙﾁｶﾝﾊﾟﾆｰ対応漏れ(会社ｺｰﾄﾞ)             */
/*  履歴：VerP3.0c 2006/05/25 Y.Y D100090 障害者雇用納付金機能対応                */
/*  履歴：VerP3.0d 2006/08/09 Y.Y D100138 被評価者設定の個人制御対応              */
/*  履歴：VerP3.1  2006/11/28 I.H D100207 組織マスタ-予備項目登録時の組入対応     */
/*  履歴：VerP3.1a 2007/07/24 M.I E100212 異動－部門必須チェック解除対応(適用漏れ)*/
/*  履歴：VerP4.0  2007/12/20 M.I D100351 単一会社運用対応                        */
/*  履歴：VerP4.0  2007/12/26 M.I D100379 TDE対応                                 */
/*  履歴：VerP4.0a 2008/03/16 Y.Y D100427 評価拡張対応                            */
/*  履歴：VerP4.0c 2008/11/07 Y.Y E101082 シングルカンパニー対応漏れ対応          */
/*  履歴：VerP4.0c 2008/08/06 Y.Y D100473 拠点マスター各社管理対応                */
/*  履歴：VerP4.0c 2008/11/20 Y.Y E101101 シングルカンパニー対応漏れ対応(目標管理)*/
/*  履歴：VerP4.0c 2008/12/10 Y.Y D100512 組織マスター予備項目拡張対応            */
/*  履歴：VerP4.0c 2009/02/25 Y.Y E101192 変更時の履歴化期間重複ﾁｪｯｸ不具合対応    */
/*  履歴：VerP4.0f 2010/03/24 M.I【修正568】E101426 事業所ﾏｽﾀｰ取込時の不具合対応  */
/*  履歴：VerP4.0f 2010/05/10 Y.Y【改善】D100557 自由マスターの履歴化対応         */
/*  履歴：VerP4.0g 2010/09/14 M.K【修正693】E101557 更新日更新者ｺｰﾄﾞ登録漏れ対応  */
/*  履歴：VerP4.0g 2010/10/19 M.K【修正706】E101570 異動案内容変更画面仕様変更    */
/*  履歴：Ver.2    2011/04/15 Y.Y【改善】D100641                                  */
/*  履歴：Ver.2    2011/09/24 T.M【改善P-11-004】                                 */
/*  履歴：Ver.2    2011/11/30 Y.Y【修正P11250】                                   */
/*  履歴：Ver.3    2012/02/16 M.I【修正P11970】                                   */
/*  履歴：Ver.3a   2012/10/24 M.K【修正P14530】                                   */
/*  履歴：VerP6.0  2014/06/26 T.M【改善P-14-044】                                 */
/*  履歴：VerP6.0  2014/09/03 T.M【改善P-14-053】                                 */
/*  履歴：VerP6.0  2014/10/08 T.M【改善P-14-055】                                 */
/*  履歴：VerP6.0  2014/10/29 SHSC【P-14-208】禁則文字解除対応（先行）            */
/*  履歴：VerP6.0  2015/02/04 T.M【修正P17720】                                   */
/*  履歴：VerP6.0  2015/10/20 ICOM【改善】マイナンバー対応2次                     */
/*  履歴：VerP6.1  2015/1/27 SHSC【改善P-14-086】                                 */
/*  履歴：VerP6.1  2015/02/05 MSSD【改善P-14-101】                                */
/*  履歴：VerP6.1  2016/06/06 ISID【P16320】所属コード重複エラー対応              */
/*  履歴：Ver6.1   2018/10/15 ISID【修正P26640】                                  */
/*  履歴：Ver6.1   2020/11/23 ISID【修正P32190】                                  */
/**********************************************************************************/
DROP PROCEDURE WEB_SP0061220_S;

CREATE PROCEDURE WEB_SP0061220_S(
	P_KAISYA    IN  WEB_TPFIELD.KAISYACD%TYPE,		/* 会社コード			*/
	P_SKBN      IN  NUMBER,   /* 1:テーブル作成,2:チェック,3:登録,4:テーブル削除,5:ワーク変更,6:一括取込 */
	P_KINOU     IN  NUMBER,   /* 機能区分 */
	P_KKBN      IN  NUMBER,   /* 取込ＩＤ */
	P_UPDKBN    IN  VARCHAR2, /* 更新区分(1:追加,2:置換追加,3:削除追加,4:置換) */
	P_WKKBN     IN  VARCHAR2, /* ﾜｰｸ変更時区分(1:ﾁｪｯｸ,2:変更,3:削除) */
	P_KID       IN  VARCHAR2, /* 更新先対象区分(0:通常,その他:項目単位(各ビット=0:対象外,1:対象)) */
	P_SID       IN  WEB_TPFIELD.SYAINCD%TYPE,   /* 更新者社員コード,ﾜｰｸ変更時(レコードＩＤ) */
	P_RID       IN  NUMBER,   /* 利用者ＩＤ */
	P_HOSOKU1   IN  VARCHAR2, /* 補足区分１ */
	P_HOSOKU2   IN  VARCHAR2, /* 補足区分２ */
	P_HOSOKU3   IN  VARCHAR2, /* 補足区分３ */
	P_HOSOKU4   IN  VARCHAR2, /* 補足区分４ */
	P_HOSOKU5   IN  VARCHAR2, /* 補足区分５ */
	P_SDATE     IN  VARCHAR2, /* 処理日時 */
	P_EXEID     IN  NUMBER,   /* 実行ＩＤ */
	P_KDATE     IN  VARCHAR2, /* 開始日時 */
	P_ERREXE    IN  VARCHAR2, /* エラー対応 */
	P_UNIQUE    IN  VARCHAR2, /* 重複対応(1:無.2:先頭優先,3:最終優先) */
	P_YOBI      IN  VARCHAR2, /* 予備フラグ */
	P_SYUBETU   IN  NUMBER,   /* 組織種別 */
	P_UPDID     IN  WEB_TPFIELD.UPDID%TYPE, /* 更新者ＩＤ */
	P_ERR       OUT NUMBER    /* エラー区分(0:正常,-1:エラー) */
)

IS

TYPE T_LVAR1 IS TABLE OF VARCHAR2(100)   INDEX BY BINARY_INTEGER; /* 配列宣言 */
TYPE T_LNUM1 IS TABLE OF NUMBER(5)      INDEX BY BINARY_INTEGER; /* 配列宣言 */
TYPE T_LVAR2 IS TABLE OF VARCHAR2(400)  INDEX BY BINARY_INTEGER; /* 配列宣言 */
W_SQL      VARCHAR2(32767);  /* 全ＳＱＬ */
W_SQL2     VARCHAR2(2000);  /* 全ＳＱＬ */
W_TABLE1   VARCHAR2(100);    /* ワークテーブル名 */
W_TABLE2   VARCHAR2(100);    /* 保存テーブル名 */
W_TABLE3   VARCHAR2(100);    /* チェック用テーブル名 */
W_TABLE4   VARCHAR2(100);    /* 外国語テーブル名 */
W_VIEW1    VARCHAR2(100);    /* ワークビュー名 */
W_INDEX1   VARCHAR2(100);    /* ワークテーブルインデックス */
W_INDEX2   VARCHAR2(100);    /* ワークテーブルインデックス */
W_SKNAME   VARCHAR2(100);    /* 社員コード名 */
W_AKNAME   VARCHAR2(100);    /* 自動採番項目名 */
W_KEYINF   VARCHAR2(400);   /* キー情報 */
W_ETCKEY   VARCHAR2(400);   /* その他キー項目 */
W_KEYFLD   T_LVAR1;         /* キー情報(配列) */
W_KEYCNT   NUMBER(3);       /* キー項目数 */
W_MSTK1    VARCHAR2(100);    /* マスタコード項目1 */
W_MSTK2    VARCHAR2(100);    /* マスタコード項目2 */
W_I        NUMBER(5);       /* ワークカウント */
W_J        NUMBER(5);       /* ワークカウント */
W_CNT      NUMBER(10);      /* ワークカウント */
W_FCNT     NUMBER(10);      /* ワークカウント */
W_NDATA1   NUMBER(10);      /* カーソル取得データ */
W_NDATA2   NUMBER(10);      /* カーソル取得データ */
W_NDATA3   NUMBER(10);      /* カーソル取得データ */
W_VDATA1   VARCHAR2(20);    /* カーソル取得データ */
W_VDATA2   VARCHAR2(20);    /* カーソル取得データ */
W_DATA1    NUMBER;          /* 取得データ */
W_DATA2    NUMBER;          /* 取得データ */
W_DATA3    VARCHAR2(20);    /* 取得データ */
W_SID      NUMBER(10);      /* ワーク社員コード */
W_BDATA1   NUMBER(10);      /* */
W_BDATA2   VARCHAR2(20);    /* */
W_BDATA3   VARCHAR2(20);    /* */
W_MSTRKB   VARCHAR2(2);     /* マスタ履歴区分 */
W_MSTRFI   VARCHAR2(100);    /* マスタ履歴項目名 */
W_DATE1    DATE;           /* */
W_DATE2    DATE;           /* */
W_DATE3    DATE;           /* */
W_DATE4    DATE;           /* */
W_BDATE1   DATE;           /* */
W_BDATE2   DATE;           /* */
W_SDATE    DATE;           /* */
W_EDATE    DATE;           /* */
W_ID       NUMBER(8);		/* 組織マスタ ＩＤ		*/
W_NAME     T_LVAR1;			/* 組織マスタ 名称1～20	*/
W_TSET     NUMBER(1);       /* 退職者設定 */
W_NSET     NUMBER(1);       /* 年数設定 */
W_ERRNO    NUMBER(5);       /* ワークエラー番号 */
W_STR_X    NUMBER(3);       /* 文字サーチ変数 */
W_EMSTCNT  NUMBER(5);       /* マスタエラー用件数 */
W_EMSTCD   T_LNUM1;         /* マスタエラー用（エラー区分）*/
W_EMSTNA   T_LVAR2;         /* マスタエラー用（エラー項目）*/
W_INCNT    NUMBER(10);      /* 一括取込件数 */
W_ERRCNT   NUMBER(10);      /* 一括取込エラー件数 */
W_UPDCNT   NUMBER(10);      /* 一括取込登録件数 */
W_WKTBSP   VARCHAR2(100);    /* ワークテーブルスペース */
W_STYPE    NUMBER(1);       /* 社員番号属性 */
W_MSTRKBN  NUMBER(1);       /* マスタ履歴区分 */
W_CSR      INTEGER;
W_RVL      INTEGER;
W_CSR2     INTEGER;
W_RVL2     INTEGER;
W_ERRCODE  NUMBER;          /* ORACLEエラーコード */
W_ERRMSG   VARCHAR2(510);   /* ORACLEエラーメッセージ */
W_ERR      NUMBER;          /* 関数戻り値用エラー区分 */
W_MATRIXTB1  VARCHAR2(200);	/* 部門世代管理テーブル */
W_MATRIXTB2  VARCHAR2(200);	/* 部門マスタ */
W_MATRIXTB3  VARCHAR2(200);	/* 部門マスタ表示順 */
W_MRNK		NUMBER(3);		/* 最大ランク（定数）			*/

W_KDATA1   NUMBER(8);       /* 期間重複データワーク(ＩＤ) */
W_KDATA2   NUMBER(3);       /* 期間重複データワーク(拠点コード) */
W_KDATA3   DATE;            /* 期間重複データワーク(開始日) */
W_KDATA4   DATE;            /* 期間重複データワーク(終了日) */
W_KDATA5   NUMBER(8);       /* 期間重複データワーク(会社コード) */

W_SDATA1   NUMBER(8);       /* 期間重複データワーク(ＩＤ) */
W_SDATA2   VARCHAR2(20);    /* 期間重複データワーク(社員コード) */
W_SDATA3   NUMBER(3);       /* 期間重複データワーク(障害レベル) */
W_SDATA4   DATE;            /* 期間重複データワーク(開始日) */
W_SDATA5   DATE;            /* 期間重複データワーク(終了日) */
W_GRPINF   VARCHAR2(400);   /* グループ情報 */
W_KFLG     VARCHAR2(2);     /* 単一会社運用フラグ */
W_KKFLG    NUMBER(1);       /* 拠点マスター会社管理判断 */

W_MID       NUMBER(8);      /* マスタＩＤ */
W_KKBN      NUMBER(1);      /* 会社区分 */
W_KNAME     VARCHAR2(100);   /* 項目名 */
W_CKOMOKU   VARCHAR2(100);   /* コード項目 */
W_ONAME     VARCHAR2(400);  /* マスタ名称 */
W_GNAME     VARCHAR2(100);   /* 画面名称 */
W_CID       NUMBER(3);      /* 項目ＩＤ */
W_KAISYA    NUMBER(8);      /* マスタ検索用会社コード（全社時考慮） */

W_UPDFLG    T_LNUM1;        /* 更新日・更新者コード更新フラグ */
W_COLUMN    VARCHAR2(60);   /* ワーク項目名変数 */
W_NULLCD   VARCHAR2(200);   /* 空(NULL)入力判断コード(NULL:変更なし,NULL以外:空(NULL)入力) */
W_MSTERRINI NUMBER(5);      /* マスター未存在時のERRID初期値 */
W_NRENKEI  VARCHAR2(50);    /* マイナンバー管理連携設定				*/

W_POST_KAISYA   NUMBER(8);  /* ポストの会社コード */
W_GROUP_KAISYA  NUMBER(8);  /* 管理グループ会社コード */
W_GROUP_NUMBER  NUMBER(5);  /* 管理グループ管理番号*/
W_POST_FLG      NUMBER(1);  /* ポスト管理フラグ */

/* 項目情報 */
CURSOR C_001 IS
	SELECT
		A.ITEM_ID,         /* 項目ＩＤ */
		A.ITEM_NAME,           /* 項目名 */
		A.DATA_TYPE,           /* タイプ */
		A.DATA_SIZE,           /* サイズ */
		A.FRACTION_SIZE,       /* 小数サイズ */
		A.REFERENCE_DIV,         /* 参照区分 */
		B.OBJECT_NAME MASTER_NAME,   /* マスタ名 */
		A.MASTER_LINK_ITEM, /* マスタリンク項目 */
		B.CODE_ITEM MASTER_CODE_ITEM, /* マスタコード項目 */
		A.LITERAL_CONTENT,     /* リテラル内容 */
		A.MASTER_ID,       /* マスタＩＤ */
		NVL(C.MANAGEMENT_NAME,A.MANAGEMENT_NAME) MANAGEMENT_NAME, /* 管理名称 */
		B.CORP_DIV,         /* 会社区分 */
		A.TAKE_DIV,         /* 取込区分 */
	    0   SO_CLS_ID,      /* 組織分類区分 */
	    '0' SO_CLS_USE,     /* 組織分類使用区分 */
	    ''  SO_CLS_NAME     /* 組織分類名 */
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
	    A.ITEM_ID,                                             /* 項目ＩＤ */
	    A.ITEM_NAME,                                               /* 項目名 */
	    A.DATA_TYPE,                                               /* タイプ */
	    NVL(D.MAX_SIZE,A.DATA_SIZE),                             /* サイズ */
	    A.FRACTION_SIZE,                                           /* 小数サイズ */
	    DECODE(NVL(D.MASTER_ID,0),0,A.REFERENCE_DIV,1),             /* 参照区分 */
	    NVL(E.OBJECT_NAME,B.OBJECT_NAME) MASTER_NAME,        /* マスタ名 */
	    A.MASTER_LINK_ITEM,                                     /* マスタリンク項目 */
	    NVL(E.CODE_ITEM,B.CODE_ITEM) MASTER_CODE_ITEM,        /* マスタコード項目 */
	    A.LITERAL_CONTENT,                                         /* リテラル内容 */
	    NVL(D.MASTER_ID,A.MASTER_ID),                         /* マスタＩＤ */
	    NVL(D.SCREEN_NAME,NVL(C.MANAGEMENT_NAME,A.MANAGEMENT_NAME)) MANAGEMENT_NAME,    /* 管理名称 */
	    NVL(E.CORP_DIV,B.CORP_DIV),                             /* 会社区分 */
	    NVL(D.USAGE_DIV,A.TAKE_DIV),                              /* 取込区分 */
	    NVL(F.IDENTIFIER,0)   SO_CLS_ID,                          /* 組織分類区分 */
	    NVL(F.USAGE_DIV,'0')  SO_CLS_USE,                         /* 組織分類使用区分 */
		F.CLS_NAME            SO_CLS_NAME                         /* 組織分類名 */
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
		A.ITEM_ID,                    /* 項目ＩＤ */
		A.ITEM_NAME,                  /* 項目名 */
		A.DATA_TYPE,                  /* タイプ */
		A.DATA_SIZE,                  /* サイズ */
		A.FRACTION_SIZE,              /* 小数サイズ */
		A.REFERENCE_DIV,              /* 参照区分 */
		B.OBJECT_NAME MASTER_NAME,    /* マスタ名 */
		A.MASTER_LINK_ITEM,           /* マスタリンク項目 */
		B.CODE_ITEM MASTER_CODE_ITEM, /* マスタコード項目 */
		A.LITERAL_CONTENT,            /* リテラル内容 */
		A.MASTER_ID,                  /* マスタＩＤ */
		A.MANAGEMENT_NAME,            /* 管理名称 */
		B.CORP_DIV  ,                 /* 会社区分 */
		'1' TAKE_DIV,                 /* 取込区分 */
	    0   SO_CLS_ID,                /* 組織分類区分 */
	    '0' SO_CLS_USE,               /* 組織分類使用区分 */
	    ''  SO_CLS_NAME               /* 組織分類名 */
	  FROM WEB_TP0009108_W A,
	       WEB_TP0110210_M B
	 WHERE A.CUSTOMER_ID = P_RID
	   AND A.MASTER_ID=B.IDENTIFIER(+)
	 ORDER BY A.ITEM_ID;

C_102_REC C_102%ROWTYPE;

/* テーブル情報 */
CURSOR C_002 IS
	SELECT
		UPDATE_TABLE_NAME,
		OTHER_KEY
	  FROM WEB_TP0060710_M
	 WHERE FUNCTION_DIV = P_KINOU
	   AND TAKE_ID = P_KKBN;

/* 登録項目情報 */
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

/* キー情報 */
CURSOR C_011 IS
	SELECT
		A.ITEM_NAME F001  /* 項目名 */
	  FROM WEB_TP0060720_M A
	 WHERE A.FUNCTION_DIV = P_KINOU
	   AND A.TAKE_ID=P_KKBN
	   AND A.KEY_ITEM IS NOT NULL
 ORDER BY A.ITEM_ID;

/* 社員番号項目チェック */
CURSOR C_021 IS
	SELECT
		A.ITEM_ID,   /* 項目ＩＤ */
		A.ITEM_NAME      /* 項目名 */
	  FROM WEB_TP0060720_M A
	 WHERE A.FUNCTION_DIV = P_KINOU
	   AND A.TAKE_ID = P_KKBN
	   AND A.TAKE_DIV = '5'
 ORDER BY A.ITEM_ID;

/* 会社情報 */
CURSOR C_031 IS
	SELECT
		A.KAISYACD
	  FROM KAISYA_MS A
 ORDER BY A.KAISYACD;

 /**********************************************************************/
/* 指定ランク文のSQL文字列取得                                        */
/**********************************************************************/
FUNCTION GET_SQLRANKFLD
(
	 FP_MRNK	IN NUMBER					/* ランク数 */
	,FP_TBL		IN VARCHAR2					/* テーブル・デリミタ */
	,FP_FLD		IN VARCHAR2					/* 項目名 */
) RETURN VARCHAR2
IS
	FW_I			INTEGER;				/* ループ用					*/
	FW_SQL			VARCHAR2(2000);			/* SQL文字列				*/
	FW_TBL			VARCHAR2(2000);			/* テーブル・デリミタ		*/
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
/* 補足キー情報                                                       */
/*  異動(P_HOSOKU1:新世代番号,P_HOSOKU2:処理ＩＤ,P_HOSOKU3:公開ＩＤ)  */
/*  組織・組織(世代)・組織(一覧)(P_HOSOKU3:有効日付)                  */
/*  組織(一覧)(P_HOSOKU1:世代番号,P_HOSOKU2:マスタチェック)           */
/*  214-1(P_HOSOKU1:履歴番号,P_HOSOKU2:目標番号)                      */
/*  213-3(P_HOSOKU1:基準日,P_HOSOKU2:世代番号,P_HOSOKU3:履歴番号,P_HOSOKU4:目標番号) */
/*  213-4(P_HOSOKU1:基準日,P_HOSOKU2:世代番号,P_HOSOKU3:開始ランク,P_HOSOKU4:終了ランク) */
/*  214-5(P_HOSOKU1:履歴番号,P_HOSOKU2:目標番号)                      */
/**********************************************************************/
/**********************************************************************/
/* 行エラー内容(採用SP参照あり注意)                                   */
/*    1000～:社員番号未存在                                           */
/*    2000～:社員番号対象外（目標管理）                               */
/*    3000～:マスタ未存在（目標管理）                                 */
/*    2:キー重複(取込内)                                              */
/*    3:キー重複(既存データ)                                          */
/*    4:置換データ未存在(項目指定時、置換取込時)                      */
/*    8:期間重複(取込内)                                              */
/*    9:期間重複(既存データ)                                          */
/*   100～199:マスタ未存在                                            */
/*   201:考課点数取込同一考課時期存在                                 */
/*   202:本人取込不可                                                 */
/*   301:発令本人対象外部署                                           */
/*   401:事業所マスタ(事業所コード重複)                               */
/*   402:事業所マスタ(表示順重複)                                     */
/*   403:事業所マスタ(まとめ事業所コード未存在)                       */
/*   404:事業所マスタ(まとめ事業所階層不備)                           */
/*   405:事業所マスタ(他会社内部割振コード重複)                       */
/*   406:事業所社保マスタ(給与事業所未選択)                           */
/*   411:組織マスタ(処理区分)                                         */
/*   412:組織マスタ(部門名称重複)                                     */
/*   413:組織マスタ(所属コード重複)                                   */
/*   414:組織マスタ(部門名称登録済)                                   */
/*   415:組織マスタ(部門名称未登録)                                   */
/*   416:組織マスタ(削除＆追加時、処理区分)                           */
/*   417:組織マスタ(処理区分重複)                                     */
/*   418:組織マスタ(上位部署未存在)                                   */
/*   421:障害者情報(マスタ関連チェック)                               */
/*   431:目標管理(シート未存在)                                       */
/*   441:目標管理-組織(部署、シート関連チェック)                      */
/*   442:目標管理-組織(部門ランク、部門コード未存在)                  */
/*   443:目標管理-組織(部門ランク、部門コード対象外)                  */
/*   444:目標管理-多面(評価者区分と評価者コードの関連チェック)        */
/*   445:目標管理-多面(多面評価被評価者設定の存在チェック)            */
/*   446:目標管理-多面(多面評価入力者設定の存在チェック)              */
/*   447:目標管理-組織(被評価者設定の対象外の社員存在チェック)        */
/*   451:目標管理－被評価者設定(担当グループ範囲チェック)             */
/*   452:目標管理－被評価者設定(未指定・指定有りの存在チェック)       */
/**********************************************************************/
/**********************************************************************/
/* 初期処理                                                           */
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

	/* 組織マスタ最大ランク取得 */
	W_MRNK := WEB_SP0002000_F(8);

	/* 部門世代管理テーブルのテーブル名を取得する */
	W_MATRIXTB1 := WEB_SP0001240_F(1, P_SYUBETU);

	/* 部門マスタのテーブル名を取得する */
	W_MATRIXTB2 := WEB_SP0001240_F(2, P_SYUBETU);

	/* 部門マスタ表示順のテーブル名を取得する */
	W_MATRIXTB3 := WEB_SP0001240_F(3, P_SYUBETU);

	/* マスタ履歴区分 */
	IF P_KINOU = 11 AND P_KKBN = 9 THEN
		W_MSTRKBN := WEB_SP0002420_F(1,253);
		W_KKFLG := WEB_SP0002000_F(33);
	ELSE
		W_MSTRKBN := 0;
		W_KKFLG := 1;
	END IF;

/**********************************************************************/
/* キー情報取得                                                       */
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
/* テーブル情報取得処理                                               */
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
/* テーブル作成                                                       */
/**********************************************************************/
	IF P_SKBN = 1 THEN
		/* 前回テーブル削除 */
		WEB_SP0003020_S(1,W_TABLE1);

		W_I := 1;

		/* テーブル作成 */
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
/* 自動変換処理                                                       */
/**********************************************************************/
	IF P_SKBN = 2 OR (P_SKBN=5 AND P_WKKBN=1) OR P_SKBN = 6 THEN
	/**********************************************************************/
	/* 目標管理－組織(所属コード→部門ランク・部門コード変換処理)         */
	/**********************************************************************/
		IF P_KINOU = 214 AND (P_KKBN = 3 OR P_KKBN = 4) THEN
			IF W_KFLG = '0' THEN
				W_SQL := 'UPDATE ' || W_TABLE1 || ' A SET';
				W_SQL := W_SQL || ' (A.DEPT_RANK,A.DEPT_CODE)=(';
				W_SQL := W_SQL || ' SELECT B.RANK,B.CODE_VALUE';
				W_SQL := W_SQL || '   FROM (SELECT B1.AGE_NUMBER,B1.RANK,B1.CODE_VALUE,B3.LINK_CORP_CODE KAISYACD,B1.SALARY_BELONG_CODE';
				W_SQL := W_SQL || '           FROM ' || WEB_SP0002290_F(1,P_KKBN,3) || ' B1'; /* 部門マスタ表示順 */
				W_SQL := W_SQL || '               ,' || WEB_SP0002290_F(1,P_KKBN,2) || ' B2'; /* 部門マスタ */
				W_SQL := W_SQL || '               ,' || WEB_SP0002290_F(1,P_KKBN,4) || ' B3'; /* 部門会社連携マスタ */
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
				W_SQL := W_SQL || '   FROM ' || WEB_SP0002290_F(1,P_KKBN,3) || ' B'; /* 部門マスタ表示順 */
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
/* チェック処理                                                       */
/**********************************************************************/
	IF P_SKBN = 2 OR (P_SKBN=5 AND P_WKKBN=1) OR P_SKBN = 6 THEN

	/**********************************************************************/
	/* インデックス作成                                                   */
	/**********************************************************************/
		IF P_SKBN = 2 OR P_SKBN = 6 THEN
			/* ＩＤに対して */
			W_SQL := 'CREATE INDEX ' || W_INDEX1 || ' ON ' || W_TABLE1;
			W_SQL :=  W_SQL || '(IDENTIFIER)'; 
			W_SQL :=  W_SQL || ' PCTFREE 5'; 
			IF W_WKTBSP IS NOT NULL THEN
				W_SQL :=  W_SQL || ' TABLESPACE ' || W_WKTBSP || ' '; 
			END IF;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/* キー項目に対して */
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
	/* 社員番号未存在                                                     */
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
	/* キー重複(取込内)                                                   */
	/**********************************************************************/
		IF W_KEYINF IS NOT NULL THEN
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
					IF W_AKNAME IS NOT NULL THEN
						W_SQL := W_SQL || ' WHERE ' || W_AKNAME || ' IS NOT NULL';
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
		END IF;

	/**********************************************************************/
	/* キー重複(既存データ)                                               */
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
	/* 既存データ未存在(項目単位取込・置換のみ)                           */
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
	/* 履歴化期間重複                                                     */
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
					/* エラー状態をクリア */
					W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
					W_SQL := W_SQL || ' WHERE ERROR = 8';
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
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* 拠点コード */
					IF W_KKFLG = 1 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* 会社コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* 終了日 */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* 終了日 */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* ＩＤ */
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* 拠点コード */
							IF W_KKFLG = 1 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* 会社コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* 終了日 */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 終了日 */
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
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
				DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* 拠点コード */
				IF W_KKFLG = 1 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* 会社コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* 終了日 */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* 終了日 */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);	/* ＩＤ */
						DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* 拠点コード */
						IF W_KKFLG = 1 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* 会社コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* 終了日 */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 終了日 */
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
				/* エラー8チェック */
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
	/* 履歴化期間重複(既存データ)                                         */
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
						/* エラー状態をクリア */
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
						DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
						DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* 拠点コード */
						IF W_KKFLG = 1 THEN
							DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* 会社コード */
							DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* 開始日 */
							DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* 終了日 */
						ELSE
							DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* 開始日 */
							DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* 終了日 */
						END IF;
						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
						LOOP
							W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
							IF W_RVL > 0 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);		/* ＩＤ */
								DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* 拠点コード */
								IF W_KKFLG = 1 THEN
									DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* 会社コード */
									DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* 開始日 */
									DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* 終了日 */
								ELSE
									DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* 開始日 */
									DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 終了日 */
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
					DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
					DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* 拠点コード */
					IF W_KKFLG = 1 THEN
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* 会社コード */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* 終了日 */
					ELSE
						DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* 開始日 */
						DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* 終了日 */
					END IF;
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
					LOOP
						W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
						IF W_RVL > 0 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);	/* ＩＤ */
							DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* 拠点コード */
							IF W_KKFLG = 1 THEN
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* 会社コード */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* 終了日 */
							ELSE
								DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* 開始日 */
								DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 終了日 */
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
					/* エラー9チェック */
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
	/* その他チェック                                                     */
	/**********************************************************************/
		/**********************************************************************/
		/* 社員番号対象外（目標管理）                                         */
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
		/* 考課点数取込(考課時期重複)                                         */
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
		/* 考課点数取込(本人不可)                                             */
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
		/* 事業所マスタ取込                                                   */
		/**********************************************************************/
		IF P_KINOU = 11 AND P_KKBN = 1 THEN

			/* FROM句作成 */
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
			/* 事業所コードの重複                                                 */
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
			/* 表示順の重複                                                       */
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
			/* まとめ事業所存在チェック                                           */
			/**********************************************************************/
			/* 存在チェック */
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=403';
			W_SQL := W_SQL || ' WHERE ERROR IS NULL';
			IF P_SKBN = 5 THEN
				W_SQL := W_SQL || ' AND IDENTIFIER=0';
			END IF;
			W_SQL := W_SQL || '   AND IDENTIFIER IN (';
			W_SQL := W_SQL || '  SELECT A.IDENTIFIER';
			W_SQL := W_SQL || ' ' || W_SQL2;
			W_SQL := W_SQL || ' WHERE A.SUMMARY_OFFICE_CODE IS NOT NULL';
		--	W_SQL := W_SQL || '   AND A.内部割振コード<>B.内部割振コード';
			W_SQL := W_SQL || '   AND A.KAISYACD=B.KAISYACD(+)';
			W_SQL := W_SQL || '   AND A.SUMMARY_OFFICE_CODE=B.OFFICE_CODE(+)';
			W_SQL := W_SQL || '   AND B.KAISYACD IS NULL)';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/* 期間チェック */
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
			/* まとめ事業所階層チェック                                           */
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
			/* 他会社内部割振コード重複チェック（置換＆追加・削除＆追加）         */
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
		/* 組織マスタ取込                                                     */
		/**********************************************************************/
		IF P_KINOU = 11 AND P_KKBN = 2 THEN
			FOR W_I IN 1..W_MRNK LOOP
				W_NAME(W_I) := NULL;
			END LOOP;
			/**********************************************************************/
			/* 処理区分チェック                                                   */
			/**********************************************************************/
			W_SQL := 'UPDATE ' || W_TABLE1;
			W_SQL := W_SQL || ' SET ERROR = 411';
			W_SQL := W_SQL || ' WHERE PROCESS_DIV <> ''1''';
			W_SQL := W_SQL || ' AND PROCESS_DIV <> ''2''';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/**********************************************************************/
			/* 部門名称重複チェック                                               */
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
			/* 所属コード重複チェック                                             */
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
			/* 既存データとのチェック                                             */
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
			/* 所属コード重複チェック                                             */
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
		/* 組織マスタ一覧入力取込                                             */
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
			DBMS_SQL.DEFINE_COLUMN(W_CSR2,1,W_NAME(1),100);			/* 所属コード	*/
			IF W_KFLG = '0' THEN
				DBMS_SQL.DEFINE_COLUMN(W_CSR2,2,W_BDATA1);			/* コード1	*/
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
			/* 補助入力マスタチェック                                             */
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
		/* 事業所社保マスタ取込（健康保険記号・厚生年金記号）                 */
		/**********************************************************************/
		IF P_KINOU = 11 AND (P_KKBN = 6 OR P_KKBN = 7) THEN
			/**********************************************************************/
			/* 給与事業所チェック                                                 */
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
		/* 組織マスタ世代取込                                                 */
		/**********************************************************************/
		IF P_KINOU = 11 AND P_KKBN = 17 THEN
			FOR W_I IN 1..W_MRNK LOOP
				W_NAME(W_I) := NULL;
			END LOOP;
			/**********************************************************************/
			/* 部門名称重複チェック                                               */
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
			/* 上位部署未存在チェック(１行目は会社であること)                     */
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
			/* 上位部署未存在チェック                                             */
			/**********************************************************************/
			W_SQL := 'SELECT';
			W_SQL := W_SQL || ' IDENTIFIER' || GET_SQLRANKFLD(W_MRNK,'','NAME');
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE NAME2 IS NOT NULL';
			FOR W_I IN 3..W_MRNK LOOP
				W_SQL := W_SQL || ' OR NAME' || W_I || ' IS NOT NULL';
			END LOOP;
--			W_SQL := W_SQL || ' WHERE ＩＤ > 1';
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
			/* 所属コード重複チェック                                             */
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
		/* 障害者情報取込                                                     */
		/**********************************************************************/
		IF P_KINOU = 451 AND P_KKBN = 1 THEN
			/******************************************************************/
			/*期間重複                                                        */
			/******************************************************************/
			W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
			W_SQL := W_SQL || ' FROM ' || W_TABLE1;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_SDATA1);		/* ＩＤ*/
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_SDATA2,20);	/* 社員コード */
			DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_SDATA3);		/* 障害レベル */
			DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_SDATA4);		/* 開始日 */
			DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_SDATA5);		/* 終了日 */
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				IF W_RVL > 0 THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_SDATA1);	/* ＩＤ */
					DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_SDATA2);	/* 社員コード */
					DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_SDATA3);	/* 障害レベル */
					DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_SDATA4);	/* 開始日 */
					DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_SDATA5);	/* 終了日 */
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
			/* 期間重複(既存データ)                                       */
			/**************************************************************/
			IF P_UPDKBN IN (1,2) THEN
				W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
				W_SQL := W_SQL || ' FROM ' || W_TABLE1;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_SDATA1);		/* ＩＤ*/
				DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_SDATA2,20);	/* 社員コード */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_SDATA3);		/* 障害レベル */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_SDATA4);		/* 開始日 */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_SDATA5);		/* 終了日 */
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_SDATA1);	/* ＩＤ */
						DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_SDATA2);	/* 社員コード */
						DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_SDATA3);	/* 障害レベル */
						DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_SDATA4);	/* 開始日 */
						DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_SDATA5);	/* 終了日 */
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
			/* マスタ関連チェック                                             */
			/******************************************************************/
			IF P_UPDKBN IN (1,2) THEN
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_SDATA1);		/* ＩＤ*/
				DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_SDATA2,20);	/* 社員コード */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_SDATA3);		/* 障害レベル */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_SDATA4);		/* 開始日 */
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_SDATA1);	/* ＩＤ */
						DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_SDATA2);	/* 社員コード */
						DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_SDATA3);	/* 障害レベル */
						DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_SDATA4);	/* 開始日 */
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
		/* 目標管理－被評価者設定取込                                         */
		/**********************************************************************/
		IF P_KINOU = 214 AND P_KKBN IN (1,2,5) THEN
			/******************************************************************/
			/* 担当グループ範囲チェック(全社定義時)                           */
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
		/* 目標管理取込                                                       */
		/**********************************************************************/
		IF P_KINOU = 214 AND (P_KKBN = 2 OR P_KKBN = 4 OR P_KKBN = 6) THEN
			/******************************************************************/
			/* 本人選択可否確認                                               */
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
			/* シート存在確認                                                 */
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
			/* シート指定存在時の未指定有チェック                             */
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
		/* 目標管理－組織取込                                                 */
		/**********************************************************************/
		IF P_KINOU = 214 AND (P_KKBN = 3 OR P_KKBN = 4) THEN
			/******************************************************************/
			/* 部門ランク・部門コード未入力チェック処理                       */
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
				/* シート存在チェック処理                                     */
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
				/* 対象外部署チェック処理                                     */
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
--						W_SQL := 'UPDATE ' || W_TABLE1 || ' SET エラー=447';
--						W_SQL := W_SQL || ' WHERE エラー IS NULL';
--						W_SQL := W_SQL || '   AND ＩＤ IN (';
--						W_SQL := W_SQL || '  SELECT A.ＩＤ';
--						W_SQL := W_SQL || '    FROM ' || W_TABLE1 || ' A';
--						W_SQL := W_SQL || '       , ' || W_TABLE2 || ' B';
--						W_SQL := W_SQL || '   WHERE A.会社コード = B.会社コード';
--						W_SQL := W_SQL || '     AND A.履歴番号 = B.履歴番号';
--						W_SQL := W_SQL || '     AND A.部門ランク = B.部門ランク';
--						W_SQL := W_SQL || '     AND A.部門コード = B.部門コード';
--						W_SQL := W_SQL || '     AND A.部門ランク IS NOT NULL';
--						W_SQL := W_SQL || '     AND NOT EXISTS (SELECT * FROM ' || W_TABLE3 || ' C';
--						W_SQL := W_SQL || '                      WHERE B.社員コード = C.社員コード))';
--						IF P_SKBN = 5 THEN
--							W_SQL := W_SQL || ' AND A.ＩＤ = 0';
--						END IF;
--						DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
--						W_RVL := DBMS_SQL.EXECUTE(W_CSR);
--					END IF;
				END IF;
			END IF;

		/**********************************************************************/
		/* 目標管理－多面評価                                                 */
		/**********************************************************************/
		IF P_KINOU = 214 AND P_KKBN = 5 THEN
			/******************************************************************/
			/* シート関連付けチェック処理                                     */
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
			/* 入力対象者関連付けチェック処理                                 */
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
		/* 目標管理－多面評価（入力対象者設定）                               */
		/**********************************************************************/
		IF P_KINOU = 214 AND P_KKBN = 7 THEN
			/******************************************************************/
			/* 本人チェック処理                                               */
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
			/* 本人指定チェック処理                                           */
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
		/* 推薦者                                                             */
		/**********************************************************************/
		IF P_KINOU = 432 THEN
			/******************************************************************/
			/* ポストの存在チェック                                           */
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
			/* 管理グループに対して、ポストが参照範囲外                       */
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
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_KAISYA' ,W_POST_KAISYA);          /* 会社コード */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_SEDAI' ,-1);                      /* 世代番号 */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_SYUBETU' ,'');                    /* 組織種別 */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_GROUP_KAISYA' ,W_GROUP_KAISYA);   /* 管理グループ会社コード */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_GROUP_NUMBER' ,W_GROUP_NUMBER);   /* 管理グループ管理番号 */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_OPERATION' ,'0');                 /* 運用状況 */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_PAGEKB' ,'0');                    /* 画面区分 */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_LANGID' ,0);                      /* 言語区分 */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_RID' ,P_RID);                     /* 利用者ＩＤ */
			DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_ERR' ,P_ERR);                     /* エラー区分(0:正常,-1:エラー) */
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
	/* マスタ存在確認                                                     */
	/**********************************************************************/
		IF P_ERR = 0 THEN
			W_CNT := 0;
			W_EMSTCNT :=0;
			W_KAISYA := P_KAISYA;
			W_MSTERRINI := 100;
			IF P_KINOU = '11' AND (P_KKBN = 2 OR P_KKBN = 3 OR P_KKBN = 17) THEN
				/* ポスト管理導入チェック */
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
				/* 組織分類 */
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
				/* 部門マスタ(発令時) */
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

					/* 参照可能部署 */
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

				/* 事業所マスタ */
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

				/* 拠点マスタ */
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
					
				/* 法人番号マスタ */
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
					/* シングルカンパニーで、目標管理（組織目標・多面評価）は会社マスタのチェックを行わない */
						W_J := 0;					/* ダミー */
					ELSIF P_KINOU = 432 AND (P_KKBN = 1 OR P_KKBN = 2) AND W_KFLG = '0' AND (C_001_REC.MASTER_ID = 206 OR C_001_REC.MASTER_ID = 432) THEN
					/* シングルカンパニーで、推薦者（データ取込）は会社マスタのチェックを行わない */
						W_J := 0;					/* ダミー */
					ELSIF P_KINOU = 432 AND (P_KKBN = 1 OR P_KKBN = 2) AND C_001_REC.MASTER_ID = 219 THEN
					/* 推薦者（データ取込）のポスト存在チェックは別途で行うため、こちでは行わない */
						W_J := 0;					/* ダミー */
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
							/* 異動の職能給号級マスタ(環境設定の値とワークの職能給号級の値が異なるときエラーとする) */
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
	/* エラー存在確認                                                     */
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
	/* 自由組入れ呼出処理(後処理)                                         */
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
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_1' ,P_KAISYA);		/* 会社コード */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_2' ,P_SKBN);			/* 1:テーブル作成,2:チェック,3:登録,4:テーブル削除,5:ワーク変更,6:一括取込 */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_3' ,P_KINOU);		/* 機能区分 */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_4' ,P_KKBN);			/* 取込ＩＤ */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_5' ,P_UPDKBN);		/* 更新区分(1:追加,2:置換追加,3:削除追加,4:置換) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_6' ,P_WKKBN);		/* ﾜｰｸ変更時区分(1:ﾁｪｯｸ,2:変更,3:削除) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_7' ,P_KID);			/* 更新先対象区分(0:通常,その他:項目単位(各ビット=0:対象外,1:対象)) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_8' ,P_SID);			/* 更新者社員コード,ﾜｰｸ変更時(レコードＩＤ) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_9' ,P_RID);			/* 利用者ＩＤ */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_10',P_HOSOKU1);		/* 補足区分１ */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_11',P_HOSOKU2);		/* 補足区分２ */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_12',P_HOSOKU3);		/* 補足区分３ */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_13',P_HOSOKU4);		/* 補足区分４ */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_14',P_HOSOKU5);		/* 補足区分５ */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_15',P_SDATE);		/* 処理日時 */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_16',P_EXEID);		/* 実行ＩＤ */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_17',P_KDATE);		/* 開始日時 */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_18',P_ERREXE);		/* エラー対応 */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_19',P_UNIQUE);		/* 重複対応(1:無.2:先頭優先,3:最終優先) */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_20',P_YOBI);			/* 予備フラグ */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_21',P_SYUBETU);		/* 組織種別 */
				DBMS_SQL.BIND_VARIABLE(W_CSR,':ORA_22',W_ERR);			/* エラー区分(0:正常,-1:エラー) */
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				DBMS_SQL.VARIABLE_VALUE(W_CSR,':ORA_22',W_ERR);
				IF W_ERR <> 0 THEN
					P_ERR := -1;
				END IF;
			END IF;
		END IF;
	ELSIF P_SKBN = 5 AND (P_WKKBN = 2 OR P_WKKBN = 3) THEN
		-- 履歴管理判断
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
			/* 履歴化期間重複(取込データ)                                         */
			/**********************************************************************/
			/* エラー状態をクリア */
			W_SQL := 'UPDATE ' || W_TABLE1 || ' SET ERROR=NULL';
			W_SQL := W_SQL || ' WHERE ERROR = 8';
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
			DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* 拠点コード */
			IF W_KKFLG = 1 THEN
				DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* 会社コード */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* 開始日 */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* 終了日 */
			ELSE
				DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* 開始日 */
				DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* 終了日 */
			END IF;
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			LOOP
				W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
				IF W_RVL > 0 THEN
					DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);	/* ＩＤ */
					DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* 拠点コード */
					IF W_KKFLG = 1 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* 会社コード */
						DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* 開始日 */
						DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* 終了日 */
					ELSE
						DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* 開始日 */
						DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 終了日 */
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
			/* 履歴化期間重複(既存データ)                                         */
			/**********************************************************************/
				W_SQL := 'SELECT IDENTIFIER,' || W_KEYINF || ',NVL(END_DAY,TO_DATE(''3999/12/31'',''YYYY/MM/DD''))';
				W_SQL := W_SQL || '  FROM ' || W_TABLE1;
				W_SQL := W_SQL || ' WHERE DELETE_DIV IS NULL';
				W_SQL := W_SQL || '   AND IDENTIFIER <> 0';
				W_SQL := W_SQL || '   AND IDENTIFIER <> ' || P_SID;
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				DBMS_SQL.DEFINE_COLUMN(W_CSR,1,W_KDATA1);		/* ＩＤ*/
				DBMS_SQL.DEFINE_COLUMN(W_CSR,2,W_KDATA2);		/* 拠点コード */
				IF W_KKFLG = 1 THEN
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA5);		/* 会社コード */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA3);		/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,5,W_KDATA4);		/* 終了日 */
				ELSE
					DBMS_SQL.DEFINE_COLUMN(W_CSR,3,W_KDATA3);		/* 開始日 */
					DBMS_SQL.DEFINE_COLUMN(W_CSR,4,W_KDATA4);		/* 終了日 */
				END IF;
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				LOOP
					W_RVL := DBMS_SQL.FETCH_ROWS(W_CSR);
					IF W_RVL > 0 THEN
						DBMS_SQL.COLUMN_VALUE(W_CSR,1,W_KDATA1);	/* ＩＤ */
						DBMS_SQL.COLUMN_VALUE(W_CSR,2,W_KDATA2);	/* 拠点コード */
						IF W_KKFLG = 1 THEN
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA5);	/* 会社コード */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA3);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,5,W_KDATA4);	/* 終了日 */
						ELSE
							DBMS_SQL.COLUMN_VALUE(W_CSR,3,W_KDATA3);	/* 開始日 */
							DBMS_SQL.COLUMN_VALUE(W_CSR,4,W_KDATA4);	/* 終了日 */
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
/* エラー内容登録                                                     */
/**********************************************************************/
	IF P_SKBN = 6 THEN
		/**********************************************************************/
		/* 同一社員にエラーがある場合の同一社員の正常をエラーとする           */
		/**********************************************************************/
		IF P_ERREXE = 2 THEN
			/* エラーデータ */
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

			/* 取込データ */
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
		W_SQL := W_SQL || ',' || P_HOSOKU1;
		W_SQL := W_SQL || ',' || P_HOSOKU2;
		W_SQL := W_SQL || ',' || P_EXEID;
		W_SQL := W_SQL || ',IDENTIFIER';
		W_SQL := W_SQL || ',ERROR';
		W_SQL := W_SQL || ',DECODE(ERROR';
		W_SQL := W_SQL || ',1,''社員番号は存在しません。''';
		W_SQL := W_SQL || ',2,''キーが重複しています。''';
		W_SQL := W_SQL || ',3,''既存データにキー重複があります。''';
		W_SQL := W_SQL || ',4,''置換するデータが存在しません。''';
		W_SQL := W_SQL || ',7,''キー重複の除外データです。''';
		W_SQL := W_SQL || ',201,''同一考課時期に存在します。''';
		W_SQL := W_SQL || ',202,''本人のデータは取込できません。''';
		W_SQL := W_SQL || ',301,''本人登録対象外の組織が指定されています。''';
		W_SQL := W_SQL || ',401,''同一期間内に事業所コードが重複しています。''';
		W_SQL := W_SQL || ',402,''同一期間内に表示順が重複しています。''';
		W_SQL := W_SQL || ',403,''同一期間内にまとめ事業所コードが存在しません。''';
		W_SQL := W_SQL || ',404,''指定されたまとめ事業所コードは、他の事業所にまとめられています。''';
		FOR W_I IN 1..W_EMSTCNT LOOP
			IF W_I = 1 THEN
				W_SQL := W_SQL || ',DECODE(ERROR';
			END IF;
			W_SQL := W_SQL || ',' || W_EMSTCD(W_I) || ',''「' || W_EMSTNA(W_I) || '」''';
			IF W_I = W_EMSTCNT THEN
				W_SQL := W_SQL || ') || ''=マスタ未存在''';
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

	/**********************************************************************/
	/* 通常登録時                                                         */
	/**********************************************************************/
		IF P_KID = '0' THEN
		/**********************************************************************/
		/* 削除処理                                                           */
		/**********************************************************************/
			/* 目標管理－組織（被評価者設定） */
			IF P_KINOU = 214 AND P_KKBN = 4 THEN
				/* 組織目標入力ファイルの削除 */
				/* 削除＆追加時 */
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

				/* 置換＆追加時・削除＆追加時・置換 */
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

			/* 目標管理－多面（被評価者設定） */
			IF P_KINOU = 214 AND P_KKBN = 6 THEN
				/* 多面入力ファイルの削除 */
				/* 削除＆追加時 */
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

				/* 置換＆追加時・削除＆追加時・置換 */
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
--							W_SQL := W_SQL || '              WHERE D.評価者コード = C2.社員コード)';
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

			/* 目標管理－多面（入力対象者設定） */
			IF P_KINOU = 214 AND P_KKBN = 7 THEN
				/* 多面入力ファイルの削除 */
				/* 削除＆追加時 */
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
--							W_SQL := W_SQL || '              WHERE A.評価者コード = C.社員コード)';
						END IF;
					END IF;
					DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
					W_RVL := DBMS_SQL.EXECUTE(W_CSR);
				END IF;
			END IF;

			/* 置換＆追加時 */
			IF P_UPDKBN = 2 OR P_UPDKBN = 4 THEN
				W_SQL := 'DELETE FROM ' || W_TABLE2;
				W_SQL := W_SQL || ' WHERE (' || W_KEYINF || ') IN (';
				W_SQL := W_SQL || '  SELECT ' || W_KEYINF;
				W_SQL := W_SQL || '    FROM ' || W_TABLE1;
				W_SQL := W_SQL || '   WHERE DELETE_DIV IS NULL)';
				DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
				W_RVL := DBMS_SQL.EXECUTE(W_CSR);
			END IF;

			/* 削除＆追加時 */
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
--									W_SQL := W_SQL || '              WHERE A.評価者コード = C.社員コード)';
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
--									W_SQL := W_SQL || '              WHERE A.評価者コード = C.社員コード)';
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

			/* ワークデータ削除 */
			W_SQL := 'DELETE FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE IDENTIFIER=0';
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);
		/**********************************************************************/
		/* 追加処理                                                           */
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

					/* 更新日・更新者コード */
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

				/* 更新日・更新者コード */
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
		/* 目標管理－被評価者設定取込                                         */
		/**********************************************************************/
		IF P_KINOU = 214 AND P_KKBN IN (2) THEN
			/**********************************************************************/
			/* 不要未指定データの削除                                             */
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
	/* 項目単位登録時                                                     */
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

			/* 更新日・更新者コード */
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
	/* その他処理                                                         */
	/**********************************************************************/
	/**********************************************************************/
	/* 仕向け金融機関マスタ                                               */
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
/* 外国語不要データ削除                                               */
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
/* テーブル削除                                                       */
/**********************************************************************/
--	IF P_SKBN = 4 OR P_SKBN = 6 THEN
--		/* ワークテーブル削除 */
--		WEB_SP0003020_S(1,W_TABLE1);
--	END IF;

/**********************************************************************/
/* ワーク変更                                                         */
/**********************************************************************/
	IF P_SKBN = 5 AND (P_WKKBN = 2 OR P_WKKBN = 3) THEN

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
			W_I := 1;

			/* 前回データ削除 */
			W_SQL := 'DELETE FROM ' || W_TABLE1;
			W_SQL := W_SQL || ' WHERE IDENTIFIER=' || P_SID;
			DBMS_SQL.PARSE(W_CSR,W_SQL,DBMS_SQL.NATIVE);
			W_RVL := DBMS_SQL.EXECUTE(W_CSR);

			/* 変更データ追加 */
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

/**********************************************************************/
/* 一括取込処理ログ更新                                               */
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
		W_SQL := W_SQL || ',DECODE(' || W_ERRCNT || ',0,'''',''取込データにエラーが存在します。''),SYSDATE,:ORA_2)';
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
	DBMS_SQL.CLOSE_CURSOR(W_CSR2);
	DBMS_SQL.CLOSE_CURSOR(W_CSR);

/**********************************************************************/
/* エラー発生時処理                                                   */
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

