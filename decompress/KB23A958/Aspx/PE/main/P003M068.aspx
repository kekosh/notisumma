<%@ Page Language="vb" Explicit="true" %>

<%=""%>
<%@ Import Namespace="Isid.Positive.DataAccess" %>
<%@ Import Namespace="Isid.Positive.Util" %>
<%@ Import Namespace="Isid.Positive.PE.Common" %>
<%@ Import Namespace="Isid.Positive.PE.Common.P003S003" %>
<%@ Import Namespace="Isid.Positive.Common.PositiveHttpState" %>
<%@ Import Namespace="Isid.Positive.PE.Env" %>

<%
    '**********************************************************************
    '*  ｼｽﾃﾑ：STAFFBRAIN-WEB版人事
    '*  機能：検索
    '*  処理：統計検索
    '*  内容：統計検索条件設定保存画面（POPUP）
    '*  FILE：P003M068.aspx
    '*  備考：
    '*
    '*  作成：000-Ver6.0  2000/11/01 S.T
    '*  履歴：001-Ver6.1  2001/05/01 S.T 社員表示機能追加対応
    '*  履歴：002-Ver6.2  2001/10/15 Y.Y POPUPのタイムアウト時の対応
    '*  履歴：003-Ver6.2  2001/10/15 Y.Y ＤＢ変数取得方法の変更対応
    '*  履歴：004-Ver6.3  2002/03/29 Y.Y 保存結果を共通で使用できる機能を追加
    '*  履歴：005-Ver6.3  2002/03/29 K.K 採用管理機能対応
    '*  履歴：006-Ver8.0  2003/xx/xx Y.Y 社員番号の英数字化対応
    '*  履歴：007-VerP3.01 2005/08/31 Y.Y D100001 マルチカンパニー対応
    '*  履歴：008-VerP3.0d 2006/07/10 T.K D100122 メモリ消費改善対応（Include分割）
    '*  履歴：009-VerP3.1  2007/01/10 M.I D100186 保存一覧グループ化対応
    '*  履歴：010-VerP4.0c 2009/02/18 C.O D100528 HTMLコメント対応
    '*  履歴：011-VerP4.0f 2010/04/15 M.I【改善】D100584 JavaScriptコメント削除対応
    '*  履歴：012-VerP4.0f 2010/04/16 M.I【改善】D100585 HTMLエンコード対応
    '*  履歴：013-VerP4.0g 2010/12/08 M.K【修正931】E101592 全社時ﾘｽﾄ表示不具合(&統一化)
    '*  履歴：014-VerP4.2  2011/10/27 K.I【改善P-11-004】英語対応
    '*  -------------------------------------------------------------------
    '*  作成：000-Ver5.0   2013/05/31 ISID 【Hayabusa】.NET版新規作成
    '*  履歴：001-Ver5.0a  2013/06/04 SHSC 【P14080】各種検索機能の英語化不具合対応
    '*  履歴：002-Ver5.0a  2013/06/04 SHSC 【P-12-021】禁則文字対応
    '*  履歴：003-Ver5.1   2014/01/21 SHSC 【Unicode対応】クライアントでの文字数チェック不具合対応
    '*  履歴：004-Ver5.1   2014/01/27 SHSC 【Unicode対応】入力文字チェック処理の修正
    '*  履歴：005-Ver5.1   2014/02/17 SHSC 【Unicode対応】文字数入力チェックエラーメッセージ修正
    '*  履歴：006-Ver6.0   2014/10/31 COBA 【P-14-030】タレントマネジメント対応
    '*  履歴：007-Ver6.0   2014/10/31 COBA 【P-14-032】タレントマネジメント対応
    '*  履歴：008-Ver6.0   2014/10/31 COBA 【P-14-034】タレントマネジメント対応
    '*  履歴：009-Ver6.1   2015/06/23 CIS  【P-14-086】組織を軸とした検索処理対応
    '*  履歴：010-Ver6.1   2016/07/11 ICOM 【P21970】採用管理時の統計検索保存条件不備
    '*  履歴：011-Ver6.1   2019/10/29 ISID 【P30130】別名追加時の不具合対応
    '*  履歴：012-Ver6.1   2020/11/30 ISID 【P32230】「統計検索の部署を軸とした検索の利用」が使用不可の場合の不具合対応
    '**********************************************************************
    Response.Expires = -1
    Response.AddHeader("Cache-Control", "No-Cache")
    '**********************************************************************
    '//**  （処理概要）
    '//**    名称マスタ登録画面の表示処理
    '//**
    '**********************************************************************
    '**********************************************************************
    '*    ログイン認証
    '**********************************************************************
    P000S012.SUBG_P_LOGINCHK("1", "2")
    '**********************************************************************
    '*    変数初期設定
    '**********************************************************************
    If P000S011.FNCG_P_DBOBJGET("0", PE_ComVars.Instance.DBOBJ) <> 0 Then
    End If
    '*** 文言情報取得
    If P000S008.FNCG_P_GET_MULTILANGUAGE_WORD("P003M068", -1, "0", "", w_langmsg) <> 0 Then
    End If
    w_droplen = ""
    '******************************************************************
    '* 機能区分・テーブル設定
    '******************************************************************
    w_mode = SessionAsStr("SL_P000M008_GMODE")
    '*** 機能ﾓｰﾄﾞ（1=通常・2=採用管理）
    w_smode = SessionAsStrArray("SL_P000M008_GMODE_S")
    '*** 機能ﾓｰﾄﾞ詳細（(0)：1=通常・2=発令・3=考課・5=異動線）
    If w_mode = "1" Then
        w_kinou = "1"
        w_table = "WEB_TP0030110_T"
        w_table_al = "WEB_TP0030111_T"
    Else
        w_kinou = "400"
        w_table = "WEB_TP4001030_T"
    End If
    w_color = SessionAsStrArray("SG_P_COLOR")
    keydata = SessionAsStrArray("SL_P003M061_KEY")
    '*** 配列化（配列(10)の空情報）
    '***(0) = 保存コード（作成者コード）
    '***(1) = 選択数と件数のフィールド数
    '***(2) = コード：カテゴリ区分 "-" 項目順
    '***(3) = 名称  ：カテゴリ名称 "（" 項目名称 "）"
    '***(4) = 同一データ
    '***(5) = 小計区分
    '***(6) = コード表示
    '***(7) = 補足区分
    '***(8) = ＩＤ （保存データのＫＥＹ）
    '***(9) = 名称（保存データ）
    '***(10)= グループ（保存データ）
    '***(11)= 機能種別（1=実行・2=新規・3=変更・4=削除・5=外部出力のみ）
    '***(12)= 補足種別
    '***(13)= 出力集計形式
    '***(14)= 出力集計行数
    '***(15)= カテゴリ区分（画面上の選択情報）
    '***(16)= 統計検索区分
    '***(17)= 社員表示（0=しない・1=する・2=する（１×１形式））
    '***(18)= 社員表示選択項目（BIT）
    '***(19)= 社員表示順（1=役職・2=職級・3=入社年月日・4=性別・5=社員番号）
    '***(20)= 社員基準日
    '***(21)= ソート件数(データ)
    '***(22)= 登録権限
    '***(23)= 絞込区分
    '***(24)= 表示方法（1=画面表示有り・2=外部出力のみ）
    '***(25)= 補足区分（名称）
    '***(26)= 計算単位
    '***(27)= 公開先（1=全社員・2=特定・3=権限）
    '***(28)= コード
    '***(27)=
    '***(28)=
    '***(29)= ソート数(-区切り)
    '***(30)= 選択言語ＩＤ
    '***(31)= 出力言語ＩＤ
    '***(32)= 出力内容ＩＤ
    If w_mode = "2" OrElse w_smode(0) = "2" OrElse w_smode(0) = "3" OrElse w_smode(0) = "5" Then
        '*** 採用管理・発令・考課・異動線
        w_kcd = SessionAsStr("SG_P_KAISYA_SELECT")
    Else
        w_kcd = GetLoginKaisyacdByAllKengen()
    End If
    w_langid = SessionAsStrArray("SG_P_LANGUAGE")(6)
    w_skbn = P000S001.FNCG_P_NZ(Request.QueryString("skbn"))
    w_grtn = P000S001.FNCG_P_NZ(Request.QueryString("grtn"))
    w_ekbn = P000S001.FNCG_P_NZ(Request.QueryString("err"))
    w_menu = P000S001.FNCG_P_NZ(Request.QueryString("menu"))
    If w_menu = "2" Then
        '*** グループ編集呼出の再表示時
        w_grpkey = SessionAsStrArray("SL_P003MCOM_KEY")
        w_fdata(0) = w_grpkey(1)
        w_fdata(1) = w_grpkey(2)
        w_fdata(2) = w_grpkey(15)
        w_fdata(3) = w_grpkey(5)
        w_fdata(4) = w_grpkey(6)
    ElseIf IsNull(w_ekbn) Then
        w_fdata(0) = keydata(9)
        w_fdata(1) = keydata(10)
        w_fdata(2) = w_skbn
        w_fdata(3) = keydata(27)
        w_fdata(4) = keydata(28)
    Else
        w_fdata(0) = Request.QueryString("d1")
        w_fdata(1) = Request.QueryString("d2")
        w_fdata(2) = Request.QueryString("d3")
        w_fdata(3) = Request.QueryString("d4")
        w_fdata(4) = Request.QueryString("d5")
    End If
    '**********************************************************************
    '//**  （処理手順）
    '//**    １．画面情報取得処理
    '//**
    '**********************************************************************
    '******************************************************************
    '* 初期表示画面制御
    '******************************************************************
    w_defdisp = "0"
    '*** エラー、グループ編集からの遷移、遷移画面からの戻り時は再表示扱い
    If w_ekbn = "1" OrElse w_grtn = "1" OrElse Not IsNull(w_menu) Then
        w_defdisp = "1"
    End If
    If SessionAsStr("SG_P_STYPE") = "0" Then
        If ((w_fdata(2) = "1" AndAlso keydata(0) <> "-1") OrElse (w_fdata(2) = "2" AndAlso keydata(0) = "-1")) AndAlso keydata(11) <> "2" Then
            w_display(0) = "display=none"
            If w_defdisp = "0" Then
                w_fdata(0) = ""
                w_fdata(1) = ""
            End If
        Else
            w_display(0) = "display=block"
        End If
    Else
        If ((w_fdata(2) = "1" AndAlso keydata(0) <> "-1") OrElse (w_fdata(2) = "2" AndAlso keydata(0) = "-1")) AndAlso keydata(11) <> "2" Then
            w_display(0) = "display=none"
            If w_defdisp = "0" Then
                w_fdata(0) = ""
                w_fdata(1) = ""
            End If
        Else
            w_display(0) = "display=block"
        End If
    End If
    w_lngsel = 0
    If w_mode = "1" AndAlso w_smode(0) = "1" AndAlso w_fdata(2) = "1" Then
        '*** 通常時-共通用(個人用、及び採用・発令・考課・異動線は除く)
        w_lngsel = P000S009.FNCG_P_LANG_LIST_HANDAN("11", "", "")
        If w_lngsel = 1 Then
            '*** 言語リストデータ取得
            w_langlist = P000S009.FNCG_P_LANG_MSTGET("1", "1", "1", w_langid)
            '*** 入力情報保持用のセッション情報作成(初期表示時のみ)
            If w_defdisp = "0" Then
                ReDim w_inf01(4, UBound(w_langlist, 2))
                '*** (0, x) 選択フラグ(1:選択)
                '*** (1, x) 言語ＩＤ
                '*** (2, x) 公開言語名
                '*** (3, x) 名称
                '*** (4, x) グループ名
                Session.Add("SL_P003_INF01", w_inf01)
                '*** SL_003-1_002 詳細はP003M068.aspx
            Else
                w_inf01 = SessionAsStrArray2D("SL_P003_INF01")
                '*** SL_003-1_002 詳細はP003M068.aspx
                'w_inf02はグループ編集時のみで必要なためここでは取得不要
            End If
        End If
    End If
    If w_smode(0) = "1" AndAlso w_mode <> P0060000.PE_MODE_RECRUITMENT Then
        '人事機能、かつ、通常統計
        If SessionAsStr("SG_P_KAISYA_FLG") = "0" OrElse (SessionAsStr("SG_P_KAISYA") <> "0" AndAlso SessionAsStrArray("SG_P_ALLKENGEN")(2) <> "2") Then
            'シングルカンパニー、マルチ各社の自社参照、マルチ全社の各社選択時
            If SessionAsStrArray("SG_P_ETCSEC")(43) = "1" Then
                '部署を軸とした検索を行う権限がある
                w_orgflg = "1"
                '組織を軸とした検索が可能
            Else
                w_orgflg = "0"
            End If
        Else
            w_orgflg = "0"
        End If
    Else
        w_orgflg = "0"
    End If
    '******************************************************************
    '* 言語選択権限が存在する場合の各種データ取得
    '******************************************************************
    If w_lngsel = 1 Then
        '*** エラー、及び、グループ編集からの遷移以外
        If w_defdisp = "0" Then
            '*** 登録データ取得
            sql = ""
            sql = sql & " SELECT"
            sql = sql & "     '1'"
            '*** (0)
            sql = sql & "    ,0"
            '*** (1)
            sql = sql & "    ,NVL(AL1.NAME, A1.NAME)"
            '*** (2)
            sql = sql & "    ,NVL(AL1.GROUP_NAME, A1.GROUP_NAME)"
            '*** (3)
            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & w_table & " A1"
            sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & w_table_al & " AL1"
            sql = sql & " WHERE    A1.KAISYACD    = :ORA_2"
            sql = sql & "   AND    A1.CREATOR_CODE    = :ORA_0"
            sql = sql & "   AND    A1.IDENTIFIER            = :ORA_1"
            sql = sql & "   AND    A1.NAME IS NOT NULL"
            sql = sql & "   AND    AL1.LANG_ID(+)    = 0"
            sql = sql & "   AND    A1.KAISYACD    = AL1.KAISYACD(+)"
            sql = sql & "   AND    A1.CREATOR_CODE    = AL1.CREATOR_CODE(+)"
            sql = sql & "   AND    A1.IDENTIFIER            = AL1.IDENTIFIER(+)"
            sql = sql & " UNION ALL"
            sql = sql & " SELECT"
            sql = sql & "     '1'"
            '*** (0)
            sql = sql & "    ,AL2.LANG_ID"
            '*** (1)
            sql = sql & "    ,AL2.NAME"
            '*** (2)
            sql = sql & "    ,AL2.GROUP_NAME"
            '*** (3)
            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & w_table & " A2"
            sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & w_table_al & " AL2"
            sql = sql & " WHERE    A2.KAISYACD    = :ORA_2"
            sql = sql & "   AND    A2.CREATOR_CODE    = :ORA_0"
            sql = sql & "   AND    A2.IDENTIFIER            = :ORA_1"
            sql = sql & "   AND    AL2.LANG_ID    <> 0"
            sql = sql & "   AND    A2.KAISYACD    = AL2.KAISYACD"
            sql = sql & "   AND    A2.CREATOR_CODE    = AL2.CREATOR_CODE"
            sql = sql & "   AND    A2.IDENTIFIER            = AL2.IDENTIFIER"
            sql = sql & " ORDER BY    1"
            ReDim w_orapara(2, 2)
            w_orapara(0, 0) = "-1"
            w_orapara(1, 0) = "0"
            w_orapara(0, 1) = keydata(8)
            w_orapara(1, 1) = "2"
            w_orapara(0, 2) = w_kcd
            w_orapara(1, 2) = "101"
            If P000S011.FNCG_P_RECORDSET5(4, sql, w_orapara, w_dbdata) = False Then
            End If
            '*** 共通用の変更時のみ
            If keydata(0) = "-1" AndAlso keydata(11) = "3" Then
                '*** 登録内容を使用する
            Else
                '*** 言語ＩＤ以外を初期化
                For w_i = 0 To UBound(w_dbdata, 2)
                    w_dbdata(0, w_i) = "0"
                    w_dbdata(2, w_i) = ""
                    w_dbdata(3, w_i) = ""
                Next
            End If
            '*** セッションデータ生成
            SUBL_P_KOUKAIGENGO_IMPUTAREA(w_dbdata, w_inf01)
            '*** (0, x) 選択フラグ(1:選択)
            '*** (1, x) 言語ＩＤ
            '*** (2, x) 公開言語名
            '*** (3, x) 名称
            '*** (4, x) グループ名
            Session.Add("SL_P003_INF01", w_inf01)
            '*** SL_003-1_002 詳細はP003M068.aspx
        End If
        '*** グループ制御情報取得
        ReDim w_groupflg(UBound(w_inf01, 2))
        sql = ""
        sql = sql & " SELECT"
        sql = sql & "     0"
        sql = sql & "    ,NVL(AL1.GROUP_NAME, A1.GROUP_NAME)"
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & w_table & " A1"
        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & w_table_al & " AL1"
        sql = sql & " WHERE    A1.KAISYACD    = :ORA_1"
        sql = sql & "   AND    A1.CREATOR_CODE    = :ORA_0"
        sql = sql & "   AND    A1.GROUP_NAME IS NOT NULL"
        sql = sql & "   AND    AL1.GROUP_NAME(+) IS NOT NULL"
        sql = sql & "   AND    AL1.LANG_ID(+)    = 0"
        sql = sql & "   AND    A1.KAISYACD    = AL1.KAISYACD(+)"
        sql = sql & "   AND    A1.CREATOR_CODE    = AL1.CREATOR_CODE(+)"
        sql = sql & "   AND    A1.IDENTIFIER            = AL1.IDENTIFIER(+)"
        sql = sql & " UNION"
        sql = sql & " SELECT"
        sql = sql & "     AL2.LANG_ID"
        sql = sql & "    ,AL2.GROUP_NAME"
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & w_table & " A2"
        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & w_table_al & " AL2"
        sql = sql & " WHERE    A2.KAISYACD    = :ORA_1"
        sql = sql & "   AND    A2.CREATOR_CODE    = :ORA_0"
        sql = sql & "   AND    AL2.GROUP_NAME IS NOT NULL"
        sql = sql & "   AND    AL2.LANG_ID    <> 0"
        sql = sql & "   AND    A2.KAISYACD    = AL2.KAISYACD"
        sql = sql & "   AND    A2.CREATOR_CODE    = AL2.CREATOR_CODE"
        sql = sql & "   AND    A2.IDENTIFIER            = AL2.IDENTIFIER"
        sql = sql & " ORDER BY    1,2"
        ReDim w_orapara(2, 1)
        w_orapara(0, 0) = "-1"
        w_orapara(1, 0) = "0"
        w_orapara(0, 1) = w_kcd
        w_orapara(1, 1) = "101"
        If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, w_grlist) = False Then
            ReDim w_grlist(1, -1)
        End If
    Else
        '**************************************
        '* 既存のグループ名取得
        '**************************************
        sql = "SELECT GROUP_NAME"
        '*** 下記のいずれかの場合は常に各国語用のテーブルを参照する
        '*** ①通常時-共通用(採用・発令・考課・異動線は除く)
        '*** ②通常時-個人用(採用は除く)
        If (w_mode = "1" AndAlso w_smode(0) = "1" AndAlso w_fdata(2) = "1") OrElse (w_mode = "1" AndAlso w_fdata(2) = "2") Then
            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & w_table_al
        Else
            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & w_table
        End If
        If w_fdata(2) = "1" Then
            '*** 共通
            sql = sql & " WHERE CREATOR_CODE = :ORA_0"
        Else
            '*** 個人
            sql = sql & " WHERE CREATOR_CODE = :ORA_1"
        End If
        sql = sql & " AND KAISYACD = :ORA_2"
        sql = sql & " AND GROUP_NAME IS NOT NULL"
        If w_mode = "1" AndAlso w_smode(0) = "1" AndAlso w_fdata(2) = "1" Then
            sql = sql & " AND LANG_ID = :ORA_3"
        End If
        sql = sql & " GROUP BY GROUP_NAME"
        sql = sql & " ORDER BY GROUP_NAME"
        ReDim w_orapara(2, 3)
        w_orapara(0, 0) = "-1"
        w_orapara(1, 0) = "0"
        w_orapara(0, 1) = SessionAsStr("SG_P_SID")
        w_orapara(1, 1) = "0"
        If w_mode = "2" Then
            '*** 採用管理時
            w_orapara(0, 2) = SessionAsStr("SG_P_KAISYA")
        Else
            '*** 通常
            w_orapara(0, 2) = w_kcd
        End If
        w_orapara(1, 2) = "101"
        w_orapara(0, 3) = keydata(30)
        w_orapara(1, 3) = "2"
        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_list1) = False Then
            ReDim w_list1(0, -1)
        End If
    End If
    '******************************************************************
    '* 画面制御設定
    '******************************************************************
    Select Case w_fdata(3)
        Case "1"
            '*** 公開先：全社員
            w_display(1) = "display=none"
            w_display(2) = "display=none"
        Case "2"
            '*** 公開先：特定
            w_display(1) = "display=block"
            w_display(2) = "display=none"
        Case "3"
            '*** 公開先：権限
            w_display(1) = "display=none"
            w_display(2) = "display=block"
    End Select
    If w_fdata(2) = "1" Then
        '*** 保存（共通）
        w_width = "5"
    Else
        '*** 保存（個人）
        w_width = "10"
    End If
    '******************************************************************
    '*    項目スタイル設定
    '******************************************************************
    If w_langid = "0" Then
        w_style(0) = "width=65"
        '*** 項目ラベルの表示幅
        w_style(1) = "id=button01"
        '*** ボタンの表示幅
    Else
        If w_fdata(2) = "1" Then
            '*** 保存（共通）
            w_style(0) = "width=100"
        Else
            w_style(0) = "width=65"
        End If
        w_style(1) = "id=buttons130"
    End If
    '******************************************************************
    '* グループ情報取得
    '******************************************************************
    sql = "SELECT A.GROUP_DIV"
    If w_mode = "1" AndAlso w_smode(0) = "1" Then
        '*** 採用・発令・考課・異動線は除く
        sql = sql & ",NVL(WEB_SP0050010_F('WEB_TP0050910_T',1, A.KAISYACD,A.GROUP_DIV,NULL,NULL,NULL,NULL,1,NULL,:ORA_1),A.GROUP_NAME)"
    Else
        sql = sql & ",A.GROUP_NAME"
    End If
    sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0050910_T A"
    sql = sql & " WHERE KAISYACD = :ORA_0"
    sql = sql & " ORDER BY A.DISP_ORDER"
    ReDim w_orapara(2, 1)
    w_orapara(0, 0) = w_kcd
    w_orapara(1, 0) = "101"
    w_orapara(0, 1) = w_langid
    w_orapara(1, 1) = "2"
    If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, w_list2) = False Then
        ReDim w_list2(1, -1)
    End If
    '******************************************************************
    '* 権限情報取得
    '******************************************************************
    sql = "SELECT A.PERMISSION"
    If w_mode = "1" AndAlso w_smode(0) = "1" Then
        sql = sql & ",NVL(WEB_SP0050010_F('WEB_TP0050010_M',1, A.KAISYACD,A.PERMISSION,NULL,NULL,NULL,NULL,1,NULL,:ORA_1),A.NAME)"
    Else
        sql = sql & ",A.NAME"
    End If
    sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0050010_M A"
    sql = sql & " WHERE KAISYACD = :ORA_0"
    sql = sql & " ORDER BY A.PREFERENTIAL_ORDER"
    Dim bindParams(1, 1) As String
    bindParams(0, 0) = w_kcd
    bindParams(1, 0) = "101"

    bindParams(0, 1) = w_langid
    bindParams(1, 1) = "2"
    If P000S011.FNCG_P_RECORDSET5(2, sql, bindParams, w_list3) = False Then
        ReDim w_list3(1, -1)
        w_droplen = " id=droplen110 "
    End If
    '******************************************************************
    '* 言語データ取得
    '******************************************************************
    '*** システムで利用する言語データを取得
    w_chklanglist = P000S009.FNCG_P_LANG_MSTGET("1", "0", "1", w_langid)
    '*** Javascriptチェック用(||区切り)の文言データ生成
    w_jschkclm = ""
    For ix = 0 To UBound(w_chklanglist, 2)
        '*** エラー文言情報取得（ﾗﾍﾞﾙ(5)："なし"）
        If P000S008.FNCG_P_GET_MULTILANGUAGE_WORD("P003M068", 5, "1", w_chklanglist(0, ix), w_langclm) <> 0 Then
        End If
        w_jschkclm = w_jschkclm & "," & w_langclm(0, 0)
    Next
    w_jschkclm = Mid(w_jschkclm, 2)
	
	'グループ編集可否
	Dim condsGroupEdit As String = "0"
	If IsZensyaRef() Then
		condsGroupEdit = SessionAsStrArray("SG_P_ETCSEC_ALL")(38)
	Else
		condsGroupEdit = SessionAsStrArray("SG_P_ETCSEC")(38)
	End If
	
    '******************************************************************************
    '//**    ２．ＨＴＭＬの書き出し
    '//**
    '******************************************************************************
%>
<html>
<head>
    <%
        P000S004.SUBG_P_METATAG("1")
        '*** ﾗﾍﾞﾙ(1)："条件保存画面"
    %>
    <title>
        <%= P000S004.FNCG_P_TITLE(w_langmsg(0, 1))%></title>
    <%    'スタイルシート：データ用 %>
    <link rel="stylesheet" type="text/css" href="./CSS/P000C301.CSS">
    <%    '<!-- P000J000.JS EXEMPT --> %>
    <script language="JavaScript" type="text/javascript" src="./SCRIPT/P000J000.JS"></script>
    <%    '<!-- P000V000.VBS EXEMPT --> %>
    <script language="VbScript" type="text/vbscript" src="./SCRIPT/P000V000.VBS"></script>
    <script language="JavaScript" type="text/javascript" src="./SCRIPT/P000J040.JS"></script>
    <script language="JavaScript"><!--
<%
    '//********************************
    '//* 登録確認処理
    '//********************************
    '//* SUBMIT時の選択ボタン判断フラグセット処理
%>
    function JSFL_P_SETID(id)
    {
        var form = document.Form068;
        form.h_button.value = id;
    }

<%    '//* 更新前のチェック処理 %>
    function JSFL_P_CHK_SUBMIT()
    {
        var form = document.Form068;
        var form2 = parent.opener.document.Form061;
        var p_button = form.h_button.value;
        var p_i = 0;
        var p_bit = "";
        var p_name = "";
        var p_array = "";
        var w_chkclm = "<%= w_jschkclm %>";
        var w_chkerr = false;
        var w_f2_ary = "";
        var w_cnt;
        var w_form0;
        var w_form2;

<%
    '//******************************
    '//* 入力チェック
    '//******************************
%>
        if (p_button=="1" || p_button=="2") {
<%
    If w_lngsel = 0 Then 
        '// 言語選択権限=無しの場合
%>
                if (form.f0.value == ""){
<%        '*** ﾗﾍﾞﾙ(2)：名称を入力して下さい。 %>
                    alert("<%= w_langmsg(0, 2) %>");
                    return false;
                }else{
                    if (JSFG_P_LENBCHK(form.f0.value,50) == false){
<%        '*** ﾗﾍﾞﾙ(3)：名称の文字数が長すぎます。（全角・半角カナ25文字、半角英数75文字） %>
                        alert("<%= w_langmsg(0, 3) %>");
                        return false;
                    }
                }
                if (JSFG_P_LENBCHK(form.f2.value,50) == false){
<%        '*** ﾗﾍﾞﾙ(4)：カテゴリ名の文字数が長すぎます。（全角・半角カナ25文字、半角英数75文字） %>
                    alert("<%= w_langmsg(0, 4) %>");
                    return false;
                }
<%
        '*** カテゴリ名="なし"のチェック処理
        '*** チェック対象名称をスプリット
%>
                w_f2_ary = w_chkclm.split(",");
                for (p_i=0; p_i<w_f2_ary.length; p_i++){
                    if (form.f2.value == w_f2_ary[p_i]){
                        w_chkerr = true;
                    }
                }
                if (w_chkerr == true) {
<%        '*** ﾗﾍﾞﾙ(6)：カテゴリ名は「なし」以外で設定して下さい。 %>
                    alert("<%= P000S008.FNCG_P_SUBWORD(1, CStr(w_langmsg(0, 6)), w_jschkclm, "") %>");
                    return false;
                }
<%
    Else
        '// 言語選択権限=有りの場合
%>
                w_cnt = 0;
                for (p_j = 0; p_j <= <%= UBound(w_inf01, 2) %> ; p_j++) {
                    if (eval("form.ch0_" + p_j).checked) {
                        w_form0 = eval("form.f0_" + p_j)
                        w_form2 = eval("form.f2_" + p_j)
                        w_cnt = w_cnt + 1;
                        if (w_form0.value == "") {
<%        '*** ﾗﾍﾞﾙ(2)：名称を入力して下さい。 %>
                            JSFG_P_ALERT(w_form0,"<%= w_langmsg(0, 2) %>");
                            return false;
                        } else {
                            if (JSFG_P_LENBCHK(w_form0.value,50) == false){
<%        '*** ﾗﾍﾞﾙ(3)：名称の文字数が長すぎます。（全角・半角カナ25文字、半角英数75文字） %>
                                JSFG_P_ALERT(w_form0,"<%= w_langmsg(0, 3) %>");
                                return false;
                            }
                        }
                        if (JSFG_P_LENBCHK(w_form2.value,50) == false){
<%        '*** ﾗﾍﾞﾙ(4)：カテゴリ名の文字数が長すぎます。（全角・半角カナ25文字、半角英数75文字） %>
                            JSFG_P_ALERT(w_form2,"<%= w_langmsg(0, 4) %>");
                            return false;
                        }
<%
        '*** グループ名="なし"のチェック処理
        '*** チェック対象名称をスプリット
%>
                        w_f2_ary = w_chkclm.split(",");
                        for (p_i=0; p_i<w_f2_ary.length; p_i++){
                            if (w_form2.value == w_f2_ary[p_i]){
                                w_chkerr = true;
                            }
                        }
                        if (w_chkerr == true) {
<%        '*** ﾗﾍﾞﾙ(6)：カテゴリ名は「なし」以外で設定して下さい。 %>
                            JSFG_P_ALERT(w_form2,"<%= P000S008.FNCG_P_SUBWORD(1, CStr(w_langmsg(0, 6)), w_jschkclm, "") %>");
                            return false;
                        }
                    }
                }
                if (w_cnt == 0) {
<%        '*** ﾗﾍﾞﾙ(23)：公開対象とする言語を選択して下さい。 %>
                    alert("<%= w_langmsg(0, 23) %>");
                    return false;
                }
<%
    End IF
%>

            if (form.h_1.value == "1") {
<%    '// 公開先が特定 %>
                if (form.f4[1].checked == true) {
                    if (form.f5_1.value == "") {
<%    '*** ﾗﾍﾞﾙ(7)：グループを選択して下さい。 %>
                        alert("<%= w_langmsg(0, 7) %>");
                        return false;
                    } else {
                        form.f5.value = form.f5_1.value;
                    }
                }
<%    '// 公開先が権限 %>
                if (form.f4[2].checked == true) {
                    if (form.f5_2.value == "") {
<%    '*** ﾗﾍﾞﾙ(8)：権限を選択して下さい。 %>
                        alert("<%= w_langmsg(0, 8) %>");
                        return false;
                    } else {
                        form.f5.value = form.f5_2.value;
                    }
                }
            }


            //<%'******************************%>
            //<%'* 確認処理%>
            //<%'******************************%>
            if (p_button=="1"){
                //<%'*** メッセージ(9)：登録します。 %>
                var result = confirm("<%= w_langmsg(0, 9) %>");
            }else if (p_button=="2") {
                //<%'*** メッセージ(10)：別名で登録します。 %>
                var result = confirm("<%= w_langmsg(0, 10) %>");
            }
            if (result==false){
                return false;
            }
            //<%'******************************%>
            //<%'* 親画面の情報取得%>
            //<%'******************************%>

            var parentDoc = opener.document;

            //<%' 選択項目・計算単位%>
            //<%'出力項目(10行固定) %>
            var o;
            //<%'出力項目カンマ区切り保存フィールド %>
            var baseDateDivSyutu = document.getElementById('baseDateDivSyutu');
            var baseDateContent1Syutu = document.getElementById('baseDateContent1Syutu');
            var baseDateContent2Syutu = document.getElementById('baseDateContent2Syutu');
            var masterAuxSyutu = document.getElementById('masterAuxSyutu');
            for (var idx=0; idx< 10; ++idx){
                o = eval("form2.h_list" + idx.toString());
                if (o.value != ""){
                    p_array = o.value.split("|");
                    form.h_f003.value += p_array[0] + ","
                    o = eval("form2.num" + idx.toString());
                    if (p_array[1]=="2"){
                        form.h_f013.value += o.value + ","
                    }else{
                        form.h_f013.value += ","
                    }
                }
                //<%'基準日関連 %>
                baseDateDivSyutu.value += parentDoc.getElementById('<%=P0030000.PNAME_BASE_DATE_DIV & P0030000.SFX_SYUTURYOKU & "_"%>' + idx.toString()).value + ",";
                baseDateContent1Syutu.value += parentDoc.getElementById('<%=P0030000.PNAME_BASE_DATE_CONTENT1 & P0030000.SFX_SYUTURYOKU & "_"%>' + idx.toString()).value + ",";
                baseDateContent2Syutu.value += parentDoc.getElementById('<%=P0030000.PNAME_BASE_DATE_CONTENT2 & P0030000.SFX_SYUTURYOKU & "_"%>' + idx.toString()).value + ",";
                //<%'マスター補助関連 %>
                masterAuxSyutu.value += parentDoc.getElementById('<%=P0030000.PNAME_MASTER_AUX & P0030000.SFX_SYUTURYOKU & "_"%>' + idx.toString()).value + ",";
            }

            //<%' 補足区分(4行固定) %>
            //<%'集計項目カンマ区切り保存フィールド %>
            var baseDateDivSyukei = document.getElementById('baseDateDivSyukei');
            var baseDateContent1Syukei = document.getElementById('baseDateContent1Syukei');
            var baseDateContent2Syukei = document.getElementById('baseDateContent2Syukei');
            var masterAuxSyukei = document.getElementById('masterAuxSyukei');
            for (var idx=0; idx<4; ++idx){
                o = eval("form2.h_skei" + idx);
                if (o.value != ""){
                    //<%' 補足区分（コード） %>
                    form.h_f007.value += o.value + ","
                    //<%' 補足種別 %>
                    o = eval("form2.f008_" + idx);
                    form.h_f008.value += o.value + ","
                }
                //<%'基準日関連 %>
                baseDateDivSyukei.value += parentDoc.getElementById('<%=P0030000.PNAME_BASE_DATE_DIV & P0030000.SFX_SYUKEI & "_"%>' + idx.toString()).value + ",";
                baseDateContent1Syukei.value += parentDoc.getElementById('<%=P0030000.PNAME_BASE_DATE_CONTENT1 & P0030000.SFX_SYUKEI & "_"%>' + idx.toString()).value + ",";
                baseDateContent2Syukei.value += parentDoc.getElementById('<%=P0030000.PNAME_BASE_DATE_CONTENT2 & P0030000.SFX_SYUKEI & "_"%>' + idx.toString()).value + ",";
                //<%'マスター補助関連 %>
                masterAuxSyukei.value += parentDoc.getElementById('<%=P0030000.PNAME_MASTER_AUX & P0030000.SFX_SYUKEI & "_"%>' + idx.toString()).value + ",";
            }

            //<%' 同一データ %>
            if(form2.f004[1].checked==true){
                form.h_f004.value = "2";
            }else{
                form.h_f004.value = "1";
            }
            //<%'小計表示 %>
            if(form2.f005[1].checked==true){
                form.h_f005.value = "1";
            }else{
                form.h_f005.value = "0";
            }
            //<%'コード表示 %>
            if(form2.f006[1].checked==true){
                form.h_f006.value = "1";
            }else{
                form.h_f006.value = "0";
            }



            //<%'出力集計形式 %>
            form.h_f009.value = form2.f009.value + "<%=P0030000.CUSTOM_LINE_SEPARATOR2 %>" + form2.f010.value;

            //<%'社員表示 %>
            if(form2.f011[1].checked==true){
                form.h_f010.value = "1";
            }else if(form2.f011[2].checked==true){
                form.h_f010.value = "2";
            }else{
                form.h_f010.value = "0";
            }

            //<%'社員表示項目 %>
            p_bit = "";
            for (p_i=0 ; p_i < form2.f012.length ; p_i++){
                if (form2.f012[p_i].checked == true) {
                    p_bit = p_bit + "1";
                }else{
                    p_bit = p_bit + "0";
                }
            }
            form.h_f011.value = p_bit;

            //<%'社員基準日 %>
            if(form2.f013[1].checked==true){
                form.h_f012.value = "2";
            }else{
                form.h_f012.value = "1";
            }

            if (<%=w_orgflg %>=="1") {
                //<%'表示方法 %>
                if(form2.f014[1].checked==true){
                    form.h_f014.value = "2";
                }else{
                    form.h_f014.value = "1";
                }

                //<%'対象組織 %>
                form.h_f015.value = form2.f015.value;

                //<%'対象部署 %>
                form.h_f016.value = form2.f016.value;

                //<%'兼務設定 %>
                if(form2.f017[1].checked==true){
                    form.h_f017.value = "1";
                }else{
                    form.h_f017.value = "0";
                }

                //<%'組織項目(5行固定) %>
                var o;
                //<%'組織項目の取得 %>
                for (var idx=0; idx< 5; ++idx){
                    o2 = eval("form2.h_slist" + idx.toString());
                    if (o2.value != ""){
                        form.h_f018.value += o2.value + ","
                    }
                }
            } else {
                form.h_f014.value = "1";
            }

            <%
            If w_mode = "1"  Then
            %>
            //<%'マスター項目の表示 %>
            if(form2.f019[1].checked==true){
                form.h_f019.value = "2";
            }else{
                form.h_f019.value = "1";
            }
            <%
            End If
            %>
        } else if (p_button=="3") {
            //<%'グループ選択情報をセット %>
            form.f5.value = form.f5_1.value;
        }

    }

<%
    '//********************************
    '//* ウインドウオープン・クローズ
    '//********************************
%>
    var grpwin = "";
    function JSFL_P_OPENCLOSE(id)
    {
        var form = document.Form068;
        if (id=="1") {
<%    '//* 自画面をクローズ %>
            window.close();
        } else if (id=="2") {
<%    '//* グループ編集画面をオープン %>
            grpwin = window.open('P003M210.aspx?noget=1','newgrpwin','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,width=770,height=570');
        }
    }

<%
    '//********************************
    '//* グループ編集ウインドウクローズ
    '//********************************
%>
    function JSFL_P_CLOSE()
    {
        var form = document.Form068;
        if (grpwin != ""){
            grpwin.close();
        }
    }

<%
    '//******************************
    '//* カテゴリリスト選択時の制御
    '//******************************
    If w_lngsel = 0 Then 
        '//* 外国語登録不可時
%>
        function JSFL_P_DISP(id)
        {
            var form = document.Form068;
            if (id.value==""){
                form.f2.disabled=false;
            }else{
                form.f2.value="";
                form.f2.disabled=true;
            }
        }
<%
    Else
        '//* 外国語登録可能時
%>
        function JSFL_P_DISP2(p_id, p_no)
        {
            var form = document.Form068;
            if (p_id.value == ""){
                eval("form.f2_" + p_no).disabled=false;
            }else{
                eval("form.f2_" + p_no).value="";
                eval("form.f2_" + p_no).disabled=true;
            }
        }
<%
    End IF
    '//******************************
    '//* 公開先変更
    '//******************************
%>
    function JSF_P_DISPLAY(kbn) {
        var form = document.Form068;
        if (kbn == 1) {
            form.all.div1.style.display="none";
            form.all.div2.style.display="none";
        } else if (kbn == 2) {
            form.all.div1.style.display="block";
            form.all.div2.style.display="none";
        } else {
            form.all.div1.style.display="none";
            form.all.div2.style.display="block";
        }
    }

//-->
    </script>
    <link rel="stylesheet" type="text/css" href="./CSS/PE_Common.css"/>
    <link rel="stylesheet" type="text/css" href="./CSS/utf8style.css"/>
    <link rel="stylesheet" type="text/css" href="./CSS/P003M068.css"/>
</head>
<body <%= P000S004.FNCG_P_BODYTAG2() %> onload="javascript:JSFL_P_OPENCLOSE('<%= w_menu %>');" onunload="javascript:JSFL_P_CLOSE();">
    <form name="Form068" method="post" action="P003M069.aspx" onsubmit="javascript:return JSFL_P_CHK_SUBMIT();" <%= P000S004.FNCG_P_AUTOCOMPLETE() %>>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td height="20"></td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <%
                        '********************************************************
                        '* 公開先
                        '********************************************************
                        Dim tokuteiDisp As String = "none"
                        Dim koukaisakiDisp As String = "none"
                        
                        '各社ログインにおける全社参照モード
                        If SessionAsStrArray("SG_P_ALLKENGEN")(2) = "2" Then
                            tokuteiDisp = "none"
                            koukaisakiDisp = "block"
                        '各社ログインにおける各社参照モード
                        ElseIf SessionAsStrArray("SG_P_ALLKENGEN")(2) = "1" Then
                            tokuteiDisp = "block"
                            koukaisakiDisp = "block"
                        'それ以外
                        ElseIf w_fdata(2) = "1" Then
                            tokuteiDisp = "block"
                            koukaisakiDisp = "block"
                        End If
                    %>
                    <% '共通用の場合のみ、公開先を表示する %>
                    <% If w_fdata(2) = "1" Then %>
	                    <tr>
	                        <%'*** ﾗﾍﾞﾙ(11)："公開先" %>
	                        <td <%= w_style(0) %> align="right" nowrap>
	                            <div style="display:<%=koukaisakiDisp%>;">
	                                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 11), "id=idsmidasi01") %>
	                            </div>
	                        </td>
	                        <td width="5" nowrap><br></td>
	                        <td>
	                            <div style="display:<%=koukaisakiDisp%>;float:left;">
	                                <%        '*** ﾗﾍﾞﾙ(12)："全" & SessionAsStrArray("SG_P_SYSTEM")(7) %>
	                                <input type="radio" value="1" id="l4_1" name="f4" <%= P000S001.FNCG_P_CHECKED("1", w_fdata(3)) %> onclick="Javascript:JSF_P_DISPLAY(1);"><label for="l4_1"><%= P000S004.FNCG_P_FONT_TAG(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 12), SessionAsStrArray("SG_P_SYSTEM")(7), ""), "")%></label>
	                            </div>
	                            <div style="display:<%=tokuteiDisp%>;float:left;">
	                                <%        '*** ﾗﾍﾞﾙ(13)："特定" %>
	                                <input type="radio" value="2" id="l4_2" name="f4" <%= P000S001.FNCG_P_CHECKED("2", w_fdata(3)) %> onclick="Javascript:JSF_P_DISPLAY(2);"><label for="l4_2"><%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 13), "") %></label>
	                            </div>
	                            <div style="display:<%=koukaisakiDisp%>;float:left;">
	                                <%        '*** ﾗﾍﾞﾙ(14)："権限" %>
	                                <input type="radio" value="3" id="l4_3" name="f4" <%= P000S001.FNCG_P_CHECKED("3", w_fdata(3)) %> onclick="Javascript:JSF_P_DISPLAY(3);"><label for="l4_3"><%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 14), "") %></label>
	                            </div>
	                        </td>
	                    </tr>
	                <% End If %>
                    <tr>
                        <td colspan="3" height="<%= w_width %>"></td>
                    </tr>
                    <%
                    '*** 言語選択権限が無い場合
                    If w_lngsel = 0 Then
                        '********************************************************
                        '* 名称
                        '********************************************************
                    %>
                    <tr>
                        <%        '*** ﾗﾍﾞﾙ(15)："名称" %>
                        <td <%= w_style(0) %> align="right" nowrap>
                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 15), "id=idsmidasi01") %><br></td>
                        <td width="5" nowrap><br></td>
                        <td>
                            <input name="f0" type="text" size="52" maxlength="50" <%= P000S022.FNCG_P_INPUT_IME(1) %> value="<%= P000S001.FNCG_P_HTMLENCODE(w_fdata(0)) %>">
                        </td>
                    </tr>
                    <%
                        '********************************************************
                        '* グループ
                        '********************************************************
                    %>
                    <tr>
                        <td colspan="3" height="<%= w_width %>"></td>
                    </tr>
                    <tr>
                        <%        '*** ﾗﾍﾞﾙ(16)："カテゴリ" %>
                        <td align="right" nowrap>
                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 16), "id=idsmidasi01") %><br></td>
                        <td><br></td>
                        <td>
                            <select name="f1" id="droplen300" size="0" onchange="javascript:JSFL_P_DISP(this);">
                                <option value="">
                                    <%
                                        w_lflg = 0
                                        For icount = 0 To UBound(w_list1, 2)
                                            w_selected = P000S001.FNCG_P_SELECTED(w_list1(0, icount), w_fdata(1))
                                    %>
                                <option value="<%= P000S001.FNCG_P_HTMLENCODE(w_list1(0, icount)) %>" <%= w_selected %>>
                                    <%= P000S001.FNCG_P_HTMLENCODE(w_list1(0, icount))%><br>
                                    <%
                                        If Not IsNull(w_selected) Then
                                            w_lflg = 1
                                        End If
                                    Next
                                    %>
                            </select>
                        </td>
                    </tr>
                    <%
                        '********************************************************
                        '* グループ（リスト）
                        '********************************************************
                    %>
                    <tr>
                        <td colspan="3" height="<%= w_width %>"></td>
                    </tr>
                    <tr>
                        <td><br></td>
                        <td><br></td>
                        <td>
                            <%
                                If w_lflg = 0 Then
                            %>
                            <input name="f2" type="text" size="52" maxlength="50" <%= P000S022.FNCG_P_INPUT_IME(1) %> value="<%= P000S001.FNCG_P_HTMLENCODE(w_fdata(1)) %>">
                            <%
                            Else
                            %>
                            <input name="f2" type="text" size="52" maxlength="50" <%= P000S022.FNCG_P_INPUT_IME(1) %> value="" disabled>
                            <%
                            End If
                            %>
                        </td>
                    </tr>
                    <%
                    Else
                        '*** 言語選択権限が有る場合
                    %>
                    <tr>
                        <%        '*** ﾗﾍﾞﾙ(24)："公開名称" %>
                        <td <%= w_style(0) %> align="right" valign="top" nowrap>
                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 24), "id=idsmidasi01") %><br></td>
                        <td width="5" nowrap><br></td>
                        <td>
                            <table border="1" cellpadding="2" cellspacing="0" class="border">
                                <tr bgcolor="<%= w_color(2) %>">
                                    <%        '*** ﾗﾍﾞﾙ(25)："選択" %>
                                    <th nowrap width="35">
                                        <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 25), "id=idsmidasi01") %>
                        </td>
                        <%        '*** ﾗﾍﾞﾙ(26)："公開言語" %>
                        <th nowrap width="100">
                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 26), "id=idsmidasi01") %>
            </td>
            <%        '*** ﾗﾍﾞﾙ(15)："名称" %>
            <th nowrap width="250">
                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 15), "id=idsmidasi01") %></TD>
                <%        '*** ﾗﾍﾞﾙ(16)："カテゴリ" %>
            <th nowrap width="300" class="thwidth">
                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 16), "id=idsmidasi01") %>
            </TD>
        </tr>
    </table>
    <%
        If UBound(w_inf01, 2) < 6 Then
    %>
    <div style="overflow: auto" border="0">
        <%
        Else
        %>
        <div style="height: 308; width: 728; overflow: auto" border="0" class="P003M068_listdiv">
            <%
            End If
            %>
            <table border="1" cellpadding="2" cellspacing="0" class="border">
                <%
                    For w_j = 0 To UBound(w_inf01, 2)
                %>
                <tr bgcolor="<%= w_color(8) %>">
                    <td align="center" width="35">
                        <input type="checkbox" value="<%= w_inf01(1, w_j) %>" name="ch0_<%= w_j %>" <%= P000S001.FNCG_P_CHECKED("1", w_inf01(0, w_j)) %>>
                    </td>
                    <td valign="middle" width="100">
                        <%= P000S004.FNCG_P_FONT_TAG(w_inf01(2, w_j), "") %></td>
                    <td valign="middle" width="250">
                        <input name="f0_<%= w_j %>" type="text" size="42" maxlength="50" <%= P000S022.FNCG_P_INPUT_IME(1) %> value="<%= P000S001.FNCG_P_HTMLENCODE(w_inf01(3, w_j)) %>">
                    </td>
                    <td width="300">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <select name="f1_<%= w_j %>" id="droplen300" size="0" onchange="javascript:JSFL_P_DISP2(this, <%= w_j %>);">
                                        <option value="">
                                            <%
                                                w_groupflg(w_j) = True
                                                For w_i = 0 To UBound(w_grlist, 2)
                                                    If w_grlist(0, w_i) = w_inf01(1, w_j) Then
                                                        '** 該当する言語ＩＤのみリスト表示
                                                        If Not IsNull(P000S001.FNCG_P_SELECTED(w_grlist(1, w_i), w_inf01(4, w_j))) Then
                                                            w_groupflg(w_j) = False
                                                        End If
                                            %>
                                        <option value="<%= P000S001.FNCG_P_HTMLENCODE(w_grlist(1, w_i)) %>" <%= P000S001.FNCG_P_SELECTED(w_grlist(1, w_i), w_inf01(4, w_j)) %>>
                                            <%= P000S001.FNCG_P_HTMLENCODE(w_grlist(1, w_i))%>
                                            <%
                                            End If
                                        Next
                                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td height="3"></td>
                            </tr>
                            <tr>
                                <td>
                                    <%
                                        If w_groupflg(w_j) Then
                                            '*** カテゴリリスト未選択
                                    %>
                                    <input name="f2_<%= w_j %>" type="text" size="52" maxlength="50" <%= P000S022.FNCG_P_INPUT_IME(1) %> value="<%= P000S001.FNCG_P_HTMLENCODE(w_inf01(4, w_j)) %>">
                                    <%
                                    Else
                                        '*** カテゴリリスト選択済
                                    %>
                                    <input name="f2_<%= w_j %>" type="text" size="52" maxlength="50" <%= P000S022.FNCG_P_INPUT_IME(1) %> value="" disabled>
                                    <%
                                    End If
                                    %>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%
                Next
                %>
            </table>
        </div>
        </TD> </TR>
        <%
        End If
        %>
        </TABLE> </TD> </TR>
        <%
            If w_fdata(2) = "1" Then
        %>
        <tr>
            <td colspan="3" height="<%= w_width %>"></td>
        </tr>
        <tr>
            <td colspan="3">
                <div id="div1" style="<%= w_display(1) %>">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <%        '*** ﾗﾍﾞﾙ(17)："グループ" %>
                            <td <%= w_style(0) %> align="right" nowrap>
                                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 17), "id=idsmidasi01") %><br></td>
                            <td width="5" nowrap><br></td>
                            <td>
                                <select name="f5_1" id="droplen200">
                                    <%
                                        For icount = 0 To UBound(w_list2, 2)
                                    %>
                                    <option value="<%= P000S001.FNCG_P_HTMLENCODE(w_list2(0, icount)) %>" <%= P000S001.FNCG_P_SELECTED(w_list2(0, icount), w_fdata(4)) %>>
                                        <%= P000S001.FNCG_P_HTMLENCODE(w_list2(1, icount))%><br>
                                        <%
                                        Next
                                        %>
                                </select>
                            </td>
                            <%
                                '*** グループ編集可能な対象者のみ表示
                                If condsGroupEdit = "1" Then
                            %>
                            <td width="5"><br></td>
                            <%            '*** ﾗﾍﾞﾙ(18)：グループ編集 %>
                            <td>
                                <input id="button01" class="normal" type="submit" value="<%= w_langmsg(0, 18) %>" onclick="javascript:JSFL_P_SETID('3');"></td>
                            <%
                            End If
                            %>
                        </tr>
                    </table>
                </div>
                <div id="div2" style="<%= w_display(2) %>">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <%        '*** ﾗﾍﾞﾙ(19)："権限" %>
                            <td <%= w_style(0) %> align="right" nowrap>
                                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 19), "id=idsmidasi01") %><br></td>
                            <td width="5" nowrap><br></td>
                            <td>
                                <select name="f5_2" <%= w_droplen %>>
                                    <%
                                        For icount = 0 To UBound(w_list3, 2)
                                    %>
                                    <option value="<%= P000S001.FNCG_P_HTMLENCODE(w_list3(0, icount)) %>" <%= P000S001.FNCG_P_SELECTED(w_list3(0, icount), w_fdata(4)) %>>
                                        <%= P000S001.FNCG_P_HTMLENCODE(w_list3(1, icount))%><br>
                                        <%
                                        Next
                                        %>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <%
        End If
        %>
        <tr>
            <td height="20"></td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td <%= w_style(0) %> nowrap><br></td>
                        <td width="5" nowrap><br></td>
                        <td>
                            <div id="div0" style="<%= w_display(0) %>">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <%    '*** ﾗﾍﾞﾙ(20)：登  録 %>
                                        <td>
                                            <input id="button01" type="submit" value="<%= w_langmsg(0, 20) %>" onclick="javascript:JSFL_P_SETID('1');"></td>
                                        <td width="10" nowrap><br></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <%
                            If keydata(11) <> "2" Then
                                '*** 新規追加時以外
                                '*** ﾗﾍﾞﾙ(21)：別名追加
                        %>
                        <td>
                            <input <%= w_style(1) %> type="submit" value="<%= w_langmsg(0, 21) %>" onclick="javascript:JSFL_P_SETID('2');"></td>
                        <td width="10" nowrap><br></td>
                        <%
                        End If
                        '*** ﾗﾍﾞﾙ(22)：閉じる
                        %>
                        <td>
                            <input id="button01" class="normal" type="button" value="<%= w_langmsg(0, 22) %>" onclick="window.close();"></td>
                    </tr>
                </table>
            </td>
        </tr>
        </TABLE>
        <input type="hidden" value="" name="h_f003">
        <%    '選択項目 %>
        <input type="hidden" value="" name="h_f004">
        <%    '同一データ %>
        <input type="hidden" value="" name="h_f005">
        <%    '小計表示 %>
        <input type="hidden" value="" name="h_f006">
        <%    'コード表示 %>
        <input type="hidden" value="" name="h_f007">
        <%    '補足区分 %>
        <input type="hidden" value="" name="h_f008">
        <%    '補足種別 %>
        <input type="hidden" value="" name="h_f009">
        <%    '出力集計形式 %>
        <input type="hidden" value="" name="h_f010">
        <%    '社員表示 %>
        <input type="hidden" value="" name="h_f011">
        <%    '社員表示項目 %>
        <input type="hidden" value="" name="h_f012">
        <%    '社員基準日 %>
        <input type="hidden" value="" name="h_f013">
        <%    '計算単位 %>
        <input type="hidden" value="" name="h_f014">
        <%    '表示方法 %>
        <input type="hidden" value="" name="h_f015">
        <%    '対象情報 %>
        <input type="hidden" value="" name="h_f016">
        <%    '対象部署 %>
        <input type="hidden" value="" name="h_f017">
        <%    '兼務情報 %>
        <input type="hidden" value="" name="h_f018">
        <%    '組織項目 %>
        <input type="hidden" value="" name="h_f019">
        <%    'マスターの表示 %>
        <input type="hidden" value="0" name="h_button">
        <%    '機能判断区分（1=登録・2=別名追加・3=グループ編集） %>
        <input type="hidden" value="<%= P000S001.FNCG_P_HTMLENCODE(w_fdata(2)) %>" name="h_1">
        <input type="hidden" value="" name="f5">
        <input type="hidden" value="<%= P000S001.FNCG_P_HTMLENCODE(w_kinou) %>" name="h_kkbn">

        <%'基準日関連(出力項目) %>
        <input type="hidden" value="" id="baseDateDivSyutu" name="baseDateDivSyutu" />
        <input type="hidden" value="" id="baseDateContent1Syutu" name="baseDateContent1Syutu"/>
        <input type="hidden" value="" id="baseDateContent2Syutu" name="baseDateContent2Syutu"/>
        <%'マスター補助関連(出力項目) %>
        <input type="hidden" value="" id="masterAuxSyutu" name="masterAuxSyutu"/>

        <%'基準日関連(集計項目) %>
        <input type="hidden" value="" id="baseDateDivSyukei" name="baseDateDivSyukei"/>
        <input type="hidden" value="" id="baseDateContent1Syukei" name="baseDateContent1Syukei"/>
        <input type="hidden" value="" id="baseDateContent2Syukei" name="baseDateContent2Syukei"/>
        <%'マスター補助関連(集計項目) %>
        <input type="hidden" value="" id="masterAuxSyukei" name="masterAuxSyukei"/>

    </form>
</body>
</html>
<%
    '*** 保存形式(1:共通,2:個人）
    '*** 機能区分(1:通常,400:採用)
    '*** 配列変数の開放
    If IsArray(w_langmsg) Then
        Erase w_langmsg
    End If
    If IsArray(w_langclm) Then
        Erase w_langclm
    End If
    If IsArray(w_style) Then
        Erase w_style
    End If
    Response.End()
%>
<script language="vb" runat="server">
    '**********************************************************************
    '*    変数宣言
    '**********************************************************************
    Dim sql As String     '*** SQL
    Dim w_orapara(,) As String     '*** SQL
    Dim icount As Integer     '*** カウンタ
    Dim ix As Integer     '*** カウンタ
    Dim keydata() As String     '*** KEY情報格納
    Dim w_fdata(4) As String    '*** 画面情報
    '***(0)= 名称（保存データ）
    '***(1)= グループ（保存データ）
    '***(2)= 保存形式（1=共通・2=個人）
    '***(3)= 公開先（1=全社員・2=特定・3=権限）
    '***(4)= グループ Or 権限
    Dim w_display(2) As String    '*** ボタン使用制御
    Dim w_mode As String     '*** 機能ﾓｰﾄﾞ（1=通常・""=採用管理）
    Dim w_smode() As String     '*** 機能ﾓｰﾄﾞ詳細
    Dim w_kcd As String     '*** 会社コード
    Dim w_list1(,) As String     '*** リスト(カテゴリ名取得)
    Dim w_list2(,) As String     '*** リスト(グループ名取得)
    Dim w_list3(,) As String     '*** リスト(権限名称名取得)
    Dim w_droplen As String     '*** 画面制御
    Dim w_width As String     '*** 画面制御
    Dim w_selected As String     '*** 画面制御
    Dim w_lflg As Integer     '*** 画面制御
    Dim w_skbn As String     '*** 処理区分
    Dim w_ekbn As String     '*** エラー区分
    Dim w_kinou As String     '*** 機能区分(1:通常,400:採用)
    Dim w_table As String     '*** テーブル名
    Dim w_table_al As String     '*** テーブル名(外国語用)
    Dim w_grtn As String     '*** 1:グループ編集からの遷移・Else:以外
    Dim w_langmsg(,) As String     '*** 文言情報取得用
    Dim w_chklanglist(,) As String     '*** 言語マスターデータチェック処理用
    Dim w_langclm(,) As String     '*** 言語用項目名
    Dim w_jschkclm As String     '*** Javascriptチェック項目文字列(カンマ区切り)
    Dim w_lngsel As Integer     '*** 言語選択有無(0:無,1:有)
    Dim w_color() As String     '*** 設定色
    Dim w_inf01(,) As String     '*** 複数言語登録時のセッション情報
    Dim w_i As Integer     '*** カウンタ
    Dim w_j As Integer     '*** カウンタ
    Dim w_defdisp As String     '*** 画面初期表示区分(0:初期表示,1:再表示)
    Dim w_langlist(,) As String     '*** 言語リストデータ
    Dim w_dbdata(,) As String     '*** ＤＢデータ取得用
    Dim w_grlist(,) As String     '*** グループデータ
    Dim w_menu As String     '*** 遷移画面からの戻り区分("":遷移画面以外,1:画面クローズ,2:グループ編集呼出)
    Dim w_groupflg() As Boolean     '*** グループ項目制御用
    Dim w_grpkey() As String     '*** 検索共通セッション情報
    Dim w_langid As String     '*** 表示言語ＩＤ
    Dim w_style(1) As String    '*** 項目スタイル制御
    Dim w_orgflg As String     '*** 組織検索使用フラグ
    '**********************************************************************
    '*  名称：SUBL_P_KOUKAIGENGO_IMPUTAREA
    '*  処理：公開言語設定の登録内容セット
    '*  内容：言語に応じた各名称をセットする
    '*  備考：
    '*  引数：[I] p_data1   -- DB取得データ
    '*      ：[O] p_data2   -- 結果データ
    '**********************************************************************
    Sub SUBL_P_KOUKAIGENGO_IMPUTAREA(ByRef p_data1(,) As String, ByRef p_data2(,) As String)
        Dim w_i As Integer
        Dim w_j As Integer
        Dim w_temp(,) As String
        '*** （変更）初期表示パラメータ
        ReDim w_temp(4, UBound(w_langlist, 2))
        '*** (0, x) 選択フラグ(1:選択)
        '*** (1, x) 言語ＩＤ
        '*** (2, x) 公開言語名
        '*** (3, x) 名称
        '*** (4, x) グループ名
        For w_i = 0 To UBound(w_langlist, 2)
            w_temp(0, w_i) = "0"
            w_temp(1, w_i) = w_langlist(0, w_i)
            w_temp(2, w_i) = w_langlist(1, w_i)
            w_temp(3, w_i) = ""
            w_temp(4, w_i) = ""
            For w_j = 0 To UBound(p_data1, 2)
                If CInt(w_temp(1, w_i)) = CInt(p_data1(1, w_j)) Then
                    w_temp(0, w_i) = p_data1(0, w_j)
                    w_temp(3, w_i) = p_data1(2, w_j)
                    w_temp(4, w_i) = p_data1(3, w_j)
                    Exit For
                End If
            Next
        Next
        p_data2 = w_temp
        Erase w_temp
    End Sub

</script>
