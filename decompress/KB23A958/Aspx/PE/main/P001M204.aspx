<%@ Page Language="vb" Explicit="true" %>

<%=""%>
<%@ Import Namespace="Isid.Positive.Common" %>
<%@ Import Namespace="Isid.Positive.DataAccess" %>
<%@ Import Namespace="Isid.Positive.Env" %>
<%@ Import Namespace="Isid.Positive.Util" %>
<%@ Import Namespace="Isid.Positive.PE.Common" %>
<%@ Import Namespace="Isid.Positive.PE.Common.P003S002" %>
<%@ Import Namespace="Isid.Positive.Common.PositiveHttpState" %>
<%
    '**********************************************************************
    '*  ｼｽﾃﾑ：STAFFBRAIN-WEB版人事
    '*  機能：共通
    '*  処理：個人情報
    '*  内容：個人情報画面の遷移処理
    '*  FILE：P001M204.aspx
    '*  備考：
    '*
    '*  作成：000-Ver6.0   2014/10/31 ISID  .NET版新規作成
    '*  履歴：001-Ver6.0   2014/10/31 ISID 【P-14-043】照会機能から関連業務への連携
    '*  履歴：002-Ver6.1   2015/05/11 CIS  【P-14-081】他機能連携対応
    '*  履歴：003-Ver6.1   2015/07/23 CIS  【P-14-081】適合率検索対応
    '*  履歴：004-Ver6.1   2015/09/29 ISID 【P19650】対象者登録不備対応
    '*  履歴：005-Ver6.1   2015/12/08 CIS  【P-14-101】後継者管理対応
    '*  履歴：006-Ver6.1   2016/02/01 ISID 【P-14-097】照会機能から関連業務への連携
    '*  履歴：007-Ver6.1   2016/11/07 ICOM 【P22300】個別登録機能へ遷移時の不具合対応
    '*  履歴：008-Ver6.1   2017/01/17 ISID 【P22930】社員指定検索時の個別登録機能遷移不備対応
    '*  履歴：009-Ver6.1   2017/05/18 ISID 【P23040】検索機能から個人情報登録への遷移不備対応
    '*  履歴：010-Ver6.1   2020/12/03 ISID 【P31970】他業務への遷移機能から遷移した場合の参照範囲不備対応
    '**********************************************************************
    Response.Expires = -1
    Response.AddHeader("Cache-Control", "No-Cache")
    '**********************************************************************
    '//**  （処理概要）
    '//**    評価入力画面の入力値をチェック・遷移処理
    '//**
    '**********************************************************************
    '**********************************************************************
    '*  ログイン認証
    '**********************************************************************
    P000S012.SUBG_P_LOGINCHK("1", "1")
    '**********************************************************************
    '*  変数初期設定
    '**********************************************************************
    If P000S011.FNCG_P_DBOBJGET("0", DBOBJ) <> 0 Then
    End If
    
    '*** 文言情報取得
    If P000S008.FNCG_P_GET_MULTILANGUAGE_WORD("P001M204", -1, "0", "", w_langmsg) <> 0 Then
    End If

    '**********************************************************************
    '* 呼出元機能への遷移処理
    '**********************************************************************
    If Not IsNull(P000S001.FNCG_P_NZ(Request.QueryString("h_etcKiDiv"))) Then

        '*** 検索結果画面から選択社員を引き継いで戻る場合
        If P000S001.FNCG_P_NZ(Request.QueryString("h_etcKiDiv")) = "2" Then

            '**************************************************************
            '* 適合率検索の選択社員制御処理
            '**************************************************************
            If SessionAsStrArray2D("SL_P000KENFLAG")(0, 5) = "1" Then    '*** 適合率検索
                w_scd_select = Request.Form("syainNoList")               '*** 選択社員情報
                w_scd_disp = Request.Form("syainNoListAll")              '*** 画面表示社員情報

                '*** 対象社員コードのセット処理
                P003S002.SUBG_P_TAGET_SCD_SET(3, w_scd_disp, w_scd_select)

                '*** 対象社員コードの再取得（SL_P001M004_SCDの再作成）
                P003S002.SUBG_P_KENSAKUSET_PRE()
                
                '*** 適合率検索の選択社員数取得
                w_scnt = UBound(SessionAsStrArray2D("SL_P001M004_SCD"), 2) + 1
            Else
                '*** 一致検索の選択社員数取得
                w_scnt = P003S002.FNCG_P_KENSAKUSET(Request.Form("syainList"))
            End If

            '*** 社員選択チェック
            If w_scnt = 0 Then
                w_title = P000S004.FNCG_P_TITLE(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 1), SessionAsStrArray("SG_P_SYSTEM")(7), ""))
                errMsg = w_langmsg(0, 7)
                w_phref = "P001M001.aspx?"
                w_target = ""
                '*** ﾗﾍﾞﾙ(7)："対象者を選択して下さい。<BR>"
                P000S004.SUBG_P_ERRVIEW(w_title, "4", errMsg, w_phref, w_target)
                Response.End()
            End If


            '*** 選択された社員を配列に格納
            ReDim w_scd(UBound(SessionAsStrArray2D("SL_P001M004_SCD"), 2))
            For w_idx = 0 To UBound(SessionAsStrArray2D("SL_P001M004_SCD"), 2)
                w_scd(w_idx) = SessionAsStrArray2D("SL_P001M004_SCD")(0, w_idx)
            Next

            '*** 選択された社員の連携区分を更新
            SetEmpListHikitugi(w_scd)

            '*** セッション変数(SG_P_COMFLAG(5,3))に引き継ぎありを設定
            w_table2D = SessionAsStrArray2D("SG_P_COMFLAG")
            w_table2D(5, 3) = "1"
            Session.Add("SG_P_COMFLAG", w_table2D)
        End If

        w_phref = "P000M008.aspx?id=" & SessionAsStrArray2D("SG_P_COMFLAG")(5, 6) & "-" & _
                                        SessionAsStrArray2D("SG_P_COMFLAG")(5, 7) & _
                         "&p_direct=" & SessionAsStrArray2D("SG_P_COMFLAG")(5, 8)

        Response.Redirect(w_phref)
        Response.End()
    End If

    '**********************************************************************
    '* 再表示の場合（呼び元が'P001M202'のPOPUP形式からのみ）
    '**********************************************************************
    If P000S001.FNCG_P_NZ(Request.Form("h_redraw")) = "1" Then
        Dim w_err As Integer

        w_title = P000S004.FNCG_P_TITLE(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 1), SessionAsStrArray("SG_P_SYSTEM")(7), ""))

        w_fdata = SessionAsStrArray("SG_P_005INF")
        w_fdata(0) = Request.Form("f25")    '*** 1列の表示幅
        w_fdata(1) = Request.Form("f26")    '*** 文字サイズ

        w_err = P000S027.FNCG_P_KINOUSET(2, 2, "005", w_fdata)
        If w_err = 0 Then
            Session.Add("SG_P_005INF", w_fdata)
        Else
            ' エラーの場合、エラー画面に
            errMsg = "登録処理でエラーが発生しました。(ASPOBJ=P001M204 ORAOBJ=FNCG_P_KINOUSET ID=1)<BR>"
            P000S004.SUBG_P_ERRVIEW(w_title, "4", errMsg, w_phref, w_target)
            Response.End()
        End If

        w_phref = "P001M202.aspx?gkbn=" + Request.Form("h_gkbn") + _
                               "&rpid=" + Request.Form("h_rpid") + _
                               "&scd=" + Request.Form("h_nscd")
        Response.Redirect(w_phref)
        Response.End()
    End If
    
    '**********************************************************************
    '* 他機能への遷移処理
    '**********************************************************************
    report_kbn = Request.Form("h_repKbn")
    procDiv = P000S001.FNCG_P_NZ(POCOM001.POCOM_CheckCollectionWithLogAlert(Request.Form("h_procDiv"), "1,2,3,4", ",", True, "P001M204.aspx", "h_procDiv", "P000-00152", DBOBJ))
    dispKbn = P000S001.FNCG_P_NZ(POCOM001.POCOM_CheckCollectionWithLogAlert(Request.Form("p1"), "1,2,3,4,5,6,7,8,9,10,11", ",", True, "P001M204.aspx", "p1", "P000-00152", DBOBJ))
    taisyo = Request.Form("h_taisyo")
    hscd = Request.Form("h_scd")
    tsyain = Request.Form("f2")
    outdatekbn = Request.Form("r1")        '*** 出力基準日区分
    outdate = Request.Form("f0")           '*** 基準日
    
    '*** ﾗﾍﾞﾙ(1)：SessionAsStrArray("SG_P_SYSTEM")(7) & "情報照会"
    w_title = P000S004.FNCG_P_TITLE(P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 1), SessionAsStrArray("SG_P_SYSTEM")(7), ""))
    w_target = ""

    If procDiv = "1" Then
        w_phref = "P001M202.aspx?gkbn=1&id=" + report_kbn + "&r2=" + taisyo + "&f2=" + tsyain + "&dispKbn=" + dispKbn + "&r1=" + outdatekbn + "&f0=" + outdate
    ElseIf procDiv = "2" Then
        w_phref = "P001M202.aspx?gkbn=1&kkbn=51&id=" + report_kbn + "&r2=" + taisyo + "&f2=" + tsyain + "&dispKbn=" + dispKbn + "&r1=" + outdatekbn + "&f0=" + outdate
    ElseIf procDiv = "3" Then
        w_phref = "P001M001.aspx?dispKbn=" + dispKbn
    ElseIf procDiv = "4" Then
        w_phref = SessionAsStr("SL_P001M016_DSP")
    End If

    '**********************************************************************
    '//**    1．画面遷移処理
    '//**
    '**********************************************************************
    Select Case dispKbn
        Case "1", "2"
            ' 個別登録
            ' 発令登録
            If procDiv = "3" Then
                '**********************************************************
                '* 適合率検索の選択社員制御処理
                '**********************************************************
                If SessionAsStrArray2D("SL_P000KENFLAG")(0, 5) = "1" Then    '*** 適合率検索
                    w_scd_select = Request.Form("syainNoList")               '*** 選択社員情報
                    w_scd_disp = Request.Form("syainNoListAll")              '*** 画面表示社員情報

                    '*** 対象社員コードのセット処理
                    P003S002.SUBG_P_TAGET_SCD_SET(3, w_scd_disp, w_scd_select)

                    '*** 対象社員コードの再取得（SL_P001M004_SCDの再作成）
                    P003S002.SUBG_P_KENSAKUSET_PRE()
                    
                    '*** 適合率検索の選択社員数取得
                    sCnt = UBound(SessionAsStrArray2D("SL_P001M004_SCD"), 2) + 1
                Else
                    '*** 選択社員の取得処理
                    sCnt = P003S002.FNCG_P_KENSAKUSET(Request.Form("syainList"))
                End If

                '*** ﾗﾍﾞﾙ(7)："対象者を選択して下さい。<BR>"
                If sCnt = 0 Then
                    errMsg = w_langmsg(0, 7)
                End If
            End If

            moveFlag = SessionAsStrArray("SG_P_FUNCTION_MOVE_FLG")

            If IsNull(errMsg) Then
                If dispKbn = "1" Then
                    '*** 適合率検索 または本人情報、部下情報
                    If SessionAsStrArray2D("SL_P000KENFLAG")(0, 5) = "1" OrElse (procDiv = "1" OrElse procDiv = "2") Then
                        ' 対象者リスト生成
                        empList = SetEmpList(procDiv, errMsg)
                        If IsNull(errMsg) Then
                            ' 対象者設定処理
                            errMsg = SetEmpData(empList)
                        End If
                    End If
                    ' 個別登録
                    P003S002.FNCG_P_BUNPU_WORK_SET("3", "1", "", "", errMsg)
                    If IsNull(errMsg) Then
                        errMsg = SetEmpListWorkTable(procDiv, empList)
                        If IsNull(errMsg) Then
                            w_phref = "P000M008.aspx?id=3-1&gkbn=1"
                        End If
                    End If
                ElseIf dispKbn = "2" Then
                    ' 対象者リスト生成
                    empList = SetEmpList(procDiv, errMsg)
                    If IsNull(errMsg) Then
                        ' 対象者設定処理
                        errMsg = SetEmpData(empList)
                    End If
                    If IsNull(errMsg) Then
                        ' 発令登録
                        w_phref = "P000M008.aspx?id=303-1"
                    End If
                End If
                
                ' 機能間遷移状況区分の設定
                moveFlag(0) = "1"
                Session.Add("SG_P_FUNCTION_MOVE_FLG", moveFlag)
            End If
        Case "3"
            ' 一般届出申請
            w_phref = "P000M008.aspx?id=4-1"
        Case "4"
            ' 評価・自己申告（本人入力）
            w_phref = "P000M008.aspx?id=214-2"
        Case "5"
            ' 評価・自己申告（評価入力）
            w_phref = "P000M008.aspx?id=214-3"
        Case "6"
            ' 研修管理（研修申込）
            w_phref = "P000M008.aspx?id=126-1"
        Case "7"
            ' 研修管理（研修受講状況）
            w_phref = "P000M008.aspx?id=126-11"
        Case "8"
            ' 能力スキル入力（本人）
            w_phref = "P000M008.aspx?id=412-2"
        Case "9"
            ' 能力スキル入力（上司）
            w_phref = "P000M008.aspx?id=412-11"
        Case "10"
            ' 双方向コミュニケーション
            w_phref = "P000M008.aspx?id=8-11"
        Case "11"
            ' 後継者候補管理
            w_phref = "P000M008.aspx?id=432-15"
    End Select
    
    If Not IsNull(errMsg) Then
        ' エラーの場合、エラー画面に
        P000S004.SUBG_P_ERRVIEW(w_title, "4", errMsg, w_phref, w_target)
        Response.End()
    Else
        ' 各機能へ画面遷移
        Response.Redirect(w_phref)
    End If
    
%>
<script language="vb" runat="server">

    '**********************************************************************
    '*  変数宣言エリア
    '**********************************************************************
    Dim w_orapara(,) As String
    Dim DBOBJ As OraDatabase
    Dim sql As String
    Dim w_wdata(,) As String           '*** ワークデータ
    Dim w_data(,) As String            '*** ワークデータ
    Dim w_refkbn_array() As String
    Dim errMsg As String
    Dim w_title As String              '*** エラー用タイトル
    Dim w_phref As String              '*** エラー用戻り先画面のファイル名
    Dim w_target As String             '*** エラー用戻り先画面のファイルのターゲット
    Dim w_langmsg(,) As String         '*** 文言情報取得用
    Dim moveFlag As String()           '*** 機能間遷移状況区分
    Dim dispKbn As String              '*** 遷移先画面区分
    Dim procDiv As String              '*** 処理区分(1:本人情報、2:部下情報、3:検索結果、4:個人情報照会)
    Dim empList As String()            '*** 内部社員コードリスト
    Dim w_gkbn As String               '*** 画面遷移区分
    Dim report_kbn As String           '*** 帳票区分
    Dim taisyo As String               '*** 対象区分
    Dim hscd As String                 '*** 社員コード
    Dim tsyain As String               '*** 対象社員コード
    Dim w_fdata() As String            '*** データ格納用
    Dim w_key As String                '*** ページ番号
    Dim menuKbn As String              '*** QueryString
    Dim chkKbn As String               '*** 画面の社員一覧項目
    Dim chkList As String()            '*** カンマ区切りデータの配列化
    Dim setChk As String               '*** 選択チェックフラグ 初期化
    Dim temp As String()               '*** カンマ区切りデータの配列化用
    Dim cnt As Integer                 '*** カウント
    Dim sCnt As Integer                '*** カウント
    Dim outdatekbn As String           '*** 
    Dim outdate As String              '*** 
    Dim w_scd() As String              '*** 選択社員番号
    Dim w_sdata() As String            '*** 
    Dim w_scnt As Integer              '*** 選択対象社員数
    Dim w_updkbn As Integer            '*** 対象者DB保存(0:しない,1:する)
    Dim w_idx As Integer               '*** カウンタ
    Dim w_table2D(,) As String         '*** SG_P_COMFLAGの編集用
    Dim w_scd_select As String         '*** （適合率検索）選択社員情報
    Dim w_scd_disp As String           '*** （適合率検索）画面表示社員情報


    ''' <summary>
    ''' 対象者リスト生成
    ''' </summary>
    ''' <param name="procDiv">処理区分</param>
    ''' <returns>対象者リスト</returns>
    ''' <remarks></remarks>
    Private Function SetEmpList(procDiv As String, ByRef errText As String) As String()
        
        Dim list As String()
        Dim syainCode As String
        Dim kaisyaCode As String = SessionAsStr("SG_P_KAISYA_SELECT")
        Dim empCode As String
        
        ReDim list(0)
        If procDiv = "1" OrElse procDiv = "2" Then
            ' 本人情報
            ' 部下情報
            If IsNull(P000S001.FNCG_P_NZ(Request.Form("f2"))) Then
                syainCode = P000S001.FNCG_P_NZ(Request.Form("h_sdt"))
            Else
                syainCode = P000S001.FNCG_P_NZ(Request.Form("f2"))
            End If

            ' 社員存在チェック
            P000S006.FNCG_P_HYOUJI_SCDCHK(3, kaisyaCode, syainCode, SessionAsStrArray("SG_P_SYSTEM")(8), errText)
            If IsNull(errText) Then
                ' 内部社員コード取得
                empCode = P000S006.FNCG_P_HYOUJI_SCDGET2("0", 1, kaisyaCode, syainCode)
                list(0) = empCode
            End If
        ElseIf procDiv = "3" OrElse procDiv = "4" Then
            ' 検索結果
            ' 個人情報照会
            Dim checkData As String
            Dim setData As String
            Dim setDataList As String()
            Dim workData As String()
            Dim j As Integer = 0

            If procDiv = "4" AndAlso SessionAsStr("SL_P000M008_SKIND") = "2" AndAlso IsNull(Session("SL_P000KENWORK")) Then
                ReDim list(0)
                list(0) = SessionAsStrArray2D("SL_P001M004_SCD")(0, 0)
                moveFlag(1) = "2"
            Else
                ReDim list(UBound(SessionAsStrArray2D("SL_P001M004_SCD"), 2))
                '*** 選択された社員を配列に格納
                For w_idx = 0 To UBound(SessionAsStrArray2D("SL_P001M004_SCD"), 2)
                    list(w_idx) = SessionAsStrArray2D("SL_P001M004_SCD")(0, w_idx)
                Next
                
                moveFlag(1) = "1"
            End If
        End If
             
        Return list
    End Function
    
    ''' <summary>
    ''' 対象者設定処理
    ''' </summary>
    ''' <param name="empList"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function SetEmpData(empList As String()) As String
        Dim errText As String = String.Empty
        Dim addFlag As Boolean = False
        Dim addCnt As Integer = 0
        
        '*** ワークデータ削除
        sql = "DELETE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0009121_W"
        sql = sql & " WHERE CUSTOMER_ID = :ORA_0"
        ReDim w_orapara(1, 0)
        w_orapara(0, 0) = SessionAsStr("SG_P_RID")
        w_orapara(1, 0) = "2"
        If P000S011.FNCG_P_SQLEXECUTE1(1, sql, w_orapara, Nothing, "") Then
        End If
        
        ' ** 権限チェック
        If P003S001.FNCG_P_REFSET("1") = -1 Then
            errText = w_langmsg(0, 2)
        Else
            If P003S001.FNCG_P_REFSET("2") = -1 Then
                errText = w_langmsg(0, 3)
            Else
                If SessionAsStrArray("SG_P_REFKBN")(3) = "-1" Then
                    '-1:不可･･･全員不可
                    errText = w_langmsg(0, 4)
                    
                ElseIf SessionAsStrArray("SG_P_REFKBN")(3) = "0" Then
                    '0:全社員･･･全員ＯＫ
                ElseIf SessionAsStrArray("SG_P_REFKBN")(3) >= "1" Then
                    'SessionAsStrArray("SG_P_REFKBN")(1)を参照します。
                    Select Case SessionAsStrArray("SG_P_REFKBN")(1)
                        Case "1"
                            '1:済(照会同一)･･･WEB_TP0052020_W_x（xは利用者ＩＤ⇒SessionAsStr("SG_P_RID")）を参照
                            sql = ""
                            sql = "SELECT EMP_CODE"
                            sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0052020_W_" & SessionAsStr("SG_P_RID")
                          
                        Case "2"
                            ' 2:済          ･･･WEB_TP0052030_W_x（xは利用者ＩＤ⇒SessionAsStr("SG_P_RID")）を参照
                            sql = ""
                            sql = "SELECT EMP_CODE"
                            sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0052030_W_" & SessionAsStr("SG_P_RID")
                    End Select
                    
                    If P000S011.FNCG_P_RECORDSET1(1, sql, w_wdata) Then
                    End If
                    If w_wdata.Length = 0 Then
                        errText = w_langmsg(0, 5)
                    End If
                End If
            End If
        End If
        
        '** 対象者設定
        If IsNull(errText) Then
            For i As Integer = 0 To empList.Count - 1
                ' 登録権限チェック
                If SessionAsStrArray("SG_P_REFKBN")(3) = "0" Then
                    addFlag = True
                ElseIf SessionAsStrArray("SG_P_REFKBN")(3) >= "1" Then
                    For j As Integer = 0 To w_wdata.Length - 1
                        If CStr(empList(i)) = w_wdata(0, j) Then
                            addFlag = True
                            Exit For
                        End If
                    Next
                End If
                
                ' 登録チェック
                If addFlag Then
                    sql = " SELECT COUNT(*) FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0009121_W"
                    sql = sql & " WHERE CUSTOMER_ID = :ORA_0"
                    sql = sql & " AND EMP_CODE = :ORA_1"
                    ReDim w_orapara(1, 1)
                    w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                    w_orapara(1, 0) = "2"
                    w_orapara(0, 1) = CStr(empList(i))
                    w_orapara(1, 1) = "2"
                    If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_data) Then
                        '既に登録済み
                        If CInt(w_data(0, 0)) = 1 Then
                            addFlag = False
                        End If
                    Else
                        addFlag = False
                    End If
                End If
                
                If addFlag Then
                    sql = " INSERT INTO " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0009121_W"
                    sql = sql & " (CUSTOMER_ID,EMP_CODE) VALUES(:ORA_0,:ORA_1)"
                    ReDim w_orapara(1, 1)
                    w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                    w_orapara(1, 0) = "2"
                    w_orapara(0, 1) = CStr(empList(i))
                    w_orapara(1, 1) = "2"
                    If P000S011.FNCG_P_SQLEXECUTE1(1, sql, w_orapara, Nothing, "") Then
                    End If
                    addCnt = addCnt + 1
                End If
                addFlag = False
            Next
        
            If addCnt = 0 Then
                errText = w_langmsg(0, 6)
            End If
        End If

        Return errText
    End Function
       
    ''' <summary>
    ''' 対象者ワーク設定
    ''' </summary>
    ''' <param name="procDiv">処理区分</param>
    ''' <param name="plist">対象者リスト</param>    
    ''' <remarks></remarks>
    Private Function SetEmpListWorkTable(ByVal procDiv As String, ByVal plist As String()) As String
        Dim sql As String            '*** SQL
        Dim w_orapara(,) As String   '*** バインド変数
        Dim errText As String = String.Empty
        Dim addFlag As Boolean = False
        Dim addCnt As Integer = 0
        Dim w_P000KENWORK() As String      '*** SL_P000KENWORK編集用
        Dim w_div As String
        
        If procDiv = "1" OrElse procDiv = "2" OrElse _
            (procDiv = "4" AndAlso SessionAsStr("SL_P000M008_SKIND") = "2" AndAlso IsNull(Session("SL_P000KENWORK"))) Then
            w_P000KENWORK = New String() {"", "", "", "", ""}
            w_P000KENWORK(0) = "100000000000000"
            If procDiv = "4" Then
                w_P000KENWORK(1) = CStr(SessionAsStrArray2D("SL_P001M004_SCD")(0, 0))
            Else
                w_P000KENWORK(1) = CStr(IIf(IsNull(plist), "", plist(0)))
            End If            
            w_P000KENWORK(2) = "0"
            w_P000KENWORK(3) = "0"
            w_P000KENWORK(4) = "0"
            Session.Add("SL_P000KENWORK", w_P000KENWORK)
        End If
        
        Dim list As String() = SessionAsStrArray("SL_P000KENWORK")
        Dim exelist As String = list(0).Replace("-", "")
        Dim emplist As String() = list(1).Split(New String() {",", "="}, StringSplitOptions.None)
        Dim postlist As String() = list(2).Split(New String() {",", "-"}, StringSplitOptions.None)
        Dim issuelist As String() = list(3).Split(New String() {",", "-"}, StringSplitOptions.None)

        sql = "DELETE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID")
        DBOBJ.DbExecuteSQL(sql)
        
        '*** 適合率検索
        If SessionAsStrArray2D("SL_P000KENFLAG")(0, 5) = "1" Then
            sql = " INSERT INTO " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID")
            sql = sql & " ("
            sql = sql & "     EMP_CODE,ANOTHER_POST_DIV,ISSUE_DATE,DIV"
            sql = sql & " )"
            sql = sql & " SELECT EMP_CODE,'0','',0"
            sql = sql & "   FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0009121_W"
            sql = sql & " WHERE CUSTOMER_ID = :ORA_0"
            ReDim w_orapara(1, 0)
            w_orapara(0, 0) = SessionAsStr("SG_P_RID")
            w_orapara(1, 0) = "2"
            If P000S011.FNCG_P_SQLEXECUTE1(1, sql, w_orapara, Nothing, "") Then
            End If
        Else
            ' ** 権限チェック
            If P003S001.FNCG_P_REFSET("1") = -1 Then
                errText = w_langmsg(0, 2)
            Else
                If P003S001.FNCG_P_REFSET("2") = -1 Then
                    errText = w_langmsg(0, 3)
                Else
                    If SessionAsStrArray("SG_P_REFKBN")(3) = "-1" Then
                        '-1:不可･･･全員不可
                        errText = w_langmsg(0, 4)
                    
                    ElseIf SessionAsStrArray("SG_P_REFKBN")(3) = "0" Then
                        '0:全社員･･･全員ＯＫ
                    ElseIf SessionAsStrArray("SG_P_REFKBN")(3) >= "1" Then
                        'SessionAsStrArray("SG_P_REFKBN")(1)を参照します。
                        Select Case SessionAsStrArray("SG_P_REFKBN")(1)
                            Case "1"
                                '1:済(照会同一)･･･WEB_TP0052020_W_x（xは利用者ＩＤ⇒SessionAsStr("SG_P_RID")）を参照
                                sql = ""
                                sql = "SELECT EMP_CODE,DIV"
                                sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0052020_W_" & SessionAsStr("SG_P_RID")
                          
                            Case "2"
                                ' 2:済          ･･･WEB_TP0052030_W_x（xは利用者ＩＤ⇒SessionAsStr("SG_P_RID")）を参照
                                sql = ""
                                sql = "SELECT EMP_CODE,DIV"
                                sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0052030_W_" & SessionAsStr("SG_P_RID")
                        End Select
                    
                        If P000S011.FNCG_P_RECORDSET1(2, sql, w_wdata) Then
                        End If
                        If w_wdata.Length = 0 Then
                            errText = w_langmsg(0, 5)
                        End If
                    End If
                End If
            End If
        
            '** 対象者設定
            If IsNull(errText) Then
                For i As Integer = 0 To emplist.Length - 1
                    If exelist.Substring(i, 1) = "1" Then
                        ' 登録権限チェック
                        If SessionAsStrArray("SG_P_REFKBN")(3) = "0" Then
                            w_div = "0"
                            addFlag = True
                        ElseIf SessionAsStrArray("SG_P_REFKBN")(3) >= "1" Then
                            For j As Integer = 0 To UBound(w_wdata, 2) - 1
                                If CStr(emplist(i)) = w_wdata(0, j) Then
                                    w_div = w_wdata(1, j)
                                    addFlag = True
                                    Exit For
                                End If
                            Next
                        End If
                             
                        If addFlag Then
                            sql = " INSERT INTO " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID")
                            sql = sql & " ("
                            sql = sql & "     EMP_CODE,ANOTHER_POST_DIV,ISSUE_DATE,DIV"
                            sql = sql & " )"
                            sql = sql & " VALUES (:ORA_0, :ORA_1, :ORA_2, :ORA_3)"
                            ReDim w_orapara(1, 3)
                            w_orapara(0, 0) = CStr(emplist(i))
                            w_orapara(1, 0) = PE_OraType.ORATYPE_VARCHAR2
                            w_orapara(0, 1) = CStr(postlist(i))
                            w_orapara(1, 1) = PE_OraType.ORATYPE_VARCHAR2
                            w_orapara(0, 2) = CStr(IIf(issuelist(i) = "0", String.Empty, issuelist(i)))
                            w_orapara(1, 2) = PE_OraType.ORATYPE_DATE
                            w_orapara(0, 3) = w_div
                            w_orapara(1, 3) = PE_OraType.ORATYPE_VARCHAR2
                            If P000S011.FNCG_P_SQLEXECUTE1(1, sql, w_orapara, Nothing, "") Then
                            End If
                            addCnt = addCnt + 1
                        End If
                    End If
                    addFlag = False
                Next
        
                If addCnt = 0 Then
                    errText = w_langmsg(0, 6)
                End If
            End If
        End If
        Return errText

    End Function

    ''' <summary>
    ''' 対象者引継ぎ設定
    ''' </summary>
    ''' <remarks></remarks>
    Private Sub SetEmpListHikitugi(ByRef p_scd() As String)
        Dim sql As String               '*** 処理SQL
        Dim w_err As Integer            '*** オラクルエラー情報
        Dim w_odata As OraParamArray    '*** オラクル社員データ配列
        Dim w_scnt As Integer           '*** 処理件数(配列数)
        Dim w_rcnt As Integer           '*** レコード件数
        Dim w_maxcnt As Integer         '*** 処理社員データ最大配列数
        Dim w_i As Integer              '*** ワークカウント
        Dim w_j As Integer              '*** ワークカウント
        Dim w_k As Integer              '*** ワークカウント
        Dim w_end As Integer            '*** 処理終了フラグ
        
        w_scnt = UBound(p_scd) \ 16

        For w_i = 0 To w_scnt
            P000S011.SUBG_P_ORAPDEL(DBOBJ, "ORA_DATA")
            DBOBJ.Parameters.AddTable("ORA_DATA", OraConst.ORAPARM_INPUT, OraConst.ORATYPE_VARCHAR2, 16, 20)
            w_odata = DirectCast(DBOBJ.Parameters("ORA_DATA"), OraParamArray)
            If w_i = w_scnt Then
                w_end = 1
                w_maxcnt = UBound(p_scd)
            Else
                w_end = 2
                w_maxcnt = ((w_i + 1) * 16) - 1
            End If
            w_rcnt = -1
            For w_j = w_i * 16 To w_maxcnt
                w_rcnt = w_rcnt + 1
                w_odata.Put_Value(p_scd(w_j), w_rcnt)
            Next
            sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP0010010_P.WEB_SP0010010_S("
            sql = sql & " :ORA_0"
            '***
            sql = sql & ",1"
            '***
            sql = sql & ",:ORA_1"
            '***
            sql = sql & ",:ORA_2"
            '***
            sql = sql & ",:ORA_3"
            '***
            sql = sql & ",:ORA_DATA"
            '***
            sql = sql & ",NULL"
            '***
            sql = sql & ",:ORA_4"
            '*** 利用者ＩＤ
            sql = sql & ",:ORA_ERR); END;"
            ReDim w_orapara(3, 4)
            If SessionAsStrArray2D("SG_P_COMFLAG")(5, 2) = "0" Then
                w_orapara(0, 0) = "5"
            Else
                w_orapara(0, 0) = "4"
            End If
            w_orapara(1, 0) = "2"
            w_orapara(0, 1) = CStr(w_end)
            w_orapara(1, 1) = "2"
            w_orapara(0, 2) = CStr(w_i + 1)
            w_orapara(1, 2) = "2"
            w_orapara(0, 3) = CStr(w_rcnt + 1)
            w_orapara(1, 3) = "2"
            w_orapara(0, 4) = SessionAsStr("SG_P_RID")
            w_orapara(1, 4) = "2"
            If P000S011.FNCG_P_SPEXECUTE1(1, sql, w_orapara, w_err, "") = False Then
            End If
            P000S011.SUBG_P_ORAPDEL(DBOBJ, "ORA_DATA")
            If w_err <> 0 Then
                errMsg = "取得処理でエラーが発生しました。(ID=P001M204 ORAOBJ=WEB_SP0010010_P)<BR>"
                P000S004.SUBG_P_ERRVIEW(w_title, "4", errMsg, w_phref, w_target)
                Response.End()
            End If
        Next
    End Sub
    
</script>
