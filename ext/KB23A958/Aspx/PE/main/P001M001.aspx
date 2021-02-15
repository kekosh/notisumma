<%@ Page Language="vb" Explicit="true" %>

<%@ Import Namespace="Isid.Positive.DataAccess" %>
<%@ Import Namespace="Isid.Positive.Env" %>
<%@ Import Namespace="Isid.Positive.Util" %>
<%@ Import Namespace="Isid.Positive.PE.Common" %>
<%@ Import Namespace="Isid.Positive.Common.PositiveHttpState" %>
<%@ Import Namespace="Isid.Positive.FileSystem" %>
<%@ Import Namespace="Isid.Positive.Common" %>
<%
    '**********************************************************************
    '*  ｼｽﾃﾑ：STAFFBRAIN-WEB版人事
    '*  機能：社員情報照会・登録
    '*  処理：社員検索結果画面
    '*  内容：社員検索結果画面の表示処理
    '*  FILE：P001M001.aspx
    '*  備考：
    '*
    '*  作成：000-Ver5.7  2000/08/07 S.T
    '*  履歴：001-Ver6.0  2000/11/01 Y.Y 保存結果検索対応
    '*  履歴：002-Ver6.1  2001/05/01 Y.Y 全件表示時の件数表示対応
    '*  履歴：003-Ver6.2  2001/10/15 Y.Y POPUPのタイムアウト時の対応
    '*  履歴：004-Ver6.2  2001/10/15 Y.Y ＤＢ変数取得方法の変更対応
    '*  履歴：005-Ver6.2  2001/10/15 T.M セッション対応
    '*  履歴：006-Ver6.3  2002/03/29 Y.Y 保存結果を共通で使用できる機能を追加
    '*  履歴：007-Ver6.3  2002/03/29 K.K onload時の帳票出力対応
    '*  履歴：008-Ver7.0  2002/10/01 Y.Y 項目名称変更対応
    '*  履歴：009-Ver9.0  2003/xx/xx T.M 社員番号の英数字化対応
    '*  履歴：010-VerP1.3 2004/02/18 Y.Y 検索結果一覧の表示内容対応
    '*  履歴：011-VerP2.1 2004/07/27 M.T FACEタグ不使用対応
    '*  履歴：012-VerP2.12 2004/08/16 S.B マスタ履歴化対応
    '*  履歴：013-VerP2.2 2004/10/15 H.N マスタ履歴化の判断方法変更対応
    '*  履歴：014-VerP2.2 2004/10/15 S.T 排他制御対応
    '*  履歴：015-VerP3.01 2005/08/15 Y.Y D100001 マルチカンパニー対応
    '*  履歴：016-VerP3.0b 2006/04/03 M.I D100087 社員番号項目の表示位置制御対応
    '*  履歴：017-VerP3.0d 2006/07/10 Y.Y D100122 メモリ消費改善対応（Include分割）
    '*  履歴：018-VerP3.1  2007/01/22 H.N D100191 画面レイアウト対応(次前ﾎﾞﾀﾝ変更)
    '*  履歴：019-VerP4.0  2007/11/26 Y.Y D100351 単一会社運用対応
    '*  履歴：020-VerP3.1b 2008/02/18 M.I E100925 兼務表示時の不具合対応
    '*  履歴：021-VerP4.0c 2009/02/20 C.O D100528 HTMLコメント対応
    '*  履歴：022-VerP4.0d 2009/04/10 M.I D100536 画面表示文言変更対応
    '*  履歴：023-VerP4.0d 2009/09/11 M.I【修正453】E101308 世代番号取得時の基準日不具合対応
    '*  履歴：024-VerP4.0e 2009/11/27 M.I【修正495】E101351 統計検索における不具合対応
    '*  履歴：025-VerP4.0e 2009/12/11 M.I【修正505】E101361 社員番号順の不具合対応
    '*  履歴：026-VerP4.0f 2010/04/15 M.I【改善】D100584 JavaScriptコメント削除対応
    '*  履歴：027-VerP4.0f 2010/04/16 M.I【改善】D100585 HTMLエンコード対応
    '*  履歴：028-VerP4.2  2011/10/21 K.I【改善P-11-004】英語対応
    '*  履歴：029-VerP4.3  2012/02/24 M.K【修正P12090】表示氏名格納先拡張漏れ対応
    '*  -------------------------------------------------------------------
    '*  作成：000-Ver5.0 2013/05/31 ISID 【Hayabusa】.NET版新規作成
    '*  履歴：001-Ver6.0 2014/10/31 COBA 【P-14-042】タレントマネジメント対応
    '*  履歴：002-Ver6.0 2014/10/31 COBA 【P-14-030】タレントマネジメント対応
    '*  履歴：003-Ver6.0 2014/10/31 ISID 【P-14-043】タレントマネジメント対応
    '*  履歴：004-Ver6.1 2015/04/20 CIS  【P-14-081】他機能連携対応
    '*  履歴：005-Ver6.1 2015/07/23 CIS  【P-14-081】適合率検索対応
    '*  履歴：006-Ver6.1 2019/07/09 ISID 【P29080】操作員（社員以外）ログイン時に「他業務機能への遷移」機能の機能制限対応
    '*  履歴：007-Ver6.1 2020/10/01 ISID 【P31820】適合率検索で件数、条件数が多い場合のパフォーマンス悪化対応
    '*  履歴：008-Ver6.1 2020/12/03 ISID 【P31970】他業務への遷移機能から遷移した場合の参照範囲不備対応
    '**********************************************************************
    Response.Expires = -1
    Response.AddHeader("Cache-Control", "No-Cache")
    '**********************************************************************
    '//**  （処理概要）
    '//**    社員情報メニューの表示
    '//**
    '**********************************************************************
    '**********************************************************************
    '* ログイン認証
    '**********************************************************************
    P000S012.SUBG_P_LOGINCHK("1", "1")
    '**********************************************************************
    '* 初期情報取得
    '**********************************************************************
    If P000S011.FNCG_P_DBOBJGET("0", DBOBJ) <> 0 Then
    End If

    '*** 文言情報取得
    If P000S008.FNCG_P_GET_MULTILANGUAGE_WORD("P001M001", -1, "0", "", w_langmsg) <> 0 Then
    End If

    Session.Add("SL_P001M001_FORM_KBN", "1")
    '*** フレームのデータ部に何の画面が表示されているかを判断するフラグ
    '*** 0：照会情報が表示されている場合
    '*** 1：検索一覧が表示されている場合
	'PCS-バグ#194対応
	If P003S003.IsZensyaRef() Then
		w_skbn = SessionAsStrArray("SG_P_ETCSEC_ALL")(12)
		dispAll = SessionAsStrArray("SG_P_ETCSEC_ALL")(3)
	Else
		w_skbn = SessionAsStrArray("SG_P_ETCSEC")(12)
		dispAll = SessionAsStrArray("SG_P_ETCSEC")(3)
	End If
    
    w_kflg = SessionAsStrArray("SG_P_ENVIR_001")(19)
    w_k_select = SessionAsStr("SG_P_KAISYA_SELECT")
        
    w_khflg = SessionAsStr("SG_P_KAISYA_FLG")
    w_langdt = SessionAsStrArray("SG_P_LANGUAGE")
    w_sysdata = SessionAsStrArray("SG_P_SYSTEM") '*** 社員番号情報

    w_214instchk = P000S012.FNCG_P_INSTCHK(1, 1, 214, 0, 0).ToString() '*** 目標導入チェック（機能レベル）

    w_DateFormat = SessionAsStrArray("SG_P_001INF")(2)

    w_loadflg = 0
    If Not IsNull(P000S001.FNCG_P_NZ(Request.QueryString("loadflg"))) Then
        w_loadflg = 1
    End If

    w_out_flg = "0"
    If Not IsNull(P000S001.FNCG_P_NZ(Request.QueryString("outflg"))) Then
        w_out_flg = "1"
    End If
    
    w_kcnt = 0
    For w_icnt = 1 To 5
        If Mid(w_kflg, w_icnt, 1) = "1" Then
            If w_icnt <> 1 Then
                w_kcnt = w_kcnt + 1
            End If
        End If
    Next

    '******************************************************************
    '* 個人情報の排他解除制御
    '******************************************************************
    If SessionAsStrArray("SL_P001M001_SKBN")(0) = "2" Then        '*** 登録機能時
        P000S013.SUBG_P_HAITASEIGYO(2, "0", 0, "0", "1", "1", "")
    Else
        ' ** 環境設定を取得
        trfKbn = SessionAsStrArray("SG_P_ENVIR_001")(113)
        procDiv = "3"
        dispKbn = P000S001.FNCG_P_NZ(Request.QueryString("dispKbn"))

        ' ** 他機能遷移情報を取得
        sql = " SELECT NVL(F.IDENTIFIER,M.IDENTIFIER)"
        sql = sql & ",NVL(F.SCREEN_NAME,M.SCREEN_NAME)"
        sql = sql & ",M.DISP_ORDER"
        sql = sql & " FROM WEB_TP0000310_M M"
        sql = sql & ",WEB_TP0000311_M F"
        sql = sql & ",WEB_TP0051130_W W"
        sql = sql & " WHERE(M.DIV1 = W.DIV1) AND M.DIV2 = W.DIV2  "
        sql = sql & " AND M.FUNCTION_DIV ='1'"
        sql = sql & " AND M.PROCESS_DIV = :ORA_1 "
        sql = sql & " AND M.FUNCTION_DIV = F.FUNCTION_DIV(+)"
        sql = sql & " AND M.PROCESS_DIV = F.PROCESS_DIV(+)"
        sql = sql & " AND M.IDENTIFIER = F.IDENTIFIER(+)"
        sql = sql & " AND F.LANG_ID(+) = :ORA_2 "
        sql = sql & " AND W.CUSTOMER_ID = :ORA_0 "
        '*** 操作員（社員以外）の場合は研修管理、評価・自己申告、能力開発は非表示に設定。
        If SessionAsStrArray("SG_P_SOUSYA_KBN")(0) = "1" Then
            sql = sql & " AND (M.DIV1,M.DIV2) NOT IN ((126,1),(126,11),(214,2),(214,3),(412,2),(412,11))"
        End If
        sql = sql & " ORDER BY M.DISP_ORDER ASC "

        ReDim w_orapara(1, 2)
        w_orapara(0, 0) = SessionAsStr("SG_P_RID")
        w_orapara(1, 0) = "2"
        w_orapara(0, 1) = "3"
        w_orapara(1, 1) = "2"
        w_orapara(0, 2) = SessionAsStrArray("SG_P_LANGUAGE")(6)
        w_orapara(1, 2) = "2"
          
        If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, trfList) Then
        End If
    End If

    '******************************************************************
    '* 項目スタイル設定
    '******************************************************************
    w_style(0) = ""
    w_style(1) = "id=idfsize10B"
    If w_langdt(6) <> "0" Then
        w_style(0) = "id=idfsize09"
        w_style(1) = "id=idfsize09B"
    End If

    '*** POPUPウィンドウ呼出時の各種情報セット
    If P000S009.FNCG_P_LANG_LIST_HANDAN("11", "", "") = 1 Then
        '* 保存名称の登録言語選択権限の有無によって共通用ポップアップのサイズを判断
        w_popwidth = 850
        w_popheight = 650
    Else
        w_popwidth = 550
        w_popheight = 480
    End If

    If SessionAsStrArray2D("SG_P_COMFLAG")(5, 0) = "1" Then
        w_kstyle = "id=""buttons110"""  '*** 「呼出元機能へ」ボタン
    ElseIf w_langdt(6) = "0" Then   '*** 日本語表示
        w_kstyle = "id=""button05"""  '*** 「移動」ボタン
    Else
        w_kstyle = "id=""buttons50"""
    End If

    '**********************************************************************
    '//**  （処理手順）
    '//**    １．対象者情報の取得
    '//**
    '**********************************************************************

    w_mode = SessionAsStrArray2D("SL_P000KENFLAG")(0, 5)	'*** 検索結果表示モード(0:通常,1:複合適合率)
    '/** Session("SL_P000KENFLAG")：検索共通設定
    '/**  0:検索共通用フラグ
    '/**    0:検索結果画面での検索種類判断区分(SL_P000M008_KEN_KIND)
    '/**    1:各処理中戻り先ＵＲＬ(SL_P003M101_URL1)
    '/**    2:検索結果表示情報(SL_P003M102_KKBN)
    '/**    3:検索結果後の画面(1:通常,2:ｷｰﾜｰﾄﾞ結果表示)
    '/**    4:検索全社時判断(0:優先フラグ参照しない,1:優先フラグ参照する)
    '/**    5:検索結果表示モード(0:通常,1:複合適合率)

    '**********************************************************************
    '* （複合検索）適合率検索結果処理
    '**********************************************************************
    If (w_mode = "1") Then
        Call SUBL_P_TEKIGOU()
    End If

    '**********************************************************************
    '* 通常検索結果処理
    '**********************************************************************
    If (w_mode <> "1") Then

        If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
            '**************************************************************
            '* １５件毎を表示の場合
            '**************************************************************
            w_sdata = SessionAsStrArray("SL_P000KENWORK")        '*** SL_P000KENWORK_02

            '**************************************************************
            '* 次前処理項目
            '**************************************************************
            If SessionAsStr("PSSO_DESIGN") = "1" Then             '*** 新メニュー
                '*** ﾗﾍﾞﾙ(1)：先頭に移動します。
                '*** ﾗﾍﾞﾙ(2)：前に移動します。
                w_btkbn1 = New String() {"onclick=""javascript:JSFL_P_SUBMIT('1');""", " title='" & w_langmsg(0, 1) & "'", _
                    "onclick=""javascript:JSFL_P_SUBMIT('3');""", " title='" & w_langmsg(0, 2) & "'"}
                '*** ﾗﾍﾞﾙ(3)：次に移動します。
                '*** ﾗﾍﾞﾙ(4)：最後に移動します。
                w_btkbn2 = New String() {"onclick=""javascript:JSFL_P_SUBMIT('4');""", " title='" & w_langmsg(0, 3) & "'", _
                    "onclick=""javascript:JSFL_P_SUBMIT('2');""", " title='" & w_langmsg(0, 4) & "'"}

                w_chkset = VBSplit(w_sdata(0), "-", -1, 0)(CInt(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1)))
                If SessionAsStrArray2D("SL_P000KENFLAG")(2, 1) = "0" Then
                    '*** ﾗﾍﾞﾙ(5)：移動できません。
                    '*** ﾗﾍﾞﾙ(6)：移動できません。
                    w_btkbn1 = New String() {"""""", " disabled title='" & w_langmsg(0, 5) & "'", _
                        """""", " disabled title='" & w_langmsg(0, 6) & "'"}
                End If

                If SessionAsStrArray2D("SL_P000KENFLAG")(2, 1) = SessionAsStrArray2D("SL_P000KENFLAG")(2, 0) Then
                    '*** ﾗﾍﾞﾙ(7)：移動できません。
                    '*** ﾗﾍﾞﾙ(8)：移動できません。
                    w_btkbn2 = New String() {"""""", " disabled title='" & w_langmsg(0, 7) & "'", _
                        """""", " disabled title='" & w_langmsg(0, 8) & "'"}
                End If

            Else                                    '*** 旧メニュー
                '*** ﾗﾍﾞﾙ(9)：先頭に移動します。
                '*** ﾗﾍﾞﾙ(10)：前に移動します。
                w_btkbn1 = New String() {"javascript:JSFL_P_SUBMIT('1');", " title='" & w_langmsg(0, 9) & "'", _
                    "javascript:JSFL_P_SUBMIT('3');", " title='" & w_langmsg(0, 10) & "'"}
                '*** ﾗﾍﾞﾙ(11)：次に移動します。
                '*** ﾗﾍﾞﾙ(12)：最後に移動します。
                w_btkbn2 = New String() {"javascript:JSFL_P_SUBMIT('4');", " title='" & w_langmsg(0, 11) & "'", _
                    "javascript:JSFL_P_SUBMIT('2');", " title='" & w_langmsg(0, 12) & "'"}
                w_chkset = VBSplit(w_sdata(0), "-", -1, 0)(CInt(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1)))
                w_btnbit = "1111"
                If SessionAsStrArray2D("SL_P000KENFLAG")(2, 1) = "0" Then
                    '*** ﾗﾍﾞﾙ(13)：移動できません。
                    '*** ﾗﾍﾞﾙ(14)：移動できません。
                    w_btkbn1 = New String() {"#", " disabled title='" & w_langmsg(0, 13) & "'", _
                        "#", " disabled title='" & w_langmsg(0, 14) & "'"}
                    w_btnbit = "00" & Mid(w_btnbit, 3)
                End If
                If SessionAsStrArray2D("SL_P000KENFLAG")(2, 1) = SessionAsStrArray2D("SL_P000KENFLAG")(2, 0) Then
                    '*** ﾗﾍﾞﾙ(15)：移動できません。
                    '*** ﾗﾍﾞﾙ(16)：移動できません。
                    w_btkbn2 = New String() {"#", " disabled title='" & w_langmsg(0, 15) & "'", _
                        "#", " disabled title='" & w_langmsg(0, 16) & "'"}
                    w_btnbit = Mid(w_btnbit, 1, 2) & "00"
                End If
            End If

            '**************************************************************
            '* ページ描画方法の切替
            '**************************************************************
            w_posit = CLng(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1)) + 1 & "/" & CLng(SessionAsStrArray2D("SL_P000KENFLAG")(2, 0)) + 1

            w_chkevent = "OnChange=""return JSFL_P_CHGPAGE(this,0)"" OnBlur=""return JSFL_P_CHGPAGE(this,1)"" onKeyPress=""if(event.keyCode==13){ JSFL_P_CHGPAGE(this,2); return false; }"""
            w_kopt(0) = SessionAsStrArray("SG_P_003INF")(4)

            '**************************************************************
            '* 一致検索の場合
            '**************************************************************
            DBOBJ.Parameters.Remove("ORA_ARRAY")
            DBOBJ.Parameters.Remove("ORA_OPT")
            DBOBJ.Parameters.Add(("ORA_ARRAY"), 0, OraConst.ORAPARM_BOTH)
            DBOBJ.Parameters.AddTable("ORA_OPT", OraConst.ORAPARM_INPUT, OraConst.ORATYPE_VARCHAR2, 4, 4)
            w_array = DirectCast(DBOBJ.Parameters("ORA_ARRAY"), OraParameter)
            w_opt = DirectCast(DBOBJ.Parameters("ORA_OPT"), OraParamArray)
            For w_icnt = 0 To UBound(w_kopt)
                w_opt.Put_Value(w_kopt(w_icnt), w_icnt)
            Next

            For w_icnt = 0 To UBound(w_data)
                DBOBJ.Parameters.Remove("ORA_DATA" & w_icnt)
                Select Case w_icnt
                    Case 0
                        DBOBJ.Parameters.AddTable("ORA_DATA0", OraConst.ORAPARM_OUTPUT, OraConst.ORATYPE_VARCHAR2, 15, 10)
                    Case 1
                        DBOBJ.Parameters.AddTable("ORA_DATA1", OraConst.ORAPARM_OUTPUT, OraConst.ORATYPE_VARCHAR2, 15, 220)
                    Case 2
                        DBOBJ.Parameters.AddTable("ORA_DATA2", OraConst.ORAPARM_OUTPUT, OraConst.ORATYPE_VARCHAR2, 15, 300)
                    Case 3
                        DBOBJ.Parameters.AddTable("ORA_DATA3", OraConst.ORAPARM_OUTPUT, OraConst.ORATYPE_VARCHAR2, 15, 2000)
                    Case 4
                        DBOBJ.Parameters.AddTable("ORA_DATA4", OraConst.ORAPARM_OUTPUT, OraConst.ORATYPE_VARCHAR2, 15, 150)
                    Case 5
                        DBOBJ.Parameters.AddTable("ORA_DATA5", OraConst.ORAPARM_OUTPUT, OraConst.ORATYPE_VARCHAR2, 15, 20)
                    Case 6
                        DBOBJ.Parameters.AddTable("ORA_DATA6", OraConst.ORAPARM_OUTPUT, OraConst.ORATYPE_VARCHAR2, 15, 200)
                    Case 7
                        DBOBJ.Parameters.AddTable("ORA_DATA7", OraConst.ORAPARM_OUTPUT, OraConst.ORATYPE_VARCHAR2, 15, 200)
                    Case 8
                        DBOBJ.Parameters.AddTable("ORA_DATA8", OraConst.ORAPARM_OUTPUT, OraConst.ORATYPE_VARCHAR2, 15, 200)
                End Select
                w_data(w_icnt) = DirectCast(DBOBJ.Parameters("ORA_DATA" & w_icnt), OraParamArray)
            Next
            sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP0030060_P.WEB_SP0030060_S("
            sql = sql & ":ORA_OPT,"
            sql = sql & "" & SessionAsStr("SG_P_RID") & ","
            sql = sql & P000S001.FNCG_P_CANGEVALUE(102, SessionAsStr("SG_P_UPDID")) & ","
        
            '全社または権限ありの場合は、会社名を一覧に表示する(WEB_SP0030060_Sは、第4引数が 0 でないと、会社名を返さないため)
            If IsZensyaMode() Then
                sql = sql & "" & P000S001.FNCG_P_CANGEVALUE(101, "0") & ","
            Else
                sql = sql & "" & P000S001.FNCG_P_CANGEVALUE(101, w_k_select) & ","
            End If
        
            sql = sql & "'" & VBSplit(w_sdata(1), "=", -1, 0)(CInt(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1))) & ",',"
            sql = sql & "'" & VBSplit(w_sdata(2), "-", -1, 0)(CInt(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1))) & ",',"
            sql = sql & "'" & VBSplit(w_sdata(3), "-", -1, 0)(CInt(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1))) & ",',"
            sql = sql & ":ORA_ARRAY,"
            sql = sql & ":ORA_DATA0,"
            sql = sql & ":ORA_DATA1,"
            sql = sql & ":ORA_DATA2,"
            sql = sql & ":ORA_DATA3,"
            sql = sql & ":ORA_DATA4,"
            sql = sql & ":ORA_DATA5,"
            sql = sql & ":ORA_DATA6,"
            sql = sql & ":ORA_DATA7,"
            sql = sql & ":ORA_DATA8); END;"
            DBOBJ.DbExecuteSQL(sql)
            If CInt(w_array.Value) = -1 Then
                Response.Write("err2")
            Else
                ReDim PE_ComVars.Instance.w_fdata2D(UBound(w_data), CInt(w_array.Value) - 1)
                For w_icnt = 0 To CInt(w_array.Value) - 1
                    w_i = 0
                    For w_jcnt = 0 To UBound(w_data)
                        PE_ComVars.Instance.w_fdata2D(w_jcnt, w_icnt) = CStr(w_data(w_jcnt).Get_Value(w_icnt))
                    Next
                Next
                If w_langdt(6) <> "0" Then
                    sql = "SELECT EMP_NUMBER,NAME,NAME_KANA,BELONG_NAME,ABBREVIATION,BELONG_CODE,POST,GRADE,CORP"
                    sql = sql & " FROM  " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030110_W"
                    sql = sql & " WHERE CUSTOMER_ID=:ORA_0"
                    sql = sql & " ORDER BY IDENTIFIER"
                    ReDim w_orapara(2, 0)
                    w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                    w_orapara(1, 0) = "2"
                    If P000S011.FNCG_P_RECORDSET5(9, sql, w_orapara, w_wdata) Then
                        For w_icnt = 0 To UBound(w_wdata, 2)
                            For w_jcnt = 0 To UBound(w_wdata, 1)
                                PE_ComVars.Instance.w_fdata2D(w_jcnt, w_icnt) = w_wdata(w_jcnt, w_icnt)
                            Next
                        Next
                    End If
                End If
            End If
            DBOBJ.Parameters.Remove("ORA_ARRAY")
            DBOBJ.Parameters.Remove("ORA_OPT")
            For w_icnt = 0 To UBound(w_data)
                DBOBJ.Parameters.Remove("ORA_DATA" & w_icnt)
            Next

        Else
            '**************************************************************
            '* 全件を表示の場合
            '**************************************************************

            w_sdata = SessionAsStrArray("SL_P000KENWORK")
            '*** SL_P000KENWORK_02
            ReDim PE_ComVars.Instance.w_fdata2D(4, CInt(SessionAsStrArray2D("SL_P000KENFLAG")(2, 2)) - 1)

            '*** 本務情報
            sql = "SELECT B.F001,B.F002,B.F003,B.F004,A.DIV,A.ANOTHER_POST_DIV,A.ISSUE_DATE"
            If w_langdt(6) <> "0" Then
                sql = sql & ",NVL(K2L.KAISYANM,K2.KAISYANM)"
            Else
                sql = sql & ",K2.KAISYANM"
            End If
            If SessionAsStrArray("SG_P_003INF")(2) = "3" Then
                sql = sql & ",C.F001,C.F002,C.F003"
            End If
            w_fcnt = 0
            For w_icnt = 1 To 5
                If Mid(w_kflg, w_icnt, 1) = "1" Then
                    Select Case w_icnt
                        Case 2
                            If w_langdt(6) <> "0" Then
                                sql = sql & ",NVL(EL.ABBREVIATION,E.ABBREVIATION)"
                            Else
                                sql = sql & ",E.ABBREVIATION"
                            End If
                        Case 3
                            sql = sql & ",F.SALARY_BELONG_CODE"
                        Case 4
                            If w_langdt(6) <> "0" Then
                                sql = sql & ",WEB_SP0002418_F(H.KAISYACD,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,H.POST_DIV_CODE,'',NULL,NULL,H.ISSUE_DATE,:ORA_1)"
                            Else
                                If P000S015.FNCG_P_MSTLIST_HANDAN("15") = "1" Then                                '*** マスタの履歴化する
                                    sql = sql & ",WEB_SP0002415_F(H.KAISYACD,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,H.POST_DIV_CODE,'',NULL,NULL,H.ISSUE_DATE)"
                                Else
                                    sql = sql & ",I.TEXT1"
                                End If
                            End If
                        Case 5
                            If w_langdt(6) <> "0" Then
                                sql = sql & ",WEB_SP0002418_F(J.KAISYACD,2,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,J.GRADE_CODE,'',NULL,NULL,J.ISSUE_DATE,:ORA_1)"
                            Else
                                If P000S015.FNCG_P_MSTLIST_HANDAN("17") = "1" Then                                '*** マスタの履歴化する
                                    sql = sql & ",WEB_SP0002415_F(J.KAISYACD,2,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,J.GRADE_CODE,'',NULL,NULL,J.ISSUE_DATE)"
                                Else
                                    sql = sql & ",K.TEXT1"
                                End If
                            End If
                    End Select
                End If
            Next
            sql = sql & ",S1.SYAINCD FOR_SORTING"
            If SessionAsStrArray("SG_P_003INF")(2) = "4" Then
                sql = sql & ",S1.NAME_ALPHABET NAME_ALPHABET"
            End If
            '***sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & " A"
            sql = sql & " FROM (SELECT DISTINCT * FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & ") A"
            sql = sql & "    ,(SELECT A1.EMP_CODE    F001"
            'sql = sql & "             ,A1.氏名        F002"
            sql = sql & "            ,WEB_SP0002471_F(2,A1.EMP_CODE,0,1,NULL,'" & w_langdt(0) & "','" & w_langdt(4) & "','" & w_langdt(8) & "','" & SessionAsStr("SG_P_SID") & "') F002"
            sql = sql & "             ,A1.NAME_KANA    F003"
            If w_langdt(6) <> "0" Then
                sql = sql & "             ,WEB_SP0002151_F(1,26,B1.EMP_CODE,TO_DATE('" & SessionAsStr("SG_P_TDATE") & "','YYYY/MM/DD'),:ORA_1)    F004"
            Else
                sql = sql & "             ,WEB_SP0002150_F(1,26,B1.EMP_CODE,TO_DATE('" & SessionAsStr("SG_P_TDATE") & "','YYYY/MM/DD'))    F004"
            End If
            sql = sql & "             ,A1.EMP_CODE    W001"
            sql = sql & "         FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO A1"
            sql = sql & "            , " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0001111 B1"
            sql = sql & "        WHERE A1.EMP_CODE = B1.EMP_CODE(+)) B"
            sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO K1"
            sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "KAISYA_MS K2"
            If w_langdt(6) <> "0" Then
                sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "KAISYA_L_MS K2L"
            End If
            If SessionAsStrArray("SG_P_003INF")(2) = "3" Then
                If P000S015.FNCG_P_MSTLIST_HANDAN("15") = "1" Then                '*** マスタの履歴化する
                    sql = sql & ",(SELECT "
                    sql = sql & "    NVL(D2.TOTAL_DISP_ORDER,99999) F001,"
                    sql = sql & "   NVL(TO_NUMBER(WEB_SP0002415_F(A2.KAISYACD,3,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,C2.POST_DIV_CODE,'',NULL,NULL,C2.ISSUE_DATE)),999) F002,"
                    sql = sql & "   NVL(WEB_SP0002415_F(A2.KAISYACD,1,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,C2.POST_DIV_CODE,'',NULL,NULL,C2.ISSUE_DATE),'ZZZZ') F003,"
                    sql = sql & "    A2.EMP_CODE F004,"
                    sql = sql & "    A2.EMP_CODE W001"
                    sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO A2,"
                    sql = sql & "          " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0001111 B2,"
                    sql = sql & "          " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0001150 C2,"
                    sql = sql & "          " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER D2"
                    sql = sql & "    WHERE A2.EMP_CODE = B2.EMP_CODE(+)"
                    sql = sql & "      AND A2.EMP_CODE = C2.EMP_CODE(+)"
                    sql = sql & "     AND B2.KAISYACD = D2.KAISYACD(+)"
                    sql = sql & "     AND D2.AGE_NUMBER(+) = WEB_SP0002022_F(B2.KAISYACD,0,1,SYSDATE)"
                    sql = sql & "      AND B2.DEPT_RANK = D2.RANK(+)"
                    sql = sql & "      AND B2.DEPT_CODE = D2.CODE_VALUE (+)) C"
                Else
                    sql = sql & ",(SELECT "
                    sql = sql & "  NVL(D1.TOTAL_DISP_ORDER,99999)        F001,"
                    sql = sql & "  NVL(E1.NUMBER1,999)                F002,"
                    sql = sql & "  NVL(C1.POST_DIV_CODE,'ZZZZ')    F003,"
                    sql = sql & "  A1.EMP_CODE                    F004,"
                    sql = sql & "  A1.EMP_CODE                    W001"
                    sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO A1"
                    sql = sql & "       , " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0001111 B1"
                    sql = sql & "       , " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0001150 C1"
                    sql = sql & "       , " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER D1"
                    sql = sql & "       , " & SessionAsStr("SG_C_DBUSER1") & "V_M_POST E1"
                    sql = sql & "   WHERE A1.EMP_CODE = B1.EMP_CODE(+)"
                    sql = sql & "     AND A1.EMP_CODE = C1.EMP_CODE(+)"
                    sql = sql & "     AND B1.KAISYACD = D1.KAISYACD(+)"
                    sql = sql & "     AND D1.AGE_NUMBER(+) = WEB_SP0002022_F(B1.KAISYACD,0,1,SYSDATE)"
                    sql = sql & "     AND B1.DEPT_RANK = D1.RANK(+)"
                    sql = sql & "     AND B1.DEPT_CODE = D1.CODE_VALUE(+)"
                    sql = sql & "     AND C1.POST_DIV_CODE = E1.CODE_VALUE(+)"
                    sql = sql & "     AND C1.KAISYACD = E1.KAISYACD(+)) C"
                End If
            End If
            For w_icnt = 1 To 5
                If Mid(w_kflg, w_icnt, 1) = "1" Then
                    Select Case w_icnt
                        Case 2
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO D"
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS E"
                            If w_langdt(6) <> "0" Then
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_L EL"
                            End If
                        Case 3
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO G"
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER F"
                        Case 4
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_POST_HISTORY_INFO H"
                            If P000S015.FNCG_P_MSTLIST_HANDAN("15") <> "1" Then                            '*** マスタの履歴化する
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_POST I"
                            End If
                        Case 5
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO J"
                            If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then                            '*** マスタの履歴化する
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_JOB_GRADE K"
                            End If
                    End Select
                End If
            Next
            sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO S1"
            sql = sql & " WHERE A.ANOTHER_POST_DIV = '0'"
            sql = sql & "   AND A.EMP_CODE = K1.EMP_CODE"
            sql = sql & "   AND K1.KAISYACD = K2.KAISYACD(+)"
            If w_langdt(6) <> "0" Then
                sql = sql & "   AND K2.KAISYACD = K2L.KAISYACD(+)"
                sql = sql & "   AND K2L.LANGUAGEID(+) =:ORA_1"
            End If
            sql = sql & "   AND A.EMP_CODE = B.F001 (+)"
            If SessionAsStrArray("SG_P_003INF")(2) = "3" Then
                sql = sql & "   AND A.EMP_CODE = C.W001 (+)"
            End If
            For w_icnt = 1 To 5
                If Mid(w_kflg, w_icnt, 1) = "1" Then
                    Select Case w_icnt
                        Case 2
                            sql = sql & "   AND A.EMP_CODE = D.EMP_CODE(+)"
                            sql = sql & "   AND A.ANOTHER_POST_DIV = D.ANOTHER_POST_DIV(+)"
                            sql = sql & "   AND D.ISSUE_DATE(+) <= :ORA_0"
                            sql = sql & "   AND D.END_DAY(+) >= :ORA_0"
                            sql = sql & "   AND D.DEPT_CODE = E.CODE_VALUE(+)"
                            sql = sql & "   AND D.DEPT_RANK = E.RANK(+)"
                            sql = sql & "   AND D.KAISYACD = E.KAISYACD(+)"
                            If w_langdt(6) <> "0" Then
                                sql = sql & "   AND E.KAISYACD = EL.KAISYACD(+)"
                                sql = sql & "   AND E.RANK = EL.RANK(+)"
                                sql = sql & "   AND E.CODE_VALUE = EL.CODE_VALUE(+)"
                                sql = sql & "   AND EL.LANG_ID(+)=:ORA_1"
                            End If
                        Case 3
                            sql = sql & "   AND A.EMP_CODE = G.EMP_CODE(+)"
                            sql = sql & "   AND A.ANOTHER_POST_DIV = G.ANOTHER_POST_DIV(+)"
                            sql = sql & "   AND G.ISSUE_DATE(+) <= :ORA_0"
                            sql = sql & "   AND G.END_DAY(+) >= :ORA_0"
                            sql = sql & "   AND G.DEPT_CODE = F.CODE_VALUE(+)"
                            sql = sql & "   AND G.DEPT_RANK = F.RANK(+)"
                            sql = sql & "   AND G.KAISYACD = F.KAISYACD(+)"
                            sql = sql & "   AND F.AGE_NUMBER(+) = WEB_SP0002022_F(G.KAISYACD,0,1,SYSDATE)"
                        Case 4
                            sql = sql & "   AND A.EMP_CODE = H.EMP_CODE(+)"
                            sql = sql & "   AND H.ISSUE_DATE(+) <= :ORA_0"
                            sql = sql & "   AND H.END_DAY(+) >= :ORA_0"
                            If P000S015.FNCG_P_MSTLIST_HANDAN("15") <> "1" Then                            '*** マスタの履歴化する
                                sql = sql & "   AND H.POST_DIV_CODE = I.CODE_VALUE(+)"
                                sql = sql & "   AND H.KAISYACD = I.KAISYACD(+)"
                            End If
                        Case 5
                            sql = sql & "   AND A.EMP_CODE = J.EMP_CODE(+)"
                            sql = sql & "   AND J.ISSUE_DATE(+) <= :ORA_0"
                            sql = sql & "   AND J.END_DAY(+) >= :ORA_0"
                            If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then                            '*** マスタの履歴化する
                                sql = sql & "   AND J.GRADE_CODE = K.CODE_VALUE(+)"
                                sql = sql & "   AND J.KAISYACD = K.KAISYACD(+)"
                            End If
                    End Select
                End If
            Next
            sql = sql & "   AND A.EMP_CODE = S1.EMP_CODE"
            '*** 兼務情報
            If SessionAsStrArray("SG_P_003INF")(4) = "1" Then
                sql = sql & " UNION"
                sql = sql & " SELECT B.F001,B.F002,B.F003,B.F004,A.DIV,A.ANOTHER_POST_DIV,A.ISSUE_DATE"
                If w_langdt(6) <> "0" Then
                    sql = sql & ",NVL(K2L.KAISYANM,K2.KAISYANM)"
                Else
                    sql = sql & ",K2.KAISYANM"
                End If
                If SessionAsStrArray("SG_P_003INF")(2) = "3" Then
                    sql = sql & ",C.F001,C.F002,C.F003"
                End If
                For w_icnt = 1 To 5
                    If Mid(w_kflg, w_icnt, 1) = "1" Then
                        Select Case w_icnt
                            Case 2
                                If w_langdt(6) <> "0" Then
                                    sql = sql & ",NVL(EL.ABBREVIATION,E.ABBREVIATION)"
                                Else
                                    sql = sql & ",E.ABBREVIATION"
                                End If
                            Case 3
                                sql = sql & ",F.SALARY_BELONG_CODE"
                            Case 4
                                If w_langdt(6) <> "0" Then
                                    sql = sql & ",WEB_SP0002418_F(H.KAISYACD,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,H.POST_DIV_CODE,'',NULL,NULL,H.ISSUE_DATE,:ORA_1)"
                                Else
                                    If P000S015.FNCG_P_MSTLIST_HANDAN("15") = "1" Then                                    '*** マスタの履歴化する
                                        sql = sql & ",WEB_SP0002415_F(H.KAISYACD,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,H.POST_DIV_CODE,'',NULL,NULL,H.ISSUE_DATE)"
                                    Else
                                        sql = sql & ",I.TEXT1"
                                    End If
                                End If
                            Case 5
                                If w_langdt(6) <> "0" Then
                                    sql = sql & ",WEB_SP0002418_F(J.KAISYACD,2,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,J.GRADE_CODE,'',NULL,NULL,J.ISSUE_DATE,:ORA_1)"
                                Else
                                    If P000S015.FNCG_P_MSTLIST_HANDAN("17") = "1" Then                                    '*** マスタの履歴化する
                                        sql = sql & ",WEB_SP0002415_F(J.KAISYACD,2,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,J.GRADE_CODE,'',NULL,NULL,J.ISSUE_DATE)"
                                    Else
                                        sql = sql & ",K.TEXT1"
                                    End If
                                End If
                        End Select
                    End If
                Next
                sql = sql & ",S1.SYAINCD FOR_SORTING"
                If SessionAsStrArray("SG_P_003INF")(2) = "4" Then
                    sql = sql & ",S1.NAME_ALPHABET NAME_ALPHABET"
                End If
                '***sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & " A"
                sql = sql & " FROM (SELECT DISTINCT * FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & ") A"
                sql = sql & "    ,(SELECT A1.EMP_CODE    F001"
                'sql = sql & "             ,A1.氏名        F002"
                sql = sql & "            ,WEB_SP0002471_F(2,A1.EMP_CODE,0,1,NULL,'" & w_langdt(0) & "','" & w_langdt(4) & "','" & w_langdt(8) & "','" & SessionAsStr("SG_P_SID") & "') F002"
                sql = sql & "             ,A1.NAME_KANA    F003"
                If w_langdt(6) <> "0" Then
                    sql = sql & "             ,WEB_SP0002042_F(B1.ANOTHER_POST_DIV,B1.DEPT_RANK,C1.DISP_FLAG,NVL(B1L.DEPT_NAME1,B1.DEPT_NAME1),NVL(B1L.BELONG_NAME,B1.BELONG_NAME))    F004"
                Else
                    sql = sql & "             ,WEB_SP0002040_F(B1.ANOTHER_POST_DIV,B1.DEPT_RANK,C1.DISP_FLAG,B1.DEPT_NAME1,B1.BELONG_NAME)    F004"
                End If
                '***sql = sql & "             ,WEB_SP0002150_F(1,26,B1.社員コード,TO_DATE('" & SessionAsStr("SG_P_TDATE") & "','YYYY/MM/DD'))    F004"
                sql = sql & "             ,A1.EMP_CODE    W001"
                sql = sql & "             ,B1.ANOTHER_POST_DIV    W002"
                sql = sql & "             ,B1.ISSUE_DATE        W003"
                sql = sql & "         FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO A1"
                sql = sql & "            , " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0001110 B1"
                If w_langdt(6) <> "0" Then
                    sql = sql & "            , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO_L B1L"
                End If
                sql = sql & "            , " & SessionAsStr("SG_C_DBUSER1") & "DEPT_CORP_COLLABO_MS C1"
                sql = sql & "        WHERE A1.EMP_CODE = B1.EMP_CODE(+)"
                sql = sql & "          AND B1.KAISYACD = C1.KAISYACD(+)"
                sql = sql & "          AND B1.DEPT_CODE1 = C1.DEPT_CODE(+)"
                sql = sql & "          AND B1.ANOTHER_POST_DIV(+) <> '0'"
                If w_langdt(6) <> "0" Then
                    sql = sql & "          AND B1.EMP_CODE = B1L.EMP_CODE(+)"
                    sql = sql & "          AND B1.ANOTHER_POST_DIV = B1L.ANOTHER_POST_DIV(+)"
                    sql = sql & "          AND B1.ISSUE_DATE = B1L.ISSUE_DATE(+)"
                    sql = sql & "          AND B1L.LANG_ID(+) =:ORA_1"
                End If
                sql = sql & ") B"
                sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO K1"
                sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "KAISYA_MS K2"
                If w_langdt(6) <> "0" Then
                    sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "KAISYA_L_MS K2L"
                End If
                If SessionAsStrArray("SG_P_003INF")(2) = "3" Then
                    If P000S015.FNCG_P_MSTLIST_HANDAN("15") = "1" Then                    '*** マスタの履歴化する
                        sql = sql & ",(SELECT "
                        sql = sql & "    NVL(B2.TOTAL_DISP_ORDER,99999) F001,"
                        sql = sql & "   NVL(TO_NUMBER(WEB_SP0002415_F(A2.KAISYACD,3,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A2.POST_DIV_CODE,'',NULL,NULL,A2.ISSUE_DATE)),999) F002,"
                        sql = sql & "   NVL(WEB_SP0002415_F(A2.KAISYACD,1,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A2.POST_DIV_CODE,'',NULL,NULL,A2.ISSUE_DATE),'ZZZZ') F003,"
                        sql = sql & "    A2.EMP_CODE F004,"
                        sql = sql & "    A2.EMP_CODE W001,"
                        sql = sql & "    A2.ANOTHER_POST_DIV W002,"
                        sql = sql & "    A2.ISSUE_DATE W003"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0001110 A2,"
                        sql = sql & "          " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER B2"
                        sql = sql & "    WHERE A2.ANOTHER_POST_DIV <> '0'"
                        sql = sql & "     AND A2.KAISYACD = B2.KAISYACD(+)"
                        sql = sql & "     AND B2.AGE_NUMBER(+) = WEB_SP0002022_F(A2.KAISYACD,0,1,SYSDATE)"
                        sql = sql & "      AND A2.DEPT_RANK = B2.RANK(+)"
                        sql = sql & "      AND A2.DEPT_CODE = B2.CODE_VALUE(+)) C"
                    Else
                        sql = sql & ",(SELECT "
                        sql = sql & "  NVL(B1.TOTAL_DISP_ORDER,99999)        F001,"
                        sql = sql & "  NVL(C1.NUMBER1,999)                F002,"
                        sql = sql & "  NVL(A1.POST_DIV_CODE,'ZZZZ')    F003,"
                        sql = sql & "  A1.EMP_CODE                    F004,"
                        sql = sql & "  A1.EMP_CODE                    W001,"
                        sql = sql & "  A1.ANOTHER_POST_DIV                    W002,"
                        sql = sql & "  A1.ISSUE_DATE                        W003"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0001110 A1"
                        sql = sql & "       , " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER B1"
                        sql = sql & "       , " & SessionAsStr("SG_C_DBUSER1") & "V_M_POST C1"
                        sql = sql & "   WHERE A1.ANOTHER_POST_DIV <> '0'"
                        sql = sql & "     AND A1.KAISYACD = B1.KAISYACD(+)"
                        sql = sql & "     AND B1.AGE_NUMBER(+) = WEB_SP0002022_F(A1.KAISYACD,0,1,SYSDATE)"
                        sql = sql & "     AND A1.DEPT_RANK = B1.RANK(+)"
                        sql = sql & "     AND A1.DEPT_CODE = B1.CODE_VALUE(+)"
                        sql = sql & "     AND A1.POST_DIV_CODE = C1.CODE_VALUE(+)"
                        sql = sql & "     AND A1.KAISYACD = C1.KAISYACD(+)) C"
                    End If
                End If
                For w_icnt = 1 To 5
                    If Mid(w_kflg, w_icnt, 1) = "1" Then
                        Select Case w_icnt
                            Case 2
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO D"
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS E"
                                If w_langdt(6) <> "0" Then
                                    sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_L EL"
                                End If
                            Case 3
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO G"
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER F"
                            Case 4
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO H"
                                If P000S015.FNCG_P_MSTLIST_HANDAN("15") <> "1" Then                                '*** マスタの履歴化する
                                    sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_POST I"
                                End If
                            Case 5
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO J"
                                If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then                                '*** マスタの履歴化する
                                    sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_JOB_GRADE K"
                                End If
                        End Select
                    End If
                Next
                sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO S1"
                sql = sql & " WHERE A.ANOTHER_POST_DIV <> '0'"
                sql = sql & "   AND A.EMP_CODE = K1.EMP_CODE"
                sql = sql & "   AND K1.KAISYACD = K2.KAISYACD(+)"
                If w_langdt(6) <> "0" Then
                    sql = sql & "   AND K2.KAISYACD = K2L.KAISYACD(+)"
                    sql = sql & "   AND K2L.LANGUAGEID(+) =:ORA_1"
                End If
                sql = sql & "   AND A.EMP_CODE = B.W001"
                sql = sql & "   AND A.ANOTHER_POST_DIV = B.W002"
                sql = sql & "   AND A.ISSUE_DATE = B.W003"
                If SessionAsStrArray("SG_P_003INF")(2) = "3" Then
                    sql = sql & "   AND A.EMP_CODE = C.W001"
                    sql = sql & "   AND A.ANOTHER_POST_DIV = C.W002"
                    sql = sql & "   AND A.ISSUE_DATE = C.W003"
                End If
                For w_icnt = 1 To 5
                    If Mid(w_kflg, w_icnt, 1) = "1" Then
                        Select Case w_icnt
                            Case 2
                                sql = sql & "   AND A.EMP_CODE = D.EMP_CODE(+)"
                                sql = sql & "   AND A.ANOTHER_POST_DIV = D.ANOTHER_POST_DIV(+)"
                                sql = sql & "   AND A.ISSUE_DATE = D.ISSUE_DATE(+)"
                                sql = sql & "   AND D.DEPT_CODE = E.CODE_VALUE(+)"
                                sql = sql & "   AND D.DEPT_RANK = E.RANK(+)"
                                sql = sql & "   AND D.KAISYACD = E.KAISYACD(+)"
                                If w_langdt(6) <> "0" Then
                                    sql = sql & "   AND E.KAISYACD = EL.KAISYACD(+)"
                                    sql = sql & "   AND E.RANK = EL.RANK(+)"
                                    sql = sql & "   AND E.CODE_VALUE = EL.CODE_VALUE(+)"
                                    sql = sql & "   AND EL.LANG_ID(+)=:ORA_1"
                                End If
                            Case 3
                                sql = sql & "   AND A.EMP_CODE = G.EMP_CODE(+)"
                                sql = sql & "   AND A.ANOTHER_POST_DIV = G.ANOTHER_POST_DIV(+)"
                                sql = sql & "   AND A.ISSUE_DATE = G.ISSUE_DATE(+)"
                                sql = sql & "   AND G.DEPT_CODE1 = F.CODE_VALUE(+)"
                                sql = sql & "   AND G.DEPT_RANK = F.RANK(+)"
                                sql = sql & "   AND G.KAISYACD = F.KAISYACD(+)"
                                sql = sql & "   AND F.AGE_NUMBER(+) = WEB_SP0002022_F(G.KAISYACD,0,1,SYSDATE)"
                            Case 4
                                sql = sql & "   AND A.EMP_CODE = H.EMP_CODE"
                                sql = sql & "   AND A.ANOTHER_POST_DIV = H.ANOTHER_POST_DIV"
                                sql = sql & "   AND A.ISSUE_DATE = H.ISSUE_DATE(+)"
                                If P000S015.FNCG_P_MSTLIST_HANDAN("15") <> "1" Then                                '*** マスタの履歴化する
                                    sql = sql & "   AND H.POST_DIV_CODE = I.CODE_VALUE(+)"
                                    sql = sql & "   AND H.KAISYACD = I.KAISYACD(+)"
                                End If
                            Case 5
                                sql = sql & "   AND A.EMP_CODE = J.EMP_CODE(+)"
                                sql = sql & "   AND J.ISSUE_DATE(+) <= :ORA_0"
                                sql = sql & "   AND J.END_DAY(+) >= :ORA_0"
                                If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then                                '*** マスタの履歴化する
                                    sql = sql & "   AND J.GRADE_CODE = K.CODE_VALUE(+)"
                                    sql = sql & "   AND J.KAISYACD = K.KAISYACD(+)"
                                End If
                        End Select
                    End If
                Next
                sql = sql & "   AND A.EMP_CODE = S1.EMP_CODE"
            End If
            Select Case SessionAsStrArray("SG_P_003INF")(2)
                Case "1"
                    sql = sql & " ORDER BY FOR_SORTING,6"
                    w_fcnt = w_kcnt + 8
                Case "2"
                    sql = sql & " ORDER BY 3,FOR_SORTING,6"
                    w_fcnt = w_kcnt + 8
                Case "3"
                    sql = sql & " ORDER BY 9,10,11,FOR_SORTING,6"
                    w_fcnt = w_kcnt + 11
                Case "4"
                    sql = sql & " ORDER BY NAME_ALPHABET,FOR_SORTING,6"
                    w_fcnt = w_kcnt + 9
            End Select
            ReDim w_orapara(2, 1)
            w_orapara(0, 0) = SessionAsStr("SG_P_TDATE")
            w_orapara(1, 0) = "12"
            w_orapara(0, 1) = w_langdt(6)
            w_orapara(1, 1) = "2"
            If P000S011.FNCG_P_RECORDSET5(w_fcnt, sql, w_orapara, PE_ComVars.Instance.w_fdata2D) Then
            End If
            If IsNull(w_sdata(0)) Then
                w_sdata(0) = ""
                w_sdata(1) = ""
                w_sdata(2) = ""
                w_sdata(3) = ""
                w_sdata(4) = ""
                For w_icnt = 0 To UBound(PE_ComVars.Instance.w_fdata2D, 2)
                    If SessionAsStrArray("SG_P_003INF")(7) = "1" Then
                        w_sdata(0) = w_sdata(0) & "1"
                    Else
                        w_sdata(0) = w_sdata(0) & "0"
                    End If
                    w_sdata(1) = w_sdata(1) & "," & PE_ComVars.Instance.w_fdata2D(0, w_icnt)
                    w_sdata(2) = w_sdata(2) & "," & PE_ComVars.Instance.w_fdata2D(5, w_icnt)
                    w_sdata(3) = w_sdata(3) & "," & PE_ComVars.Instance.w_fdata2D(6, w_icnt)
                    w_sdata(4) = w_sdata(4) & "," & PE_ComVars.Instance.w_fdata2D(4, w_icnt)
                Next
                w_sdata(1) = Mid(w_sdata(1), 2)
                w_sdata(2) = Mid(w_sdata(2), 2)
                w_sdata(3) = Mid(w_sdata(3), 2)
                w_sdata(4) = Mid(w_sdata(4), 2)
            End If
            Session.Add("SL_P000KENWORK", w_sdata)
            '*** SL_P000KENWORK_02
        End If
    End If

    '**********************************************************************
    '//**   ３・一覧画面の表示
    '//**       HTMLの書き出し
    '//**
    '**********************************************************************
%>
<html>
<head>
    <%P000S004.SUBG_P_METATAG("1")%>
    <%'*** ﾗﾍﾞﾙ(17)：SessionAsStrArray("SG_P_SYSTEM")(7) & "情報照会"%>
    <title><%=P000S004.FNCG_P_TITLE(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 17), SessionAsStrArray("SG_P_SYSTEM")(7), ""))%></title>
    <%    '<!-- P000J000.JS EXEMPT --> %>
    <script language="JavaScript" type="text/javascript" src="./SCRIPT/P000J000.JS"></script>
    <script language="JavaScript" type="text/javascript" src="./SCRIPT/jquery.js"></script>
    <%    '<!-- P000V000.VBS EXEMPT --> %>
    <script language="VbScript" type="text/vbscript" src="./SCRIPT/P000V000.VBS"></script>
    <script language="JavaScript"><!--

    $(document).ready(function(){
        htmlobj=$.ajax({url:"P000M500.aspx",async:false});
        $("head").append (htmlobj.responseText);
    });

<%
    '//***********************************************************
    '// 社員選択処理(全件表示時) mode--true:選択、false:解除 <%'//
    '//***********************************************************
%>
    function JSF_P_ALLCHECK(mode){
        var icount = 0;
        var imax = document.form1.ch1.length;
<%    '//社員選択が一件の時はNullを返す %>
        if(imax == null){
<%    '//社員選択が一件の時は配列ではない（JAVASCRIPTの仕様） %>
            document.form1.ch1.checked = mode;
        }else{
<%    '//社員選択が複数件の時は配列になる %>
            for (icount=0;icount<imax;icount++){
                document.form1.ch1[icount].checked = mode;
            }
        }
        JSF_P_WORKSET(0,0);
    }
<%
    '//***********************************************************
    '// 社員選択時に左フレームに値をセットする
    '//***********************************************************
%>
    function JSF_P_WORKSET(w_kbn,w_load){
        var form = document.form1;
        var icount = 0;
        var w_flg = 0;
        var p_modo = 0;
        var p_name = "";
        var w_set ="";
        var w_set2 ="";
        var imax = form.ch1.length;

       <% If w_mode = "1" Then '//*** 適合率検索%>
            p_modo = 1;
       <% End If %>

        <%'//検索結果一覧の社員選択情報（次前時のセッション情報 0=選択なし・1=選択あり） %>
        <%'//top.Frame_Logo.Form002：P000M002.asp%>
        top.Frame_Logo.Form002.syaincd2.value = form.syaincd.value;

        if (p_modo == 1) {
            <%'//総ページ数(適合率) %>
            form.h_totalpage_Precision.value = <%= val(w_PageMaxBuff) %>;
            <%'//画面表示社員情報 %>
            top.Frame_Logo.Form002.syainNoListAll.value = form.syainNoListAll.value;
        }

        if (w_kbn == 0) {
            <%'//社員選択が一件の時はNullを返す %>
            if(imax == null){
                <%'//社員選択が一件の時は配列ではない（JAVASCRIPTの仕様） %>
                if (form.ch1.checked == true){
                    top.Frame_Logo.Form002.syaincd.value = form.ch1.value;
                    form.syainList.value = form.ch1.value;
                    if (p_modo == 1) {
                        form.syainNoList.value = form.ch1_1.value;
                        top.Frame_Logo.Form002.syainNoList.value = form.ch1_1.value;
                    }
                }else{
                    top.Frame_Logo.Form002.syaincd.value = "";
                    form.syainList.value = "";
                    if (p_modo == 1) {
                        form.syainNoList.value = "";
                        top.Frame_Logo.Form002.syainNoList.value = "";
                    }
                }
            } else {
                <%'//社員選択が複数件の時は配列になる %>
                for (icount=0;icount<imax;icount++){
                    if (form.ch1[icount].checked == true){
                        if (w_flg==0) {
                            w_flg=1;
                        }else{
                            w_set = w_set + ",";
                            w_set2 = w_set2 + ",";
                        }
                        w_set = w_set + form.ch1[icount].value;

                        if (p_modo == 1) {
                            p_name = eval("form.ch1_" + (icount + 1));
                            w_set2 = w_set2 + p_name.value;
                        }
                    }
                }
                top.Frame_Logo.Form002.syaincd.value = w_set;
                form.syainList.value = w_set;
                if (p_modo == 1) {
                    form.syainNoList.value = w_set2;
                    top.Frame_Logo.Form002.syainNoList.value = w_set2;
                }
            }
        } else if (w_kbn == 1) {    <%    '//* 全選択時 %>
            if(imax == null){
                w_set = form.ch1.value;
                if (p_modo == 1) {
                    w_set2 = form.ch1_1.value;
                }
            } else {
                for (icount=0;icount<imax;icount++){
                    if (w_flg==0) {
                        w_flg=1;
                    }else{
                        w_set = w_set + ",";
                        w_set2 = w_set2 + ",";
                    }
                    w_set = w_set + form.ch1[icount].value;

                    if (p_modo == 1) {
                        p_name = eval("form.ch1_" + (icount + 1));
                        w_set2 = w_set2 + p_name.value;
                    }
                }
            }

            top.Frame_Logo.Form002.syaincd.value = w_set;
            form.syainList.value = w_set;
            if (p_modo == 1) {
                form.syainNoList.value = w_set2;
                top.Frame_Logo.Form002.syainNoList.value = w_set2;
            }

        } else if (w_kbn == 2) {    <%    '//* 全解除時 %>
            top.Frame_Logo.Form002.syaincd.value = "";
            top.Frame_Logo.Form002.syaincd2.value = "";
            form.syainList.value = "";
            if (p_modo == 1) {
                form.syainNoList.value = "";
                top.Frame_Logo.Form002.syainNoList.value = "";
            }
        }

        if (w_load == 1){    <%    '//* 帳票設定時の再読み込み時 %>
            event.returnValue = false;
            winmain2 = window.open("P000M212.aspx?kbn1=1&kbn2=5",'newwin1','toolbar=no,location=no, status=no,menubar=no,scrollbars=no,width=500,height=200');
        }
      
    }

<%    '//**    Ｓｕｂｍｉｔ処理 アンカー選択時 %>
    function JSFL_P_SUBMIT(prm)
    {
        <% If w_mode = "1" Then %>
            var form = document.form1;

            if (prm == "11"){
                <% '最大抽出件数 %>
                if (form.score_k.value == "") {
                    //return true;
                } else {
                    if (isNaN(form.score_k.value) == true){
                        <%' // ***ラベル(67): "最大抽出件数は整数値（範囲：1～{1}）で入力して下さい。") %>
                        alert("<%= P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 67), w_str_TyusyutuKensu, "") %>");
                        form.score_k.focus()
                        form.score_k.select()
                        return false;
                    }else if(parseInt(form.score_k.value,10) > <%= val(w_str_TyusyutuKensu) %> || parseInt(form.score_k.value,10) < 1){
                        <%' // ***ラベル(67): "最大抽出件数は整数値（範囲：1～{1}）で入力して下さい。") %>
                        alert("<%= P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 67), w_str_TyusyutuKensu, "") %>");
                        form.score_k.focus()
                        form.score_k.select()
                        return false;
                    }
                }

                <% '最低抽出適合率 %>
                if (form.score_w.value == "") {
                    //return true;
                } else {
                    if (isNaN(form.score_w.value) == true){
                        <%' //***ラベル(68): "最低抽出適合率は数値（範囲：0.1～100.0）で入力して下さい。"  %>
                        alert("<%= w_langmsg(0, 68) %>");
                        form.score_w.focus()
                        form.score_w.select()
                        return false;
                    }else if(parseFloat(form.score_w.value,10) > 100 || parseFloat(form.score_w.value,10) < 0.1){
                        <%' //***ラベル(68): "最低抽出適合率は数値（範囲：0.1～100.0）で入力して下さい。"  %>
                        alert("<%= w_langmsg(0, 68) %>");
                        form.score_w.focus()
                        form.score_w.select()
                        return false;
                    }
                }
            }

            <% '// ** 条件合致の絞込時 %>
            if (prm == "13"){
                
                var icount = 0;
                var Last_Item = document.form1.h_cond_check.value.split("_")
                var imax = document.form1.w_ch2.length;
                var w_set = "";

                if(imax == null){
                    if (document.form1.w_ch2.checked) {
                        w_set = "1"
                    }else{
                        w_set = "0"
                    }
                } else {
                    for (icount=0;icount<imax;icount++){
                        if (icount!=0) {
                            w_set = w_set + "_";
                        }
                            
                        <% '// ** 1:絞込有 0:なし %>
                        if (document.form1.w_ch2[icount].checked) {
                            w_set = w_set + "1"
                        }else{
                            w_set = w_set + "0"
                        }
                    }
                }

                var Crr_ITEM = w_set.split("_")
                for (icount=0;icount<Last_Item.length;icount++){
                    if (Last_Item[icount] == "1" && Crr_ITEM[icount]=="0"){
                        document.form1.h_last_cond_check.value = "OFF";
                        break;
                    }

                    if (Last_Item[icount] == "0" && Crr_ITEM[icount]=="1"){
                        document.form1.h_last_cond_check.value = "ON";
                        break;
                    }
                }
                <% '// ** hiddenに保持する %>
                document.form1.h_cond_check.value = w_set;
            }

            var w_sort_chk = prm.split("_");
            if ((w_sort_chk[0] == "14") || (w_sort_chk[0] == "12")){
                document.form1.h_sort_value.value = prm;
            }

        <% End if %>

<%    '//**次前遷移時のﾎﾞﾀﾝ制御処理 %>
        JSFL_P_CHGPAGE_DISABLED();
        document.form1.target = "_self"
        document.form1.action = "P001M004.aspx?menu=" + prm
        document.form1.submit();
    }

<% If w_mode = "1" Then%>
    var winmain3 = "";
<% '//*********************************************************** %>
<% '// %>
<% '//*********************************************************** %>
    function JSFL_P_SYOSAI(id){
        //event.returnValue = false;

        var cVal;
        var buff = "";
        
        if (id.value != ""){
         cVal = id.split("_");
        
         buff = "?emcd=" + cVal[0] + "&gno=" + cVal[1] + "&geda=" + cVal[2];
        }
        winmain3 = window.open("P003M213.aspx" + buff,"newwin3","toolbar=no,location=no, status=no,menubar=no,scrollbars=no,width=450,height=350");
    }
<% End IF %>

<%    '//*** ウィンドウオープン処理 %>
    var winmain = "";
    function JSF_P_OPENWIN(p_kbn){
        event.returnValue = false;
        var p_width
        var p_height
        if (p_kbn == "1") {
            p_width = "<%= w_popwidth %>"
            p_height = "<%= w_popheight %>"
        } else {
            p_width = "600"
            p_height = "480"
        }

        <% If w_mode = "1" Then '//*** 適合率検索%>
            JSF_P_WORKSET(0,0);
        <% End If %>

        winmain = window.open("P003M076.aspx?lkbn=1&skbn=" + p_kbn,"newwin1","toolbar=no,location=no, status=no,menubar=no,scrollbars=no,width=" + p_width + ",height=" + p_height);
    }

    var winmain2 = ""

<%    '//*** ウィンドウクローズ処理 %>
    function JSF_P_CLOSEWIN2()
    {
<%    '//*** フォームが閉じられた時及び別画面に遷移するとき表示設定ウィンドウを閉じる %>
        if (winmain != ""){
            winmain.close();
        }
        if (winmain2 != ""){
            winmain2.close();
        }

        <% If w_mode = "1" Then%>
        if (winmain3 != ""){
            winmain3.close();
        }        
        <% End IF %>
    }

     <% '//*** 移動ボタン押下時の処理 %>
    function JSFL_P_CLICK_MOVEMENT(){
        var form = document.form1;
        var icount = 0;
        var p_errflg = 0;
        var imax = form.ch1.length;

         if (form.p1.value == ""){
             alert("<%= P000S001.FNCG_P_JSESCAPE_JAVA(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 45), w_sysdata(8), "")) %>");
             return;
         }

         <% '// 社員の選択チェック %>
        if (form.p1.value == "1" || form.p1.value == "2") {
            if (imax == null){
                if (form.ch1.checked == true){
                    p_errflg = 1;
                }
            }else{
                for (icount=0;icount<imax;icount++){
                    if (form.ch1[icount].checked == true){
                        p_errflg = 1;
                        break;
                    }
                }
            }
            if (p_errflg == 0 && form.syaincd.value == ""){
                <%' // ***ラベル(48): "対象者を選択してください。") %>
                alert("<%= P000S001.FNCG_P_JSESCAPE_JAVA(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 48), w_sysdata(8), "")) %>");
                return;
            }
        }

         form.action = "P001M204.aspx?";
         form.submit();
    }

    <% '//*** 呼出元機能へボタン押下時の処理 %>
    function JSFL_P_CLICK_TRANSCALLER(){
        var form = document.form1;
        var icount = 0;
        var p_errflg = 0;
        var imax = form.ch1.length;

        <% '// 選択社員を引き継ぐ場合 %>
        if (form.etcki.checked == true){
            <% '// 社員の選択チェック %>
            if (imax == null){
                if (form.ch1.checked == true){
                    p_errflg = 1;
                }
            }else{
                for (icount=0;icount<imax;icount++){
                    if (form.ch1[icount].checked == true){
                        p_errflg = 1;
                        break;
                    }
                }
            }
            if (p_errflg == 0 && form.syaincd.value == ""){
                <%' // ***ラベル(48): "対象者を選択してください。") %>
                alert("<%= P000S001.FNCG_P_JSESCAPE_JAVA(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 48), w_sysdata(8), "")) %>");
                return;
            }
            form.action = "P001M204.aspx?h_etcKiDiv=2";
        }else{
            form.action = "P001M204.aspx?h_etcKiDiv=1";
        }
        form.submit();
    }

<%
    '//*********************************************************************
    '//* 関数名：JSFL_P_CHGPAGE(item,mode)
    '//* 機  能：ページ入力時の処理    mode 0:OnChange時 1:OnBlur時 2:OnKeyPress時
    '//*********************************************************************
%>
    function JSFL_P_CHGPAGE(item,mode) {
        var form = document.form1;

        <%'//**ページ情報取得 %>
        var w_currentpage = form.h_currentpage.value;        <%    '//現在表示ページ %>
        var w_totalpage = form.h_totalpage.value;            <%    '//総ページ %>

        <% If w_mode = "1" Then %>
            w_totalpage = <%= val(w_PageMaxBuff) %>

            if (w_totalpage != "0") {
                var temp = JSFG_P_CHKINPUTPAGE(item,w_currentpage,w_totalpage);

                if (temp != -1) {
                    if (mode==0) {

                    } else if (mode==1) {
                        return true;
                    } else if (mode==2) {
                        if (temp == w_currentpage) {
                            return true;
                        }
                    }
                } else {
                    return false;
                }

                <%'//**遷移先ページ格納 %>
                form.h_page.value = Number(temp);
                JSFL_P_SUBMIT('5');
            }

        <% Else %>
            var temp = JSFG_P_CHKINPUTPAGE(item,w_currentpage,w_totalpage);
            if (temp != -1) {
                if (mode==0) {
                    
                } else if (mode==1) {
                    return true;
                } else if (mode==2) {
                    if (temp == w_currentpage) {
                        return true;
                    }
                }
            } else {
                return false;
            }
            <%'//**遷移先ページ格納 %>
            form.h_page.value = Number(temp);
            JSFL_P_SUBMIT('5');

        <% End If %>
    }

<%    '//** 次前遷移時のﾎﾞﾀﾝ制御処理 %>
    function JSFL_P_CHGPAGE_DISABLED() {
        var form = document.form1;

        <%If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then%>
            <%'//**次前ﾎﾞﾀﾝ制御 %>
            form.NEXT_PREVIOUS1.disabled=true;
            form.NEXT_PREVIOUS2.disabled=true;
            form.NEXT_PREVIOUS3.disabled=true;
            form.NEXT_PREVIOUS4.disabled=true;
            form.PAGE_SET.disabled=true;
        <%End If%>
    }

//-->
    </script>

    <%
    If w_mode = "1" Then
        P000S014.SUBG_P_EXCELPOP("Form093")
        '*** JSFL_P_EXCELPOPの書き出し処理
        'スタイルシート：データ用
    End If
    %>
    <%    'スタイルシート：データ用 %>
    <link rel="stylesheet" type="text/css" href="./CSS/P000C301.CSS">
    <link rel="stylesheet" type="text/css" href="./CSS/PE_Common.css"/>
    <link rel="stylesheet" type="text/css" href="./CSS/utf8style.css"/>
    <base target="_self">
</head>
<form action="P001M004.aspx" method="post" name="form1" <%= P000S004.FNCG_P_AUTOCOMPLETE() %>>
<body <%= P000S019.FNCG_P_BODYTAG_NON2() %> leftmargin="10" topmargin="0" onload="javascript:JSF_P_WORKSET(0,<%= w_loadflg %>);" onunload="javascript:JSF_P_CLOSEWIN2();">
    <%
        '*** 社員選択状態判断
        w_select_flg = ""
        If w_mode = "0" Then       '*** 通常検索
            If InStr(1, w_sdata(0), "1", 0) > 0 Then ' 表示されている社員が１件以上選択されている
                w_select_flg = "1"
            End If
        Else                       '*** 適合率検索
            If FNCL_P_CHK_EMP_EXIST(w_disp_scd, w_selectdata) = "1" Then ' 非表示の社員を含めて社員が１件以上選択されている
                w_select_flg = "1"
            End If
        End If
    %>
    <input type="hidden" name="syaincd" value="<%=w_select_flg%>">
    <%
    '**********************************************************************
    '*  社員一覧部分の表示処理
    '**********************************************************************
    If w_mode <> "1" Then		'*** 一致検索
        '******************************************************************
        '* 一致検索
        '******************************************************************
        %>
        <table border="0" cellpadding="0" cellspacing="0" width="780">
        <%
        If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
            '**************************************************************
            '* １５件毎の表示
            '**************************************************************
            %>
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="bottom">
                            <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td nowrap width="8"><br></td>
                                <%P000S032.SUBG_P_NEXT_PREVIOUS_BUTTON("1", w_btkbn1(0), w_btkbn1(1), "")%>
                                <td nowrap width="8"><br></td>
                                <%P000S032.SUBG_P_NEXT_PREVIOUS_BUTTON("2", w_btkbn1(2), w_btkbn1(3), "")%>
                                <td nowrap width="8"><br></td>
                                <%P000S032.SUBG_P_INPUTPAGE(w_posit, w_chkevent)%>
                                <td nowrap width="8"><br></td>
                                <%P000S032.SUBG_P_NEXT_PREVIOUS_BUTTON("3", w_btkbn2(0), w_btkbn2(1), "")%>
                                <td nowrap width="8"><br></td>
                                <%P000S032.SUBG_P_NEXT_PREVIOUS_BUTTON("4", w_btkbn2(2), w_btkbn2(3), "")%>
                                <%If dispAll = "1" Then%>
                                    <td nowrap width="15"><br></td>
                                    <%
                                    If w_skbn = "1" Then
                                        If w_langdt(6) = "0" Then%>
                                            <td nowrap valign="bottom">
                                                <%'*** ﾗﾍﾞﾙ(18)："検索結果を保存" %>
                                                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 18), w_style(1))%></td>
                                            <td nowrap width="10"><br></td>
                                            <td nowrap valign="bottom">
                                                <%'*** ﾗﾍﾞﾙ(19)："共通用" %>
                                                <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('1');">
                                                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 19), w_style(1))%></a></td>
                                            <td nowrap width="10"><br></td>
                                            <td nowrap valign="bottom">
                                                <%'*** ﾗﾍﾞﾙ(20)："個人用" %>
                                                <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 20), w_style(1))%></a></td>
                                        <%Else%>
                                            <td nowrap valign="bottom">
                                                <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <%'*** ﾗﾍﾞﾙ(18)："検索結果を保存" %>
                                                    <td nowrap colspan="3">
                                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 18), w_style(1))%></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap>
                                                        <%'*** ﾗﾍﾞﾙ(19)："共通用" %>
                                                        <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('1');">
                                                        <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 19), w_style(1))%></a> </td>
                                                    <td nowrap width="10"><br></td>
                                                    <td nowrap>
                                                        <%'*** ﾗﾍﾞﾙ(20)："個人用" %>
                                                        <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                                        <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 20), w_style(1))%></a> </td>
                                                </tr>
                                                </table>
                                            </td>
                                        <%End If
                                    Else
                                        %>
                                        <td nowrap valign="bottom">
                                            <%'*** ﾗﾍﾞﾙ(21)："検索結果を保存" %>
                                            <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 21), w_style(1))%></a> </td>
                                        <%
                                    End If
                                End If%>
                                <td nowrap width="15"><br></td>
                                <td nowrap width="100%" align="right" valign="bottom">
                                    <%
                                    '*** ﾗﾍﾞﾙ(22)："［件数］"
                                    '*** ﾗﾍﾞﾙ(23)：Session("SL_P000KENFLAG")(2,2) & "件（" & SessionAsStr("SL_P000KENFLAG")(2,3) & "人）"
                                    '''Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 22) & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 23), SessionAsStrArray2D("SL_P000KENFLAG")(2, 2) & "||" & SessionAsStrArray2D("SL_P000KENFLAG")(2, 3), "||"), w_style(1)))
                                    
                                    '*** 他業務遷移選択作成
                                    Call SUBL_P_CREATEMOVEOTHER()
                                    %>
                                </td>
                            </tr>
                            </table>
                        </td>
                    </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="5"></td>
            </tr>
        <%
        Else
            '**************************************************************
            '* 全件表示
            '**************************************************************
            If dispAll = "1" Then%>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <%If w_skbn = "1" Then%>
                                <td nowrap valign="bottom">
                                    <%'*** ﾗﾍﾞﾙ(24)："検索結果を保存"%>
                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 24), w_style(1))%></td>
                                <td nowrap width="10"><br></td>
                                <td nowrap valign="bottom">
                                    <%'*** ﾗﾍﾞﾙ(25)："共通用" %>
                                    <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('1');">
                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 25), w_style(1))%></a> </td>
                                <td nowrap width="10"><br></td>
                                <td nowrap valign="bottom">
                                    <%'*** ﾗﾍﾞﾙ(26)："個人用" %>
                                    <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 26), w_style(1))%></a> </td>
                            <%Else%>
                                <td nowrap valign="bottom">
                                    <%'*** ﾗﾍﾞﾙ(27)："検索結果を保存" %>
                                    <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 27), w_style(1))%></a> </td>
                            <%End If%>
                            <td nowrap width="30"><br></td>
                            <td nowrap valign="bottom">
                                <%
                                '*** ﾗﾍﾞﾙ(28)："［件数］"
                                '*** ﾗﾍﾞﾙ(29)：Session("SL_P000KENFLAG")(2,2) & "件（" & SessionAsStr("SL_P000KENFLAG")(2,3) & "人）"
                                '''Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 28) & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 29), SessionAsStrArray2D("SL_P000KENFLAG")(2, 2) & "||" & SessionAsStrArray2D("SL_P000KENFLAG")(2, 3), "||"), w_style(1)))
                                
                                '*** 他業務遷移選択作成
                                Call SUBL_P_CREATEMOVEOTHER()
                                %>
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr><td height="5"></td></tr>
            <%End If
        End If%>
        </table>

        <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td nowrap>
                <%
                If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
                    '*** １５件表示
                    '*** ﾗﾍﾞﾙ(22)："［件数］"
                    '*** ﾗﾍﾞﾙ(23)：Session("SL_P000KENFLAG")(2,2) & "件（" & SessionAsStr("SL_P000KENFLAG")(2,3) & "人）"
                    Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 22) & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 23), SessionAsStrArray2D("SL_P000KENFLAG")(2, 2) & "||" & SessionAsStrArray2D("SL_P000KENFLAG")(2, 3), "||"), w_style(1)))
                Else
                    '*** 全件表示
                    If dispAll = "1" Then
                        '*** ﾗﾍﾞﾙ(28)："［件数］"
                        '*** ﾗﾍﾞﾙ(29)：Session("SL_P000KENFLAG")(2,2) & "件（" & SessionAsStr("SL_P000KENFLAG")(2,3) & "人）"
                        Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 28) & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 29), SessionAsStrArray2D("SL_P000KENFLAG")(2, 2) & "||" & SessionAsStrArray2D("SL_P000KENFLAG")(2, 3), "||"), w_style(1)))
                    End If
                End If
                %>
            </td>
        </tr>
        </table>

        <table>
        <tr>
            <td>
                <div id="id01">
                    <input type="hidden" value="" name="syainList">
                    <table id="idborder01" border="1" cellpadding="0" cellspacing="0" width="100%" class="border" bgcolor=<%= SessionAsStrArray("SG_P_COLOR")(8) %>>
                        <tr bgcolor=<%= SessionAsStrArray("SG_P_COLOR")(2) %>>
                            <%
                            If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
                            %>
                            <th nowrap align="center">
                                <%
                                    '*** ﾗﾍﾞﾙ(30)：全てを選択する
                                    '*** ﾗﾍﾞﾙ(31)："選択"
                                %>
                                <a id="lnk02" href="javascript:JSFL_P_SUBMIT('on');" title="<%= w_langmsg(0, 30) %>" onclick="JSF_P_WORKSET(1,0)">
                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 31), "id=idfsize09") %></a><br>
                                <%
                                    '*** ﾗﾍﾞﾙ(32)："解除"
                                    '*** ﾗﾍﾞﾙ(33)：全てを解除する
                                %>
                                <a id="lnk02" href="javascript:JSFL_P_SUBMIT('off');" title="<%= w_langmsg(0, 33) %>" onclick="JSF_P_WORKSET(2,0)">
                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 32), "id=idfsize09") %></a>
                            </th>
                            <%
                            Else
                            %>
                            <th nowrap>
                                <%
                                    '*** ﾗﾍﾞﾙ(34)：全てを選択する
                                    '*** ﾗﾍﾞﾙ(35)："選択"
                                %>
                                <a id="lnk02" href="javascript:JSF_P_ALLCHECK(true);" title="<%= w_langmsg(0, 34) %>">
                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 35), "id=idfsize09") %></a><br>
                                <%
                                    '*** ﾗﾍﾞﾙ(36)：全てを解除する
                                    '*** ﾗﾍﾞﾙ(37)："解除"
                                %>
                                <a id="lnk02" href="javascript:JSF_P_ALLCHECK(false);" title="<%= w_langmsg(0, 36) %>">
                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 37), "id=idfsize09") %></a>
                            </th>
                            <%
                            End If
                            If IsZensyaMode() Then
                                '*** ﾗﾍﾞﾙ(38)：FNCG_P_KAISYA_KMK_NAME(w_k_select,85) & "名"
                            %>
                            <th nowrap>
                                <%'会社名 %>
                                <%= P000S004.FNCG_P_FONT_TAG(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 38), P000S024.FNCG_P_KAISYA_KMK_NAME(w_k_select, 85), ""), w_style(0))%>
                            </th>
                            <%
                            End If
                            %>
                            <th nowrap>
                                <%= P000S004.FNCG_P_FONT_TAG(SessionAsStrArray("SG_P_SYSTEM")(8), w_style(0))%>
                            </th>
                            <%    '*** ﾗﾍﾞﾙ(39)："氏名" %>
                            <th nowrap>
                                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 39), w_style(0))%>
                            </th>
                            <%    '*** ﾗﾍﾞﾙ(40)："カナ氏名" %>
                            <th nowrap>
                                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 40), w_style(0))%>
                            </th>
                            <%
                                For w_icnt = 1 To 5
                                    If Mid(w_kflg, w_icnt, 1) = "1" Then
                                        Select Case w_icnt
                                            Case 1
                                                '*** ﾗﾍﾞﾙ(41)："所属名称"
                                                Response.Write("<TH nowrap width=450>" & P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 41), w_style(0)) & "</TH>")
                                            Case 2
                                                If w_kcnt = 1 Then
                                                    Response.Write("<TH nowrap width=450>")
                                                Else
                                                    Response.Write("<TH nowrap width=250>")
                                                End If
                                                '*** ﾗﾍﾞﾙ(42)："所属略称"
                                                Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 42), w_style(0)) & "</TH>")
                                            Case 3
                                                '*** ﾗﾍﾞﾙ(43)："所属コード"
                                                Response.Write("<TH nowrap>" & P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 43), w_style(0)) & "</TH>")
                                            Case 4
                                                Response.Write("<TH nowrap>" & P000S004.FNCG_P_FONT_TAG(SessionAsStrArray("SG_P_FNAME")(1), w_style(0)) & "</TH>")
                                            Case 5
                                                Response.Write("<TH nowrap>" & P000S004.FNCG_P_FONT_TAG(SessionAsStrArray("SG_P_FNAME")(2), w_style(0)) & "</TH>")
                                        End Select
                                    End If
                                Next
                            %>
                        </tr>
                        <%
                        For w_icnt = 0 To UBound(PE_ComVars.Instance.w_fdata2D, 2)
                            %>
                            <tr>
                                <td align="center">
                                    <%
                                    If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
                                        If Mid(w_chkset, w_icnt + 1, 1) = "1" Then
                                            %>
                                            <input type="checkbox" name="ch1" checked value="<%= P000S001.FNCG_P_HTMLENCODE(CStr(w_icnt + 1)) %>" onclick="JSF_P_WORKSET(0,0)">
                                            <%
                                        Else
                                            %>
                                            <input type="checkbox" name="ch1" value="<%= P000S001.FNCG_P_HTMLENCODE(CStr(w_icnt + 1)) %>" onclick="JSF_P_WORKSET(0,0)">
                                            <%
                                        End If
                                    Else
                                        If Mid(w_sdata(0), w_icnt + 1, 1) = "1" Then
                                            %>
                                            <input type="checkbox" name="ch1" checked value="<%= P000S001.FNCG_P_HTMLENCODE(CStr(w_icnt + 1)) %>" onclick="JSF_P_WORKSET(0,0)">
                                            <%
                                        Else
                                            %>
                                            <input type="checkbox" name="ch1" value="<%= P000S001.FNCG_P_HTMLENCODE(CStr(w_icnt + 1)) %>" onclick="JSF_P_WORKSET(0,0)">
                                            <%
                                        End If
                                    End If
                                    %>
                                </td>
                                <%
                                '*** 会社名列を表示する条件
                                If IsZensyaMode() Then
                                    If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
                                        %>
                                        <td nowrap>
                                        <%= P000S004.FNCG_P_FONT_TAG(PE_ComVars.Instance.w_fdata2D(8, w_icnt), "")%><br></td>
                                        <%
                                    Else
                                        %>
                                        <td nowrap>
                                        <%= P000S004.FNCG_P_FONT_TAG(PE_ComVars.Instance.w_fdata2D(7, w_icnt), "")%><br></td>
                                        <%
                                    End If
                                End If
                                %>
                                <td nowrap id="syain03">
                                    <%= P000S004.FNCG_P_FONT_TAG(P000S001.FNCG_P_SCDFMT(P000S006.FNCG_P_SCD_CHG2("1", PE_ComVars.Instance.w_fdata2D(0, w_icnt))), "")%><br></td>
                                <td nowrap>
                                    <%= P000S004.FNCG_P_FONT_TAG(PE_ComVars.Instance.w_fdata2D(1, w_icnt), "")%><br></td>
                                <td nowrap>
                                    <%= P000S004.FNCG_P_FONT_TAG(PE_ComVars.Instance.w_fdata2D(2, w_icnt), "")%><br></td>
                                <%
                                w_i = 0
                                For w_jcnt = 1 To 5
                                    If Mid(w_kflg, w_jcnt, 1) = "1" Then
                                        Select Case w_jcnt
                                        Case 1
                                            Response.Write("<TD>" & P000S004.FNCG_P_FONT_TAG(P000S024.FNCG_P_KAISYAKBN(PE_ComVars.Instance.w_fdata2D(3, w_icnt)), "") & "<BR></TD>")
                                        Case Else
                                            If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
                                                Response.Write("<TD nowrap>" & P000S004.FNCG_P_FONT_TAG(PE_ComVars.Instance.w_fdata2D(2 + w_jcnt, w_icnt), "") & "<BR></TD>")
                                            Else
                                                w_i = w_i + 1
                                                Response.Write("<TD nowrap>" & P000S004.FNCG_P_FONT_TAG(PE_ComVars.Instance.w_fdata2D(UBound(PE_ComVars.Instance.w_fdata2D) - w_kcnt + w_i, w_icnt), "") & "<BR></TD>")
                                            End If
                                        End Select
                                    End If
                                Next
                                %>
                            </tr>
                            <%
                        Next
                        For w_icnt = UBound(PE_ComVars.Instance.w_fdata2D, 2) + 1 To 14
                            %>
                            <tr height="22">
                                <td><br></td>
                                <%
                                '*** 会社名列を表示する条件
                                If IsZensyaMode() Then
                                    %>
                                    <td><br></td>
                                    <%
                                End If
                                %>
                                <td><br></td>
                                <td><br></td>
                                <td><br></td>
                                <%
                                For w_jcnt = 1 To 5
                                    If Mid(w_kflg, w_jcnt, 1) = "1" Then
                                        Response.Write("<TD><BR></TD>")
                                    End If
                                Next
                            %>
                            </tr>
                            <%
                        Next
                        %>
                    </table>
                </div>
            </td>
        </tr>
        </table>
    <% Else%>
        <%
        '******************************************************************
        '* 適合率検索
        '******************************************************************
        %>
        <table border="0" cellpadding="0" cellspacing="0" width="780">
        <%
        If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
            '**************************************************************
            '* １５件毎の表示
            '**************************************************************
            %>
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="bottom">
                            <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td nowrap width="8"><br></td>
                                    <%P000S032.SUBG_P_NEXT_PREVIOUS_BUTTON("1", w_btkbn1(0), w_btkbn1(1), "")%>
                                <td nowrap width="8"><br></td>
                                    <%P000S032.SUBG_P_NEXT_PREVIOUS_BUTTON("2", w_btkbn1(2), w_btkbn1(3), "")%>
                                <td nowrap width="8"><br></td>
                                    <%P000S032.SUBG_P_INPUTPAGE(w_posit, w_chkevent)%>
                                <td nowrap width="8"><br></td>
                                    <%P000S032.SUBG_P_NEXT_PREVIOUS_BUTTON("3", w_btkbn2(0), w_btkbn2(1), "")%>
                                <td nowrap width="8"><br></td>
                                    <%P000S032.SUBG_P_NEXT_PREVIOUS_BUTTON("4", w_btkbn2(2), w_btkbn2(3), "")%>

                                <%If dispAll = "1" Then%>
                                    <td nowrap width="15"><br></td>
                                    <%
                                        If w_skbn = "1" Then
                                            If w_langdt(6) = "0" Then
                                                '*** ﾗﾍﾞﾙ(18)："検索結果を保存"
                                                %>
                                                <td nowrap valign="bottom">
                                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 18), w_style(1))%></td>
                                                <td nowrap width="10"><br></td>
                                                <td nowrap valign="bottom">
                                                    <%'*** ﾗﾍﾞﾙ(19)："共通用" %>
                                                    <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('1');">
                                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 19), w_style(1))%></a> </td>
                                                <td nowrap width="10"><br></td>
                                                <td nowrap valign="bottom">
                                                <%'*** ﾗﾍﾞﾙ(20)："個人用" %>
                                                    <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 20), w_style(1))%></a> </td>
                                                <%
                                                Else
                                                %>
                                                <td nowrap valign="bottom">
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td nowrap colspan="3">
                                                            <%'*** ﾗﾍﾞﾙ(18)："検索結果を保存" %>
                                                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 18), w_style(1))%></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap>
                                                            <%'*** ﾗﾍﾞﾙ(19)："共通用" %>
                                                            <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('1');">
                                                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 19), w_style(1))%></a> </td>
                                                        <td nowrap width="10"><br></td>
                                                        <td nowrap>
                                                            <%'*** ﾗﾍﾞﾙ(20)："個人用" %>
                                                            <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 20), w_style(1))%></a> </td>
                                                    </tr>
                                                    </table>
                                                </td>
                                                <%
                                                End If
                                            Else
                                            %>
                                            <td nowrap valign="bottom">
                                                <%'*** ﾗﾍﾞﾙ(21)："検索結果を保存" %>
                                                <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                                <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 21), w_style(1))%></a> </td>
                                            <%
                                            End If
                                          End If%>

                                <td nowrap width="15"><br></td>
                                <td nowrap width="100%" align="right" valign="bottom">
                                    <%
                                        Call SUBL_P_CREATEMOVEOTHER()
                                    %>
                                </td>
                            </tr>
                            </table>
                        </td>
                    </tr>
                    </table>
                </td>
            </tr>
            <tr><td height="5"></td></tr>
        <%
        Else
            '**************************************************************
            '* 全件表示
            '**************************************************************
            If dispAll = "1" Then
                %>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <%
                                If w_skbn = "1" Then%>
                                    <%'*** ﾗﾍﾞﾙ(24)："検索結果を保存"%>
                                    <td nowrap valign="bottom"><%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 24), w_style(1))%></td>
                                    <td nowrap width="10"><br></td>
                                    <%'*** ﾗﾍﾞﾙ(25)："共通用" %>
                                    <td nowrap valign="bottom">
                                        <a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('1');">
                                        <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 25), w_style(1))%></a></td>
                                    <td nowrap width="10"><br></td>
                                    <%'*** ﾗﾍﾞﾙ(26)："個人用" %>
                                    <td nowrap valign="bottom"><a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                        <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 26), w_style(1))%></a></td>
                                <%Else%>
                                    <%'*** ﾗﾍﾞﾙ(27)："検索結果を保存" %>
                                    <td nowrap valign="bottom"><a href="P003M076.aspx" onclick="JavaScript:JSF_P_OPENWIN('2');">
                                        <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 27), w_style(1))%></a></td>
                                <%End If
                            %>
                            <td nowrap width="30"><br></td>
                                <td nowrap valign="bottom"><%Call SUBL_P_CREATEMOVEOTHER()%></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr><td height="5"></td></tr>
                <%
            End If
        End If%>
        </table>

        <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <%'*** 最大抽出件数%>
            <td nowrap align="right"><%=P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 50), w_style(1))%></td>
            <td nowrap width="8"><br></td>
            <td><INPUT type="text" id="input02" <%=P000S022.FNCG_P_INPUT_IME(3)%> name="score_k" value="<%=w_kensu%>" size="5" maxlength="3" onchange="javascript:return JSFG_P_NUMCHK_L(1,'<%=w_langmsg(0, 50)%>','3','form1.score_k','<%=w_langdt(6)%>');"></td>
            <td nowrap width="8"><br></td>
            <%'*** 最低適合率%>
            <td nowrap><%=P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 51), w_style(1))%></td>
            <td nowrap width="8"><br></td>
            <td><INPUT type="text" id="input02" <%=P000S022.FNCG_P_INPUT_IME(3)%> name="score_w" value="<%=w_wariai%>" size="5" maxlength="5" onchange="javascript:return JSFG_P_NUMCHK_L(3,'<%=w_langmsg(0, 51)%>','3-1','form1.score_w','<%=w_langdt(6)%>');"></td>
            <%'*** ﾗﾍﾞﾙ(69)：％%>
            <td nowrap><%=P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 69), "")%><br></td>
            <td nowrap width="8"><br></td>
            <%'*** 再表示ボタン%>
            <td><input id="button03" class="normal" type="button" name="btt" value="<%=w_langmsg(0, 52)%>" onclick="javascript:JSFL_P_SUBMIT('11')"></td>
            <td nowrap width="8"><br></td>
            <td nowrap>
                <%
                If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
                    '*** ﾗﾍﾞﾙ(22)："［件数］"
                        '*** ﾗﾍﾞﾙ(71)：Session("SL_P000KENFLAG")(2,2) & "件"
                        Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 28) & w_MaxRecBuff & "/" & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 71), SessionAsStrArray2D("SL_P000KENFLAG")(2, 2) & "||" & SessionAsStrArray2D("SL_P000KENFLAG")(2, 3), "||"), w_style(1)))
                Else
                    If dispAll = "1" Then
                            Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 28) & w_MaxRecBuff & "/" & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 71), SessionAsStrArray2D("SL_P000KENFLAG")(2, 2) & "||" & SessionAsStrArray2D("SL_P000KENFLAG")(2, 3), "||"), w_style(1)))
                    End If
                End If
                %>
            </td>
            <td nowrap width="8"><br></td>
            <%'*** 判例作成%>
            <td nowrap><%Call SUBL_P_HANREI()%></td>
        </tr>
        </table>

        <table>
        <tr>
            <td>
                <div id="Div1">
                <%
                '***明細行ラベル作成
                Call SUBL_P_createDetailLabele()
                '***明細行作成
                Call SUBL_P_createDetail()
                %>
                </div>
            </td>
        </tr>
        <tr><td height="5"></td></tr>
        </table>

        <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td nowrap>
            <%'*** ﾗﾍﾞﾙ(70)：外部出力 %>
            <td>
                <input class="normal" id="button01" type="button" name="b3" value="<%=w_langmsg(0, 70)%>"
                onclick="javascript:JSFL_P_SUBMIT('6');">
            </td>
            <%'*** 外部出力ボタン押下後%>
            <%If w_out_flg = "1" Then%>
                <td nowrap width="8"><br></td>
                <%'*** ＣＳＶ出力%>
                <td nowrap><a href="P000M203.aspx?kbn=1" target="_top">
                    <%=P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 53), w_style(1))%></a></td>
                <td nowrap width="8"><br></td>
                <%'*** ＣＳＶ出力(UTF-8)%>
                <td nowrap><a href="P000M203.aspx?kbn=1&enc=<%=System.Text.Encoding.UTF8.CodePage.ToString%>" target="_top">
                    <%=P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 53) & "(UTF-8)", w_style(1))%></a></td>
                <td nowrap width="8"><br></td>
                <%'*** ＥＸＣＥＬ出力%>
                <td nowrap><a href="P000M203.aspx?kbn=2" onclick="JavaScript:JSFL_P_EXCELPOP('0');">
                    <%=P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 54), w_style(1))%></a></td>
            <%End If%>
        </tr>
        </table>

        <table>
        <tr><td height="5"></td></tr>
        </table>

        <% '*** 必須チェック保持 %>
        <input type="hidden" name="h_cond_check" value="<%=w_chk_save%>">

        <% '*** ソート状態保持 %>
        <input type="hidden" name="h_sort_value" value="<%=w_sort_save %>">

        <% '*** 必須チェック状態保持 %>
        <input type="hidden" name="h_last_cond_check" value="">

        <%'*** 総ページ数(適合率) %>
        <input type="hidden" name="h_totalpage_Precision" value="">

    <% End If%>

    <%'*** 現在表示ページ%>
    <input type="hidden" name="h_currentpage" value="<%= P000S001.FNCG_P_HTMLENCODE(CStr((CLng(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1)) + 1))) %>">
    <%'*** 総ページ%>
    <input type="hidden" name="h_totalpage" value="<%= P000S001.FNCG_P_HTMLENCODE(CStr((CLng(SessionAsStrArray2D("SL_P000KENFLAG")(2, 0)) + 1))) %>">
    <%'*** 遷移先ページ数 %>
    <input type="hidden" name="h_page" value="">

</form>
</BODY>
</html>
<%
    '*** 配列変数の開放
    If IsArray(w_langmsg) Then
        Erase w_langmsg
    End If
    If IsArray(w_langdt) Then
        Erase w_langdt
    End If

%>
<script language="vb" runat="server">
    '**********************************************************************
    '* 変数宣言エリア
    '**********************************************************************
    Dim DBOBJ As OraDatabase          '*** DBOBJ
    Dim sql As String                 '*** sql
    Dim w_orapara(,) As String        '*** バインド変数
    Dim w_array As OraParameter       '*** ＳＰで使用（配列）
    Dim w_data(8) As OraParamArray    '*** ＳＰで使用（データ）
    Dim w_icnt As Integer             '*** カウント
    Dim w_jcnt As Integer             '*** カウント
    Dim w_chkset As String            '*** 次前処理チェック用
    Dim w_btkbn1() As String          '*** 次前処理用
    Dim w_btkbn2() As String          '*** 次前処理用
    Dim w_posit As String             '*** 社員位置(**/**)
    Dim w_kopt(0) As String           '***
    Dim w_opt As OraParamArray        '*** ＳＰで使用
    Dim w_sdata() As String           '*** データ格納用
    Dim w_fcnt As Integer             '*** 項目件数
    Dim w_skbn As String              '*** 共通用の変更（0=不可・1=可）
    Dim w_loadflg As Integer          '*** 共通用の変更（0=不可・1=可）
    Dim w_kcnt As Integer             '*** カウント
    Dim w_i As Integer                '*** カウント
    Dim w_kflg As String              '*** 表示内容
    Dim w_k_select As String          '*** 会社
    Dim w_chkevent As String          '*** 次前ﾍﾟｰｼﾞ番号表示域イベント
    Dim w_btnbit As String            '*** ﾎﾞﾀﾝ制御ビット
    Dim w_khflg As String             '*** マルチカンパニー制御
    Dim w_langmsg(,) As String        '*** 文言情報取得用
    Dim w_wdata(,) As String          '*** データ格納用
    Dim w_langdt() As String          '*** 共通言語セッション情報
    Dim w_popwidth As Integer         '*** POPUPウィンドウサイズ(共通用)（幅）
    Dim w_popheight As Integer        '*** POPUPウィンドウサイズ(共通用)（高さ）
    Dim w_style(1) As String          '*** 項目表示制御用 
    Dim trfKbn As String              '*** 他機能遷移設定情報
    Dim procDiv As String             '*** 処理区分
    Dim trfList(,) As String          '*** 遷移先画面ID
    Dim w_sysdata() As String         '*** 社員番号情報
    Dim w_kstyle As String            '*** 項目スタイル制御
    Dim dispKbn As String             '*** 遷移先画面区分
	Dim dispAll As String             '*** 全件表示可否
    Dim w_214instchk As String        '*** 目標導入フラグ(0:未導入,1:導入済)

    Dim w_mode As String              '*** （適合率検索）検索モード
    Dim w_varray(,) As String         '*** （適合率検索）適合率検索条件（WEB_TP0030030_W）
    Dim w_varray2(,) As String        '*** （適合率検索）明細データ（WEB_TP0030053_W）
    Dim w_total_array(,) As String    '*** （適合率検索）検索結果データ（全レコード）（WEB_TP0030050_W／WEB_TP0030053_W）
    Dim w_varray3(,) As String        '*** （適合率検索）検索結果データ（画面表示分）（w_total_arrayより抽出）

    Dim w_wariai As String            '*** （適合率検索）最低抽出適合率（条件設定画面の設定値）
    Dim w_kensu As String             '*** （適合率検索）最大抽出件数（条件設定画面の設定値）
    Dim w_buff() As String            '*** （適合率検索）
    Dim work_i As Integer             '*** （適合率検索）
    Dim w_dai_kbn(1) As String        '*** （適合率検索）
    Dim w_check As String             '*** （適合率検索）必須チェック格納
    Dim w_Check_flg As String         '*** （適合率検索）必須チェックの状態変化(チェックが増えたときON 減ったときはOFF) 
    Dim w_sort As String              '*** （適合率検索）ソート状態格納
    Dim w_str_TyusyutuKensu As String '*** （適合率検索）最大抽出件数の入力サイズ
    Dim w_PageMaxBuff As String       '*** （適合率検索）最大ページ数格納用
    Dim w_MaxRecBuff As String        '*** （適合率検索）最大件数格納用
    Dim w_DateFormat As String        '*** （適合率検索）日付書式格納用
    Dim w_sort_save As String         '*** （適合率検索）
    Dim w_chk_save As String          '*** （適合率検索）
    Dim w_SentakWork As String        '*** （適合率検索）
    Dim w_fmtdata(,) As String        '*** （適合率検索）
    Dim w_selectdata As String        '*** （適合率検索）選択社員情報
    Dim w_disp_scd As String          '*** （適合率検索）画面表示社員情報
    Dim SL_P000KENFLAG(,) As String   '*** （適合率検索）セッション情報取得用
    Dim w_select_flg As String        '*** （適合率検索）社員選択状態フラグ※非表示社員含む（0:未選択,1:１件以上選択あり）
    Dim w_out_flg As String           '*** （適合率検索）外部出力フラグ

    '**********************************************************************
    ''' <summary>
    ''' 「全社モード」の判定
    ''' </summary>
    ''' <returns>true : 全社モード、false : 非全社モード</returns>
    ''' <remarks>マルカン全社ログイン、またはマルカン各社ログインかつ全社検索モードが「全社モード」</remarks>
    '**********************************************************************
    Private Function IsZensyaMode() As Boolean
        If SessionAsStr("SG_P_KAISYA_SELECT") = "0" AndAlso SessionAsStr("SG_P_KAISYA") = "0" AndAlso SessionAsStr("SG_P_KAISYA_FLG") = "1" _
            OrElse(SessionAsStr("SG_P_KAISYA_FLG") = "1" _
                    AndAlso SessionAsStr("SG_P_KAISYA") <> "0" _
                    AndAlso SessionAsStrArray("SG_P_ALLKENGEN")(2) = "2") Then
            Return True
        End If
        Return False
    End Function

    '**********************************************************************
    ''' <summary>
    ''' 他機能、移動
    ''' </summary>
    ''' <remarks></remarks>
    '**********************************************************************
    Sub SUBL_P_CREATEMOVEOTHER()

        '*** 参照時かつ、固定帳票(4)以外かつ、全社選択　以外の場合、リスト表示
        If SessionAsStrArray("SG_P_ALLKENGEN")(2) = "1" Then
            If SessionAsStrArray("SL_P001M001_SKBN")(0) <> "2" AndAlso SessionAsStrArray("SL_P001M013_KINOU")(0) <> "4" AndAlso (SessionAsStr("SG_P_KAISYA_FLG") <> "1" OrElse SessionAsStr("SG_P_KAISYA_SELECT") <> "0") Then
                If (trfKbn = "1" AndAlso trfList.GetLength(1) > 0 AndAlso SessionAsStrArray2D("SG_P_COMFLAG")(5, 0) = "0") Then
                        
                    Response.Write("<table border=""0"" cellpadding=""0"" cellspacing=""0"" width=""240"">")
                    Response.Write(" <tr>")
                    Response.Write("  <td nowrap>")
                    Response.Write("   <select style="""" width: 200;"""" name=""p1"">")
                         
                    For w_i = 0 To trfList.GetLength(1) - 1
                    
                        Response.Write("<option value=""" & P000S001.FNCG_P_HTMLENCODE(trfList(0, w_i)) & _
                                   """" & P000S001.FNCG_P_SELECTED(dispKbn, trfList(0, w_i)) & ">" _
                                        & P000S001.FNCG_P_HTMLENCODE(trfList(1, w_i)) & "</option>")
                    Next
                
                    Response.Write("   </select>")
                    Response.Write("  <input name=""b3"" type=""button""" & w_kstyle & " value=""" & _
                                         w_langmsg(0, 44) & """ onclick=""javascript:JSFL_P_CLICK_MOVEMENT();""> " & _
                                        "<input type=""hidden"" value=""" & procDiv & """ name=""h_procDiv"">")
                    Response.Write("  </td>")
                    Response.Write(" </tr>")
                    Response.Write("</table>")

                End If
            End If
        End If

        '*** 他機能連携あり(「呼出元機能へ」)
        If (SessionAsStrArray2D("SG_P_COMFLAG")(5, 0) = "1") Then
            Response.Write("<table border=""0"" cellpadding=""0"" cellspacing=""0"" width=""240"">")
            Response.Write(" <tr>")
            Response.Write("   <td nowrap>")
                                         
            '*** ﾗﾍﾞﾙ(46)：選択{1}を引き継ぐ
            '*** ﾗﾍﾞﾙ(47)：呼出元機能へ
            Response.Write(" <input name=""etcki"" type=""checkbox"" value="""" id=""label1_0"">" & "<label for=""label1_0"">" & _
                                    P000S004.FNCG_P_FONT_TAG(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 46), SessionAsStrArray("SG_P_SYSTEM")(7), ""), "id=idfsize09B") & "</label>")
            Response.Write(" <input name=""b3"" type=""button""" & w_kstyle & " value=""" & w_langmsg(0, 47) & _
                                    """ onclick=""javascript:JSFL_P_CLICK_TRANSCALLER();"">")
            Response.Write("  </td>")
            Response.Write(" </tr>")
            Response.Write("</table>")
        End If
    End Sub

    '**********************************************************************
    ''' <summary>
    ''' 適合率検索結果処理
    ''' </summary>
    ''' <remarks></remarks>
    '**********************************************************************
    Sub SUBL_P_TEKIGOU()

        '******************************************************************
        '* 変数初期値セット
        '******************************************************************

        '***最大抽出件数の入力サイズ
        w_str_TyusyutuKensu = "500"		

        '*** 最大抽出件数
        w_kensu = SessionAsStrArray2D("SL_P000KENFLAG")(0, 6)

        '*** 最低抽出適合率
        w_wariai = SessionAsStrArray2D("SL_P000KENFLAG")(0, 7)
        If w_wariai <> "" Then
            w_wariai = Format(Val(w_wariai), "##0.0")
        End If

        '*** 必須チェック格納
        w_check = SessionAsStrArray2D("SL_P000KENFLAG")(0, 9)

        '*** ソート状態格納
        w_sort = SessionAsStrArray2D("SL_P000KENFLAG")(0, 8)

        '*** 必須チェックの状態変化(チェックが増えたときON 減ったときはOFF) 
        w_Check_flg = P000S001.FNCG_P_NZ(Request.QueryString("l_chk"))

        '******************************************************************
        '* 対象者データ取得
        '******************************************************************

        '*** 適合率検索条件抽出
        If FNCL_P_VP0030020(w_varray) = True Then
        End If

        '*** 外部出力ボタン押下時
        If w_out_flg = "1" Then
            '*** 外部出力用データ取得処理
            Call FNCL_P_READMAIN("2")
            Call FUNCL_P_DETAIL("2",w_varray2)
            Call SUBL_P_EXCELDATACREATE(w_total_array)
        End If

        '*** 基準データ取得(画面用)（WEB_TP0030050_W／WEB_TP0030053_W（ソート時））
        Call FNCL_P_READMAIN("1")

        '*** 明細テーブル抜出(画面用)（WEB_TP0030053_W）
        Call FUNCL_P_DETAIL("1",w_varray2)
        
        ' *** ワークテーブル再読込み(ページ単位対応)（[w_total_array]より[w_varray3]を作成）
        Call SUBL_P_CREATEARRAY()

        ' *** 選択社員情報の取得（WEB_TP0030050_W）
        Call SUBL_P_SELECT_DATA()

        ' *** 対象者情報の制御処理
        Call SUBL_P_TARGET_INFOSET()

    End Sub

    '**********************************************************************
    ''' <summary>
    ''' 適合率検索条件抽出
    ''' </summary>
    ''' <param name="vntfdata"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>    
    '**********************************************************************
    Function FNCL_P_VP0030020(ByRef vntfdata(,) As String) As Boolean
        Dim kaisyaCd As String = w_k_select
        Dim l_hkbn As String

        sql = "SELECT "
        sql = sql & " F001"    '***  0:選択順
        sql = sql & ",F002"    '***  1:カテゴリ区分
        sql = sql & ",F003"    '***  2:項目順
        sql = sql & ",F004"    '***  3:連結指定
        sql = sql & ",F005"    '***  4:括弧１
        sql = sql & ",F006"    '***  5:括弧２
        sql = sql & ",F007"    '***  6:カテゴリ名称

        sql = sql & ", (CASE NVL(F036, '0')"
        sql = sql & "   WHEN '0' THEN CAST(F008 AS NVARCHAR2(100))"
        sql = sql & "   ELSE F008 || '(' || WEB_SP0002610_F(1, :ORA_1, F039, F036, F037, F038, :ORA_2) || ')'"
        sql = sql & " END) ITEM_NAME"    '*** 7:項目名（管理名称）

        sql = sql & ", (CASE NVL(F036, '0')"
        sql = sql & "   WHEN '0' THEN"
        sql = sql & "       F009"
        sql = sql & "   ELSE"
        sql = sql & "       CAST(WEB_SP0002610_F(2, :ORA_1, F039, F036, F037, F038, :ORA_2) || '" & "-" & "' || WEB_SP0002610_F(5, :ORA_1, F039, F036, F037, F038, :ORA_2) AS VARCHAR2(10))"
        'sql = sql & "       CAST(WEB_SP0002610_F(2, :ORA_1, F039, F036, F037, F038, :ORA_2) || '" & P0030000.CUSTOM_LINE_SEPARATOR2 & "' || WEB_SP0002610_F(5, :ORA_1, F039, F036, F037, F038, :ORA_2) AS VARCHAR2(10))"
        sql = sql & " END) F009" ' 8
        '*** 検索区分－表示書式(予備項目・マッピング項目は、検索区分-表示書式を WEB_SP0002610_F() から取得する必要がある F008 対応漏れ対応
        
        sql = sql & ",F010" '9
        '*** 比較区分

        sql = sql & ",F011"
        '*** 内容１
        sql = sql & ",F012"
        '*** 内容２
        sql = sql & ",F013"
        '*** 内容３
        sql = sql & ",F014"
        '*** 内容４
        sql = sql & ",F015"
        '*** 内容５
        sql = sql & ",F016"
        '*** 内容１（補足）
        sql = sql & ",F017"
        '*** 内容２（補足）
        sql = sql & ",F018"
        '*** 内容３（補足）
        sql = sql & ",F019"
        '*** 内容４（補足）
        sql = sql & ",F020"
        '*** 内容５（補足）
        sql = sql & ",F021"
        '*** 表示内容１
        sql = sql & ",F022"
        '*** 表示内容２
        sql = sql & ",F023"
        '*** 表示内容３
        sql = sql & ",F024"
        '*** 表示内容４
        sql = sql & ",F025"
        '*** 表示内容５
        sql = sql & ",F026"
        '*** 項目名
        sql = sql & ",F027"
        '*** 会社コード
        sql = sql & ",F028"
        '*** 処理区分
        sql = sql & ",F029"
        '*** 支給年月日
        sql = sql & ",F030"
        '*** 歴区分
        sql = sql & ",F031"
        '*** 検索方法（0=名称選択・1=名称入力）
        
        sql = sql & ",F032"
        '*** 名称検索言語ＩＤ
        
        '基準日関連
        sql = sql & ", F033"    '32:基準日区分
        sql = sql & ", F034"    '33:基準日補助内容１
        sql = sql & ", F035"    '34:基準日補助内容２
        'マスター補助関連
        sql = sql & ", F036"    '35:マスター補助区分
        sql = sql & ", F037"    '36:マスター補助会社コード
        sql = sql & ", F038"    '37:マスター補助ID
        
        sql = sql & ", F040"    ' 38:No
        sql = sql & ", NVL(F041,'1') F041"    ' 39:枝番号
        sql = sql & ", NVL(F042,'0') F042"    ' 40:必須条件
        sql = sql & ", NVL(F043,'0') F043"    ' 41:点数
        sql = sql & ", NVL(F044,'0') F044"    ' 42:結果表示区分
        
        '38:予備/マッピング名
        'sql = sql & ", WEB_SP0002610_F(1, :ORA_1, MASTER_ID, F036, F037, F038, :ORA_2) MAPPING_NAME"
        
        sql = sql & " FROM (" & P000S056.FNCG_P_WEB_VP0030020(kaisyaCd) & ")"
        
        sql = sql & " WHERE W001 = :ORA_0"
        'sql = sql & " ORDER BY S001 "
        sql = sql & " ORDER BY F040,F041 "
        
        ReDim w_orapara(1, 2)
        w_orapara(0, 0) = SessionAsStr("SG_P_RID")
        w_orapara(0, 1) = kaisyaCd
        w_orapara(0, 2) = SessionAsStrArray("SG_P_LANGUAGE")(6)
        
        w_orapara(1, 0) = PE_OraType.ORATYPE_NUMBER
        w_orapara(1, 1) = PE_OraType.ORATYPE_NUMBER
        w_orapara(1, 2) = PE_OraType.ORATYPE_NUMBER

        If P000S011.FNCG_P_RECORDSET5(43, sql, w_orapara, vntfdata) Then
            SUBL_P_SETTEIGET(vntfdata)
            FNCL_P_VP0030020 = True
        Else
            ReDim vntfdata(38, -1)
            FNCL_P_VP0030020 = False
        End If
        
    End Function

    '**********************************************************************
    ''' <summary>
    ''' 固定項目のマスタ判断情報の取得
    ''' </summary>
    ''' <param name="p_data"></param>
    ''' <remarks></remarks>
    '**********************************************************************
    Sub SUBL_P_SETTEIGET(ByRef p_data(,) As String)
        Dim p_dtget(,) As String = Nothing
        Dim p_i As Integer
        For p_i = 0 To UBound(p_data, 2)
            If Not IsNull(P000S001.FNCG_P_NZ(p_data(8, p_i))) Then
                If VBSplit(p_data(8, p_i), "-", -1, 0)(1) = "L2" Then
                    sql = "SELECT "
                    sql = sql & " COUNT(*)"
                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "TIM_KOTEIKB_MS A"
                    sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010020_M B"
                    sql = sql & " WHERE A.KAISYACD = :ORA_0"
                    sql = sql & "   AND A.HENSUID = B.ITEM_NAME"
                    sql = sql & "   AND B.CATEGORY_DIV = :ORA_1"
                    sql = sql & "   AND B.ITEM_ORDER = :ORA_2"
                    ReDim w_orapara(2, 2)
                    w_orapara(0, 0) = p_data(26, p_i)
                    w_orapara(1, 0) = "2"
                    w_orapara(0, 1) = p_data(1, p_i)
                    w_orapara(1, 1) = "2"
                    w_orapara(0, 2) = p_data(2, p_i)
                    w_orapara(1, 2) = "2"
                    If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, p_dtget) Then
                        If CInt(p_dtget(0, 0)) > 0 Then
                            p_data(8, p_i) = "4" & "||" & "L2"
                            p_data(9, p_i) = "2"
                            'Else
                            'p_data(8,p_i) = "2-31"
                            'p_data(9,p_i) = "1"
                        End If
                    End If
                End If
            End If
        Next
    End Sub

    '**********************************************************************
    ''' <summary>
    ''' ワークテーブル全行取得
    ''' </summary>
    ''' <param name="w_DispAll"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>    
    '**********************************************************************
    Function FNCL_P_READMAIN(ByVal p_DispAll As String) As Boolean
        Dim w_j As Integer
        Dim w_Order As String
        Dim w_Order2 As String
        Dim sort_Arr() As String
        Dim check_Arr() As String
        Dim w_i As Integer
        Dim kaisyaCd As String = w_k_select
        Dim w_Buff(,) As String
        Dim w_wdbdata(,) As String
        Dim w_kenrate As String           '*** 最大抽出件数条件適合率
        Dim w_wcnt As Long                '*** ワーク変数
        Dim w_compdiv As String           '*** ソート項目複合検索区分

        ReDim PE_ComVars.Instance.w_fdata2D(4, CInt(SessionAsStrArray2D("SL_P000KENFLAG")(2, 2)) - 1)

        '******************************************************************
        '* 最大抽出件数指定時の対象適合率の取得
        '******************************************************************
        w_kenrate = "0"
        If w_kensu <> "" Then
            w_wcnt = 0
            sql = "SELECT"
            sql = sql & " RATE"
            sql = sql & ",COUNT(*)"
            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID")
            sql = sql & " GROUP BY RATE"
            sql = sql & " ORDER BY RATE DESC"
            If P000S011.FNCG_P_RECORDSET1(0, sql, w_wdbdata) = True Then
                For w_i = 0 To Ubound(w_wdbdata,2)
                    w_wcnt = w_wcnt + Clng(w_wdbdata(1,w_i))
                    w_kenrate = w_wdbdata(0,w_i)
                    If Clng(w_kensu) <= w_wcnt Then
                        Exit For
                    End If
                Next w_i
            End If
        End If

        '******************************************************************
        '* 表示件数の取得
        '******************************************************************
        sql = "SELECT COUNT(*)"
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & " A"
        sql = sql & " WHERE 1=1"
        ' *** 最低適合率
        If w_wariai <> "" Then
            sql = sql & " AND A.RATE >= " & w_wariai
        End If
        ' *** 最大表示件数
        If w_kensu <> "" Then
            sql = sql & " AND A.RATE >= " & w_kenrate
        End If
        ' *** 任意必須条件チェック
        If w_check <> "" Then
            ReDim check_Arr(UBound(VBSplit(w_check, "_", -1, 0)))
            check_Arr = VBSplit(w_check, "_", -1, 0)

            For w_i = 0 To UBound(check_Arr)
                If check_Arr(w_i) = "1" Then
                    sql = sql & " AND A.JOKEN" & (w_i + 1).ToString & " = 1"
                End If
            Next
        End If
        If P000S011.FNCG_P_RECORDSET1(0, sql, w_wdbdata) = True Then
            w_MaxRecBuff = w_wdbdata(0,0)
            w_PageMaxBuff = CStr(Fix((Val(w_MaxRecBuff) / 15) + 0.99))
        End If

        '******************************************************************
        '* 項目ソート情報の取得
        '******************************************************************
        w_Order = ""
        If w_sort <> "" Then
            ReDim sort_Arr(UBound(VBSplit(w_sort, "_", -1, 0)))
            sort_Arr = VBSplit(w_sort, "_", -1, 0)
            Select Case sort_Arr(0)
                Case "0"
                    w_Order = w_Order & "A.RATE"
                    
                    If sort_Arr(1) = "1" Then
                        w_Order = w_Order & " DESC"
                    ElseIf sort_Arr(1) = "2" Then
                        w_Order = w_Order & " ASC"
                    End If
                Case Else
                    sql = "SELECT"
                    sql = sql & " A.COMPOUND_SEARCH_DIV"
                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030030_W A"
                    sql = sql & " WHERE A.CUSTOMER_ID = :ORA_0"
                    sql = sql & "   AND A.SELECT_NO1 = :ORA_1"
                    sql = sql & "   AND A.SELECT_NO2 = 1"
                    ReDim w_orapara(1, 1)
                    w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                    w_orapara(1, 0) = "2"
                    w_orapara(0, 1) = sort_Arr(0)
                    w_orapara(1, 1) = "2"
                    If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_wdbdata) Then
                        w_compdiv = w_wdbdata(0,0)
                    Else
                        w_compdiv = "1"
                    End If
                    If sort_Arr(1) = "1" Then
                        w_Order = w_Order & "SRT.SRT_ITEM DESC,SRT.SRT_NUM_ITEM DESC"
                    ElseIf sort_Arr(1) = "2" Then
                        w_Order = w_Order & "SRT.SRT_ITEM ASC,SRT.SRT_NUM_ITEM ASC"
                    End If
            End Select
        Else
            w_Order = w_Order & "A.RATE DESC"
        End If

        '******************************************************************
        '* 検索設定のソート情報取得
        '******************************************************************
        Select Case SessionAsStrArray("SG_P_003INF")(2)
            Case "1"  '*** 社員番号順
                w_Order2 = " K1.KAISYACD,K1.SYAINCD"
            Case "2"  '*** カナ氏名順
                w_Order2 = " K1.KAISYACD,K1.NAME_KANA,K1.SYAINCD"
            Case "3"  '*** 所属・役職順
                w_Order2 = " K1.KAISYACD,A.SRT1,A.SRT2,A.SRT3,K1.SYAINCD"
            Case "4"  '*** アルファベット氏名順
                w_Order2 = " K1.KAISYACD,K1.NAME_ALPHABET,K1.SYAINCD"
        End Select
        
        sql = "SELECT"
        sql = sql & " F001"                   ' 0
        sql = sql & ",F002"                   ' 1
        sql = sql & ",F003"                   ' 2
        sql = sql & ",F004"                   ' 3
        sql = sql & ",DIV"                    ' 4
        sql = sql & ",ANOTHER_POST_DIV || '-' || NVL(ISSUE_DATE,'0')"' 5
        sql = sql & ",KAISYANM"               ' 6
        sql = sql & ",RATE"                   ' 7
        sql = sql & ",FOR_SORTING"            ' 8
        sql = sql & ",TRUNC((ROW_NO / 15) + 0.99) PAGE" ' 9
        
        ' 10 ～ n
        '*** 条件を登録しているワークの最終行Noまで1から繰り返す
        For w_j = 1 To CInt(w_varray(38, UBound(w_varray, 2)))
            sql = sql & " ,JOKEN" & w_j.ToString
        Next w_j
        
        '*** 枝条件はワークの登録行数分作成される
        For w_j = 0 To UBound(w_varray, 2)
            sql = sql & " ,JOKEN_SUB" & w_varray(38, w_j) & "_" & w_varray(39, w_j)
        Next w_j
        
        sql = sql & " FROM ( "
        sql = sql & "SELECT"
        sql = sql & " F001"
        sql = sql & ",F002"
        sql = sql & ",F003"
        sql = sql & ",F004"
        sql = sql & ",DIV"
        sql = sql & ",ANOTHER_POST_DIV"
        sql = sql & ",ISSUE_DATE"
        sql = sql & ",KAISYANM"
        sql = sql & ",RATE"
        sql = sql & ",FOR_SORTING"
        sql = sql & ",ROWNUM ROW_NO"
        For w_j = 1 To CInt(w_varray(38, UBound(w_varray, 2)))
            sql = sql & ",JOKEN" & w_j.ToString
        Next w_j
        
        For w_j = 0 To UBound(w_varray, 2)
            sql = sql & ",JOKEN_SUB" & w_varray(38, w_j) & "_" & w_varray(39, w_j)
        Next w_j
        
        sql = sql & " FROM ("
        sql = sql & " SELECT"
        sql = sql & " A.EMP_CODE F001"  '***  0:社員コード
        sql = sql & ",WEB_SP0002471_F(2,A.EMP_CODE,0,1,NULL,'" & w_langdt(0) & "','" & w_langdt(4) & "','" & w_langdt(8) & "','" & SessionAsStr("SG_P_SID") & "') F002"  '***  1:氏名
        'sql = sql & ",K1.NAME_KANA F003"  '***  2:カナ氏名
        sql = sql & ",DECODE(A.SELECT_FLAG,'1','○','') F003"  '***  2:選択フラグ
        If w_langdt(6) <> "0" Then
            sql = sql & ",WEB_SP0002151_F(1,26,A.EMP_CODE,TO_DATE('" & SessionAsStr("SG_P_TDATE") & "','YYYY/MM/DD'),:ORA_1) F004"  '***  3:所属名称
        Else
            sql = sql & ",WEB_SP0002150_F(1,26,A.EMP_CODE,TO_DATE('" & SessionAsStr("SG_P_TDATE") & "','YYYY/MM/DD')) F004"  '***  3:所属名称
        End If
        sql = sql & ",A.DIV"               '***  4:
        sql = sql & ",A.RATE"              '***  5:
        sql = sql & ",A.ANOTHER_POST_DIV"  '***  6:
        sql = sql & ",TO_CHAR(A.ISSUE_DATE,'YYYY/MM/DD') ISSUE_DATE" '***  7:
        For w_j = 1 To CInt(w_varray(38, UBound(w_varray, 2)))
            sql = sql & ",A.JOKEN" & w_j.ToString
        Next w_j
        For w_j = 0 To UBound(w_varray, 2)
            sql = sql & ",A.JOKEN_SUB" & w_varray(38, w_j) & "_" & w_varray(39, w_j)
        Next w_j
        If w_langdt(6) <> "0" Then
            sql = sql & ",NVL(K2L.KAISYANM,K2.KAISYANM) KAISYANM"
        Else
            sql = sql & ",K2.KAISYANM"
        End If

        w_fcnt = 0
        sql = sql & ",K1.SYAINCD FOR_SORTING"
        
        If w_sort <> "" AndAlso sort_Arr(0) <> "0" Then
            sql = sql & ",SRT.SRT_ITEM,SRT.SRT_NUM_ITEM"
        End If
        
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & " A"   '*** 基準テーブル
        ' *** 項目並べ替え
        If w_sort <> "" Then
            If sort_Arr(0) <> "0" Then
                sql = sql & ",(SELECT W.EMP_CODE"
                Select Case w_compdiv
                    Case "1"
                        sql = sql & ",W.TEXT_ITEM SRT_ITEM,NULL SRT_NUM_ITEM"
                    Case "2"
                        sql = sql & ",NULL SRT_ITEM,W.NUMBER_ITEM SRT_NUM_ITEM"
                    Case "3"
                        sql = sql & ",NVL(W.TEXT_ITEM,TO_CHAR(W.DATE_ITEM,'YYYY/MM/DD')) SRT_ITEM,NULL SRT_NUM_ITEM"
                    Case Else
                        sql = sql & ",W.CODE_ITEM SRT_ITEM,NULL SRT_NUM_ITEM"
                End Select
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030053_W_" & SessionAsStr("SG_P_RID") & " W"
                sql = sql & " WHERE W.SELECT_NO1 = " & sort_Arr(0)
                sql = sql & "   AND W.SELECT_NO2 = 1"
                sql = sql & ") SRT"
            End If
        End If
        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO K1"
        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "KAISYA_MS K2"
        If w_langdt(6) <> "0" Then
            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "KAISYA_L_MS K2L"
        End If

        sql = sql & " WHERE 1=1"
        ' *** 最低適合率
        If w_wariai <> "" Then
            sql = sql & " AND A.RATE >= :ORA_4 "
        End If
        ' *** 最大表示件数
        If w_kensu <> "" Then
            sql = sql & " AND A.RATE >= " & w_kenrate
        End If
        ' *** 任意必須条件チェック
        If w_check <> "" Then
            For w_i = 0 To UBound(check_Arr)
                If check_Arr(w_i) = "1" Then
                    sql = sql & " AND A.JOKEN" & (w_i + 1).ToString & " = 1"
                End If
            Next
        End If
        
        ' *** 並替え項目
        If w_sort <> "" AndAlso sort_Arr(0) <> "0" Then
            sql = sql & " AND A.EMP_CODE = SRT.EMP_CODE(+)"
        End If
        sql = sql & "   AND A.EMP_CODE = K1.EMP_CODE"
        sql = sql & "   AND K1.KAISYACD = K2.KAISYACD(+)"
        If w_langdt(6) <> "0" Then
            sql = sql & "   AND K2.KAISYACD = K2L.KAISYACD(+)"
            sql = sql & "   AND K2L.LANGUAGEID(+) =:ORA_1"
        End If
        sql = sql & " ORDER BY " & w_Order & "," & w_Order2
        sql = sql & "))"
        If SessionAsStrArray("SG_P_003INF")(5) = "1" And p_DispAll = "1" Then
            sql = sql & " WHERE ROW_NO >= ((:ORA_2-1) * 15) + 1"
            sql = sql & "   AND ROW_NO <= ((:ORA_2) * 15)"
        End If

        ReDim w_orapara(1, 4)
        w_orapara(0, 0) = SessionAsStr("SG_P_TDATE")
        w_orapara(1, 0) = "12"
        w_orapara(0, 1) = w_langdt(6)
        w_orapara(1, 1) = PE_OraType.ORATYPE_NUMBER
        w_orapara(0, 2) = (CLng(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1)) + 1).ToString
        w_orapara(1, 2) = PE_OraType.ORATYPE_NUMBER
        w_orapara(0, 3) = w_kensu
        w_orapara(1, 3) = PE_OraType.ORATYPE_NUMBER
        w_orapara(0, 4) = w_wariai
        w_orapara(1, 4) = PE_OraType.ORATYPE_NUMBER

        w_total_array = Nothing
'response.write (sql & "<BR>")
        If P000S011.FNCG_P_RECORDSET5(0, sql, w_orapara, w_total_array) Then
            FNCL_P_READMAIN = True
        Else
            FNCL_P_READMAIN = False
            If p_DispAll = "2" Then
                w_MaxRecBuff = "0"
                w_PageMaxBuff = "0"
            End If
        End If

        '******************************************************************
        '* 社員選択情報セット
        '******************************************************************
        '*** 全件表示の場合
        w_sdata = SessionAsStrArray("SL_P000KENWORK")        '*** SL_P000KENWORK_02

        If IsNull(w_sdata(0)) = True Then
            w_sdata(0) = ""
            w_sdata(1) = ""
            w_sdata(4) = ""

            For w_icnt = 0 To UBound(w_total_array, 2)
                If SessionAsStrArray("SG_P_003INF")(7) = "1" Then
                    w_sdata(0) = w_sdata(0) & "1"
                Else
                    w_sdata(0) = w_sdata(0) & "0"
                End If
                w_sdata(1) = w_sdata(1) & "," & w_total_array(0, w_icnt)
                w_sdata(2) = w_sdata(2) & "," & VBSplit(w_total_array(5, w_icnt), "-", -1, 0)(0)
                w_sdata(3) = w_sdata(3) & "," & VBSplit(w_total_array(5, w_icnt), "-", -1, 0)(1)
                w_sdata(4) = w_sdata(4) & "," & w_total_array(4, w_icnt)
                w_total_array(5, w_icnt) = VBSplit(w_total_array(5, w_icnt), "-", -1, 0)(0)
            Next
            w_sdata(1) = Mid(w_sdata(1), 2)
            w_sdata(2) = Mid(w_sdata(2), 2)
            w_sdata(3) = Mid(w_sdata(3), 2)
            w_sdata(4) = Mid(w_sdata(4), 2)
        End If

        Session.Add("SL_P000KENWORK", w_sdata)               '*** SL_P000KENWORK_02

    End Function

    '**********************************************************************
    ''' <summary>
    ''' 明細データ取得
    ''' </summary>
    ''' <param name="vntfdata"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    '**********************************************************************
    Function FUNCL_P_DETAIL(ByVal p_kbn As String,ByRef vntfdata(,) As String) As Boolean
        Dim w_sql As String

        w_sql = ""
        w_sql = w_sql & "    SELECT"
        w_sql = w_sql & "        W.EMP_CODE,"        '00
        w_sql = w_sql & "        W.SELECT_NO1,"      '01
        w_sql = w_sql & "        W.SELECT_NO2,"      '02
        w_sql = w_sql & "        W.SEQNO,"           '03
        w_sql = w_sql & "        W.TARGET_DIV,"      '04
        w_sql = w_sql & "        case A.COMPOUND_SEARCH_DIV"
        w_sql = w_sql & "        when '1' then W.TEXT_ITEM"
        w_sql = w_sql & "        when '2' then NVL(W.TEXT_ITEM,RTRIM(TO_CHAR(W.NUMBER_ITEM,'FM99999990.99999'),'.'))"
        w_sql = w_sql & "        when '3' then NVL(W.TEXT_ITEM,TO_CHAR(W.DATE_ITEM,'yyyy/mm/dd'))"
        w_sql = w_sql & "        else W.TEXT_ITEM"
        w_sql = w_sql & "        end ITEM "  '05
        w_sql = w_sql & "        ,DECODE(A.COMPOUND_SEARCH_DIV,'2',DECODE(W.TEXT_ITEM,NULL,'2','4'),A.COMPOUND_SEARCH_DIV)" '06
        w_sql = w_sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030053_W_" & SessionAsStr("SG_P_RID") & " W"
        w_sql = w_sql & "        ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030030_W A"
        w_sql = w_sql & "    WHERE A.CUSTOMER_ID(+) = :ORA_0"
        w_sql = w_sql & "      AND W.SELECT_NO1 = A.SELECT_NO1(+)"
        w_sql = w_sql & "      AND W.SELECT_NO2 = A.SELECT_NO2(+)"
        '*** 画面表示用（詳細表示分取得）
        If p_kbn = "1" Then
            w_sql = w_sql & " AND (W.SELECT_NO1,W.SELECT_NO2) IN ((0,0)"
            For w_i = 0 To Ubound(w_varray,2)
                If w_varray(42,w_i) = "2" Then
                    w_sql = w_sql & ",(" & w_varray(38,w_i) & "," & w_varray(39,w_i) & ")"
                End If
            Next
            w_sql = w_sql & ")"
        End if
        '*** 画面表示用（表示頁分取得）
        If p_kbn = "1" AndAlso SessionAsStrArray("SG_P_003INF")(5) = "1" Then
            w_sql = w_sql & " AND W.EMP_CODE IN ('00000000000'"
            For w_i = 0 To Ubound(w_total_array,2)
                w_sql = w_sql & ",'" & w_total_array(0,w_i) & "'"
            Next
            w_sql = w_sql & ")"
        End If
        w_sql = w_sql & "    ORDER BY"
        w_sql = w_sql & "       W.SELECT_NO1,W.SELECT_NO2,W.EMP_CODE,W.SEQNO"

        ReDim w_orapara(1, 0)
        w_orapara(0, 0) = SessionAsStr("SG_P_RID")
        w_orapara(1, 0) = "2"

        FUNCL_P_DETAIL = False
        If P000S011.FNCG_P_RECORDSET5(7, w_sql, w_orapara, vntfdata) Then
            FUNCL_P_DETAIL = True
        End If

    End Function

    '**********************************************************************
    ''' <summary>
    ''' EXCELデータ作成
    ''' </summary>
    ''' <param name="p_data"></param>
    ''' <remarks></remarks>    
    '**********************************************************************
    Sub SUBL_P_EXCELDATACREATE(ByRef p_data(,) As String)
        
        '**********************************************************************
        '//* 関数名：SUBL_P_EXCELDATACREATE()
        '//* 処  理：EXCELデータ作成
        '//* 引  数：p_data -- 一覧表示内容
        '**********************************************************************        
        
        Dim w_filename   As String                 '*** 物理ファイル名
        Dim w_fileobject As FileSystemObject       '*** Server CreateObject
        Dim w_fio_out    As TextStream             '*** テキスト変数(書込用)
        Dim w_dbuff      As String = PSTNullString '*** 書込内容
        Dim w_excel      As String = PSTNullString '*** EXCEL出力用の設定値作成ワーク
        Dim p_i          As Integer                '*** ループカウンタ
        Dim w_header     As String                 '*** EXCELヘッダー
        Dim w_header2()  As String
        Dim w_logmsg     As String = PSTNullString '*** 監査ログ：条件
        Dim w_logkname() As String                 '*** 監査ログ：カテゴリ名称
        Dim w_logsort()  As String                 '*** 監査ログ：表示順
        Dim w_logcname() As String                 '*** 監査ログ：項目名称
        Dim w_logcnt     As Integer                '*** 監査ログ：データ件数
        Dim w_logkkbn    As String                 '*** 監査ログ：機能区分
        Dim w_logsyrno As String                 '*** 監査ログ：処理番号
        Dim l_dai_kbn() As String
        Dim l_Last_No     As String
        Dim l_LastDisp    As String
        Dim w_k           As Integer
        Dim l_EasyViwe(1) As String
        
        Dim w_title As String
        Dim w_kyuyo As String
        Dim w_split() As String
        Dim w_siki As String
        Dim w_Hit As Integer
        Dim w_buff As String
        Dim w_flg As Integer
        Dim w_varray2_se(,) As Integer
        DIm w_pdata1(,,) As Integer
        DIm w_pdata2(,) As Integer
        Dim w_cnt1 As Integer
        Dim w_cnt2 As Integer
        Dim w_id As Integer
        Dim w_wsel1 As Integer
        Dim w_wsel2 As Integer
        Dim w_empcode As String
        '******************************************************************
        '* 開始ログ出力
        '******************************************************************
        w_logkkbn = "3"
        w_logsyrno = "30"
        P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
        w_logmsg = w_logmsg & "、"
        P000S017.FNCG_P_GETLOGNAME("100", "0", w_k_select, "", w_logmsg)
        
        l_EasyViwe(0) = w_langmsg(0, 61) ' ***ラベルデータ(61) "-"
        l_EasyViwe(1) = w_langmsg(0, 60) ' ***ラベルデータ(60) "○"
        
        'w_logmsg = w_logmsg & "、カナ氏名（含む）：" & w_inf(1)
        'w_logmsg = w_logmsg & "、氏名（含む）：" & w_inf(2)
        
        Session.Add("PSSO_OPERATIONNO", CDbl(SessionAsStr("PSSO_OPERATIONNO")) + 1)
        POCOM001.POCOM_ProcessStart(w_logmsg, "P000-00136", DBOBJ, "")
        '******************************************************************
        '*    外部ファイルの作成処理
        '******************************************************************
        w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & ".CSV"
        w_fileobject = New FileSystemObject()
        w_fio_out = POCOM001.POCOM_CreateTextFile(w_filename, System.Text.Encoding.Unicode, True)
        '******************************************************************
        '*    ヘッダーの設定
        '******************************************************************
        w_header = ""
        
        '*** 選択フラグ
        w_dbuff = w_dbuff & """" & w_langmsg(0, 31) & ""","
        w_header = w_header & """" & w_langmsg(0, 31) & ""","
        w_excel = w_excel & "-x"

       '*** 会社名列を表示する条件
        If IsZensyaMode() Then
            '会社名
            w_dbuff = w_dbuff & """" & P000S024.FNCG_P_KAISYA_KMK_NAME(w_k_select, 85) & ""","
            w_header = w_header & """" & P000S024.FNCG_P_KAISYA_KMK_NAME(w_k_select, 85) & ""","
            w_excel = w_excel & "x-"
        End If
        
        '*** 社員番号
        w_dbuff = w_dbuff & """" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(SessionAsStrArray("SG_P_SYSTEM")(8)) & """"
        w_header = w_header & """" & SessionAsStrArray("SG_P_SYSTEM")(8) & """"
        w_excel = w_excel & "01"
        
        '*** ﾗﾍﾞﾙ(39)："氏名"
        w_dbuff = w_dbuff & ",""" & w_langmsg(0, 39) & """"
        w_header = w_header & ",""" & w_langmsg(0, 39) & """"
        w_excel = w_excel & "-x"
        
        '*** ﾗﾍﾞﾙ(55)："適合率"
        w_dbuff = w_dbuff & ",""" & w_langmsg(0, 55) & """"
        w_header = w_header & ",""" & w_langmsg(0, 55) & """"
        w_excel = w_excel & "-21"
                
        ReDim l_dai_kbn(1)

        ' ***条件2行目
        For work_i = 0 To UBound(w_varray, 2)

            If l_dai_kbn(0) <> w_varray(38, work_i) Then
                l_dai_kbn(0) = w_varray(38, work_i)
                l_dai_kbn(1) = FNCL_P_AnswerRowSpan(w_varray(38, work_i))

                ' *** 必須項目
                If w_varray(40, work_i) = "0" Then

                    '*** ﾗﾍﾞﾙ(56)："条件"  name=""w_ch2"" checked value="""
                    '*** ﾗﾍﾞﾙ(57)："点" 
                    w_dbuff = w_dbuff & ",""" & w_langmsg(0, 56) & w_varray(38, work_i) & "(" & w_varray(41, work_i) & w_langmsg(0, 57) & ")"
                    w_header = w_header & ",""" & w_langmsg(0, 56) & w_varray(38, work_i) & "(" & w_varray(41, work_i) & w_langmsg(0, 57) & ")"
                    
                Else
                    ' ラベル(59):"必須"
                    w_dbuff = w_dbuff & ",""" & w_langmsg(0, 56) & w_varray(38, work_i) & "(" & w_langmsg(0, 59) & ")"
                    w_header = w_header & ",""" & w_langmsg(0, 56) & w_varray(38, work_i) & "(" & w_langmsg(0, 59) & ")"
                End If
                
                w_siki = ""
                If Val(FNCL_P_AnswerRowSpan(w_varray(38, work_i))) > 1 Then
                    w_siki = "[" & FNCL_P_AnswerSiki(w_varray(38, work_i)) & "]"
                End If
                
                w_dbuff = w_dbuff & w_siki & """"
                w_header = w_header & w_siki & """"
                w_excel = w_excel & "-x"
            End If
            
            '**********************************************************
            '* 検索項目名
            '**********************************************************
            w_title = ""
            w_kyuyo = ""
            If CInt(w_varray(1, work_i)) >= 501 AndAlso CInt(w_varray(1, work_i)) <= 564 Then
                '*** 給与・就業の範囲
                If Not IsNull(P000S001.FNCG_P_NZ(w_varray(7, work_i))) Then
                    w_title = w_varray(7, work_i)
                End If
                w_kyuyo = P000S030.FNCG_P_KYUYOTITLE(2, w_varray(1, work_i), w_varray(25, work_i), _
                                w_varray(26, work_i), w_varray(27, work_i), w_varray(28, work_i), "")
                w_split = VBSplit(w_kyuyo, "|", -1, 0)
                '*** 項目名 | 会社名  支給年月日
                If UBound(w_split) = -1 Then
                    w_title = w_title & w_kyuyo
                Else
                    w_title = w_title & w_split(0)
                End If
                
                w_title = "(" & w_varray(6, work_i) & ")" & w_title
                
                If UBound(w_split) > 0 Then
                    '*** 支給年月日を表示する
                    w_title += w_split(1)
                End If
            Else
                w_title = "(" & w_varray(6, work_i) & ")" & w_varray(7, work_i)
            End If
            
            ' *** ラベル(56)条件
            If Val(FNCL_P_AnswerRowSpan(w_varray(38, work_i))) > 1 Then
                w_dbuff = w_dbuff & ",""" & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 66), w_langmsg(0, 56) & w_varray(38, work_i) & "(" & w_varray(39, work_i) & ")" & w_title & " ", "") & """"
                w_header = w_header & ",""" & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 66), w_langmsg(0, 56) & w_varray(38, work_i) & "(" & w_varray(39, work_i) & ")" & w_title & " ", "") & """"
            Else
                w_dbuff = w_dbuff & ",""" & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 66), w_langmsg(0, 56) & w_varray(38, work_i) & w_title & " ", "") & """"
                w_header = w_header & ",""" & P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 66), w_langmsg(0, 56) & w_varray(38, work_i) & w_title & " ", "") & """"
            End If

            '*** 項目の表示書式を取得する
            If w_varray(1, work_i) = "-214" Then
                sql = "SELECT "
                sql = sql & " WEB_SP2140080_F(5,KAISYACD,MBO_HISTORY_NUMBER,MBO_GOAL_NUMBER,MBO_ITEM_ID,0)"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030030_W"
                sql = sql & " WHERE CUSTOMER_ID = :ORA_0"
                sql = sql & "   AND SELECT_ORDER = :ORA_1"
                ReDim w_orapara(1, 1)
                w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                w_orapara(1, 0) = PE_OraType.ORATYPE_NUMBER
                w_orapara(0, 1) = w_varray(0, work_i)
                w_orapara(1, 1) = PE_OraType.ORATYPE_NUMBER
            Else
                sql = "SELECT "
                sql = sql & " DISP_FORMAT"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010020_M"
                sql = sql & " WHERE CATEGORY_DIV = :ORA_0"
                sql = sql & "   AND ITEM_ORDER   = :ORA_1"
                ReDim w_orapara(1, 1)
                w_orapara(0, 0) = w_varray(1, work_i)
                w_orapara(1, 0) = PE_OraType.ORATYPE_NUMBER
                w_orapara(0, 1) = w_varray(2, work_i)
                w_orapara(1, 1) = PE_OraType.ORATYPE_NUMBER
            End If

            If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_fmtdata) Then
            End If

            Select Case w_fmtdata(0, 0)
                Case "01", "02", "08", "09", "21" To "29", "31" To "32", "34"
                    w_excel = w_excel & "-" & w_fmtdata(0, 0)

                Case Else
                    w_excel = w_excel & "-x"
            End Select

        Next work_i
        
        w_fio_out.WriteLine(w_dbuff)
        w_header2 = VBSplit(w_header, ",", -1, 0)
        
        '******************************************************************
        '*    内容の出力
        '******************************************************************
        If UBound(p_data, 2) > -1 Then
            '*** 詳細情報開始終了位置取得
            ReDim w_pdata1(1, UBound(w_varray, 2), UBound(p_data, 2))
            w_wsel1 = 0
            w_wsel2 = 0
            w_empcode = ""
            w_cnt1 = -1
            w_cnt2 = -1
            For w_k = 0 To UBound(w_varray2, 2)
                If w_wsel1 <> CInt(w_varray2(1, w_k)) OrElse w_wsel2 <> CInt(w_varray2(2, w_k)) Then
                    w_cnt1 = w_cnt1 + 1
                    If w_cnt1 > 0 Then
                        Exit For
                    End If
                End If
                If w_wsel1 <> CInt(w_varray2(1, w_k)) OrElse w_wsel2 <> CInt(w_varray2(2, w_k)) OrElse w_empcode <> w_varray2(0, w_k) Then
                    w_cnt2 = w_cnt2 + 1
                End If
                w_empcode = w_varray2(0, w_k)
                w_wsel1 = CInt(w_varray2(1, w_k))
                w_wsel2 = CInt(w_varray2(2, w_k))
            Next
            ReDim w_pdata2(1, w_cnt2)

            w_wsel1 = 0
            w_wsel2 = 0
            w_empcode = ""
            w_cnt1 = -1
            w_cnt2 = -1
            For w_k = 0 To UBound(w_varray2, 2)
                If w_wsel1 <> CInt(w_varray2(1, w_k)) OrElse w_wsel2 <> CInt(w_varray2(2, w_k)) Then
                    w_cnt1 = w_cnt1 + 1
                    w_cnt2 = -1
                End If
                If w_wsel1 <> CInt(w_varray2(1, w_k)) OrElse w_wsel2 <> CInt(w_varray2(2, w_k)) OrElse w_empcode <> w_varray2(0, w_k) Then
                    w_cnt2 = w_cnt2 + 1
                    If w_cnt1 = 0 Then
                        w_flg = 0
                        For p_i = 0 To UBound(p_data, 2)
                            If w_varray2(0, w_k) = p_data(0, p_i) Then
                                w_flg = 1
                                w_id = p_i
                                Exit For
                            End If
                        Next
                        If w_flg = 1 Then
                            w_pdata2(0, w_cnt2) = w_id
                            w_pdata2(1, w_cnt2) = 1
                        Else
                            w_pdata2(1, w_cnt2) = 0
                        End If
                    Else
                        w_id = w_pdata2(0, w_cnt2)
                        w_flg = w_pdata2(1, w_cnt2)
                    End If
                    If w_flg = 1 Then
                        w_pdata1(0, w_cnt1, w_id) = w_k
                    End If
                End If
                w_pdata1(1, w_cnt1, w_id) = w_k
                w_empcode = w_varray2(0, w_k)
                w_wsel1 = CInt(w_varray2(1, w_k))
                w_wsel2 = CInt(w_varray2(2, w_k))
            Next

            For p_i = 0 To UBound(p_data, 2)
                w_dbuff = ""
                l_dai_kbn(0) = ""
                
                '*** 選択フラグ
                w_dbuff = w_dbuff & """" & (p_data(2, p_i)) & ""","

                '*** 会社名列を表示する条件
                If IsZensyaMode() Then
                    w_dbuff = w_dbuff & """" & (p_data(6, p_i)) & ""","
                End If
                
                '*** 社員番号
                w_dbuff = w_dbuff & """" & (p_data(8, p_i)) & """"
                '*** 氏名
                w_dbuff = w_dbuff & ",""" & (p_data(1, p_i)) & """"
                '*** 適合率
                w_dbuff = w_dbuff & ",""" & Convert.ToDouble((p_data(7, p_i))).ToString("##0.0") & """"

                For work_i = 0 To UBound(w_varray, 2)
                    If l_dai_kbn(0) <> w_varray(38, work_i) Then
                        l_dai_kbn(0) = w_varray(38, work_i)

                        '... JOKEN1～n(ワーク行No + 9)
                        If p_data(CInt(w_varray(38, work_i)) + 9, p_i) = "1" Then
                            w_Hit = 1
                        Else
                            w_Hit = 0
                        End If
                         
                        '        If w_varray(42, work_i) = "1" Then
                        '*** 簡易表示
                        w_dbuff = w_dbuff & ",""" & l_EasyViwe(w_Hit) & """"
                        
                    End If

                    w_flg = 0
                    w_buff = ""
                    '*** 詳細情報
                    For w_k = w_pdata1(0, work_i, p_i) To w_pdata1(1, work_i, p_i)
                        If w_varray2(0, w_k) = p_data(0, p_i) AndAlso _
                           w_varray2(1, w_k) = w_varray(38, work_i) AndAlso _
                           w_varray2(2, w_k) = w_varray(39, work_i) Then
                            '*** セル内区切り文字は全角のコンマ
                            '*** 改行コードを除く
                            w_buff = w_buff & "，" & P000S001.FNCG_P_VBCRLF(1, w_varray2(5, w_k))

                            w_flg = 1
                        Else
                            If w_flg = 1 Then
                                Exit For
                            End If
                        End If
                    Next

                    w_buff = Mid(w_buff, 2)
                    w_dbuff = w_dbuff & ",""" & w_buff & """"

                    l_Last_No = w_varray(38, work_i)
                    l_LastDisp = w_varray(42, work_i)

                Next work_i

                w_fio_out.WriteLine(w_dbuff)
            Next
        End If
        w_fio_out.Close()
        w_fileobject = Nothing
        w_fio_out = Nothing
        '**************************************************************
        '* 監査ログ用項目情報取得
        '**************************************************************
        ReDim w_logkname(UBound(w_header2, 1))
        ReDim w_logsort(UBound(w_header2, 1))
        ReDim w_logcname(UBound(w_header2, 1))
        For w_i = 0 To UBound(w_header2, 1)
            w_logkname(w_i) = ""
            w_logsort(w_i) = CStr(w_i + 1)
            w_logcname(w_i) = Replace(w_header2(w_i), """", "")
        Next
        w_logcnt = UBound(p_data, 2) + 1
        '**************************************************************
        '* 終了ログ出力
        '**************************************************************
        POCOM001.POCOM_DataOutComplete(w_logmsg, w_logcnt, w_logkname, w_logsort, w_logcname, "P000-00137", DBOBJ, "")
        Session.Add("SG_P_EXCELOUTPUT", New Object() {"3", w_excel, w_logmsg, w_logcnt, w_logkname, w_logsort, w_logcname, w_logkkbn, w_logsyrno})
        '*** EXCEL出力用の設定値
        '*** (0)：処理区分（1=CSV・2=ﾃｷｽﾄ変換・・3=ﾃｷｽﾄ変換【日付の西暦指定】）
        '*** (1)：ｾﾙ形式（配列数分をﾊｲﾌﾝ(-)区切りで格納）
        '*** (2)：監査ログ：条件
        '*** (3)：監査ログ：データ件数
        '*** (4)：監査ログ：カテゴリ名称
        '*** (5)：監査ログ：表示順
        '*** (6)：監査ログ：項目名称
        '*** (7)：監査ログ：機能区分
        '*** (8)：監査ログ：処理番号
    End Sub

    '**********************************************************************
    ''' <summary>
    ''' ワークテーブル再読込み(ページ単位対応)
    ''' </summary>
    ''' <remarks></remarks>
    '**********************************************************************
    Sub SUBL_P_CREATEARRAY()
        Dim p_i, p_j, p_k As Integer

        w_varray3 = Nothing
        p_j = 0

        If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
            '*** １５件毎を表示の場合

            If UBound(w_total_array, 2) = -1 Then
                w_varray3 = w_total_array
            Else
                For p_k = 0 To UBound(w_total_array, 2)
                    If w_total_array(9, p_k) = (CLng(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1)) + 1).ToString Then
                        ReDim Preserve w_varray3(UBound(w_total_array, 1), p_j)
                        For p_i = 0 To UBound(w_total_array, 1)
                            w_varray3(p_i, p_j) = w_total_array(p_i, p_k)
                        Next
                        p_j = p_j + 1
                    End If
                Next
            End If

        Else
            '*** 全件表示の場合
            w_varray3 = w_total_array
        End If

        '******************************************************************
        '* 画面表示対象となる社員の社員コード
        '******************************************************************
        w_disp_scd = ""
        For p_i = 0 To UBound(w_varray3, 2)
            w_disp_scd = w_disp_scd & "," & w_varray3(0,p_i)
        Next
        If w_disp_scd <> "" Then
            w_disp_scd = Mid(w_disp_scd,2)
        End If

    End Sub

    '**********************************************************************
    ''' <summary>
    ''' （適合率検索）選択社員情報の取得
    ''' </summary>
    ''' <remarks></remarks>
    '**********************************************************************
    Sub SUBL_P_SELECT_DATA()
        Dim p_dtget(,) As String = Nothing
        Dim p_i As Integer

        w_selectdata = ""

        sql = "SELECT "
        sql = sql & " EMP_CODE"
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID")
        sql = sql & " WHERE NVL(SELECT_FLAG,'0') = '1'"
        sql = sql & " ORDER BY EMP_CODE"

        If P000S011.FNCG_P_RECORDSET1(1, sql, p_dtget) = True Then
            For p_i = 0 To UBound(p_dtget, 2)
                w_selectdata = w_selectdata & "," & p_dtget(0,p_i)
            Next
            If w_selectdata <> "" Then
                w_selectdata = Mid(w_selectdata,2)
            End If
        End If

    End Sub

    '**********************************************************************
    ''' <summary>
    ''' （適合率検索）対象者情報の制御処理
    ''' </summary>
    ''' <remarks></remarks>
    '**********************************************************************
    Sub SUBL_P_TARGET_INFOSET()

        ' *** 対象者情報の取得
        If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
            '******************************************************************
            '* １５件毎を表示の場合
            '******************************************************************
            w_sdata = SessionAsStrArray("SL_P000KENWORK")        '*** SL_P000KENWORK_02

            '*** 必須チェックが外された場合
            If w_Check_flg = "OFF" Then
                '*** 全体検索の件数より取得した総ページ分のチェックを立てる
                w_SentakWork = FNCL_P_CHECKED_OFF_REQ()
                If w_SentakWork <> "" Then
                    w_sdata(0) = w_SentakWork
                End If
            End If

            '******************************************************************
            '* 次前処理項目
            '******************************************************************
            If SessionAsStr("PSSO_DESIGN") = "1" Then             '*** 新メニュー

                '*** ﾗﾍﾞﾙ(1)：先頭に移動します。
                '*** ﾗﾍﾞﾙ(2)：前に移動します。
                w_btkbn1 = New String() {"onclick=""javascript:JSFL_P_SUBMIT('1');""", " title='" & w_langmsg(0, 1) & "'", _
                    "onclick=""javascript:JSFL_P_SUBMIT('3');""", " title='" & w_langmsg(0, 2) & "'"}

                '*** ﾗﾍﾞﾙ(3)：次に移動します。
                '*** ﾗﾍﾞﾙ(4)：最後に移動します。
                w_btkbn2 = New String() {"onclick=""javascript:JSFL_P_SUBMIT('4');""", " title='" & w_langmsg(0, 3) & "'", _
                    "onclick=""javascript:JSFL_P_SUBMIT('2');""", " title='" & w_langmsg(0, 4) & "'"}

                If w_PageMaxBuff <> "0" Then
                    w_chkset = VBSplit(w_sdata(0), "-", -1, 0)(CInt(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1)))
                End If

                If SessionAsStrArray2D("SL_P000KENFLAG")(2, 1) = "0" Then
                    '*** ﾗﾍﾞﾙ(5)：移動できません。
                    '*** ﾗﾍﾞﾙ(6)：移動できません。
                    w_btkbn1 = New String() {"""""", " disabled title='" & w_langmsg(0, 5) & "'", _
                        """""", " disabled title='" & w_langmsg(0, 6) & "'"}
                End If

                '*** ページの最大は算出値を使用する
                If (SessionAsStrArray2D("SL_P000KENFLAG")(2, 1) = (Val(w_PageMaxBuff) - 1).ToString) OrElse (Val(w_PageMaxBuff) - 1).ToString = "-1" Then
                    '*** ﾗﾍﾞﾙ(7)：移動できません。
                    '*** ﾗﾍﾞﾙ(8)：移動できません。
                    w_btkbn2 = New String() {"""""", " disabled title='" & w_langmsg(0, 7) & "'", _
                        """""", " disabled title='" & w_langmsg(0, 8) & "'"}
                End If

            Else                                    '*** 旧メニュー

                '*** ﾗﾍﾞﾙ(9)：先頭に移動します。
                '*** ﾗﾍﾞﾙ(10)：前に移動します。
                w_btkbn1 = New String() {"javascript:JSFL_P_SUBMIT('1');", " title='" & w_langmsg(0, 9) & "'", _
                    "javascript:JSFL_P_SUBMIT('3');", " title='" & w_langmsg(0, 10) & "'"}

                '*** ﾗﾍﾞﾙ(11)：次に移動します。
                '*** ﾗﾍﾞﾙ(12)：最後に移動します。
                w_btkbn2 = New String() {"javascript:JSFL_P_SUBMIT('4');", " title='" & w_langmsg(0, 11) & "'", _
                    "javascript:JSFL_P_SUBMIT('2');", " title='" & w_langmsg(0, 12) & "'"}

                If w_PageMaxBuff <> "0" Then
                    w_chkset = VBSplit(w_sdata(0), "-", -1, 0)(CInt(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1)))
                End If

                w_btnbit = "1111"

                If SessionAsStrArray2D("SL_P000KENFLAG")(2, 1) = "0" Then
                    '*** ﾗﾍﾞﾙ(13)：移動できません。
                    '*** ﾗﾍﾞﾙ(14)：移動できません。
                    w_btkbn1 = New String() {"#", " disabled title='" & w_langmsg(0, 13) & "'", _
                        "#", " disabled title='" & w_langmsg(0, 14) & "'"}
                    w_btnbit = "00" & Mid(w_btnbit, 3)
                End If

                If SessionAsStrArray2D("SL_P000KENFLAG")(2, 1) = SessionAsStrArray2D("SL_P000KENFLAG")(2, 0) Then
                    '*** ﾗﾍﾞﾙ(15)：移動できません。
                    '*** ﾗﾍﾞﾙ(16)：移動できません。
                    w_btkbn2 = New String() {"#", " disabled title='" & w_langmsg(0, 15) & "'", _
                        "#", " disabled title='" & w_langmsg(0, 16) & "'"}
                    w_btnbit = Mid(w_btnbit, 1, 2) & "00"
                End If

            End If

            '******************************************************************
            '* ページ描画方法の切替
            '******************************************************************
            If w_PageMaxBuff <> "0" Then
                w_posit = CLng(SessionAsStrArray2D("SL_P000KENFLAG")(2, 1)) + 1 & "/" & w_PageMaxBuff
            Else
                w_posit = ""
            End If

            w_chkevent = "OnChange=""return JSFL_P_CHGPAGE(this,0)"" OnBlur=""return JSFL_P_CHGPAGE(this,1)"" onKeyPress=""if(event.keyCode==13){ JSFL_P_CHGPAGE(this,2); return false; }"""
            w_kopt(0) = SessionAsStrArray("SG_P_003INF")(4)

        End If

    End Sub


    '**********************************************************************
    ''' <summary>
    ''' 必須チェックが外された時、社員選択を全てONにする処理
    ''' </summary>
    ''' <remarks></remarks>
    '**********************************************************************
    Function FNCL_P_CHECKED_OFF_REQ() As String
        Dim w_icnt As Integer
        Dim buff As String

        buff = ""

        If w_PageMaxBuff <> "0" Then
            For w_icnt = 0 To CInt(w_PageMaxBuff) - 1
                buff = buff & "-" & "111111111111111"
            Next

            buff = Mid(buff,2)
        End If

        FNCL_P_CHECKED_OFF_REQ = buff
    End Function

    '**********************************************************************
    ''' <summary>
    ''' 適合率検索　明細ラベル作成
    ''' </summary>
    ''' <remarks></remarks>
    '**********************************************************************
    Sub SUBL_P_createDetailLabele()
        Dim w_sort_chr(2) As String
        Dim buff(2)       As String
        Dim w_ci As Integer
        Dim w_width(1) As String
        Dim w_chk As String
        Dim chk_buf() As String
        Dim l_style(1) As String
        
        Dim l_Last_No As String
        Dim l_LastMust As String
        
        Dim w_split() As String
        Dim w_title As String
        Dim w_kyuyo As String
        
        
        w_sort_chr(0) = ""
        w_sort_chr(1) = "▼"
        w_sort_chr(2) = "▲"

        If w_sort <> "" Then
            buff(0) = VBSplit(w_sort, "_", -1, 0)(0)
            buff(1) = VBSplit(w_sort, "_", -1, 0)(1)
        End If
        
        l_style(0) = "id=idfsize09"
        l_style(1) = "id=idfsize09B"
        
        w_ci = CInt(Val(buff(1)))
        
        If w_langdt(6) = "0" Then
            w_width(0) = "width=""40"""
            w_width(1) = "width=""70"""
            
        Else
            w_width(0) = "width=""50"""
            w_width(1) = "width=""70"""
        End If

        '*** 社員選択のINDEX値
        Response.Write("<input type=""hidden"" value="""" name=""syainList"">")
        '*** 社員選択の社員コード
        Response.Write("<input type=""hidden"" value="""" name=""syainNoList"">")
        '*** 画面表示社員の社員コード
        Response.Write("<input type=""hidden"" value=""" & w_disp_scd & """ name=""syainNoListAll"">")

        Response.Write(" <table id=""Table1"" border=""0"" cellpadding=""0"" cellspacing=""0"" width=""100%"" class=""border"" bgcolor=""" & SessionAsStrArray("SG_P_COLOR")(8) & """>")
        Response.Write(" <tr bgcolor=" & SessionAsStrArray("SG_P_COLOR")(2) & ">")
        
        If SessionAsStrArray2D("SL_P000KENFLAG")(0, 2) = "1" Then
            Response.Write(" <th nowrap align=""center"" rowspan=""3"" " & w_width(0) & ">")
            '*** ﾗﾍﾞﾙ(30)：全てを選択する
            '*** ﾗﾍﾞﾙ(31)："選択"
            Response.Write("<a id=""lnk02"" href=""javascript:JSFL_P_SUBMIT('on');"" title=""" & w_langmsg(0, 30) & """ onclick=""JSF_P_WORKSET(1,0)"">")
            Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 31), "id=idfsize09") & "</a><br>")
            '*** ﾗﾍﾞﾙ(32)："解除"
            '*** ﾗﾍﾞﾙ(33)：全てを解除する
            Response.Write("<a id=""lnk02"" href=""javascript:JSFL_P_SUBMIT('off');"" title=""" & w_langmsg(0, 33) & """ onclick=""JSF_P_WORKSET(2,0)"">")
            Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 32), "id=idfsize09") & "</a>")
            Response.Write(" </th>")
        Else
            Response.Write(" <th nowrap align=""center"" rowspan=""3"" " & w_width(0) & ">")
            '*** ﾗﾍﾞﾙ(30)：全てを選択する
            '*** ﾗﾍﾞﾙ(31)："選択"
            Response.Write("<a id=""lnk02"" href=""javascript:JSFL_P_SUBMIT('on_all');"" title=""" & w_langmsg(0, 30) & """ onclick=""JSF_P_WORKSET(1,0)"">")
            Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 31), "id=idfsize09") & "</a><br>")
            '*** ﾗﾍﾞﾙ(32)："解除"
            '*** ﾗﾍﾞﾙ(33)：全てを解除する
            Response.Write("<a id=""lnk02"" href=""javascript:JSFL_P_SUBMIT('off_all');"" title=""" & w_langmsg(0, 33) & """ onclick=""JSF_P_WORKSET(2,0)"">")
            Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 32), "id=idfsize09") & "</a>")
            Response.Write(" </th>")
        End If


        '*** 会社名
        If IsZensyaMode() Then            '*** 会社名列を表示する条件
            '*** ﾗﾍﾞﾙ(38)：FNCG_P_KAISYA_KMK_NAME(w_k_select,85) & "名"
            Response.Write("<th nowrap rowspan=""3"">")
            Response.Write(P000S004.FNCG_P_FONT_TAG(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 38), _
                                P000S024.FNCG_P_KAISYA_KMK_NAME(w_k_select, 85), "id=idfsize09"), w_style(0)))
            Response.Write("</th>")
        End If

        '*** 社員番号
        Response.Write(" <th nowrap rowspan=""3""  width="""" >")
        Response.Write(P000S004.FNCG_P_FONT_TAG(SessionAsStrArray("SG_P_SYSTEM")(8), w_style(0)))
        Response.Write(" </th>")
        
        '*** ﾗﾍﾞﾙ(39)："氏名"
        Response.Write(" <th nowrap rowspan=""3"" >")
        Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 39), w_style(0)))
        Response.Write(" </th>")
        
        '*** ﾗﾍﾞﾙ(55)："適合率"
        Response.Write(" <th nowrap rowspan=""3"" " & w_width(1) & ">")
        
        If buff(0) Is Nothing Then
            Response.Write("<a id=""lnk09"" href=""#"" onclick=""javascript:JSFL_P_SUBMIT('12_0_1');"" >")
            Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 55) & w_sort_chr(1), l_style(0)))

            w_sort_save = "12_0_1"
        Else
            If buff(0) = "0" Then
                Response.Write("<a id=""lnk09"" href=""#"" onclick=""javascript:JSFL_P_SUBMIT('12_0_" & w_ci.ToString & "');"" >")
                Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 55) & w_sort_chr(w_ci), l_style(0)))

                w_sort_save = "12_0_" & w_ci.ToString
            Else
                Response.Write("<a id=""lnk09"" href=""#"" onclick=""javascript:JSFL_P_SUBMIT('12_0_0');"" >")
                Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 55), l_style(0)))
            End If
        End If
            
        Response.Write("</a>")

        
        Response.Write(" </th>")
            
        ' ***　必須チェック取得
        w_chk = FNCL_P_str_CheckValue()
        w_chk_save = w_chk
        ReDim chk_buf(UBound(VBSplit(w_chk, "_", -1, 0)))
        chk_buf = VBSplit(w_chk, "_", -1, 0)

        l_Last_No = ""
        l_LastMust = ""
        
        ' ***条件1行目
        For work_i = 0 To UBound(w_varray, 2)
                                    
            If w_dai_kbn(0) <> w_varray(38, work_i) Then
                w_dai_kbn(0) = w_varray(38, work_i)
                w_dai_kbn(1) = FNCL_P_AnswerRowSpan(w_varray(38, work_i))
                
                '*** ﾗﾍﾞﾙ(56)："条件"  name=""w_ch2"" checked value="""
                '*** ﾗﾍﾞﾙ(57)："点"
                'Response.Write("<TD align=center >" & vntfdata(38, icnt) & "<BR></TD>")  
                Response.Write("<th nowrap colspan=""" & w_dai_kbn(1) & """rowspan=""1"" >")
                
                ' 必須項目
                If l_Last_No = w_varray(38, work_i) AndAlso l_LastMust <> w_varray(40, work_i) Then
                    w_varray(40, work_i) = l_LastMust
                End If
                
                ' 必須項目
                If w_varray(40, work_i) = "0" Then
                    ' 必須チェック
                    If chk_buf(CInt(w_dai_kbn(0)) - 1) = "0" Then
                        Response.Write("<input type=""checkbox"" name=""w_ch2""  value=""" & work_i & _
                                                 """  onclick=""javascript:JSFL_P_SUBMIT('13')"" title=""" & w_langmsg(0, 64) & """>")
                    Else
                        Response.Write("<input type=""checkbox"" name=""w_ch2"" checked value=""" & work_i & _
                                                 """  onclick=""javascript:JSFL_P_SUBMIT('13')"" title=""" & w_langmsg(0, 64) & """>")
                    End If
                    Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 56) & w_varray(38, work_i) & _
                  "<br>(" & w_varray(41, work_i) & w_langmsg(0, 57) & ")", l_style(0)))
                Else
                    Response.Write("<input type=""hidden"" name=""w_ch2"" value="""">")
                    ' ラベル(59):"必須"
                    Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 56) & w_varray(38, work_i) & _
                        "<br>(" & w_langmsg(0, 59) & ")", l_style(0)))
                End If
                
                Response.Write("</th>")
            End If
            
            l_Last_No = w_varray(38, work_i)
            l_LastMust = w_varray(40, work_i)
            
        Next work_i
        
        Response.Write(" </tr>")
        Response.Write(" <tr bgcolor=" & SessionAsStrArray("SG_P_COLOR")(2) & ">")
        
        ' ***条件2行目
        For work_i = 0 To UBound(w_varray, 2)
            
            '**********************************************************
            '* 検索項目名
            '**********************************************************
            w_title = ""
            w_kyuyo = ""
            If CInt(w_varray(1, work_i)) >= 501 AndAlso CInt(w_varray(1, work_i)) <= 564 Then
                '*** 給与・就業の範囲
                If Not IsNull(P000S001.FNCG_P_NZ(w_varray(7, work_i))) Then
                    w_title = w_varray(7, work_i)
                End If
                w_kyuyo = P000S030.FNCG_P_KYUYOTITLE(2, w_varray(1, work_i), w_varray(25, work_i), _
                                w_varray(26, work_i), w_varray(27, work_i), w_varray(28, work_i), "")
                w_split = VBSplit(w_kyuyo, "|", -1, 0)
                '*** 項目名 | 会社名  支給年月日
                If UBound(w_split) = -1 Then
                    w_title = w_title & w_kyuyo
                Else
                    w_title = w_title & w_split(0)
                End If
                
                w_title = w_varray(6, work_i) & "<br>" & w_title
                
                If UBound(w_split) > 0 Then
                    '*** 支給年月日を表示する
                    w_title += "<br>" & w_split(1)
                End If
            Else
                w_title = w_varray(6, work_i) & "<br>" & w_varray(7, work_i)
            End If
            
            If Val(FNCL_P_AnswerRowSpan(w_varray(38, work_i))) > 1 Then
                Response.Write("<th nowrap >" & "(" & w_varray(39, work_i) & ")" & w_title & "</th>")
            Else
                Response.Write("<th nowrap colspan=""1"" rowspan=2 >")
                If w_varray(42, work_i) <> "1" AndAlso w_varray(29, work_i) = "1" Then '必須項目でない、かつ、単一項目
                    If w_varray(38, work_i) = buff(0) Then
                        Response.Write("<a id=""lnk09"" href=""#"" onclick=""javascript:JSFL_P_SUBMIT('14_" & w_varray(38, work_i) & "_" & w_ci.ToString & "');"" >")
                        Response.Write(P000S004.FNCG_P_FONT_TAG(w_title & w_sort_chr(w_ci), l_style(0)))
                        w_sort_save = "14_" & w_varray(38, work_i) & "_" & w_ci.ToString
                    Else
                        Response.Write("<a id=""lnk09"" href=""#"" onclick=""javascript:JSFL_P_SUBMIT('14_" & w_varray(38, work_i) & "_1');"" >")
                        Response.Write(P000S004.FNCG_P_FONT_TAG(w_title, l_style(0)))
                    End If
                    Response.Write("</a>")
                Else
                    Response.Write(P000S004.FNCG_P_FONT_TAG(w_title, l_style(0)))
                End If
                Response.Write("</th>")
            End If
        Next work_i
        
        Response.Write(" </tr>")
        Response.Write(" <tr bgcolor=" & SessionAsStrArray("SG_P_COLOR")(2) & ">")
        
        w_dai_kbn(0) = ""
        w_dai_kbn(1) = ""
        
        ' ***条件3行目
        For work_i = 0 To UBound(w_varray, 2)
            
            If Val(FNCL_P_AnswerRowSpan(w_varray(38, work_i))) > 1 Then
                
                If w_dai_kbn(0) <> w_varray(38, work_i) Then
                    w_dai_kbn(0) = w_varray(38, work_i)
                    w_dai_kbn(1) = FNCL_P_AnswerRowSpan(w_varray(38, work_i))
                    
                    Response.Write("<th nowrap colspan=""" & w_dai_kbn(1) & """rowspan=""1"" >" &
                       P000S004.FNCG_P_FONT_TAG(FNCL_P_AnswerSiki(w_varray(38, work_i)), l_style(0)) & "</th>")
                End If
            End If
        Next work_i
        Response.Write(" </tr>")
    End Sub
    
    '**********************************************************************
    ''' <summary>
    ''' 適合率検索　明細行作成
    ''' </summary>
    ''' <remarks></remarks>
    '**********************************************************************
    Sub SUBL_P_createDetail()
        
        Dim l_style(1)     As String
        Dim l_color(1)     As String
        Dim l_EasyViwe(1)  As String
        Dim l_FontColor(1) As String

        Dim l_Last_No      As String
        Dim l_LastDisp     As String
        
        Dim w_k            As Integer
        Dim w_font         As String
        Dim w_fColor       As String

        Dim w_Hit          As Integer
        Dim w_Hit2         As Integer
        Dim LoopMax        As Integer
        Dim StartPoint     As Integer
        
        Dim l_Align        As String
        Dim w_DetileCnt    As Integer
        
        l_style(0) = " id=idfsize09"
        l_style(1) = " id=idfsize09B"
        
        l_color(0) = "bgcolor=white"
        l_color(1) = "bgcolor=#FFFF99" '*** 薄黄色
        
        'ラベルデータ
        l_EasyViwe(0) = w_langmsg(0, 61) ' ***ラベルデータ(61) "-"
        l_EasyViwe(1) = w_langmsg(0, 60) ' ***ラベルデータ(60) "○"
        
        l_FontColor(0) = " color=""gray"""
        l_FontColor(1) = " color=""black"""

        ' ***明細行 UBound(w_varray3)
        For w_icnt = 0 To UBound(w_varray3, 2)
            Response.Write(" <tr>")

            ' *** 選択
            Response.Write("  <td align=""center"">")
            Response.Write("<input type=""checkbox"" name=""ch1"" " & _
                        P000S001.FNCG_P_HAIRETUCHK2(1, w_selectdata, w_varray3(0, w_icnt), ",") & " value=""" & _
                        P000S001.FNCG_P_HTMLENCODE(CStr(w_icnt + 1)) & """ onclick=""JSF_P_WORKSET(0,0)"">")
            Response.Write("<input type=""hidden"" name=""ch1_" & CStr(w_icnt + 1) & """ value=""" & P000S001.FNCG_P_HTMLENCODE(w_varray3(0, w_icnt)) & """>")
            Response.Write("  </td>")

            ' *** 会社名
            If IsZensyaMode() Then		'*** 会社名列を表示する条件
                Response.Write("  <td nowrap>")
                Response.Write(P000S004.FNCG_P_FONT_TAG(w_varray3(6, w_icnt), l_style(0)))
                Response.Write("<br></td>")
            End If

            ' *** 社員番号
            Response.Write("  <td nowrap id=""Td1"" align=""center"">")
            Response.Write(P000S004.FNCG_P_FONT_TAG(w_varray3(8, w_icnt), l_style(0)))
            Response.Write("  <br></td>")

            ' *** 氏名
            Response.Write("  <td nowrap>")
            Response.Write(P000S004.FNCG_P_FONT_TAG(w_varray3(1, w_icnt), l_style(0)))
            Response.Write("  <br></td>")
            
            ' ***適合率
            Response.Write("  <td nowrap align=""right"">")
            If w_varray3(7, w_icnt) <> "" Then
                Response.Write(P000S004.FNCG_P_FONT_TAG(Format(Val(w_varray3(7, w_icnt)), "##0.0"), l_style(0)))
            Else
                Response.Write(P000S004.FNCG_P_FONT_TAG(w_varray3(7, w_icnt), l_style(0)))
            End If

            Response.Write("  <br></td>")
            
            l_Last_No = ""
            l_LastDisp = ""
            
            For work_i = 0 To UBound(w_varray, 2)
                
                '*** 色分け 添え字10 ... JOKEN1～n(ワーク行No + 9)
                If w_varray3(CInt(w_varray(38, work_i)) + 9, w_icnt) = "1" Then
                    w_Hit = 1
                Else
                    w_Hit = 0
                End If
                
                If w_varray(42, work_i) = "1" Then
                    Response.Write(" <td nowrap " & l_color(w_Hit) & l_style(w_Hit) & " align=""center"" >")
                    ' *** 簡易表示
                    
                    '*** WEB_TP0030030条件ワークの最終行No + 10 + ループ回数
                    '*** (枝番情報＝ワークの行数)＝表示列数の為、キーによるマッピングは不要
                    w_Hit2 = CInt(w_varray3(CInt(w_varray(38, UBound(w_varray, 2))) + 10 + work_i, w_icnt))
                    
                    Response.Write("      <a id=""lnk09"" href=""javascript:JSFL_P_SYOSAI('" & w_varray3(0, w_icnt) & "_" _
                                                & w_varray(38, work_i) & "_" & w_varray(39, work_i) & "');"">")
                    
                    'Response.Write(P000S004.FNCG_P_FONT_TAG(l_EasyViwe(w_Hit), ""))
                    Response.Write(P000S004.FNCG_P_FONT_TAG(l_EasyViwe(w_Hit2), l_style(0)))
                    Response.Write("</a>")
                    
                Else

                    w_DetileCnt = 0

                    '***:詳細情報
                    For w_k = 0 To UBound(w_varray2, 2)
                        If w_varray2(0, w_k) = w_varray3(0, w_icnt) _
                                AndAlso w_varray(38, work_i) = w_varray2(1, w_k) _
                                AndAlso w_varray(39, work_i) = w_varray2(2, w_k) Then
                                
                            ' *** 明細のTARGET_DIVを判定
                            If w_varray2(4, w_k) = "1" Then
                                w_font = l_style(1)
                                w_fColor = l_FontColor(1)
                            Else
                                w_font = l_style(0)
                                w_fColor = l_FontColor(0)
                            End If
                            
                            '*** 初回制御 先頭行に合わせる
                            If w_DetileCnt = 0 Then
                                
                                Select Case w_varray2(6, w_k)
                                    Case "2"
                                        l_Align = " align=""right"""
                                    Case Else
                                        l_Align = " align=""left"""
                                End Select
                                Response.Write(" <td nowrap " & l_color(w_Hit) & l_style(w_Hit) & l_Align & ">")
                                
                                Response.Write("      <table>")
                            End If
                            
                            Response.Write("       <tr>")
                            Response.Write("        <td" & w_font & " nowrap " & l_Align & ">")
                            Response.Write(P000S004.FNCG_P_FONT_TAG(w_varray2(5, w_k), w_fColor))
                            Response.Write("        </td>")
                            Response.Write("       </tr>")
                                
                            w_DetileCnt = w_DetileCnt + 1
                        End If
                    Next
                    Response.Write("      </table>")        
                End If
                
                Response.Write(" </td>")
                 
                l_Last_No = w_varray(38, work_i)
                l_LastDisp = w_varray(42, work_i)
            Next work_i
            
            Response.Write(" </tr>")
            
        Next w_icnt
        
        StartPoint = UBound(w_varray3, 2)
        If StartPoint = -1 Then
            StartPoint = 0
            LoopMax = 15
        Else
            LoopMax = 14
        End If
        
        If w_PageMaxBuff <> "0" Then
            ' ***空行
            'For w_icnt = UBound(PE_ComVars.Instance.w_fdata2D, 2) + 1 To 14
            For w_icnt = StartPoint + 1 To LoopMax
                Response.Write(" <tr height=""22"">")
                Response.Write(" <td nowrap  align=""center"">")
                        
                If UBound(w_varray3, 2) = -1 Then
                                
                    If w_icnt = 1 Then
                        Response.Write("<input type=""checkbox"" disabled="""" name=""ch1""  value=""" & _
                                    P000S001.FNCG_P_HTMLENCODE(CStr(w_icnt)) & """ onclick=""JSF_P_WORKSET(0,0)"">")
                    Else
                        Response.Write("  <br>")
                    End If
                Else
                    Response.Write("  <br>")
                End If
                Response.Write(" </td>")
                
                '*** 会社名列を表示する条件
                If IsZensyaMode() Then
                    Response.Write("<td><br></td>")
                End If
            
                Response.Write(" <td><br></td>")
                Response.Write(" <td><br></td>")
                Response.Write(" <td><br></td>")
            
                For work_i = 0 To UBound(w_varray, 2)
                    Response.Write("<td nowrap> <br></td>")
                Next work_i
            
                Response.Write(" </tr>")
            Next w_icnt
            
        Else
            Response.Write(" <tr>")
            Response.Write("<input type=""hidden"" name=""ch1"" value="""" >")
            Response.Write("<input type=""hidden"" name=""ch1_1"" value="""" >")
            If IsZensyaMode() Then
                Response.Write("<td colspan=""" & 5 + UBound(w_varray, 2) & """  align=""left"">")
            Else
                Response.Write("<td colspan=""" & 4 + UBound(w_varray, 2) & """  align=""left"">")
            End If
            
            Response.Write(P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 62), "") & "</td>")
            Response.Write(" </tr>")
        End If
        
        Response.Write(" </table>")
       
    End Sub

    '**********************************************************************
    ''' <summary>
    ''' 受け取り引数の確認
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    '**********************************************************************
    Function FNCL_P_str_CheckValue() As String
        Dim w_max As Integer
        Dim w_max_num As Integer
        Dim w_checkd_l As String
        Dim w_i As Integer
        
        ' *** 変数初期化
        w_checkd_l = ""
        
        If w_check = "" Then
            ' *** 引数の受け取りが無い場合、初期値をセット(未チェック)
            w_max = UBound(w_varray, 2)
            w_max_num = CInt(Val(w_varray(38, w_max)))
        
            For w_i = 1 To w_max_num
                If w_i = 1 Then
                    w_checkd_l = "0"
                Else
                    w_checkd_l = w_checkd_l & "_0"
                End If
            Next
            FNCL_P_str_CheckValue = w_checkd_l
        Else
            FNCL_P_str_CheckValue = w_check
        End If
        
    End Function

    '**********************************************************************
    ''' <summary>
    ''' 判例『色見本表示』作成
    ''' </summary>
    ''' <remarks></remarks>
    '**********************************************************************
    Sub SUBL_P_HANREI()

        Response.Write("<TABLE border=0 cellpadding=0 cellspacing=0>")
        Response.Write("<TR>")
        '*** ﾗﾍﾞﾙ(49)："背景色"
        Response.Write("    <TD>")
        Response.Write("        <TABLE border=0 cellPadding=1 cellSpacing=0 bgcolor=""#FFFF99"" style=""border-style:ridge;border-color:#000000;border-width:1px"">")
        Response.Write("        <TR><TD nowrap>" & P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 49), "id=idfsize09") & "</TD></TR>")
        Response.Write("        </TABLE>")
        Response.Write("    </TD>")
        Response.Write("    <TD width=5 nowrap></TD>")

        '*** ﾗﾍﾞﾙ(58)："…条件を満たしています。"
        Response.Write("    <TD valign=bottom nowrap>" & P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 58), "id=idfsize09 color=red") & "</TD>")
        Response.Write("    <TD width=5 nowrap></TD>")

        '*** ﾗﾍﾞﾙ(65)："太字"
        Response.Write("    <TD>")
        Response.Write("        <TABLE border=0 cellPadding=1 cellSpacing=0  style=""border-style:ridge;border-color:#000000;border-width:1px"">")
        Response.Write("        <TR><TD nowrap>" & P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 65), "id=idfsize09B") & "</TD></TR>")
        Response.Write("        </TABLE>")
        Response.Write("    </TD>")
        Response.Write("    <TD width=5 nowrap></TD>")
        '*** ﾗﾍﾞﾙ(63)："…条件に合致した値です。"
        Response.Write("    <TD valign=bottom nowrap>" & P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 63), "id=idfsize09 color=red") & "</TD>")
        Response.Write("</TR>")
        Response.Write("</TABLE>")

    End Sub

    '**********************************************************************
    ''' <summary>
    ''' 最大値を取得
    ''' </summary>
    ''' <param name="getNo"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    '**********************************************************************
    Private Function FNCL_P_AnswerRowSpan(ByVal getNo As String) As String
        
        Dim i As Integer
        Dim maxRows As Integer
        Dim count As Integer
        
        maxRows = UBound(w_varray, 2)
        
        count = 0
        
        For i = 0 To maxRows
            ' Noをキー
            If w_varray(38, i) = getNo Then
                count = count + 1
            End If
        Next i
        
        FNCL_P_AnswerRowSpan = CStr(count)
    End Function

    '**********************************************************************
    ''' <summary>
    ''' 式の構築
    ''' </summary>
    ''' <param name="getNo"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    '**********************************************************************
    Private Function FNCL_P_AnswerSiki(ByVal getNo As String) As String
        
        Dim i As Integer
        Dim maxRows As Integer
        Dim count As Integer
        Dim w_siki As String
        
        maxRows = UBound(w_varray, 2)
        
        count = 0
        
        w_siki = ""
        For i = 0 To maxRows
            ' Noをキー
            If w_varray(38, i) = getNo Then
                
                If count > 0 Then
                    Select Case w_varray(3, i)
                        Case "1"
                            '*** ﾗﾍﾞﾙ(72)：ＡＮＤ
                            w_siki = w_siki & " " & w_langmsg(0, 72) & " "
                        Case "2"
                            '*** ﾗﾍﾞﾙ(73)：ＯＲ
                            w_siki = w_siki & " " & w_langmsg(0, 73) & " "
                    End Select
                End If
                count = count + 1
                w_siki = w_siki & w_varray(4, i)
                w_siki = w_siki & count.ToString
                w_siki = w_siki & w_varray(5, i)
                
            End If
        Next i
        
        FNCL_P_AnswerSiki = w_siki
    End Function

    '**********************************************************************
    ''' <summary>
    ''' 非表示社員の中に選択社員が存在するかチェックする
    ''' </summary>
    ''' <param name="p_disp_syain">表示社員文字列（カンマ区切）</param>
    ''' <param name="p_select_syain">選択社員文字列（カンマ区切）</param>
    ''' <returns>"0":存在しない,"1":存在する</returns>
    ''' <remarks></remarks>
    '**********************************************************************
    Private Function FNCL_P_CHK_EMP_EXIST(ByVal p_disp_syain As String, ByVal p_select_syain As String) As String
        Dim rtn As String = ""
        Dim i As Integer
        Dim j As Integer
        Dim isExist As Boolean
        Dim w_disp_syain() As String
        Dim w_select_syain() As String
        
        
        If P000S001.FNCG_P_NZ(p_select_syain) = "" Then '選択社員が存在しない場合
            Return "0"
        End If
        
        '*** 選択社員の配列取得
        w_select_syain = Split(p_select_syain, ",")
        '*** 表示社員の配列取得
        w_disp_syain = Split(p_disp_syain, ",")
        
        rtn = "0"
        '*** 選択社員毎にループ
        For i = 0 To UBound(w_select_syain)
            isExist = False
            '*** 表示社員毎にループ
            For j = 0 To UBound(w_disp_syain)
                If w_select_syain(i) = w_disp_syain(j) Then '社員がマッチした場合
                    isExist = True
                    Exit For
                End If
            Next
            '*** 表示社員の中に選択社員が存在しなかった場合、"1"を返して終了
            If isExist = False Then
                rtn = "1"
                Exit For
            End If
        Next
        
        Return rtn
    End Function
    
    
</script>
