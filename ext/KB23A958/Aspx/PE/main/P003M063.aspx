<%@ Page Language="vb" Explicit="true" %>

<%=""%>
<%@ Import Namespace="Isid.Positive.Common" %>
<%@ Import Namespace="Isid.Positive.DataAccess" %>
<%@ Import Namespace="Isid.Positive.Env" %>
<%@ Import Namespace="Isid.Positive.Util" %>
<%@ Import Namespace="Isid.Positive.FileSystem" %>
<%@ Import Namespace="Isid.Positive.PE.Common" %>
<%@ Import Namespace="Isid.Positive.PE.Env" %>
<%@ Import Namespace="Isid.Positive.Common.PositiveHttpState" %>
<%
    '**********************************************************************
    '*  ｼｽﾃﾑ：STAFFBRAIN-WEB版人事
    '*  機能：検索
    '*  処理：統計検索
    '*  内容：統計検索画面（２／２）
    '*  FILE：P003M063.aspx
    '*  備考：
    '*
    '*  作成：000-Ver5.7  2000/08/07 M.Y
    '*  履歴：001-Ver6.0  2000/11/01 T.M コード表示対応,補足項目対応
    '*  履歴：002-Ver6.0c 2001/01/19 S.T 出力集計形式の表示名称変更対応
    '*  履歴：003-Ver6.1  2001/05/01 S.T 外部出力処理の統一化
    '*  履歴：004-Ver6.2  2001/10/15 Y.Y ＤＢ変数取得方法の変更対応
    '*  履歴：005-Ver6.3  2002/03/29 Y.Y 数値関数の対応
    '*  履歴：006-Ver6.3  2002/03/29 K.K 採用管理機能対応
    '*  履歴：007-Ver6.3  2002/03/29 Y.Y 発令(異動・昇格)機能(統計)対応
    '*  履歴：008-Ver6.3b 2002/08/02 T.M 小数点表示の不具合対応
    '*  履歴：009-Ver7.0  2002/10/01 Y.Y 項目名称変更対応
    '*  履歴：010-Ver7.0  2002/10/01 T.M 在籍者基準日対応
    '*  履歴：011-Ver8.0  2003/05/01 K.T 人員調べ(PB07)対応
    '*  履歴：012-Ver9.0  2003/xx/xx Y.Y 社員番号の英数字化対応
    '*  履歴：013-VerP2.0 2004/06/22 T.MA 異動線対応
    '*  履歴：014-VerP2.1 2004/05/12 S.T 個人情報の詳細情報表示制御対応
    '*  履歴：015-VerP2.3b 2005/05/02 S.T バッファオーバ対応
    '*  履歴：016-VerP3.01 2005/10/19 M.I D100001 マルチカンパニー対応(WEB_SP0002261_F対応)
    '*  履歴：017-VerP3.01 2005/10/27 Y.Y D100030 INIのＤＢ化対応
    '*  履歴：018-VerP3.04 2006/02/01 T.M D100001 全社時の優先フラグ参照対応
    '*  履歴：019-VerP3.0a 2006/03/28 T.M E100147 マルチカンパニー対応漏れ(採用)
    '*  履歴：020-VerP3.0b 2006/04/06 Y.Y D100091 CSVﾌｧｲﾙのﾀﾞｳﾝﾛｰﾄﾞ方法変更対応
    '*  履歴：021-VerP3.0d 2006/07/10 T.K D100122 メモリ消費改善対応（Include分割）
    '*  履歴：022-VerP3.1  2006/11/29 M.I D100139 給与(明細項目履歴)項目の区別化(不具合)
    '*  履歴：023-VerP3.1  2006/11/30 M.I D100144 事業所名の表示順対応
    '*  履歴：024-VerP3.1  2006/12/12 M.I D100194 社員番号の表示書式対応
    '*  履歴：025-VerP3.1  2006/12/18 C.O D100223 マスタ画面表示改善対応(マスタ→マスター)
    '*  履歴：026-VerP3.2a 2007/07/25 K.T D100303 監査ログ対応（帳票・外部出力）
    '*  履歴：027-VerP4.0  2007/08/14 I.H D100310 SQLインジェクション対応
    '*  履歴：028-VerP4.0  2007/11/27 Y.N D100351 単一会社運用対応(ログメッセージ対応のみ)
    '*  履歴：029-VerP4.0c 2009/02/17 Y.Y E101188 未存在所属の社員情報表示不具合対応
    '*  履歴：030-VerP4.0c 2009/02/18 C.O D100528 HTMLコメント対応
    '*  履歴：031-VerP4.0c 2009/03/03 C.O E101196 インクルード宣言漏れ対応
    '*  履歴：032-VerP4.0d 2009/09/09 Y.Y【改善】D100546 セキュリティ対応(EXCEL出力)
    '*  履歴：033-VerP4.0e 2009/11/27 M.I【修正495】E101351 統計検索における不具合対応
    '*  履歴：034-VerP4.0e 2009/12/22 Y.Y【修正514】E101370 ｾｷｭﾘﾃｨ対応（EXCEL出力）漏れ対応
    '*  履歴：035-VerP4.0f 2009/12/09 Y.Y【改善】D100570 統計検索事業所コード表示対応
    '*  履歴：036-VerP4.0f 2010/03/30 M.I【修正573】E101432 EXCEL出力(集計形式)の表示順不具合対応
    '*  履歴：037-VerP4.0f 2010/04/16 M.I【改善】D100585 HTMLエンコード対応
    '*  履歴：038-VerP4.2  2011/10/27 K.I【改善P-11-004】英語対応
    '*  履歴：039-VerP4.2  2011/06/27 M.I【修正P10060】所属ｺｰﾄﾞEXCEL出力(集計形式)の出力不具合
    '*  履歴：040-VerP4.3  2012/03/06 H.N【改善W-11-008】就業投資改善対応
    '*  -------------------------------------------------------------------
    '*  作成：000-Ver5.0   2013/05/31 ISID 【Hayabusa】.NET版新規作成
    '*  履歴：001-Ver5.0a  2013/06/04 SHSC 【P-12-021】禁則文字対応
    '*  履歴：002-Ver5.0a  2013/08/01 SHSC 【P15870】共通関数の引数不備対応
    '*  履歴：003-Ver5.1   2013/12/02 SHSC 【Unicode対応】ファイル出力関連機能の修正
    '*  履歴：004-Ver6.0   2014/10/31 COBA 【P-14-042】タレントマネジメント対応
    '*  履歴：005-Ver6.0   2014/10/31 COBA 【P-14-030】タレントマネジメント対応
    '*  履歴：006-Ver6.0   2014/10/31 COBA 【P-14-032】タレントマネジメント対応
    '*  履歴：007-Ver6.0   2014/10/31 COBA 【P-14-034】タレントマネジメント対応
    '*  履歴：008-Ver6.1   2015/05/07 CIS  【P-14-081】他機能連携対応
    '*  履歴：009-Ver6.1   2015/07/15 T.M  【P-14-086】組織統計対応
    '*  履歴：010-Ver6.1   2015/07/21 ICOM 【P19580】分類名称表示位置改善
    '*  履歴：011-Ver6.1   2016/12/27 ISID 【P22720】統計検索検索実行時にシステムエラーが発生
    '*  履歴：012-Ver6.1   2019/06/12 ISID 【P28950】就業関連項目の表示・入力・検索対応
    '*  履歴：013-Ver6.1   2019/10/31 ISID 【P29680】HHMM形式をHH:MM形式に変換する場合のマイナス表示対応
    '*  履歴：014-Ver6.1   2020/02/19 ISID 【P30960】マスター全表示時の組み合わせ件数制限対応
    '*  履歴：015-Ver6.1   2020/11/30 ISID 【P32230】「統計検索の部署を軸とした検索の利用」が使用不可の場合の不具合対応
    '**********************************************************************
    Response.Expires = -1
    Response.AddHeader("Cache-Control", "No-Cache")
    '**********************************************************************
    '//**（処理概要）
    '//**  統計検索項目選択で選択された情報を一覧形式で表示する。
    '//**（処理内容）
    '**********************************************************************
    '**********************************************************************
    '*    ログイン認証
    '**********************************************************************
    P000S012.SUBG_P_LOGINCHK("1", "1")
    '**********************************************************************
    '*    変数初期設定エリア
    '**********************************************************************
    w_jflg = 1
    If P000S011.FNCG_P_DBOBJGET("0", DBOBJ) <> 0 Then
    End If
    '******************************************************************
    '*  Session変数(ＫＥＹ情報)をワーク変数に設定する。
    '******************************************************************
    keydata = SessionAsStrArray("SL_P003M061_KEY")
    '***(0) = 保存コード（作成者コード）
    '***(1) = 選択数と件数のフィールド数
    '***(2) = コード：カテゴリ区分 "-" 項目順
    '***(3) = 名称  ：カテゴリ名称 "（" 項目名称 "）"
    '***(4) = 同一データ
    '***(5) = 小計区分
    '***(6) = コード表示
    '***(7) = 補足区分(←集計項目(コメント誤記))
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
    '***(27)=
    '***(28)= 権限
    '***(29)= ソート数(-区切り)
    '***(30)= 選択言語ＩＤ
    '***(31)= 出力言語ＩＤ
    '***(32)= 出力内容ＩＤ
    '***(33)= マスター補助(DIV-KAISYACD-ID)(出力)
    '***(34)= 基準日補足区分(出力)
    '***(35)= 基準日補足区分補助内容１(出力)
    '***(36)= 基準日補足区分補助内容２(出力)
    '***(37)= マスター補助(DIV-KAISYACD-ID)(出力)
    '***(38)= 基準日補足区分(集計)
    '***(39)= 基準日補足区分補助内容１(集計)
    '***(40)= 基準日補足区分補助内容２(集計)
    '***(41)= 表示方法
    '***(42)= 対象情報
    '***(43)= 対象部署
    '***(44)= 兼務情報
    '***(45)= マスター項目の表示
    '***(46)= 組織項目ＩＤ
    '***(47)= 組織項目名称
 
    '******************************************************************
    '*  画面文言取得
    '******************************************************************
    '*** 文言情報取得(表示言語)
    If P000S008.FNCG_P_GET_MULTILANGUAGE_WORD("P003M063", -1, "0", "", w_langmsg) <> 0 Then
    End If
    '*** 文言情報取得(出力言語)
    If P000S008.FNCG_P_GET_MULTILANGUAGE_WORD("P003M063", -1, "1", keydata(31), w_outlangmsg) <> 0 Then
    End If
    '*** ﾗﾍﾞﾙ(57)："【未登録】"
    w_lang_noregist = w_outlangmsg(0, 57)
    '*** 出力データでの比較となるため出力言語用の文言をセット
    ReDim w_list2(1, 10)
    '*** 集計項目
    w_list2(0, 0) = "0"
    '*** ﾗﾍﾞﾙ(1)："０"
    w_list2(1, 0) = w_langmsg(0, 1)
    w_list2(0, 1) = "1"
    '*** ﾗﾍﾞﾙ(2)："１"
    w_list2(1, 1) = w_langmsg(0, 2)
    w_list2(0, 2) = "2"
    '*** ﾗﾍﾞﾙ(3)："２"
    w_list2(1, 2) = w_langmsg(0, 3)
    w_list2(0, 3) = "3"
    '*** ﾗﾍﾞﾙ(4)："３"
    w_list2(1, 3) = w_langmsg(0, 4)
    w_list2(0, 4) = "4"
    '*** ﾗﾍﾞﾙ(5)："４"
    w_list2(1, 4) = w_langmsg(0, 5)
    w_list2(0, 5) = "5"
    '*** ﾗﾍﾞﾙ(6)："５"
    w_list2(1, 5) = w_langmsg(0, 6)
    w_list2(0, 6) = "6"
    '*** ﾗﾍﾞﾙ(7)："６"
    w_list2(1, 6) = w_langmsg(0, 7)
    w_list2(0, 7) = "7"
    '*** ﾗﾍﾞﾙ(8)："７"
    w_list2(1, 7) = w_langmsg(0, 8)
    w_list2(0, 8) = "8"
    '*** ﾗﾍﾞﾙ(9)："８"
    w_list2(1, 8) = w_langmsg(0, 9)
    w_list2(0, 9) = "9"
    '*** ﾗﾍﾞﾙ(10)："９"
    w_list2(1, 9) = w_langmsg(0, 10)
    w_list2(0, 10) = "10"
    '*** ﾗﾍﾞﾙ(11)："１０"
    w_list2(1, 10) = w_langmsg(0, 11)
    w_kansys = SessionAsStrArray2D("SG_P_ENVIR_000")(0, 50)
    w_gmode = SessionAsStr("SL_P000M008_GMODE")
    w_langid = SessionAsStrArray("SG_P_LANGUAGE")(6)
    If w_gmode = "1" Then
        '*** 通常
        '*** SessionAsStrArray("SG_P_SYSTEM")(7) －出力言語に応じた名称を再取得
        w_sname = CStr(P000S009.FNCG_P_GET_LANGNAME_INDEV("1", 7, SessionAsStr("SG_P_KAISYA_SELECT"), keydata(31)))
    Else
        '*** ﾗﾍﾞﾙ(12)："応募者"
        w_sname = w_langmsg(0, 12)
        w_hflg = 0
        If P000S012.FNCG_P_INSTCHK(1, 3, 400, 1, 0) = 1 Then
            '*** 採用利用フラグ
            If SessionAsStrArray("SG_P_SYAIN")(5) = "0" OrElse SessionAsStrArray("SG_P_400COM")(0) = "1" Then
                w_hflg = 1
            Else
                sql = "SELECT COUNT(*)"
                sql = sql & " FROM  " & SessionAsStr("SG_C_DBUSER1") & "APPLICANT_YEAR"
                sql = sql & " WHERE KAISYACD = :ORA_0"
                sql = sql & "   AND APPLY_YEAR = TO_DATE(:ORA_1,'YYYY/MM/DD')"
                sql = sql & "   AND LATEST_DIV = '1'"

                ReDim w_orapara(2, 1)
                w_orapara(0, 0) = SessionAsStr("SG_P_KAISYA_SELECT")
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = SessionAsStrArray2D("SL_P000KENFLAG")(5, 0)
                w_orapara(1, 1) = "1"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_ctdata) = False Then
                End If
                If CInt(w_ctdata(0, 0)) > 0 Then
                    w_hflg = 1
                End If
            End If
        End If
        If P000S012.FNCG_P_INSTCHK(1, 3, 400, 2, 0) = 1 Then
            '*** 採用利用フラグ
            If w_hflg = 1 Then
                w_hflg = 3
            Else
                w_hflg = 2
            End If
        End If
        Select Case w_hflg
            Case 0
                ReDim w_list(1, -1)
                '*** 集計項目
            Case 1
                ReDim w_list(1, 0)
                '*** 集計項目
                w_list(0, 0) = "1"
                '*** ﾗﾍﾞﾙ(13)："応募者登録"
                w_list(1, 0) = w_langmsg(0, 13)
            Case 2
                ReDim w_list(1, 0)
                '*** 集計項目
                w_list(0, 0) = "1"
                '*** ﾗﾍﾞﾙ(14)："応募者照会"
                w_list(1, 0) = w_langmsg(0, 14)
            Case 3
                ReDim w_list(1, 1)
                '*** 集計項目
                w_list(0, 0) = "1"
                '*** ﾗﾍﾞﾙ(15)："応募者登録"
                w_list(1, 0) = w_langmsg(0, 15)
                w_list(0, 1) = "2"
                '*** ﾗﾍﾞﾙ(16)："応募者照会"
                w_list(1, 1) = w_langmsg(0, 16)
        End Select
    End If
    w_smode = SessionAsStrArray("SL_P000M008_GMODE_S")
    '*** 機能ﾓｰﾄﾞ詳細（(0)：1=通常・2=発令）

    '******************************************************************
    '*  組織軸時の変数値変更処理
    '******************************************************************
    w_skcnt = 0
    If keydata(41) = "2" Then
        If P000S001.FNCG_P_NZ(Request.QueryString("gkbn")) = "1" Then
            keydata(1) = CStr(CInt(keydata(1)) + 1)
            '*** ﾗﾍﾞﾙ(62)：部署名称
            If keydata(3) = "" Then
                keydata(3) = w_outlangmsg(0, 62)
            Else
                keydata(3) = w_outlangmsg(0, 62) & P0030000.CUSTOM_LINE_SEPARATOR1 & keydata(3)
            End If
            keydata(16) = "4-" & keydata(16)
            keydata(26) = "," & keydata(26)
        End If
        If keydata(46) <> "" Then
            w_sk_array_id = VBSplit(keydata(46), ",", -1, 0)
            w_skcnt = UBound(w_sk_array_id) + 1
            '*** 出力言語と表示言語が異なる場合、組織項目名称を再取得
            If w_langid <> keydata(31) Then
                ReDim w_sk_array_na(w_skcnt - 1)
                '*** 文言情報取得(統計検索画面)
                If P000S008.FNCG_P_GET_MULTILANGUAGE_WORD("P003M061", -1, "1", keydata(31), w_langmsg2) <> 0 Then
                End If
                w_orgID = "0"
                If keydata(42).Length > 1 Then
                    '*** 組織IDが２桁以上の場合（予備組織）
                    w_orgID = Right(keydata(42), 1)
                End If
                For w_i = 0 To w_skcnt - 1
                    Select Case w_sk_array_id(w_i)
                        Case "1"
                            '*** ﾗﾍﾞﾙ(119)：略称
                            w_sk_array_na(w_i) = w_langmsg2(0, 119)
                        Case "2"
                            '*** ﾗﾍﾞﾙ(120)：所属コード
                            w_sk_array_na(w_i) = w_langmsg2(0, 120)
                        Case "3"
                            '*** ﾗﾍﾞﾙ(121)："ポスト所属コード"
                            w_sk_array_na(w_i) = w_langmsg2(0, 121)
                        Case "4"
                            '*** ﾗﾍﾞﾙ(122)："備考"
                            w_sk_array_na(w_i) = w_langmsg2(0, 122)
                        Case Else
                            If Convert.ToInt16(w_sk_array_id(w_i)) < 200 Then
                                '*** 組織予備項目の取得
                                sql = "SELECT "
                                sql &= " NVL(B.SCREEN_NAME, A.SCREEN_NAME)"
                                sql &= "  FROM WEB_TC0000040_M A"
                                sql &= "      ,WEB_TC0000041_M B"
                                sql &= " WHERE A.ORGANIZATION_ID = :ORA_0"
                                sql &= "   AND A.ORGANIZATION_ID = B.ORGANIZATION_ID(+)"
                                sql &= "   AND A.IDENTIFIER = B.IDENTIFIER(+)"
                                sql &= "   AND B.LANG_ID(+) = :ORA_1"
                                sql &= "   AND A.IDENTIFIER = :ORA_2"
                                sql &= "  ORDER BY A.IDENTIFIER"
                                ReDim w_orapara(2, 2)
                                w_orapara(0, 0) = w_orgID
                                w_orapara(1, 0) = "2"
                                w_orapara(0, 1) = keydata(31)
                                w_orapara(1, 1) = "2"
                                w_orapara(0, 2) = (Convert.ToInt16(w_sk_array_id(w_i)) - 100).ToString()
                                w_orapara(1, 2) = "1"
                                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_sdata) Then
                                    w_sk_array_na(w_i) = w_sdata(0, 0)
                                End If
                            Else
                                '*** 組織分類の取得
                                sql = "SELECT"
                                sql &= " NVL(B.CLS_NAME,A.CLS_NAME)"
                                sql &= " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TC0000210_M A"
                                sql &= "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TC0000211_M B"
                                sql &= " WHERE A.ORGANIZATION_ID = :ORA_0"
                                sql &= "   AND A.ORGANIZATION_ID = B.ORGANIZATION_ID(+)"
                                sql &= "   AND A.IDENTIFIER = :ORA_2"
                                sql &= "   AND A.IDENTIFIER = B.IDENTIFIER(+)"
                                sql &= "   AND B.LANG_ID(+) = :ORA_1"
                                sql &= " ORDER BY A.IDENTIFIER"
                                ReDim w_orapara(2, 2)
                                w_orapara(0, 0) = w_orgID
                                w_orapara(1, 0) = "2"
                                w_orapara(0, 1) = keydata(31)
                                w_orapara(1, 1) = "2"
                                w_orapara(0, 2) = (Convert.ToInt16(w_sk_array_id(w_i)) - 200).ToString()
                                w_orapara(1, 2) = "1"
                                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_sdata) Then
                                    w_sk_array_na(w_i) = w_sdata(0, 0)
                                End If
                            End If
                    End Select
                Next
            Else
                w_sk_array_na = VBSplit(keydata(47), P0030000.CUSTOM_LINE_SEPARATOR1, -1, 0)
            End If
        End If
    End If
    '*** 組織項目が１件以上選択されている場合はＥＸＣＥＬ出力集計形式を非表示とする
    If w_skcnt > 0 Then
        w_disp = "display=none"
    Else
        w_disp = "display=block"
    End If
    '******************************************************************
    '*  項目スタイル設定
    '******************************************************************
    If w_langid = "0" Then
        w_style(0) = ""
        '*** 項目ラベル
        w_style(1) = "id=idsmidasi01"
        '*** 項目ラベル（ボールド）
        w_style(2) = "align=center"
        '*** 一覧ヘッダー項目のラベル表示位置
    Else
        w_style(0) = "id=idfsize09"
        w_style(1) = "id=idfsize09B"
        w_style(2) = ""
    End If
    '**********************************************************************
    '//**    １．Session変数(検索入力情報)が存在するかチェックし、
    '//**        存在しない場合、空画面を表示する。
    '//**
    '**********************************************************************
    w_syukei = VBSplit(keydata(13), P0030000.CUSTOM_LINE_SEPARATOR2, -1, 0)
    w_kcnt = CInt(keydata(1))
    w_cid = w_kcnt * 2
    Select Case keydata(11)
        Case "1", "5"
            '*** 一覧画面からの直接実行時（1=実行・5=外部出力のみ）
            w_asp = "P003M066.aspx?gkbn=1"
            '前画面戻り先
        Case Else
            '*** 設定画面からの実行時
            w_asp = "P003M061.aspx?gkbn=1"
            '前画面戻り先
    End Select
    '**********************************************************************
    '* 補足情報の取得
    '**********************************************************************
    If IsNull(keydata(7)) Then
        w_hos_cnt = 0
    Else
        w_hos_cnt = UBound(VBSplit(keydata(7), ",", -1, 0)) + 1
        ReDim w_hosoku(w_hos_cnt - 1)
        w_hosoku_cd = VBSplit(keydata(7), ",", -1, 0)
        w_j_array = VBSplit(keydata(25), P0030000.CUSTOM_LINE_SEPARATOR1, -1, 0)
        w_k_array = VBSplit(keydata(12), ",", -1, 0)
        Dim masterAuxInfoArr() As String = keydata(37).Split(","c)
        For w_i = 0 To UBound(w_j_array)
            '*** 表示言語と出力言語が異なる場合は、名称を再取得
            If w_langid <> keydata(31) Then
                w_split = VBSplit(w_hosoku_cd(w_i), P0030000.CUSTOM_LINE_SEPARATOR2, -1, 0)
                Dim masterAuxInfo() As String = VBSplit(masterAuxInfoArr(w_i), P0030000.CUSTOM_LINE_SEPARATOR2, -1, 0)
                sql = "SELECT"
                sql = sql & " WEB_SP0002231_F(:ORA_0,6,2,NULL,NULL,:ORA_1,NULL,:ORA_3)"
                '*** 0 カテゴリ名
                
                If masterAuxInfo(0) <> "0" Then
                    sql = sql & ", WEB_SP0002610_F(1, :ORA_0, :ORA_7, :ORA_4, :ORA_5, :ORA_6, :ORA_3)"
                Else
                    sql = sql & ",WEB_SP0002231_F(:ORA_0,5,2,NULL,NULL,:ORA_1,:ORA_2,:ORA_3)"
                End If
                '*** 1 項目名
                sql = sql & " FROM DUAL"
                
                Dim bindParams(1, 7) As String
                bindParams(0, 0) = SessionAsStr("SG_P_KAISYA_SELECT")
                bindParams(0, 1) = w_split(0)
                bindParams(0, 2) = w_split(1)
                bindParams(0, 3) = keydata(31)
                bindParams(0, 4) = masterAuxInfo(0)
                bindParams(0, 5) = masterAuxInfo(1)
                bindParams(0, 6) = masterAuxInfo(2)
                bindParams(0, 7) = masterAuxInfo(3)
                
                bindParams(1, 0) = "101"
                bindParams(1, 1) = "2"
                bindParams(1, 2) = "2"
                bindParams(1, 3) = "2"
                bindParams(1, 4) = CStr(OraConst.ORATYPE_VARCHAR2)
                bindParams(1, 5) = CStr(OraConst.ORATYPE_NUMBER)
                bindParams(1, 6) = CStr(OraConst.ORATYPE_NUMBER)
                bindParams(1, 7) = CStr(OraConst.ORATYPE_NUMBER)
                
                
                If P000S011.FNCG_P_RECORDSET5(0, sql, bindParams, w_dbdata) Then
                    w_hosoku(w_i) = w_dbdata(0, 0) & "(" & w_dbdata(1, 0) & ")"
                Else
                    w_hosoku(w_i) = w_j_array(w_i)
                End If
            Else
                w_hosoku(w_i) = w_j_array(w_i)
            End If
            Select Case w_k_array(w_i)
                Case "1"
                    '*** ﾗﾍﾞﾙ(17)："(合計)"
                    w_hosoku(w_i) = w_hosoku(w_i) & w_outlangmsg(0, 17)
                Case "2"
                    '*** ﾗﾍﾞﾙ(18)："(最大)"
                    w_hosoku(w_i) = w_hosoku(w_i) & w_outlangmsg(0, 18)
                Case "3"
                    '*** ﾗﾍﾞﾙ(19)："(最小)"
                    w_hosoku(w_i) = w_hosoku(w_i) & w_outlangmsg(0, 19)
                Case "4"
                    '*** ﾗﾍﾞﾙ(20)："(平均)"
                    w_hosoku(w_i) = w_hosoku(w_i) & w_outlangmsg(0, 20)
            End Select
        Next
    End If
    '**********************************************************************
    '* 計算単位情報の取得
    '**********************************************************************
    If IsNull(keydata(26)) Then
        ReDim w_keisan(0)
        w_keisan(0) = ""
    Else
        w_keisan = VBSplit(keydata(26), ",", -1, 0)
    End If

    '**********************************************************************
    '* 画面の表示
    '**********************************************************************
    '*    1: 選択数と件数のフィールド数
    If IsNull(P000S001.FNCG_P_NZ(keydata(1))) OrElse Not IsNull(P000S001.FNCG_P_NZ(Request.QueryString("pclr"))) Then
        Session.Add("SL_P003M061_VP01", Nothing)
%>
<html>
<head>
    <%
        P000S004.SUBG_P_METATAG("1")
    %>
</head>
<body <%= P000S004.FNCG_P_BODYTAG2() %>>
</body>
</html>
<%
    Response.End()
End If
ary_01 = VBSplit(keydata(2), ",", -1, 0)
'*** コード：カテゴリ区分 "-" 項目順
ary_02 = VBSplit(keydata(3), P0030000.CUSTOM_LINE_SEPARATOR1, -1, 0)
'*** 名称  ：カテゴリ名称 "（" 項目名称 "）"
ary_03 = VBSplit(keydata(16), P0030000.CUSTOM_LINE_SEPARATOR2, -1, 0)
'*** 統計検索区分

Dim masterAuxInfoSyutuArr() As String
If Not IsNull(P000S001.FNCG_P_NZ(keydata(33))) Then
    masterAuxInfoSyutuArr = keydata(33).Split(","c)
End If
'*** 表示言語と出力言語が異なる場合は、名称を再取得
If w_langid <> keydata(31) Then
    For w_i = 0 To UBound(ary_01)
        w_split = VBSplit(ary_01(w_i), P0030000.CUSTOM_LINE_SEPARATOR2, -1, 0)
        Dim masterAuxInfoSyutu() As String = VBSplit(masterAuxInfoSyutuArr(w_i), P0030000.CUSTOM_LINE_SEPARATOR2, -1, 0)
        
        sql = "SELECT"
        sql = sql & " WEB_SP0002231_F(:ORA_0,6,2,NULL,NULL,:ORA_1,NULL,:ORA_3)"
        '*** 0 カテゴリ名
        
        If masterAuxInfoSyutu(0) <> "0" Then
            sql = sql & ", WEB_SP0002610_F(1, :ORA_0, :ORA_7, :ORA_4, :ORA_5, :ORA_6, :ORA_3)"
        Else
            sql = sql & ",WEB_SP0002231_F(:ORA_0,5,2,NULL,NULL,:ORA_1,:ORA_2,:ORA_3)"
        End If
        '*** 1 項目名
        sql = sql & " FROM DUAL"
        Dim bindParams(1, 7) As String
        bindParams(0, 0) = SessionAsStr("SG_P_KAISYA_SELECT")
        bindParams(0, 1) = w_split(0)
        bindParams(0, 2) = w_split(1)
        bindParams(0, 3) = keydata(31)
        bindParams(0, 4) = masterAuxInfoSyutu(0)    'masterAuxDiv
        bindParams(0, 5) = masterAuxInfoSyutu(1)    'masterAuxKaisyaCD
        bindParams(0, 6) = masterAuxInfoSyutu(2)    'masterAuxID
        bindParams(0, 7) = masterAuxInfoSyutu(3)    'masterID
        
        bindParams(1, 0) = "101"
        bindParams(1, 1) = "2"
        bindParams(1, 2) = "2"
        bindParams(1, 3) = "2"
        bindParams(1, 4) = CStr(OraConst.ORATYPE_VARCHAR2)
        bindParams(1, 5) = CStr(OraConst.ORATYPE_NUMBER)
        bindParams(1, 6) = CStr(OraConst.ORATYPE_NUMBER)
        bindParams(1, 7) = CStr(OraConst.ORATYPE_NUMBER)
        
        If P000S011.FNCG_P_RECORDSET5(0, sql, bindParams, w_dbdata) Then
            If keydata(41) = "2" Then '*** 組織を軸とした検索
                ary_02(w_i + 1) = w_dbdata(0, 0) & "(" & w_dbdata(1, 0) & ")"
            Else
                ary_02(w_i) = w_dbdata(0, 0) & "(" & w_dbdata(1, 0) & ")"
            End If
        End If
    Next
End If
'**********************************************************************
'//**    ２．結果データの取得
'//**
'**********************************************************************
'**********************************************************************
'* 件数データの取得
'**********************************************************************
If Not IsNull(Session("SL_P003M061_VP01")) Then
    '*** Sessionが存在する
    w_data = SessionAsStrArray2D("SL_P003M061_VP01")
Else
    If FNCL_P_VP0030630(w_data, w_kcnt) = False Then
        '*** ﾗﾍﾞﾙ(21)："統計検索"
        '*** ﾗﾍﾞﾙ(22)："対象者は存在しません。" & "<BR>"
        P000S004.SUBG_P_ERRVIEW(w_langmsg(0, 21), "5", w_langmsg(0, 22), _
            "P003M061.aspx", "_self")
        Response.End()
    End If
End If
'**********************************************************************
'* 社員データの取得
'**********************************************************************
If keydata(17) = "1" Then
    If FNCL_P_MAKEVIEW("3", keydata(17), keydata(23), w_tkkbn, w_srtcnt1, w_srtcnt2) = 1 Then
        '*** ﾗﾍﾞﾙ(23)："統計検索"
        Session.Add("SG_P_ERRMSG", New String() {w_langmsg(0, 23), "3", vntErrText, w_asp, ""})
        P000S018.SUBG_P_REPLACE("", "P000M021.aspx")
        Response.End()
    End If
    sql = "SELECT K001"
    For w_i = 2 To w_kcnt
        sql = sql & ",K" & P000S001.FNCG_P_ZEROCD(CStr(w_i), 3)
    Next
    For w_i = 1 To 20
        If Mid(keydata(18), w_i, 1) = "1" Then
            sql = sql & ",J" & P000S001.FNCG_P_ZEROCD(CStr(w_i), 3)
        End If
    Next
    sql = sql & " ,0"
    sql = sql & " FROM  " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0030630_" & SessionAsStr("SG_P_RID") & " "
    If CInt(w_srtcnt1) > 0 Then
        sql = sql & " ORDER BY "
        For w_i = 1 To CInt(w_srtcnt1)
            If w_i > 1 Then
                sql = sql & ","
            End If
            sql = sql & " S" & P000S001.FNCG_P_ZEROCD(CStr(w_i), 3)
        Next
    End If
    If P000S011.FNCG_P_RECORDSET1(0, sql, w_sdata) Then
        ReDim w_soutkid(UBound(w_sdata, 1))
        w_cnt = w_kcnt - 1
        For w_i = 1 To 20
            If Mid(keydata(18), w_i, 1) = "1" Then
                w_cnt = w_cnt + 1
                w_soutkid(w_cnt) = CStr(w_i)
            End If
        Next
        w_smax = UBound(w_sdata, 2)
    Else
        w_smax = -1
    End If
End If
'**********************************************************************
'* 検索遷移用アンカーパラメータの作成
'**********************************************************************
ReDim w_qstring(UBound(w_data, 2))
For icnt = 0 To UBound(w_data, 2)
    w_qstring(icnt) = ""
    For iy = 0 To (w_kcnt - 1)
        If iy > 0 Then
            w_qstring(icnt) = w_qstring(icnt) & "&"
        End If
        'If Not IsNull(P000S001.FNCG_P_NZ(w_data(iy + w_kcnt,icnt))) Then
        'w_qstring(icnt) = w_qstring(icnt) & "p" & right("0" & iy,2) & "=" & Server.URLEncode(w_data(iy + w_kcnt,icnt))
        'Else
        w_qstring(icnt) = w_qstring(icnt) & "p" & Right("0" & iy, 2) & "=" & w_data(iy + w_kcnt, icnt)
        'End If
    Next
Next
Session.Add("SL_P003M061_VP01", w_data)
'**********************************************************************
'*    合計・小計取得処理
'**********************************************************************
w_sumcnt = 0
If w_kcnt > 1 AndAlso keydata(5) = "1" Then
    ReDim w_kssum(w_kcnt - 2, UBound(w_data, 2))
    ReDim w_nowcnt(w_kcnt - 2)
    For ix = 0 To UBound(w_data, 2)
        w_sumcnt = w_sumcnt + CInt(w_data(w_cid, ix))
        For iy = 0 To w_kcnt - 2
            If ix = UBound(w_data, 2) Then
                For iz = 0 To UBound(w_nowcnt, 1)
                    w_kssum(iz, ix) = CStr(S000S020.ZeroToNull(w_nowcnt(iz) + CInt(w_data(w_cid, ix))))
                Next
                Exit For
            Else
                If w_data(w_kcnt + iy, ix) = w_data(w_kcnt + iy, ix + 1) Then
                    w_nowcnt(iy) = w_nowcnt(iy) + CInt(w_data(w_cid, ix))
                Else
                    For iz = iy To UBound(w_nowcnt, 1)
                        w_kssum(iz, ix) = CStr(S000S020.ZeroToNull(w_nowcnt(iz) + CInt(w_data(w_cid, ix))))
                        w_nowcnt(iz) = 0
                    Next
                    Exit For
                End If
            End If
        Next
    Next
Else
    ReDim w_kssum(-1, UBound(w_data, 2))
    For ix = 0 To UBound(w_data, 2)
        w_sumcnt = w_sumcnt + CInt(w_data(w_cid, ix))
    Next
End If
'**********************************************************************
'*    同一項目結合処理
'**********************************************************************
ReDim w_tbrow(w_kcnt - 1, UBound(w_data, 2))
If keydata(4) = "1" Then
    ReDim w_nowcnt(UBound(w_tbrow, 1))
    For ix = 0 To UBound(w_tbrow, 1)
        w_nowcnt(ix) = 1
    Next
    For ix = UBound(w_tbrow, 2) To 1 Step -1
        For iy = 0 To UBound(w_tbrow, 1)
            If w_data(w_kcnt + iy, ix) = w_data(w_kcnt + iy, ix - 1) Then
                w_tbrow(iy, ix) = "0"
                w_nowcnt(iy) = w_nowcnt(iy) + 1
            Else
                For iz = iy To UBound(w_tbrow, 1)
                    w_tbrow(iz, ix) = CStr(w_nowcnt(iz))
                    w_nowcnt(iz) = 1
                Next
                Exit For
            End If
        Next
    Next
    For iy = 0 To UBound(w_tbrow, 1)
        w_tbrow(iy, 0) = CStr(w_nowcnt(iy))
    Next
Else
    For ix = 0 To UBound(w_tbrow, 2)
        For iy = 0 To UBound(w_tbrow, 1)
            w_tbrow(iy, ix) = "1"
        Next
    Next
End If
'**********************************************************************
'*    罫線情報・書式情報取得
'**********************************************************************
w_datafmt1 = ""
w_datafmt2 = ""
'*** 社員コード対象判断
ReDim w_scdtais(w_kcnt)
'*** 受付番号対象判断
ReDim w_unotais(w_kcnt)
'*** 時刻項目対象判断
ReDim w_timetais(w_kcnt)
'*** 所属対象判断
ReDim w_syozktais(w_kcnt)
'*** 事業所対象判断
ReDim w_jigyotais(w_kcnt)
'*** 月日項目対象判断
ReDim PE_ComVars.Instance.w_mmddtais(w_kcnt)
For w_i = 1 To w_kcnt
    w_ftype = FNCL_P_003M063_GETFORMAT(CStr(w_i))
    w_scdtais(w_i) = FNCL_P_003M063_FORMATCHK(w_ftype, "01")   '*** 社員コード
    If w_gmode = "2" Then  '*** 採用
        w_unotais(w_i) = FNCL_P_003M063_FORMATCHK(w_ftype, "08")   '*** 受付番号
    End If
    w_timetais(w_i) = FNCL_P_003M063_FORMATCHK(w_ftype, "34") '*** 時間
    w_jigyotais(w_i) = FNCL_P_003M063_JIGYOCHK("0", CStr(w_i))
    w_syozktais(w_i) = CStr(FNCL_P_003M063_SYOZKCHK(CStr(w_i)))
    PE_ComVars.Instance.w_mmddtais(w_i) = FNCL_P_003M063_FORMATCHK(w_ftype, "07")    '*** 月日
Next
For w_i = 1 To (w_kcnt - 1)
    If keydata(6) = "1" Then
        If w_scdtais(w_i) = "1" Then
            w_datafmt1 = w_datafmt1 & "-01-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
        ElseIf w_unotais(w_i) = "1" Then
            w_datafmt1 = w_datafmt1 & "-08-08".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
        ElseIf w_timetais(w_i) = "1" Then
            w_datafmt1 = w_datafmt1 & "-34-34".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
        ElseIf PE_ComVars.Instance.w_mmddtais(w_i) = "1" Then
            w_datafmt1 = w_datafmt1 & "-01-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
        Else
            w_datafmt1 = w_datafmt1 & "--".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
        End If
        '*** 組織項目出力
        If keydata(41) = "2" AndAlso w_i = 1 AndAlso w_skcnt > 0 Then
            w_flg = w_flg & "-" & Cstr(2+w_skcnt)
        Else
            w_flg = w_flg & "-2"
        End If
    Else
        If w_scdtais(w_i) = "1" Then
            w_datafmt1 = w_datafmt1 & "-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
        ElseIf w_unotais(w_i) = "1" Then
            w_datafmt1 = w_datafmt1 & "-08".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
        ElseIf w_timetais(w_i) = "1" Then
            w_datafmt1 = w_datafmt1 & "-34".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
        ElseIf PE_ComVars.Instance.w_mmddtais(w_i) = "1" Then
            w_datafmt1 = w_datafmt1 & "-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
        Else
            w_datafmt1 = w_datafmt1 & "-"
        End If
        '*** 組織項目出力
        If keydata(41) = "2" AndAlso w_i = 1 AndAlso w_skcnt > 0 Then
            w_flg = w_flg & "-" & Cstr(1+w_skcnt)
        Else
            w_flg = w_flg & "-1"
        End If
    End If
    If w_scdtais(w_i) = "1" Then
        w_datafmt2 = w_datafmt2 & "-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    ElseIf w_unotais(w_i) = "1" Then
        w_datafmt2 = w_datafmt2 & "-08".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    ElseIf w_timetais(w_i) = "1" Then
        w_datafmt2 = w_datafmt2 & "-34".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    ElseIf PE_ComVars.Instance.w_mmddtais(w_i) = "1" Then
        w_datafmt2 = w_datafmt2 & "-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    Else
        w_datafmt2 = w_datafmt2 & P0030000.CUSTOM_LINE_SEPARATOR2
    End If
    '*** 組織項目出力
    If keydata(41) = "2" AndAlso w_i = 1 AndAlso w_skcnt > 0 Then
        For ix2 = 0 To w_skcnt-1
            If Cint(w_sk_array_id(ix2)) >= 130 AndAlso Cint(w_sk_array_id(ix2)) <= 149 Then
                w_datafmt1 = w_datafmt1 & "-31".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
            Else
                w_datafmt1 = w_datafmt1 & "-".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
            End If
            w_datafmt2 = w_datafmt2 & P0030000.CUSTOM_LINE_SEPARATOR2
        Next
    End If
Next
w_cnt = 0
If keydata(6) = "1" Then
    '*** コード表示(最終項目)
    w_cnt = 2
    If w_scdtais(w_kcnt) = "1" Then
        w_datafmt1 = w_datafmt1 & "-01-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    ElseIf w_unotais(w_kcnt) = "1" Then
        w_datafmt1 = w_datafmt1 & "-08-08".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    ElseIf w_timetais(w_kcnt) = "1" Then
        w_datafmt1 = w_datafmt1 & "-34-34".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    ElseIf PE_ComVars.Instance.w_mmddtais(w_kcnt) = "1" Then
        w_datafmt1 = w_datafmt1 & "-01-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    Else
        w_datafmt1 = w_datafmt1 & "--".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    End If
Else
    w_cnt = 1
    If w_scdtais(w_kcnt) = "1" Then
        w_datafmt1 = w_datafmt1 & "-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    ElseIf w_unotais(w_kcnt) = "1" Then
        w_datafmt1 = w_datafmt1 & "-08".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    ElseIf w_timetais(w_kcnt) = "1" Then
        w_datafmt1 = w_datafmt1 & "-34".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    ElseIf PE_ComVars.Instance.w_mmddtais(w_kcnt) = "1" Then
        w_datafmt1 = w_datafmt1 & "-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
    Else
        w_datafmt1 = w_datafmt1 & P0030000.CUSTOM_LINE_SEPARATOR2
    End If
End If
If w_scdtais(w_kcnt) = "1" Then
    w_datafmt2 = w_datafmt2 & "-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
ElseIf w_unotais(w_kcnt) = "1" Then
    w_datafmt2 = w_datafmt2 & "-08".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
ElseIf w_timetais(w_kcnt) = "1" Then
    w_datafmt2 = w_datafmt2 & "-34".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
ElseIf PE_ComVars.Instance.w_mmddtais(w_kcnt) = "1" Then
    w_datafmt2 = w_datafmt2 & "-01".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
Else
    w_datafmt2 = w_datafmt2 & P0030000.CUSTOM_LINE_SEPARATOR2
End If
For w_i = 1 To w_hos_cnt
    '*** 補足表示
    w_cnt = w_cnt + 1
    w_datafmt1 = w_datafmt1 & "-33".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
Next
w_cnt = w_cnt + 1
'*** 件数
w_datafmt1 = w_datafmt1 & "-31".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
w_datafmt2 = w_datafmt2 & "-31".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
If keydata(5) = "1" Then
    '*** 小計件数
    w_cnt = w_cnt + w_kcnt - 1
    w_datafmt1 = w_datafmt1 & "-31".Replace("-", P0030000.CUSTOM_LINE_SEPARATOR2)
End If
If keydata(17) = "1" Then
    '*** 社員表示
    w_cnt = w_cnt + 1
    w_datafmt1 = w_datafmt1 & P0030000.CUSTOM_LINE_SEPARATOR2
End If
w_flg = w_flg & P0030000.CUSTOM_LINE_SEPARATOR2 & w_cnt
ReDim w_linecnt(UBound(VBSplit(Mid(w_flg, 2), "-", -1, 0)))
ReDim w_linefmt(UBound(VBSplit(Mid(w_flg, 2), "-", -1, 0)))
w_k = UBound(w_linecnt)
For w_i = 0 To w_k
    w_linecnt(w_i) = 1
    w_linefmt(w_i) = "1"
Next
For w_i = 0 To UBound(w_data, 2)
    For w_j = 0 To w_k
        If keydata(17) = "0" OrElse w_data(w_cid, w_i) = "0" Then
            w_linecnt(w_j) = w_linecnt(w_j) + 1
        Else
            w_linecnt(w_j) = w_linecnt(w_j) + CInt(w_data(w_cid, w_i))
        End If
    Next
    If w_i = UBound(w_data, 2) Then
        For w_j = 0 To (w_k - 1)
            w_linefmt(w_j) = w_linefmt(w_j) & P0030000.CUSTOM_LINE_SEPARATOR2 & w_linecnt(w_j)
            w_linefmt(w_j) = w_linefmt(w_j) & P0030000.CUSTOM_LINE_SEPARATOR2 & w_linecnt(w_j) + 1
            '*** 合計用
        Next
    Else
        For w_j = 0 To (w_k - 1)
            If IsNull(w_data(w_j + w_kcnt, w_i)) Then
                w_data(w_j + w_kcnt, w_i) = ""
            End If
            If IsNull(w_data(w_j + w_kcnt, w_i + 1)) Then
                w_data(w_j + w_kcnt, w_i + 1) = ""
            End If
            If w_data(w_j + w_kcnt, w_i) <> w_data(w_j + w_kcnt, w_i + 1) Then
                For ix = w_j To (w_k - 1)
                    w_linefmt(ix) = w_linefmt(ix) & P0030000.CUSTOM_LINE_SEPARATOR2 & w_linecnt(ix)
                Next
                Exit For
            End If
        Next
    End If
    w_linefmt(w_k) = w_linefmt(w_k) & P0030000.CUSTOM_LINE_SEPARATOR2 & w_linecnt(w_k)
    If w_i = UBound(w_data, 2) Then
        w_linefmt(w_k) = w_linefmt(w_k) & P0030000.CUSTOM_LINE_SEPARATOR2 & w_linecnt(w_k) + 1
    End If
Next
w_flg = Mid(w_flg, 2)
For w_i = 0 To w_k
    w_flg = w_flg & "," & w_linefmt(w_i)
Next
Session.Add("SG_P_EXCELLINE", w_flg)
Session.Add("SG_P_PIVOTOUTPUT", New String() {Mid(w_datafmt2, 2)})
'**********************************************************************
'//**    ４．外部出力ファイルの作成
'//**        ＣＳＶ形式で出力する。
'//**
'**********************************************************************
'**********************************************************************
'*    通常用データ
'**********************************************************************
'******************************************************************
'* 開始ログ出力
'******************************************************************
If w_gmode = "1" Then
    '*** 通常
    Select Case w_smode(0)
        Case "1"
            '*** 【通常】
            w_logkkbn = "3"
            w_logsyrno = "10"
            P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
            w_logmsg = w_logmsg & "、"
            P000S017.FNCG_P_GETLOGNAME("100", "0", SessionAsStr("SG_P_KAISYA_SELECT"), "", w_logmsg)
        Case "2"
            '*** 【異動・昇格】
            w_logkkbn = "300"
            w_logsyrno = "10"
            P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
            w_logmsg = w_logmsg & "、"
            P000S017.FNCG_P_GETLOGNAME("100", "0", SessionAsStr("SG_P_KAISYA_SELECT"), "", w_logmsg)
            'Session("SL_P300_INF01")                '*** SL_300-2_001 P300M017.aspxを参照
            '* (1)：処理ＩＤ
            '* (2)：公開ＩＤ
            '* (3)：案ＩＤ
            sql = "SELECT A.NAME"
            sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3000110_M A"
            sql = sql & " WHERE A.KAISYACD = :ORA_0"
            sql = sql & "   AND A.PROCESS_ID   = :ORA_1"
            ReDim w_orapara(2, 1)
            w_orapara(0, 0) = SessionAsStr("SG_P_KAISYA_SELECT")
            w_orapara(1, 0) = "101"
            w_orapara(0, 1) = SessionAsStrArray("SL_P300_INF01")(1)
            w_orapara(1, 1) = "2"
            If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                ReDim w_dbdata(0, 0)
            End If
            w_logmsg = w_logmsg & "、履歴名称：" & w_dbdata(0, 0)
            sql = "SELECT A.NAME"
            sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3000120_M A"
            sql = sql & " WHERE A.KAISYACD = :ORA_0"
            sql = sql & "   AND A.OPEN_ID   = :ORA_1"
            ReDim w_orapara(2, 1)
            w_orapara(0, 0) = SessionAsStr("SG_P_KAISYA_SELECT")
            w_orapara(1, 0) = "101"
            w_orapara(0, 1) = SessionAsStrArray("SL_P300_INF01")(2)
            w_orapara(1, 1) = "2"
            If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                ReDim w_dbdata(0, 0)
            End If
            w_logmsg = w_logmsg & "、グループ：" & w_dbdata(0, 0)
            sql = "SELECT A.NAME"
            sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3000200_T A"
            sql = sql & " WHERE A.KAISYACD = :ORA_0"
            sql = sql & "   AND A.PROCESS_ID   = :ORA_1"
            sql = sql & "   AND A.OPEN_ID   = :ORA_2"
            sql = sql & "   AND A.PLAN_ID     = :ORA_3"
            ReDim w_orapara(2, 3)
            w_orapara(0, 0) = SessionAsStr("SG_P_KAISYA_SELECT")
            w_orapara(1, 0) = "101"
            w_orapara(0, 1) = SessionAsStrArray("SL_P300_INF01")(1)
            w_orapara(1, 1) = "2"
            w_orapara(0, 2) = SessionAsStrArray("SL_P300_INF01")(2)
            w_orapara(1, 2) = "2"
            w_orapara(0, 3) = SessionAsStrArray("SL_P300_INF01")(3)
            w_orapara(1, 3) = "2"
            If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                ReDim w_dbdata(0, 0)
            End If
            w_logmsg = w_logmsg & "、案名称：" & w_dbdata(0, 0)
            If SessionAsStrArray2D("SL_P000KENFLAG")(5, 1) = "1" Then
                w_logmsg = w_logmsg & "、対象者：全" & SessionAsStrArray("SG_P_SYSTEM_J")(7)
            Else
                P000S057.FNCG_P_KENSAKULOG("300", "", w_kensaku)
                w_logmsg = w_logmsg & "、対象者：絞込み(" & w_kensaku & ")"
            End If
        Case "3"
            '*** 【考課】
            w_logkkbn = "200"
            w_logsyrno = "20"
            P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
            w_logmsg = w_logmsg & "、"
            P000S017.FNCG_P_GETLOGNAME("100", "0", SessionAsStr("SG_P_KAISYA_SELECT"), "", w_logmsg)
            'Session("SL_P200_INF01")                '*** SL_200-1_009
            '* (0):考課パターン
            '* (1):考課時期
            '* (2):帳票名
            '* (3):昇級時期
            If SessionAsStrArray("SL_P200_INF01")(0) = "1111" Then
                w_logmsg = w_logmsg & "、考課パターン：全て"
            Else
                sql = "SELECT A.EVAL_PATTERN"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "EVAL_PATTERN A"
                sql = sql & " WHERE A.KAISYACD = :ORA_0"
                sql = sql & "   AND A.CODE_VALUE     = :ORA_1"
                ReDim w_orapara(2, 1)
                w_orapara(0, 0) = SessionAsStr("SG_P_KAISYA_SELECT")
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = SessionAsStrArray("SL_P200_INF01")(0)
                w_orapara(1, 1) = "1"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                    ReDim w_dbdata(0, 0)
                End If
                w_logmsg = w_logmsg & "、考課パターン：" & w_dbdata(0, 0)
            End If
            sql = "SELECT A.NAME"
            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP2000010 A"
            sql = sql & " WHERE A.KAISYACD = :ORA_0"
            sql = sql & "   AND A.CODE_VALUE     = :ORA_1"
            ReDim w_orapara(2, 1)
            w_orapara(0, 0) = SessionAsStr("SG_P_KAISYA_SELECT")
            w_orapara(1, 0) = "101"
            w_orapara(0, 1) = SessionAsStrArray("SL_P200_INF01")(1)
            w_orapara(1, 1) = "1"
            If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                ReDim w_dbdata(0, 0)
            End If
            w_logmsg = w_logmsg & "、考課時期：" & w_dbdata(0, 0)
            If SessionAsStrArray("SL_P200_INF01")(3) <> "0" Then
                w_logmsg = w_logmsg & "、昇級時期：" & SessionAsStrArray("SL_P200_INF01")(3)
            End If
            If SessionAsStrArray2D("SL_P000KENFLAG")(5, 1) = "1" Then
                w_logmsg = w_logmsg & "、対象者：全" & SessionAsStrArray("SG_P_SYSTEM_J")(7)
            Else
                P000S057.FNCG_P_KENSAKULOG("200", "", w_kensaku)
                w_logmsg = w_logmsg & "、対象者：絞込み(" & w_kensaku & ")"
            End If
        Case "5"
            '*** 【異動線】
            w_logkkbn = "301"
            w_logsyrno = "10"
            P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
            w_logmsg = w_logmsg & "、"
            P000S017.FNCG_P_GETLOGNAME("100", "0", SessionAsStr("SG_P_KAISYA_SELECT"), "", w_logmsg)
            w_logmsg = w_logmsg & "、履歴名称：" & SessionAsStrArray("SL_P301_INF01")(3)
            '*** SL_301-2_001 P301M001.aspxを参照
            w_logmsg = w_logmsg & "、案名称：" & SessionAsStrArray("SL_P301_INF02")(2)
            '*** SL_301-2_001 P301M131.aspxを参照
            If SessionAsStrArray2D("SL_P000KENFLAG")(5, 1) = "1" Then
                w_logmsg = w_logmsg & "、対象者：全" & SessionAsStrArray("SG_P_SYSTEM_J")(7)
            Else
                P000S057.FNCG_P_KENSAKULOG("301", "", w_kensaku)
                w_logmsg = w_logmsg & "、対象者：絞込み(" & w_kensaku & ")"
            End If
    End Select
Else
    '*** 採用
    w_logkkbn = "400"
    w_logsyrno = "60"
    P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
    w_logmsg = w_logmsg & "、"
    P000S017.FNCG_P_GETLOGNAME("100", "0", SessionAsStr("SG_P_KAISYA_SELECT"), "", w_logmsg)
    w_logmsg = w_logmsg & "、応募年：" & SessionAsStrArray2D("SL_P000KENFLAG")(5, 0)
    If SessionAsStrArray2D("SL_P000KENFLAG")(5, 1) = "1" Then
        w_logmsg = w_logmsg & "、対象者：応募者"
    Else
        P000S057.FNCG_P_KENSAKULOG("400", "", w_kensaku)
        w_logmsg = w_logmsg & "、対象者：絞込み(" & w_kensaku & ")"
    End If
End If
Session.Add("PSSO_OPERATIONNO", CInt(Session("PSSO_OPERATIONNO")) + 1)
POCOM001.POCOM_ProcessStart(w_logmsg, "P000-00136", DBOBJ, "")
'**********************************************************************
'*    ファイルのオープン
'**********************************************************************
Filename = SessionAsStr("SG_C_OUTPUTPATH02_B") & SessionAsStr("SG_P_RID") & ".CSV"
FileObject = New FileSystemObject()
OutStream = POCOM001.POCOM_CreateTextFile(Filename, System.Text.Encoding.Unicode, True)
'**********************************************************************
'*    ヘッダー情報
'**********************************************************************
'*** 項目名ヘッダー出力
For ix = 0 To UBound(ary_02)
    If ix = 0 Then
        writeBuff = ""
        '*** ﾗﾍﾞﾙ(24)："""【合計】"""
        writeBuff2 = """" & w_outlangmsg(0, 24) & """"
        writeBuff3 = ","""""
    Else
        writeBuff2 = writeBuff2 & ","""""
        writeBuff = writeBuff & ","
        writeBuff3 = writeBuff3 & ","""""
    End If
    writeBuff = writeBuff & """" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(Trim(ary_02(ix))) & """"
    '*** コード出力時
    If keydata(6) = "1" Then
        '*** ﾗﾍﾞﾙ(25)：",""" & Trim(ary_02(ix)) & "(コード)"""
        writeBuff = writeBuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(P000S008.FNCG_P_SUBWORD(1, w_outlangmsg(0, 25), Trim(ary_02(ix)), "")) & """"
        writeBuff2 = writeBuff2 & ","""""
        writeBuff3 = writeBuff3 & ","""""
    End If
    '*** 組織項目出力
    If keydata(41) = "2" AndAlso ix = 0 AndAlso w_skcnt > 0 Then
        For ix2 = 0 To w_skcnt-1
            writeBuff = writeBuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(Trim(w_sk_array_na(ix2))) & """"
            writeBuff2 = writeBuff2 & ","""""
            writeBuff3 = writeBuff3 & ","""""
        Next
    End If
Next
'*** 補足項目出力
For w_i = 1 To w_hos_cnt
    writeBuff = writeBuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_hosoku(w_i - 1)) & """"
    writeBuff2 = writeBuff2 & ","""""
    writeBuff3 = writeBuff3 & ","""""
Next
'*** 合計出力
'*** ﾗﾍﾞﾙ(26)：",""件数"""
writeBuff = writeBuff & ",""" & w_outlangmsg(0, 26) & """"
writeBuff2 = writeBuff2 & ",""" & w_sumcnt & """"
writeBuff3 = writeBuff3 & ","""""
'*** 小計出力
For ix = 0 To UBound(w_kssum, 1)
    '*** ﾗﾍﾞﾙ(28)："",""小計""
    writeBuff = writeBuff & ",""" & w_outlangmsg(0, 28) & ix + 1 & """"
    writeBuff2 = writeBuff2 & ","""""
    writeBuff3 = writeBuff3 & ","""""
Next
'*** 社員出力
If keydata(17) = "1" Then
    '*** ﾗﾍﾞﾙ(29)：""情報""""
    writeBuff = writeBuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_sname) & w_outlangmsg(0, 29) & """"
End If
OutStream.WriteLine(writeBuff)
'**********************************************************************
'*    データ出力
'**********************************************************************
w_scnt = 0
w_data_kcnt = UBound(w_data, 1)
For icnt = 0 To UBound(w_data, 2)
    writeBuff = ""
    '*** 項目出力
    For ix = 0 To (w_kcnt - 1)
        Select Case w_tbrow(ix, icnt)
            Case "0"
                writeBuff = writeBuff & ","""""
                If keydata(6) = "1" Then
                    writeBuff = writeBuff & ","""""
                End If
            Case Else
                If w_timetais(ix + 1) = "1" Then
                    writeBuff = writeBuff & ",""" & P000S001.FNCG_P_NUM2TIME_MINUS(w_data(ix, icnt)) & """"
                ElseIf PE_ComVars.Instance.w_mmddtais(ix + 1) = "1" Then
                    writeBuff = writeBuff & ",""" & P000S001.FNCG_P_NUMTOMMDD(w_data(ix, icnt)) & """"
                Else
                    writeBuff = writeBuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_data(ix, icnt)) & """"
                End If
                If keydata(6) = "1" Then
                    If w_jigyotais(ix + 1) = "1" OrElse w_jigyotais(ix + 1) = "2" Then
                        writeBuff = writeBuff & ",""" & FNCL_P_003M063_JIGYOCHK(w_jigyotais(ix + 1), w_data(ix + w_kcnt, icnt)) & """"
                    Else
                        writeBuff = writeBuff & ",""" & w_data(ix + w_kcnt, icnt) & """"
                    End If
                End If
        End Select
        '*** 組織項目出力
        If keydata(41) = "2" AndAlso ix = 0 AndAlso w_skcnt > 0 Then
            For ix2 = 0 To w_skcnt-1
                Select Case w_tbrow(ix, icnt)
                    Case "0"
                        writeBuff = writeBuff & ","""""
                    Case Else
                        writeBuff = writeBuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_data(w_data_kcnt - w_skcnt + ix2 + 1, icnt)) & """"
                End Select
            Next
        End If
    Next
    '*** 補足項目出力
    For w_i = 1 To w_hos_cnt
        If Not IsNull(P000S001.FNCG_P_NZ(w_data(w_cid + w_i, icnt))) Then
            If Mid(P000S001.FNCG_P_NZ(w_data(w_cid + w_i, icnt)), 1, 1) = "." Then
                w_data(w_cid + w_i, icnt) = "0" & w_data(w_cid + w_i, icnt)
            End If
        End If
        writeBuff = writeBuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_data(w_cid + w_i, icnt)) & """"
    Next
    '*** 合計出力
    writeBuff = writeBuff & ",""" & w_data(w_cid, icnt) & """"
    '*** 小計出力
    For iy = 0 To UBound(w_kssum, 1)
        writeBuff = writeBuff & ",""" & w_kssum(iy, icnt) & """"
    Next
    '*** 社員出力
    If keydata(17) = "1" Then
        w_outcnt = 0
        ReDim w_outdata(CInt(w_data(w_cid, icnt)))
        If w_scnt <= w_smax Then
            Do
                w_flg = "0"
                For w_ccnt = 0 To UBound(w_sdata, 2)
                    If CInt(w_sdata(UBound(w_sdata), w_ccnt)) = 0 Then
                        w_flg = "0"
                        For w_j = 0 To (w_kcnt - 1)
                            If IsNull(w_sdata(w_j, w_ccnt)) Then
                                'If IsNull(w_sdata(w_j,w_scnt)) = True Then
                                w_sdata(w_j, w_ccnt) = ""
                                'w_sdata(w_j,w_scnt) =""
                            End If
                            If IsNull(w_data(w_j + w_kcnt, icnt)) Then
                                w_data(w_j + w_kcnt, icnt) = ""
                            End If
                            If w_data(w_j + w_kcnt, icnt) <> w_sdata(w_j, w_ccnt) Then
                                'If w_data(w_j + w_kcnt,icnt) <> w_sdata(w_j,w_scnt) Then
                                w_flg = "1"
                                Exit For
                            End If
                        Next
                        If w_flg = "0" Then
                            '*** マッチした場合
                            w_sdata(UBound(w_sdata), w_ccnt) = "1"
                            Exit For
                        End If
                    End If
                Next
                If w_flg = "0" Then
                    '*** マッチした場合
                    w_soutdata = ""
                    w_cnt = 0
                    For w_k = w_kcnt To UBound(w_sdata, 1) - 1
                        'For w_k = w_kcnt To Ubound(w_sdata,1)
                        If w_k = w_kcnt AndAlso Mid(keydata(18), 1, 1) = "1" Then
                            w_soutdata = w_soutdata & " " & P000S001.FNCG_P_SCDFMT(w_sdata(w_k, w_ccnt))
                            'w_soutdata = w_soutdata & " " & P000S001.FNCG_P_SCDFMT(w_sdata(w_k,w_scnt))
                        Else
                            If CInt(w_soutkid(w_k)) >= 3 AndAlso w_cnt = 0 Then
                                'w_soutdata = w_soutdata & "（" & w_sdata(w_k,w_scnt)
                                '*** ﾗﾍﾞﾙ(27)："（"
                                w_soutdata = w_soutdata & w_outlangmsg(0, 27) & w_sdata(w_k, w_ccnt)
                                w_cnt = 1
                            Else
                                'w_soutdata = w_soutdata & " " & w_sdata(w_k,w_scnt)
                                w_soutdata = w_soutdata & " " & w_sdata(w_k, w_ccnt)
                            End If
                        End If
                    Next
                    If w_cnt = 1 Then
                        '*** ﾗﾍﾞﾙ(30)："）"
                        w_soutdata = w_soutdata & w_outlangmsg(0, 30)
                    End If
                    w_soutdata = Trim(w_soutdata)
                    If w_outcnt = 0 Then
                        w_outdata(0) = writeBuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_soutdata) & """"
                    Else
                        w_outdata(w_outcnt) = writeBuff3 & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_soutdata) & """"
                    End If
                    w_scnt = w_scnt + 1
                    w_outcnt = w_outcnt + 1
                    If w_scnt > w_smax Then
                        Exit Do
                    End If
                Else
                    Exit Do
                End If
            Loop
        End If
        If w_outcnt = 0 Then
            w_outdata(0) = writeBuff & ","""""
        Else
            w_outcnt = w_outcnt - 1
            '*** 社員が存在する場合は１件引く
        End If
        For w_j = 0 To w_outcnt
            OutStream.WriteLine(Mid(w_outdata(w_j), 2))
        Next
    Else
        OutStream.WriteLine(Mid(writeBuff, 2))
    End If
Next
If keydata(17) = "1" Then
    For w_ccnt = 0 To UBound(w_sdata, 2)
        w_sdata(UBound(w_sdata), w_ccnt) = "0"
    Next
End If
'**********************************************************************
'*    合計項目表示
'**********************************************************************
OutStream.WriteLine(writeBuff2)
'**********************************************************************
'*    ファイルクローズ
'**********************************************************************
OutStream.Close()
'**************************************************************
'* 監査ログ用項目情報取得
'**************************************************************
If SessionAsStr("SL_P000M008_GMODE") = "1" Then
    P000S057.FNCG_P_TOKEIKENLOG("1", keydata(0), keydata(8), w_logsort, w_logkname, w_logcname)
Else
    P000S057.FNCG_P_TOKEIKENLOG("400", keydata(0), keydata(8), w_logsort, w_logkname, w_logcname)
End If
w_logcnt = UBound(w_data, 2) + 1
'**************************************************************
'* 終了ログ出力
'**************************************************************
POCOM001.POCOM_DataOutComplete(w_logmsg, w_logcnt, w_logkname, w_logsort, w_logcname, "P000-00137", DBOBJ, "")
Session.Add("SG_P_EXCELOUTPUT", New Object() {"5", Mid(w_datafmt1, 2), w_logmsg, w_logcnt, w_logkname, w_logsort, w_logcname, w_logkkbn, w_logsyrno})
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
'**********************************************************************
'*    ピボット用ＣＳＶ作成
'**********************************************************************
'*** データ数セット
keydata(14) = CStr(UBound(w_data, 2) + 2)
Session.Add("SL_P003M061_KEY", keydata)
Filename = SessionAsStr("SG_C_OUTPUTPATH02_B") & SessionAsStr("SG_P_RID") & "_PIV.CSV"
OutStream = POCOM001.POCOM_CreateTextFile(Filename, System.Text.Encoding.Unicode, True)
'*** 項目名ヘッダー出力
For ix = 0 To UBound(ary_02)
    If ix = 0 Then
        writeBuff = ""
        '*** ﾗﾍﾞﾙ(31)：【合計】
        writeBuff2 = """" & w_outlangmsg(0, 31) & """"
    Else
        writeBuff2 = writeBuff2 & ","""""
        writeBuff = writeBuff & ","
    End If
    writeBuff = writeBuff & """" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(Trim(ary_02(ix))) & """"
Next
'*** 合計出力
'*** ﾗﾍﾞﾙ(32)：件数
'※P000M209.aspxのピボットテーブル作成時に、この項目IDを指定して使用しているため
'項目IDを変更する場合はP000M209.aspxの修正が必要
writeBuff = writeBuff & ",""" & w_outlangmsg(0, 32) & """"
writeBuff2 = writeBuff2 & ",""" & w_sumcnt & """"
OutStream.WriteLine(writeBuff)
'*** データ出力
For icnt = 0 To UBound(w_data, 2)
    writeBuff = ""
    For ix = 0 To (w_kcnt - 1)
        Select Case ary_03(ix)
            Case "4", "5"
                '*** 【未登録】判断
                If w_data(ix, icnt) = w_lang_noregist Then
                    writeBuff = writeBuff & ",""" & w_data(ix, icnt) & """"
                Else
                    If w_syozktais(ix + 1) = "1" Then
                        writeBuff = writeBuff & ",""" & w_data(UBound(w_data, 1) - ix, icnt) & P0030000.CUSTOM_LINE_SEPARATOR2
                    Else
                        If w_jflg = 1 Then
                            If w_jigyotais(ix + 1) = "1" OrElse w_jigyotais(ix + 1) = "2" Then
                                writeBuff = writeBuff & ",""" & w_data(UBound(w_data, 1) - ix -w_skcnt, icnt) & P0030000.CUSTOM_LINE_SEPARATOR2
                            Else
                                writeBuff = writeBuff & ",""" & w_data(ix + w_kcnt, icnt) & P0030000.CUSTOM_LINE_SEPARATOR2
                            End If
                        Else
                            writeBuff = writeBuff & ",""" & w_data(ix + w_kcnt, icnt) & P0030000.CUSTOM_LINE_SEPARATOR2
                        End If
                    End If
                    writeBuff = writeBuff & "" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_data(ix, icnt)) & """"
                End If
            Case Else
                writeBuff = writeBuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_data(ix, icnt)) & """"
        End Select
    Next
    '*** 合計出力
    writeBuff = writeBuff & ",""" & w_data(w_cid, icnt) & """"
    OutStream.WriteLine(Mid(writeBuff, 2))
Next
'*** 合計項目表示
OutStream.WriteLine(writeBuff2)
OutStream.Close()
OutStream = Nothing
If w_kansys = "PB07" Then
    '**********************************************************************
    '*    店番マスタ作成(PB07)
    '**********************************************************************
    sql = "SELECT"
    sql = sql & " A.AUX_CHAR02"
    '*** 0 店番
    sql = sql & ",B.NAME4 || ' ' || B.NAME5"
    '*** 1 部店名称
    sql = sql & ",A.AUX_CHAR00"
    '*** 2 部店区分
    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER A"
    sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS       B"
    sql = sql & " WHERE A.KAISYACD = :ORA_0"
    sql = sql & "   AND A.AGE_NUMBER = WEB_SP0002022_F(:ORA_0,0,1,TRUNC(SYSDATE))"
    sql = sql & "   AND A.RANK IN (4,5)"
    sql = sql & "   AND A.KAISYACD = B.KAISYACD(+)"
    sql = sql & "   AND A.RANK = B.RANK(+)"
    sql = sql & "   AND A.CODE_VALUE = B.CODE_VALUE(+)"
    sql = sql & " ORDER BY A.TOTAL_DISP_ORDER"
    ReDim w_orapara(2, 0)
    w_orapara(0, 0) = SessionAsStr("SG_P_KAISYA_SELECT")
    w_orapara(1, 0) = "101"
    If P000S011.FNCG_P_RECORDSET5(3, sql, w_orapara, w_busyo) = False Then
        Response.Write("Error")
        Response.End()
    End If
    Filename = SessionAsStr("SG_C_OUTPUTPATH02_B") & SessionAsStr("SG_P_RID") & "_MISE.CSV"
    OutStream = POCOM001.POCOM_CreateTextFile(Filename, System.Text.Encoding.Unicode, True)
    For icnt = 0 To UBound(w_busyo, 2)
        writeBuff = ""
        writeBuff = writeBuff & ",""" & w_busyo(0, icnt) & """"
        writeBuff = writeBuff & ",""" & w_busyo(1, icnt) & """"
        writeBuff = writeBuff & ",""" & w_busyo(2, icnt) & """"
        OutStream.WriteLine(Mid(writeBuff, 2))
    Next
    OutStream.Close()
    OutStream = Nothing
End If
FileObject = Nothing
'**********************************************************************
'//**    ５．ＨＴＭＬの書き出し
'//**        一覧形式で表示する。
'//**
'**********************************************************************
%>
<html>
<head>
    <%
        P000S004.SUBG_P_METATAG("1")
        '*** ﾗﾍﾞﾙ(34)："統計検索画面"
    %>
    <title>
        <%= P000S004.FNCG_P_TITLE(w_langmsg(0, 34))%></title>
    <script language="JavaScript"><!--
    function JSFL_P_CHK()
    {
        var form = document.Form063;
        var w_ken = parseInt(form.f0.value,10) + parseInt(form.f1.value,10);
        <%If keydata(41) = "2" Then%>
        if(w_ken == 0) {
<%    '*** ﾗﾍﾞﾙ(35)：ＥＸＣＥＬ出力集計形式を設定して下さい。 %>
            alert("<%= w_langmsg(0, 35) %>");
            location.href = "P003M063.aspx";
            return false;
        }else if(w_ken > parseInt(form.h_kensuu.value,10)) {
<%    '*** ﾗﾍﾞﾙ(36)：選択項目数以内のＥＸＣＥＬ出力集計形式を設定して下さい。 %>
            alert("<%= w_langmsg(0, 36) %>");
            location.href = "P003M063.aspx";
            return false;
        }
        <%End If%>
        var w_ken2 = form.f0.value + "<%=P0030000.CUSTOM_LINE_SEPARATOR2 %>" + form.f1.value;
        JSFL_P_EXCELPOP(w_ken2);
    }

    function JFSL_P_AHREF(id)
    {
        var form = document.Form063;
        location.href = "P003M064.aspx?" + id + "&skbn=" + form.f2.value;
    }

//-->
    </script>
    <%
        P000S014.SUBG_P_EXCELPOP("Form063")
        '*** JSFL_P_EXCELPOPの書き出し処理
        If w_kansys = "PB07" Then
            Response.Write("<SCRIPT Language=JavaScript>" & vbCrLf)
            Response.Write("<!--" & vbCrLf)
            Response.Write("    var excelpop;" & vbCrLf)
            Response.Write("    excelpop = '';" & vbCrLf)
            Response.Write("    function JSFL_P_JININ(){" & vbCrLf)
            Response.Write("        excelpop = window.open('P000M203.aspx?kbn=5&id=','newexcel',")
            Response.Write("'toolbar=no,location=no, status=no,menubar=no,scrollbars=no,width=400,height=200,left=320,top=200');" & vbCrLf)
            Response.Write("    }" & vbCrLf)
            Response.Write("//-->" & vbCrLf)
            Response.Write("<" & "/SCRIPT>" & vbCrLf)
        End If
        '<!-- P000J000.JS EXEMPT -->
    %>
    <script language="JavaScript" type="text/javascript" src="./SCRIPT/P000J000.JS"></script>
    <%    'スタイルシート：データ用 %>
    <link rel="stylesheet" type="text/css" href="./CSS/P000C301.CSS">
    <link rel="stylesheet" type="text/css" href="./CSS/PE_Common.css"/>
    <link rel="stylesheet" type="text/css" href="./CSS/utf8style.css"/>
    <link rel="stylesheet" type="text/css" href="./CSS/P003M063.css"/>
    <base target="Frame_Data">
</head>
<body <%= P000S004.FNCG_P_BODYTAG2() %>>
    <form name="Form063" method="post" <%= P000S004.FNCG_P_AUTOCOMPLETE() %>>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td nowrap>
                <%    '*** ﾗﾍﾞﾙ(37)："前画面" %>
                <a href="<%= w_asp %>" class="thinlink"><b>
                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 37), w_style(0))%></b></a><br></td>
            <td width="20" nowrap><br></td>
            <td nowrap>
                <%    '*** ﾗﾍﾞﾙ(38)："ＣＳＶ出力" %>
                <a href="P000M203.aspx?kbn=21" target="_top"><b>
                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 38), w_style(0))%></b></a> </td>
            <td width="20" nowrap><br></td>
            <td nowrap>
                <%    '*** ﾗﾍﾞﾙ(38)："ＣＳＶ出力(UTF-8)" %>
                <a href="P000M203.aspx?kbn=1&enc=<%= System.Text.Encoding.UTF8.CodePage.ToString %>" target="_top"><b>
                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 38) & "(UTF-8)", w_style(0))%></b></a> </td>
            <td width="20" nowrap><br></td>
            <td nowrap>
                <%    '*** ﾗﾍﾞﾙ(39)："ＥＸＣＥＬ出力" %>
                <a href="P000M203.aspx?kbn=2" onclick="JavaScript:JSFL_P_EXCELPOP('0');"><b>
                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 39), w_style(0))%></b></a> </td>
            <td width="20" nowrap><br></td>
            <td nowrap>
                <div style="<%=w_disp%>">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <%    '*** ﾗﾍﾞﾙ(40)："ＥＸＣＥＬ出力（集計形式）" %>
                                <a href="javascript:JSFL_P_CHK();"><b>
                                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 40), w_style(0))%></b></a> </td>
                            <td width="5" nowrap><br></td>
                            <td>
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <%    '*** ﾗﾍﾞﾙ(41)："（" %>
                                        <td nowrap>
                                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 41), w_style(1))%></td>
                                        <td nowrap>
                                            <select id="droplen050" name="f0" size="0">
                                                <%
                                                    For icnt = 0 To UBound(w_list2, 2)
                                                        Response.Write("<OPTION value=""" & w_list2(0, icnt) & """ " & P000S001.FNCG_P_SELECTED(w_list2(0, icnt), w_syukei(0)) & ">" & w_list2(1, icnt) & "<BR>")
                                                    Next
                                                %>
                                            </select>
                                        </td>
                                        <%    '*** ﾗﾍﾞﾙ(42)："行" %>
                                        <td nowrap>
                                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 42), w_style(1))%></td>
                                        <td width="5" nowrap><br></td>
                                        <%    '*** ﾗﾍﾞﾙ(43)："×" %>
                                        <td nowrap>
                                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 43), w_style(1))%></td>
                                        <td width="5" nowrap><br></td>
                                        <td nowrap>
                                            <select id="droplen050" name="f1" size="0">
                                                <%
                                                    For icnt = 0 To UBound(w_list2, 2)
                                                        Response.Write("<OPTION value=""" & w_list2(0, icnt) & """ " & P000S001.FNCG_P_SELECTED(w_list2(0, icnt), w_syukei(1)) & ">" & w_list2(1, icnt) & "<BR>")
                                                    Next
                                                %>
                                            </select>
                                        </td>
                                        <%    '*** ﾗﾍﾞﾙ(44)："列）" %>
                                        <td nowrap>
                                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 44), w_style(1))%></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <%
                If w_kansys = "PB07" Then
            %>
            <td width="20" nowrap><br></td>
            <td nowrap>
                <%        '*** ﾗﾍﾞﾙ(45)："人員調べ" %>
                <a href="javascript:JSFL_P_JININ();"><b>
                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 45), "") %></b></a> </td>
            <%
            End If
            %>
        </tr>
    </table>
    <br>
    <%
        If keydata(24) = "1" Then
    %>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <%        '*** ﾗﾍﾞﾙ(46)："統計検索結果" %>
                        <td>
                            <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 46), "id=idbmidasi01") %></td>
                        <%
                            w_kflg1 = 0
                            w_kflg2 = ""
                            If w_gmode = "2" Then
                                '*** 採用
                                If SessionAsStrArray2D("SL_P000KENFLAG")(5, 2) = "0" AndAlso UBound(w_list, 2) > -1 Then
                                    Response.Write("<TD width=20 nowrap><BR></TD>")
                                    '*** ﾗﾍﾞﾙ(47)："機能"
                                    Response.Write("<TD nowrap>" & P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 47), "id=idsmidasi01") & "</TD>")
                                    Response.Write("<TD width=5 nowrap><BR></TD>")
                                    Response.Write("<TD nowrap>")
                                    Select Case SessionAsStrArray2D("SL_P000KENFLAG")(5, 2)
                                        Case "0"
                                            w_kflg1 = 1
                                            Response.Write("<SELECT name=""f2"" size=0>")
                                            For icnt = 0 To UBound(w_list, 2)
                                                Response.Write("<OPTION value=""" & w_list(0, icnt) & """ " & P000S001.FNCG_P_SELECTED(w_list(0, icnt), "") & ">" & w_list(1, icnt))
                                            Next
                                            Response.Write("</SELECT>")
                                        Case "1"
                                            w_kflg2 = "2"
                                            '*** ﾗﾍﾞﾙ(48)："応募者照会"
                                            Response.Write("<input readonly id=input01 name=""f2_disp"" type=""text"" size=""15"" value=""" & w_langmsg(0, 48) & """>")
                                        Case "2"
                                            w_kflg2 = "1"
                                            '*** ﾗﾍﾞﾙ(49)："応募者登録"
                                            Response.Write("<input readonly id=input01 name=""f2_disp"" type=""text"" size=""15"" value=""" & w_langmsg(0, 49) & """>")
                                    End Select
                                    Response.Write("</TD>")
                                End If
                            End If
                        %>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%
        If w_kflg1 = 0 Then
            Response.Write("<INPUT type=""hidden"" name=""f2"" value=""" & w_kflg2 & """>")
        End If
    %>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td height="10"></td>
        </tr>
        <tr>
            <td>
                <div style="width: 100%; height: 330; overflow: auto" border="0" class="P003M063_listdiv">
                    <table border="1" cellpadding="3" cellspacing="0" class="border">
                        <tr bgcolor="<%= SessionAsStrArray("SG_P_COLOR")(2) %>" class="borderheadertr">
                            <%
                                For ix = 0 To UBound(ary_02)
                                    Response.Write("<TD>" & P000S004.FNCG_P_FONT_TAG(Trim(ary_02(ix)), w_style(1)) & "<BR></TD>")
                                    If keydata(41) = "2" AndAlso ix = 0 AndAlso w_skcnt > 0 Then
                                        For ix2 = 0 To w_skcnt-1
                                            Response.Write("<TD>" & P000S004.FNCG_P_FONT_TAG(Trim(w_sk_array_na(ix2)), w_style(1)) & "<BR></TD>")
                                        Next
                                    End If
                                Next
                                '*** 補足項目表示
                                For w_i = 1 To w_hos_cnt
                                    Response.Write("<TD " & w_style(2) & ">" & P000S004.FNCG_P_FONT_TAG(w_hosoku(w_i - 1), w_style(1)) & "<BR></TD>")
                                Next
                                '*** 件数表示
                                '*** ﾗﾍﾞﾙ(50)："件数"
                                Response.Write("<TD " & w_style(2) & ">" & P000S004.FNCG_P_FONT_TAG(w_outlangmsg(0, 50), w_style(1)) & "<BR></TD>")
                                '*** 小計表示
                                For ix = 0 To UBound(w_kssum, 1)
                                    '*** ﾗﾍﾞﾙ(51)："小計" & ix + 1
                                    Response.Write("<TD " & w_style(2) & ">" & P000S004.FNCG_P_FONT_TAG(P000S008.FNCG_P_SUBWORD(1, w_outlangmsg(0, 51), CStr(ix + 1), ""), w_style(1)) & "<BR></TD>")
                                Next
                                '*** 社員出力
                                If keydata(17) = "1" Then
                                    '*** ﾗﾍﾞﾙ(52)：w_sname & "情報"
                                    Response.Write("<TD " & w_style(2) & ">" & P000S004.FNCG_P_FONT_TAG(P000S008.FNCG_P_SUBWORD(1, w_outlangmsg(0, 52), w_sname, ""), w_style(1)) & "<BR></TD>")
                                End If
                            %>
                        </tr>
                        <%
                            w_scnt = 0
                            w_data_kcnt = UBound(w_data, 1)
                            For icnt = 0 To UBound(w_data, 2)
                                Response.Write("<TR bgcolor=" & SessionAsStrArray("SG_P_COLOR")(8) & ">")
                                For ix = 0 To (w_kcnt - 1)
                                    If keydata(6) = "1" Then
                                        If w_scdtais(ix + 1) = "1" Then
                                            w_output = P000S001.FNCG_P_SCDFMT(w_data(ix, icnt)) & "(" & P000S001.FNCG_P_SCDFMT(w_data(ix + w_kcnt, icnt)) & ")"
                                        ElseIf w_unotais(ix + 1) = "1" Then
                                            w_output = P000S001.FNCG_P_UCDFMT(w_data(ix, icnt)) & "(" & P000S001.FNCG_P_UCDFMT(w_data(ix + w_kcnt, icnt)) & ")"
                                        ElseIf w_timetais((ix + 1)) = "1" Then
                                            w_output = P000S001.FNCG_P_NUM2TIME_MINUS(w_data(ix, icnt)) & "(" & P000S001.FNCG_P_NUM2TIME_MINUS(w_data(ix + w_kcnt, icnt)) & ")"
                                        ElseIf PE_ComVars.Instance.w_mmddtais(ix + 1) = "1" Then
                                            w_output = P000S001.FNCG_P_NUMTOMMDD(w_data(ix, icnt)) & "(" & P000S001.FNCG_P_NUMTOMMDD(w_data(ix + w_kcnt, icnt)) & ")"
                                        ElseIf w_jigyotais(ix + 1) = "1" OrElse w_jigyotais(ix + 1) = "2" Then
                                            w_output = w_data(ix, icnt) & "(" & FNCL_P_003M063_JIGYOCHK(w_jigyotais(ix + 1), w_data(ix + w_kcnt, icnt)) & ")"
                                        Else
                                            w_output = w_data(ix, icnt) & "(" & w_data(ix + w_kcnt, icnt) & ")"
                                        End If
                                    Else
                                        If w_scdtais(ix + 1) = "1" Then
                                            w_output = P000S001.FNCG_P_SCDFMT(w_data(ix, icnt))
                                        ElseIf w_unotais(ix + 1) = "1" Then
                                            w_output = P000S001.FNCG_P_UCDFMT(w_data(ix, icnt))
                                        ElseIf w_timetais(ix + 1) = "1" Then
                                            w_output = P000S001.FNCG_P_NUM2TIME_MINUS(w_data(ix, icnt))
                                        ElseIf PE_ComVars.Instance.w_mmddtais(ix + 1) = "1" Then
                                            w_output = P000S001.FNCG_P_NUMTOMMDD(w_data(ix, icnt))
                                        Else
                                            w_output = w_data(ix, icnt)
                                        End If
                                    End If
                                    Select Case w_tbrow(ix, icnt)
                                        Case "0"
                                        Case "1"
                                            Response.Write("<TD class=tdvalign>" & P000S004.FNCG_P_FONT_TAG(w_output, "") & "<BR></TD>")
                                        Case Else
                                            Response.Write("<TD class=tdvalign rowspan=" & w_tbrow(ix, icnt) & ">" & P000S004.FNCG_P_FONT_TAG(w_output, "") & "<BR></TD>")
                                    End Select
                                    If keydata(41) = "2" AndAlso ix = 0 AndAlso w_skcnt > 0 Then
                                        For ix2 = 0 To w_skcnt-1
                                            w_align = "left"
                                            If Cint(w_sk_array_id(ix2)) >= 130 AndAlso Cint(w_sk_array_id(ix2)) <= 149 Then
                                                w_align = "right"
                                            End If
                                            Select Case w_tbrow(ix, icnt)
                                                Case "0"
                                                Case "1"
                                                    Response.Write("<TD class=tdvalign align=" & w_align & ">" & P000S004.FNCG_P_FONT_TAG(w_data(w_data_kcnt - w_skcnt + ix2 + 1, icnt), "") & "<BR></TD>")
                                                Case Else
                                                    Response.Write("<TD class=tdvalign align=" & w_align & " rowspan=" & w_tbrow(ix, icnt) & ">" & P000S004.FNCG_P_FONT_TAG(w_data(w_data_kcnt - w_skcnt + ix2 + 1, icnt), "") & "<BR></TD>")
                                            End Select
                                        Next
                                    End If
                                Next
                                '*** 補足項目表示
                                For w_i = 1 To w_hos_cnt
                                    Response.Write("<TD align=right class=tdvalign>" & P000S004.FNCG_P_FONT_TAG(w_data(w_cid + w_i, icnt), "") & "<BR></TD>")
                                Next
                                '*** 合計表示
                                Response.Write("<TD align=right class=tdvalign>")
                                If (w_gmode = "1" AndAlso w_smode(0) = "1") OrElse w_gmode = "2" Then
                                    '*** 通常・採用のみ
                                    '***                    Response.Write "<A HREF=P003M064.aspx?" & w_qstring(icnt) & ">" & P000S004.FNCG_P_FONT_TAG(w_data(w_cid,icnt),"") & "<BR></TD>"
                                    If w_gmode = "2" Then
                                        '*** 採用
                                        If SessionAsStrArray2D("SL_P000KENFLAG")(5, 2) = "0" AndAlso UBound(w_list, 2) < 0 Then
                                            Response.Write(P000S004.FNCG_P_FONT_TAG(w_data(w_cid, icnt), "") & "<BR></TD>")
                                        Else
                                            If w_data(w_cid, icnt) = "0" Then
                                                Response.Write(P000S004.FNCG_P_FONT_TAG(w_data(w_cid, icnt), "") & "<BR></TD>")
                                            Else
                                                Response.Write("<A HREF=""javascript:JFSL_P_AHREF('" & P000S001.FNCG_P_JSESCAPE(w_qstring(icnt)) & "');"">" & P000S004.FNCG_P_FONT_TAG(w_data(w_cid, icnt), "") & "<BR></A></TD>")
                                            End If
                                        End If
                                    Else
                                        If w_data(w_cid, icnt) = "0" Then
                                            Response.Write(P000S004.FNCG_P_FONT_TAG(w_data(w_cid, icnt), "") & "<BR></TD>")
                                        Else
                                            Response.Write("<A HREF=""javascript:JFSL_P_AHREF('" & P000S001.FNCG_P_JSESCAPE(w_qstring(icnt)) & "');"">" & P000S004.FNCG_P_FONT_TAG(w_data(w_cid, icnt), "") & "<BR></A></TD>")
                                        End If
                                    End If
                                Else
                                    Response.Write(P000S004.FNCG_P_FONT_TAG(w_data(w_cid, icnt), "") & "<BR></TD>")
                                End If
                                '*** 小計表示
                                For iy = 0 To UBound(w_kssum, 1)
                                    Response.Write("<TD align=right class=tdvalign>" & P000S004.FNCG_P_FONT_TAG(CStr(w_kssum(iy, icnt)), "") & "<BR></TD>")
                                Next
                                '*** 社員出力
                                If keydata(17) = "1" Then
                                    Response.Write("<TD>")
                                    w_outcnt = 0
                                    ReDim w_outdata(CInt(w_data(w_cid, icnt)))
                                    If w_scnt <= w_smax Then
                                        Do
                                            w_flg = "0"
                                            For w_ccnt = 0 To UBound(w_sdata, 2)
                                                If CInt(w_sdata(UBound(w_sdata), w_ccnt)) = 0 Then
                                                    w_flg = "0"
                                                    For w_j = 0 To (w_kcnt - 1)
                                                        'If w_data(w_j + w_kcnt,icnt) <> w_sdata(w_j,w_scnt) Then
                                                        If P000S001.FNCG_P_NZ(w_data(w_j + w_kcnt, icnt)) <> P000S001.FNCG_P_NZ(w_sdata(w_j, w_ccnt)) Then
                                                            w_flg = "1"
                                                            Exit For
                                                        End If
                                                    Next
                                                    If w_flg = "0" Then
                                                        '*** マッチした場合
                                                        w_sdata(UBound(w_sdata), w_ccnt) = "1"
                                                        Exit For
                                                    End If
                                                End If
                                            Next
                                            If w_flg = "0" Then
                                                '*** マッチした場合
                                                w_soutdata = ""
                                                w_cnt = 0
                                                For w_k = w_kcnt To UBound(w_sdata, 1) - 1
                                                    If w_k = w_kcnt AndAlso Mid(keydata(18), 1, 1) = "1" Then
                                                        'w_soutdata = w_soutdata & " " & P000S001.FNCG_P_SCDFMT(w_sdata(w_k,w_scnt))
                                                        w_soutdata = w_soutdata & " " & P000S001.FNCG_P_SCDFMT(w_sdata(w_k, w_ccnt))
                                                    Else
                                                        If CInt(w_soutkid(w_k)) >= 3 AndAlso w_cnt = 0 Then
                                                            'w_soutdata = w_soutdata & "（" & w_sdata(w_k,w_scnt)
                                                            'w_cnt = 1
                                                            If Not IsNull(P000S001.FNCG_P_NZ(w_sdata(w_k, w_scnt))) Then
                                                                'w_soutdata = w_soutdata & "（" & w_sdata(w_k,w_scnt)
                                                                '*** ﾗﾍﾞﾙ(53)："（"
                                                                w_soutdata = w_soutdata & w_outlangmsg(0, 53) & w_sdata(w_k, w_ccnt)
                                                                w_cnt = 1
                                                            End If
                                                        Else
                                                            'w_soutdata = w_soutdata & " " & w_sdata(w_k,w_scnt)
                                                            w_soutdata = w_soutdata & " " & w_sdata(w_k, w_ccnt)
                                                        End If
                                                    End If
                                                Next
                                                If w_cnt = 1 Then
                                                    '*** ﾗﾍﾞﾙ(54)："）"
                                                    w_soutdata = w_soutdata & w_outlangmsg(0, 54)
                                                End If
                                                w_soutdata = Trim(w_soutdata)
                                                Response.Write(P000S004.FNCG_P_FONT_TAG(w_soutdata, "") & "<BR>")
                                                w_outcnt = w_outcnt + 1
                                                w_scnt = w_scnt + 1
                                                If w_scnt > w_smax Then
                                                    Exit Do
                                                End If
                                            Else
                                                Exit Do
                                            End If
                                        Loop
                                    End If
                                    If w_outcnt = 0 Then
                                        Response.Write("<BR>")
                                    End If
                                    Response.Write("</TD>")
                                End If
                                Response.Write("</TR>")
                            Next
                            '*** 合計表示
                            '*** ﾗﾍﾞﾙ(55)："【合計】"
                            Response.Write("<TR bgcolor=" & SessionAsStrArray("SG_P_COLOR")(8) & "><TD colspan=" & w_kcnt+w_skcnt & " align=center><B>" & P000S004.FNCG_P_FONT_TAG(w_outlangmsg(0, 55), "") & "</B><BR></TD>")
                            For w_i = 1 To w_hos_cnt
                                Response.Write("<TD><BR></TD>")
                            Next
                            If w_kcnt > 1 AndAlso keydata(5) = "1" Then
                                Response.Write("<TD colspan=" & w_kcnt+w_skcnt & " align=center><B>" & P000S004.FNCG_P_FONT_TAG(CStr(w_sumcnt), "") & "</B><BR></TD>")
                            Else
                                Response.Write("<TD align=center><B>" & P000S004.FNCG_P_FONT_TAG(CStr(w_sumcnt), "") & "</B><BR></TD>")
                            End If
                            '*** 社員出力
                            If keydata(17) = "1" Then
                                Response.Write("<TD><BR></TD>")
                            End If
                            Response.Write("</TR>")
                        %>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <%
    Else
    %>
    <center>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="100"></td>
            </tr>
            <tr>
                <%        '*** ﾗﾍﾞﾙ(56)："外部出力ファイルを作成しました。" %>
                <td>
                    <%= P000S004.FNCG_P_FONT_TAG(w_langmsg(0, 56), "id=idsmidasi01") %></td>
            </tr>
        </table>
    </center>
    <%
    End If
    %>
    <input type="hidden" name="h_kensuu" value="<%= P000S001.FNCG_P_HTMLENCODE(keydata(1)) %>">
    </form>
</body>
</html>
<%
    '*** 処理言語をリセット
    P000S009.SUBG_P_MULTI_LANG_JUDGE(8, "1", "", "", "", "", "")
    '*** 配列変数の開放
    If IsArray(w_langmsg) Then
        Erase w_langmsg
    End If
    If IsArray(w_outlangmsg) Then
        Erase w_outlangmsg
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
    Dim w_kssum(,) As String
    Dim w_nowcnt() As Integer
    Dim w_tbrow(,) As String
    Dim w_scdtais() As String
    Dim w_unotais() As String
    Dim w_timetais() As String
    Dim w_syozktais() As String
    Dim w_jigyotais() As String
    Dim w_outdata() As String
    Dim sql As String     '*** sql
    Dim DBOBJ As OraDatabase     '*** データベースオブジェクト
    Dim w_orapara(,) As String
    Dim icnt As Integer     '*** Counter
    Dim ix As Integer     '*** Counter
    Dim ix2 As Integer     '*** Counter
    Dim iy As Integer     '*** Counter
    Dim iz As Integer     '*** Counter
    Dim w_i As Integer
    Dim w_j As Integer
    Dim w_j_array() As String
    Dim w_k As Integer
    Dim w_k_array() As String
    Dim w_data(,) As String     '*** 結果データ(配列)
    '*** 選択数=1(0:名称,1:コード,2:件数,3:補足)
    '*** 選択数=2(0～1:名称,2～3:コード,4:件数,5:補足)
    '*** 選択数=3(0～2:名称,3～5:コード,6:件数,7:補足)
    '*** 選択数=4(0～3:名称,4～7:コード,8:件数,9:補足)
    Dim w_sdata(,) As String     '*** 社員データ
    Dim w_soutdata As String     '*** 社員出力データ
    Dim w_soutkid() As String     '*** 出力項目
    Dim w_scnt As Integer
    Dim w_smax As Integer
    Dim w_cnt As Integer
    Dim w_flg As String
    Dim w_outcnt As Integer
    Dim w_linecnt() As Integer
    Dim w_linefmt() As String
    Dim w_datafmt1 As String     '*** EXCEL出力表示書式
    Dim w_datafmt2 As String     '*** PIVOT出力表示書式
    Dim w_hos_cnt As Integer     '*** 補足件数
    Dim w_qstring() As String     '*** アンカー用のパラメータセット(配列)
    Dim keydata() As String     '*** Key Data    : Session("SL_P003M061_KEY")
    Dim ary_01() As String     '*** 配列    1: コード：カテゴリ区分 "-" 項目順
    Dim ary_02() As String     '*** 配列    2: 名称  ：カテゴリ名称 "（" 項目名称 "）"
    Dim ary_03() As String     '*** 統計検索区分配列"
    Dim w_kcnt As Integer     '*** 選択項目件数
    Dim w_cid As Integer     '*** 件数項目の配列ＩＤ
    Dim w_sumcnt As Integer     '*** 合計件数
    Dim w_output As String     '*** 出力内容
    Dim w_hosoku() As String     '*** 補足項目文字列
    Dim FileObject As FileSystemObject     '*** CSV  FileObject
    Dim OutStream As TextStream     '*** CSV  OutStream
    Dim Filename As String     '*** CSV  Filename
    Dim writeBuff As String     '*** CSV  writeBuff
    Dim writeBuff2 As String     '*** CSV  writeBuff
    Dim writeBuff3 As String     '*** CSV  writeBuff
    Dim w_asp As String     '*** 遷移元URL
    Dim w_syukei() As String     '*** 集計項目値の行列分割用（配列）
    Dim w_list2(,) As String     '*** 集計項目リスト
    Dim w_tkkbn As String     '*** 統計区分
    Dim w_srtcnt1 As String
    Dim w_srtcnt2 As String
    Dim w_keisan() As String     '*** 計算単位
    Dim w_sname As String     '*** 人名称
    Dim w_list(,) As String     '*** 採用時遷移先リスト
    Dim w_gmode As String     '*** 1=通常・2=採用
    Dim w_smode() As String     '*** 機能ﾓｰﾄﾞ詳細
    Dim w_kflg1 As Integer     '*** 採用管理の機能選択リスト表示制御
    Dim w_kflg2 As String     '*** 採用管理の機能選択値
    Dim vntErrText As String
    Dim w_hflg As Integer
    Dim w_ctdata(,) As String
    Dim w_busyo(,) As String     '*** 部署情報(PB07)
    Dim w_kansys As String     '*** 環境設定（SYS）
    Dim w_jflg As Integer     '*** 事業所選択時表示順で並び替え(0):しない・(1):する
    Dim w_dbdata(,) As String     '*** データ取得用
    Dim w_kensaku As String     '*** 検索設定
    Dim w_ccnt As Integer     '*** カウント
    Dim w_logmsg As String     '*** 監査ログ：条件
    Dim w_logkname() As String     '*** 監査ログ：カテゴリ名称
    Dim w_logsort() As String     '*** 監査ログ：表示順
    Dim w_logcname() As String     '*** 監査ログ：項目名称
    Dim w_logcnt As Integer     '*** 監査ログ：データ件数
    Dim w_logkkbn As String     '*** 監査ログ：機能区分
    Dim w_logsyrno As String     '*** 監査ログ：処理番号
    Dim w_langmsg(,) As String     '*** 文言情報取得用(表示言語)
    Dim w_outlangmsg(,) As String     '*** 文言情報取得用(出力言語)
    Dim w_lang_noregist As String     '*** 文言情報  【未登録】
    Dim w_split() As String     '*** Split分割データ
    Dim w_hosoku_cd() As String     '*** 補足情報(コード):配列情報
    Dim w_langid As String     '*** 表示言語ＩＤ
    Dim w_style(2) As String     '*** 項目スタイル制御
    Dim w_ftype As String       '*** 表示書式
    Dim w_skcnt As Integer       '*** 組織項目件数
    Dim w_sk_array_id() As String '*** 組織項目ＩＤ
    Dim w_sk_array_na() As String '*** 組織項目名称
    Dim w_data_kcnt As Integer    '*** w_data項目件数
    Dim w_langmsg2(,) As String    '*** 文言情報取得用(統計検索設定画面)
    Dim w_orgID As String          '*** 組織ID
    Dim w_keniti As Integer '*** 件数項目位置
    Dim w_align As String    '*** 文字位置
    Dim w_disp As String    '*** 画面項目表示フラグ(ＥＸＣＥＬ出力集計形式)
    '******************************************************************************
    '**        FNCL_P_VP0030630    :    リスト作成用ＳＱＬ項目情報を抽出する
    '******************************************************************************
    Function FNCL_P_VP0030630(ByRef p_data(,) As String, ByRef p_kcnt As Integer) As Boolean
        Dim w_work As String
        Dim w_iti As Integer
        Dim w_sortcnt() As String
        Dim w_sortflg As Integer
        Dim w_kcnt2 As Integer
        
        w_keniti = -1
        '*** 各項目毎のソート項目数
        sql = "SELECT "
        For ix = 1 To p_kcnt
            If ix > 1 Then
                sql = sql & ","
            End If
            sql = sql & " F" & P000S001.FNCG_P_ZEROCD(CStr(ix), 3)
            w_keniti = w_keniti + 1
        Next
        For ix = 1 To p_kcnt
            sql = sql & ",K" & P000S001.FNCG_P_ZEROCD(CStr(ix), 3)
            w_keniti = w_keniti + 1
        Next
        sql = sql & ",C001"
        w_keniti = w_keniti + 1
        For ix = 1 To w_hos_cnt
            sql = sql & ",H" & P000S001.FNCG_P_ZEROCD(CStr(ix), 3)
        Next
        w_sortcnt = VBSplit(keydata(29), P0030000.CUSTOM_LINE_SEPARATOR2, -1, 0)
        w_sortflg = 0
        For ix = 0 To UBound(w_sortcnt)
            w_sortcnt(ix) = CStr(w_sortflg + CInt(w_sortcnt(ix)))
            w_sortflg = CInt(w_sortcnt(ix))
        Next
        If keydata(41) = "2" Then
            w_kcnt2 = p_kcnt - 1
        Else
            w_kcnt2 = p_kcnt
        End If
        For ix = w_kcnt2 To 1 Step -1
            If FNCL_P_003M063_SYOZKCHK(CStr(ix)) = 1 Then
                sql = sql & ",TO_CHAR(S" & P000S001.FNCG_P_ZEROCD(w_sortcnt(ix - 1), 3) & ",'FM00000')"
            Else
                If w_jflg = 1 Then
                    '*** 事業所の場合、表示順を先頭に付与
                    If FNCL_P_003M063_JIGYOCHK("0", CStr(ix)) = "1" Then
                        '*** 複数会社有りは会社コードを先頭に付与
                        If FNCL_P_KAISYACNTCHK(w_sortcnt(ix - 1)) - 1 = 1 Then
                            sql = sql & ",TO_CHAR(S" & P000S001.FNCG_P_ZEROCD(w_sortcnt(ix - 1 - 1), 3) & ",'FM00000000') || '" & P0030000.CUSTOM_LINE_SEPARATOR2 & "' || TO_CHAR(S" & P000S001.FNCG_P_ZEROCD(w_sortcnt(ix - 1), 3) & ",'FM00000000')"
                        Else
                            sql = sql & ",TO_CHAR(S" & P000S001.FNCG_P_ZEROCD(w_sortcnt(ix - 1), 3) & ",'FM00000000')"
                        End If
                        '*** カテゴリ(保険)-事業所名
                    ElseIf FNCL_P_003M063_JIGYOCHK("0", CStr(ix)) = "2" Then
                        If FNCL_P_KAISYACNTCHK(w_sortcnt(ix - 1)) - 1 = 1 Then
                            sql = sql & ",TO_CHAR(S" & P000S001.FNCG_P_ZEROCD(CStr(CInt(w_sortcnt(ix - 1)) - 1), 3) & ",'FM00000000') || '" & P0030000.CUSTOM_LINE_SEPARATOR2 & "' || TO_CHAR(S" & P000S001.FNCG_P_ZEROCD(w_sortcnt(ix - 1), 3) & ",'FM00000000')"
                        Else
                            sql = sql & ",TO_CHAR(S" & P000S001.FNCG_P_ZEROCD(w_sortcnt(ix - 1), 3) & ",'FM00000000')"
                        End If
                    Else
                        sql = sql & ",1"
                    End If
                Else
                    sql = sql & ",1"
                End If
            End If
        Next
        '*** 組織項目
        For ix = 1 To w_skcnt
            sql = sql & ",B" & P000S001.FNCG_P_ZEROCD(CStr(ix), 3)
        Next
        sql = sql & " FROM  " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0030630_" & SessionAsStr("SG_P_RID") & " "
        If CInt(keydata(21)) > 0 Then
            sql = sql & " ORDER BY "
            For ix = 1 To CInt(keydata(21))
                If ix > 1 Then
                    sql = sql & ","
                End If
                sql = sql & " S" & P000S001.FNCG_P_ZEROCD(CStr(ix), 3)
            Next
        End If
        If P000S011.FNCG_P_RECORDSET1(0, sql, p_data) Then
            FNCL_P_VP0030630 = True
            '*** 補足情報の平均の場合の切上げ処理
            If w_hos_cnt > 0 Then
                w_k_array = VBSplit(keydata(12), ",", -1, 0)
                For w_i = 1 To w_hos_cnt
                    If w_k_array(w_i - 1) = "4" Then
                        For icnt = 0 To UBound(p_data, 2)
                            w_work = p_data(w_cid + w_i, icnt)
                            If Not IsNull(P000S001.FNCG_P_NZ(w_work)) Then
                                w_iti = InStr(1, w_work, ".", 0)
                                If w_iti > 0 Then
                                    p_data(w_cid + w_i, icnt) = Mid(w_work, 1, w_iti + 1)
                                Else
                                    p_data(w_cid + w_i, icnt) = w_work & ".0"
                                End If
                            End If
                        Next
                    End If
                Next
            End If
            '*** 名称データの変換処理
            For icnt = 0 To UBound(p_data, 2)
                For ix = Cint(keydata(41)) To p_kcnt
                    '*** 計算単位の変換処理
                    If Not IsNull(P000S001.FNCG_P_NZ(w_keisan(ix - 1))) Then
                        If IsNull(P000S001.FNCG_P_NZ(p_data(p_kcnt - 1 + ix, icnt))) Then
                            '*** 【未登録】判断
                            If p_data(w_keniti, icnt) = "0" Then
                                p_data(ix - 1, icnt) = "-"
                            Else
                                p_data(ix - 1, icnt) = w_lang_noregist
                            End If
                        Else
                            '*** ﾗﾍﾞﾙ(58)："～"
                            p_data(ix - 1, icnt) = CInt(p_data(ix - 1, icnt)) * CInt(w_keisan(CInt(ix - 1))) & w_outlangmsg(0, 58) & (CInt(p_data(ix - 1, icnt)) + 1) * CInt(w_keisan(CInt(ix - 1))) - 1
                        End If
                    Else
                        '*** NULLデータの未登録文字セット
                        If IsNull(P000S001.FNCG_P_NZ(p_data(ix - 1, icnt))) Then
                            If IsNull(P000S001.FNCG_P_NZ(p_data(p_kcnt - 1 + ix, icnt))) OrElse P000S001.FNCG_P_NZ(p_data(p_kcnt - 1 + ix, icnt)) = P0030000.CUSTOM_LINE_SEPARATOR2 Then
                                '*** 【未登録】判断
                                If p_data(w_keniti, icnt) = "0" Then
                                    p_data(ix - 1, icnt) = "-"
                                Else
                                    p_data(ix - 1, icnt) = w_lang_noregist
                                End If
                            Else
                                '*** ﾗﾍﾞﾙ(60)："【マスター未存在(" & p_data(p_kcnt -1 + ix,icnt) & ")】"
                                p_data(ix - 1, icnt) = P000S008.FNCG_P_SUBWORD(1, w_outlangmsg(0, 60), p_data(p_kcnt - 1 + ix, icnt), "")
                            End If
                        End If
                    End If
                Next
            Next
        Else
            FNCL_P_VP0030630 = False
        End If
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_MAKE_SQL
    '*  処理：統計結果用VIEW作成
    '*  内容：SP実行
    '*  備考：
    '*  引数：[I] p_refkbn -- 登録権限
    '*       ：[I] p_kskbn  -- 絞込検索区分
    '*       ：[O] p_tkkbn  -- 統計検索区分
    '*       ：[O] p_srtcnt1 -- ソート件数
    '*       ：[O] p_srtcnt2 -- ソート項目毎件数(-区切り)
    '*       ：[R] 0:正常,1:エラー
    '**********************************************************************
    Function FNCL_P_MAKEVIEW(ByRef p_id As String, ByRef p_refkbn As String, ByRef p_kskbn As String, ByRef p_tkkbn As String, ByRef p_srtcnt1 As String, ByRef p_srtcnt2 As String) As Integer
        
        If P003S001.FNCG_P_ALLKENSAKUREF() = -1 Then
            Return 1
        End If
        
        Dim w_err As Integer
        Dim w_tkkbn As OraParameter
        Dim w_srtcnt1 As OraParameter
        Dim w_srtcnt2 As OraParameter
        Dim w_idou() As String
        FNCL_P_MAKEVIEW = 0
        '**********************************************************************
        '*    統計データ取得処理
        '**********************************************************************
        P000S011.SUBG_P_ORAPDEL(DBOBJ, "ORA_TKKBN,ORA_SRTCNT1,ORA_SRTCNT2")
        DBOBJ.Parameters.Add("ORA_SRTCNT1", "0", OraConst.ORAPARM_OUTPUT)
        DBOBJ.Parameters.Add("ORA_SRTCNT2", "0", OraConst.ORAPARM_OUTPUT)
        DBOBJ.Parameters.Add("ORA_TKKBN", "0", OraConst.ORAPARM_OUTPUT)
        w_srtcnt1 = DirectCast(DBOBJ.Parameters("ORA_SRTCNT1"), OraParameter)
        w_srtcnt2 = DirectCast(DBOBJ.Parameters("ORA_SRTCNT2"), OraParameter)
        w_tkkbn = DirectCast(DBOBJ.Parameters("ORA_TKKBN"), OraParameter)
        Select Case w_gmode
            Case "1"
                '*** 通常
                sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP0030620_S("
                '* 1:絞込なし、2:絞込あり
                sql = sql & " :ORA_0"
                '* 会社コード
                sql = sql & ",:ORA_1"
                '* 会社コード(ログイン) 
                sql = sql & ",:ORA_2"
                '* 0:優先フラグ参照しない,1:優先フラグ参照する
                sql = sql & ",:ORA_3"
                '* 1:列項目取得、2:行項目取得、3:社員取得、4:通常処理
                sql = sql & ",:ORA_4"
                '* マスター項目の表示(1:データ存在分のみ,2:全て)
                sql = sql & ",:ORA_26"
                '* 表示方法(1:人事情報を軸とする,2:部署情報を軸とする)
                sql = sql & ",:ORA_27"
                '* 組織対象組織(1:人事,2:給与,11～15:予備組織)
                sql = sql & ",:ORA_28"
                '* 組織表示方法(対象部署(1:全て,2:特定部署(下位部門を含む),3:特定部署(下位部門を含まない)))
                sql = sql & ",:ORA_29"
                '* 組織兼務設定(0:兼務考慮しない,1:兼務考慮する)
                sql = sql & ",:ORA_30"
                '* 基準日
                sql = sql & ",:ORA_5"
                '* 基準年度期区分
                sql = sql & ",:ORA_6"
                '* 1:在籍者,2:全社員,3:退職者
                sql = sql & ",:ORA_7"
                '* 在退職判断日(1:今日,2:基準日)
                sql = sql & ",:ORA_8"
                '* 入社年月日を考慮(0:しない,1:する)
                sql = sql & ",:ORA_9"
                '* 社員表示項目
                sql = sql & ",:ORA_10"
                '* 社員表示順 
                sql = sql & ",:ORA_11"
                '* 社員基準日
                sql = sql & ",:ORA_12"
                '* 1:照会,2:登録
                sql = sql & ",:ORA_13"
                '* 照会権限(0:全社員,>0:特定社員)
                sql = sql & ",:ORA_14"
                '* 登録権限(0:全社員,>0:特定社員(照会同一),<0:特定社員(登録区別))
                sql = sql & ",:ORA_15"
                '* 権限コード 
                sql = sql & ",:ORA_16"
                '* 出力言語ＩＤ
                sql = sql & ",:ORA_21"
                '* 氏名出力区分
                sql = sql & ",:ORA_22"
                '* ログインＩＤ
                sql = sql & ",:ORA_17"
                '* 利用者ＩＤ
                sql = sql & ",:ORA_18"
                '* 異動ID,考課パターン,処理ＩＤ
                sql = sql & ",:ORA_19"
                '* 異動日付,考課時期,案ＩＤ 
                sql = sql & ",:ORA_20"
                '* 検索モード(1:自社検索,2:全社参照検索) 
                sql = sql & ",:ORA_23"
                '* 全社参照絞込み(0:無,1:有) 
                sql = sql & ",:ORA_24"
                '* 他機能連携区分(0:無,1:有)
                sql = sql & ",:ORA_25"
                '* ソート項目件数
                sql = sql & ",:ORA_SRTCNT1"
                '* ソート項目毎件数(-区切り) 
                sql = sql & ",:ORA_SRTCNT2"
                '* 統計検索タイプ(-区切り)
                sql = sql & ",:ORA_TKKBN"
                '* エラー区分(0:正常,-1:エラー)
                sql = sql & ",:ORA_ERR); END;"
                ReDim w_orapara(3, 30)
                If p_kskbn = "0" Then
                    w_orapara(0, 0) = "1"
                Else
                    w_orapara(0, 0) = "2"
                End If
                w_orapara(1, 0) = "2"
                w_orapara(0, 1) = SessionAsStr("SG_P_KAISYA_SELECT")
                w_orapara(1, 1) = "101"
                w_orapara(0, 2) = SessionAsStr("SG_P_KAISYA")
                w_orapara(1, 2) = "101"
                w_orapara(0, 3) = SessionAsStrArray2D("SL_P000KENFLAG")(0, 4)
                w_orapara(1, 3) = "2"
                w_orapara(0, 4) = p_id
                w_orapara(1, 4) = "2"
                w_orapara(0, 5) = SessionAsStrArray("SG_P_003INF")(8)
                w_orapara(1, 5) = "1"
                w_orapara(0, 6) = SessionAsStrArray("SG_P_003INF")(9)
                w_orapara(1, 6) = "1"
                w_orapara(0, 7) = SessionAsStrArray("SG_P_003INF")(0)
                w_orapara(1, 7) = "2"
                w_orapara(0, 8) = SessionAsStrArray("SG_P_003INF")(10)
                w_orapara(1, 8) = "1"
                w_orapara(0, 9) = SessionAsStrArray("SG_P_003INF")(11)
                w_orapara(1, 9) = "1"
                w_orapara(0, 10) = keydata(18)
                w_orapara(1, 10) = "1"
                w_orapara(0, 11) = keydata(19)
                w_orapara(1, 11) = "1"
                w_orapara(0, 12) = keydata(20)
                w_orapara(1, 12) = "1"
                w_orapara(0, 13) = SessionAsStrArray("SG_P_REFKBN")(4)
                w_orapara(1, 13) = "2"
                If SessionAsStrArray("SG_P_ALLKENGEN")(2) = "1" Then
                    w_orapara(0, 14) = SessionAsStrArray("SG_P_REFKBN")(2)
                Else
                    w_orapara(0, 14) = SessionAsStrArray("SG_P_ALLKENGEN")(4)
                End If
                w_orapara(1, 14) = "2"
                w_orapara(0, 15) = p_refkbn
                w_orapara(1, 15) = "2"
                w_orapara(0, 16) = SessionAsStrArray("SG_P_SYAIN")(5)
                w_orapara(1, 16) = "2"
                w_orapara(0, 17) = SessionAsStr("SG_P_SID")
                w_orapara(1, 17) = "0"
                w_orapara(0, 18) = SessionAsStr("SG_P_RID")
                w_orapara(1, 18) = "2"
                Select Case w_smode(0)
                    Case "1"
                        '*** 【通常】
                        w_orapara(0, 19) = ""
                        w_orapara(0, 20) = ""
                    Case "2"
                        '*** 【異動・昇格】
                        w_idou = SessionAsStrArray("SL_P300_INF01")
                        '*** SL_300-2_001 P300M017.aspxを参照
                        w_orapara(0, 19) = w_idou(1) & "," & w_idou(2) & "," & w_idou(3)
                        w_orapara(0, 20) = w_idou(14)
                    Case "3"
                        '*** 【考課】
                        w_idou = SessionAsStrArray("SL_P200_INF01")
                        '*** SL_200-1_009
                        '(0):考課パターン
                        '(1):考課時期
                        '(3):昇級時期
                        w_orapara(0, 19) = w_idou(0)
                        '*** 考課パターン
                        w_orapara(0, 20) = w_idou(1)
                        '*** 考課時期
                    Case "5"
                        '*** 【異動線】
                        w_orapara(0, 19) = SessionAsStrArray("SL_P301_INF01")(1)
                        '*** SL_301-2_001 P301M001.aspxを参照
                        w_orapara(0, 20) = SessionAsStrArray("SL_P301_INF02")(1)
                        '*** SL_301-2_001 P301M131.aspxを参照
                End Select
                w_orapara(1, 19) = "1"
                w_orapara(1, 20) = "1"
                w_orapara(0, 21) = keydata(31)
                w_orapara(1, 21) = "2"
                w_orapara(0, 22) = keydata(32)
                w_orapara(1, 22) = "1"
                
                w_orapara(0, 23) = SessionAsStrArray("SG_P_ALLKENGEN")(2)
                w_orapara(1, 23) = CStr(OraConst.ORATYPE_NUMBER)
                If SessionAsStrArray2D("SG_P_COMFLAG")(5, 0) = "0" OrElse _
                  (SessionAsStrArray2D("SG_P_COMFLAG")(5, 0) = "1" AndAlso SessionAsStrArray2D("SG_P_COMFLAG")(5, 1) = "1") Then
                    w_orapara(0, 24) = SessionAsStrArray("SG_P_ALLKENGEN")(6)
                Else
                    w_orapara(0, 24) = "0"
                End If
                w_orapara(1, 24) = "2"
                If SessionAsStrArray2D("SG_P_COMFLAG")(5, 0) = "1" AndAlso SessionAsStrArray2D("SG_P_COMFLAG")(5, 2) = "1" Then
                    w_orapara(0, 25) = "1"
                Else
                    w_orapara(0, 25) = "0"
                End If
                w_orapara(1, 25) = "2"
                w_orapara(0, 26) = keydata(45)
                w_orapara(1, 26) = "1"
                w_orapara(0, 27) = keydata(41)
                w_orapara(1, 27) = "1"
                w_orapara(0, 28) = keydata(42)
                w_orapara(1, 28) = "2"
                w_orapara(0, 29) = keydata(43)
                w_orapara(1, 29) = "1"
                w_orapara(0, 30) = keydata(44)
                w_orapara(1, 30) = "1"
                
            Case "2"
                '*** 採用
                sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP4000240_S("
                sql = sql & " :ORA_0"
                '***
                sql = sql & ",:ORA_1"
                '***
                sql = sql & ",:ORA_2"
                '***
                sql = sql & ",:ORA_3"
                '*** 年度
                sql = sql & ",:ORA_4"
                '*** 基準日
                sql = sql & ",:ORA_5"
                '***
                sql = sql & ",:ORA_6"
                '***
                sql = sql & ",:ORA_7"
                '***
                sql = sql & ",:ORA_8"
                '***
                sql = sql & ",:ORA_9"
                '***
                sql = sql & ",:ORA_10"
                '***
                sql = sql & ",:ORA_SRTCNT1"
                '***
                sql = sql & ",:ORA_SRTCNT2"
                '***
                sql = sql & ",:ORA_TKKBN"
                '***
                sql = sql & ",:ORA_ERR); END;"
                ReDim w_orapara(3, 10)
                If p_kskbn = "0" Then
                    w_orapara(0, 0) = "1"
                Else
                    w_orapara(0, 0) = "2"
                End If
                w_orapara(1, 0) = "2"
                w_orapara(0, 1) = SessionAsStr("SG_P_KAISYA_SELECT")
                w_orapara(1, 1) = "101"
                w_orapara(0, 2) = p_id
                w_orapara(1, 2) = "2"
                w_orapara(0, 3) = SessionAsStrArray2D("SL_P000KENFLAG")(5, 0)
                w_orapara(1, 3) = "1"
                w_orapara(0, 4) = SessionAsStrArray2D("SL_P000KENFLAG")(5, 3)
                w_orapara(1, 4) = "1"
                w_orapara(0, 5) = keydata(18)
                w_orapara(1, 5) = "1"
                w_orapara(0, 6) = keydata(19)
                w_orapara(1, 6) = "1"
                w_orapara(0, 7) = keydata(20)
                w_orapara(1, 7) = "1"
                w_orapara(0, 8) = SessionAsStrArray("SG_P_400COM")(3)
                w_orapara(1, 8) = "2"
                w_orapara(0, 9) = SessionAsStr("SG_P_SID")
                w_orapara(1, 9) = "0"
                w_orapara(0, 10) = SessionAsStr("SG_P_RID")
                w_orapara(1, 10) = "2"
        End Select
        If P000S011.FNCG_P_SPEXECUTE1(1, sql, w_orapara, w_err, "") = False Then
        End If
        If w_err < 0 Then
            '*** ﾗﾍﾞﾙ(61)："統計処理でエラーが発生しました。(ASPOBJ=P003M063 ORAOBJ=WEB_SP0030620_S ID=1)<BR>"
            vntErrText = w_langmsg(0, 61)
            FNCL_P_MAKEVIEW = 1
        Else If w_err = 1 Then
            '*** ﾗﾍﾞﾙ(63)："出力結果の上限を超過したため表示できません。<BR>"
            vntErrText = w_langmsg(0, 63)
            FNCL_P_MAKEVIEW = 1
        End If
        p_tkkbn = CStr(w_tkkbn.Value)
        p_srtcnt1 = CStr(w_srtcnt1.Value)
        p_srtcnt2 = CStr(w_srtcnt2.Value)
        w_srtcnt1 = Nothing
        w_srtcnt2 = Nothing
        w_tkkbn = Nothing
        P000S011.SUBG_P_ORAPDEL(DBOBJ, "ORA_TKKBN,ORA_SRTCNT1,ORA_SRTCNT2")
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_003M063_SYOZKCHK
    '*  処理：所属名称１～ｘ対象チェック
    '*  内容：
    '*  備考：
    '*  引数：[I] p_id -- 選択順
    '*       ：[R] 0:無,1:有
    '**********************************************************************
    Function FNCL_P_003M063_SYOZKCHK(ByRef p_id As String) As Integer
        Dim w_sql_s As String
        Dim w_dbdata(,) As String = Nothing

        If keydata(41) = "2" AndAlso p_id = "1" Then
            FNCL_P_003M063_SYOZKCHK = 0
        Else
            w_sql_s = "SELECT B.DISP_FORMAT"
            w_sql_s = w_sql_s & " FROM WEB_TP0030140_W A"
            If w_gmode = "1" Then
                w_sql_s = w_sql_s & "     ,WEB_TP0010020_M B"
            Else
                w_sql_s = w_sql_s & "     ,WEB_TP4000120_M B"
            End If
            w_sql_s = w_sql_s & " WHERE A.CUSTOMER_ID=:ORA_0"
            w_sql_s = w_sql_s & "   AND A.SELECT_ORDER=:ORA_1"
            w_sql_s = w_sql_s & "   AND A.CATEGORY_DIV=B.CATEGORY_DIV"
            w_sql_s = w_sql_s & "   AND A.ITEM_ORDER=B.ITEM_ORDER"
            ReDim w_orapara(2, 1)
            w_orapara(0, 0) = SessionAsStr("SG_P_RID")
            w_orapara(1, 0) = "2"
            If keydata(41) = "1" Then
                w_orapara(0, 1) = p_id
            Else
                w_orapara(0, 1) = Cstr(Cint(p_id) - 1)
            End If
            w_orapara(1, 1) = "2"
            If P000S011.FNCG_P_RECORDSET5(1, w_sql_s, w_orapara, w_dbdata) = False Then
                ReDim w_dbdata(0, 0)
                w_dbdata(0, 0) = "0"
            End If
            Select Case Mid(w_dbdata(0, 0), 1, 1)
                Case "F", "G", "I", "J", "M", "N"
                    FNCL_P_003M063_SYOZKCHK = 1
                Case Else
                    FNCL_P_003M063_SYOZKCHK = 0
            End Select
        End If
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_003M063_JIGYOCHK
    '*  処理：事業所コードチェック
    '*  内容：
    '*  備考：
    '*  引数：[I] p_skbn -- 0:事業所コードチェック,1:事業所コード取得(MSTID=202),2:事業所コード取得(MSTID=209)
    '*      ：[I] p_id   -- 選択順
    '*      ：[R] p_skbn=0の場合   → 0:無,1:有(事業所マスタ),2:有(事業所マスタ-給与専用)
    '*            p_skbn=1,2の場合 → 事業所コード
    '**********************************************************************
    Function FNCL_P_003M063_JIGYOCHK(ByRef p_skbn As String, ByRef p_id As String) As String
        Dim w_sql_s As String
        Dim w_dbdata(,) As String = Nothing
        If p_skbn = "0" Then
            If keydata(41) = "2" AndAlso p_id = "1" Then
                FNCL_P_003M063_JIGYOCHK = "0"
            Else
                w_sql_s = "SELECT C.MASTER_ID"
                w_sql_s = w_sql_s & " FROM WEB_TP0030140_W A"
                If w_gmode = "1" Then
                    w_sql_s = w_sql_s & "     ,WEB_TP0010020_M B,WEB_TP0000020_M C"
                Else
                    w_sql_s = w_sql_s & "     ,WEB_TP4000120_M B,WEB_TP4000020_M C"
                End If
                w_sql_s = w_sql_s & " WHERE A.CUSTOMER_ID= :ORA_0"
                w_sql_s = w_sql_s & "   AND A.SELECT_ORDER= :ORA_1"
                w_sql_s = w_sql_s & "   AND A.CATEGORY_DIV=B.CATEGORY_DIV"
                w_sql_s = w_sql_s & "   AND A.ITEM_ORDER=B.ITEM_ORDER"
                w_sql_s = w_sql_s & "   AND B.DIV=C.DIV"
                w_sql_s = w_sql_s & "   AND B.ITEM_NAME=C.ITEM_NAME"
                ReDim w_orapara(2, 1)
                w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                w_orapara(1, 0) = "2"
                If keydata(41) = "1" Then
                    w_orapara(0, 1) = p_id
                Else
                    w_orapara(0, 1) = Cstr(Cint(p_id) - 1)
                End If
                w_orapara(1, 1) = "2"
                If P000S011.FNCG_P_RECORDSET5(1, w_sql_s, w_orapara, w_dbdata) = False Then
                    ReDim w_dbdata(0, 0)
                    w_dbdata(0, 0) = "0"
                End If
                Select Case w_dbdata(0, 0)
                    Case "202"
                        FNCL_P_003M063_JIGYOCHK = "1"
                    Case "209"
                        FNCL_P_003M063_JIGYOCHK = "2"
                    Case Else
                        FNCL_P_003M063_JIGYOCHK = "0"
                End Select
            End If
        Else
            If SessionAsStrArray("SG_P_ENVIR_001")(95) = "2" Then
                '*** 事業所マスターのコード
                w_sql_s = "SELECT A.OFFICE_CODE"
                w_sql_s = w_sql_s & " FROM " & SessionAsStr("SG_C_DBUSER1") & "OFFICE_MS A"
                w_sql_s = w_sql_s & " WHERE A.INTERNAL_ASSIGN_CODE = :ORA_0"
                ReDim w_orapara(2, 0)
                If p_skbn = "1" Then
                    '*** 内部割振コード
                    w_orapara(0, 0) = p_id
                Else
                    '*** 会社コード + 内部割振コード
                    w_orapara(0, 0) = VBSplit(p_id, P0030000.CUSTOM_LINE_SEPARATOR2, -1, 0)(1)
                End If
                w_orapara(1, 0) = "2"
                If P000S011.FNCG_P_RECORDSET5(1, w_sql_s, w_orapara, w_dbdata) Then
                    If p_skbn = "1" Then
                        FNCL_P_003M063_JIGYOCHK = w_dbdata(0, 0)
                    Else
                        FNCL_P_003M063_JIGYOCHK = VBSplit(p_id, P0030000.CUSTOM_LINE_SEPARATOR2, -1, 0)(0) & P0030000.CUSTOM_LINE_SEPARATOR2 & w_dbdata(0, 0)
                    End If
                Else
                    FNCL_P_003M063_JIGYOCHK = ""
                End If
            Else
                '*** 内部割振コード
                FNCL_P_003M063_JIGYOCHK = p_id
            End If
        End If
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_KAISYACNTCHK
    '*  処理：複数会社登録チェック
    '*  内容：選択項目が事業所の場合、複数会社登録されているかチェック
    '*  備考：
    '*  引数：[I] p_id -- 選択順
    '*       ：[R] 0:単数会社,1:複数会社
    '**********************************************************************
    Function FNCL_P_KAISYACNTCHK(ByRef p_id As String) As Integer
        Dim w_sql_s As String
        Dim w_kmnm As String
        Dim w_dbdata(,) As String = Nothing
        w_kmnm = "S" & P000S001.FNCG_P_ZEROCD(p_id, 3)
        w_sql_s = "SELECT COUNT(*)"
        w_sql_s = w_sql_s & " FROM (SELECT " & w_kmnm & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP0030630_" & SessionAsStr("SG_P_RID")
        w_sql_s = w_sql_s & " WHERE " & w_kmnm & " IS NOT NULL"
        w_sql_s = w_sql_s & " GROUP BY " & w_kmnm & ") A"
        If P000S011.FNCG_P_RECORDSET1(1, w_sql_s, w_dbdata) = False Then
            FNCL_P_KAISYACNTCHK = 1
        Else
            If CInt(w_dbdata(0, 0)) > 1 Then
                FNCL_P_KAISYACNTCHK = 1
            Else
                FNCL_P_KAISYACNTCHK = 0
            End If
        End If
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_003M063_GETFORMAT
    '*  処理：対象行の表示書式を取得
    '*  内容：
    '*  備考：
    '*  引数：[I] p_id -- 選択順
    '*       ：[R] 表示書式
    '**********************************************************************
    Function FNCL_P_003M063_GETFORMAT(ByRef p_id As String) As String
        Dim w_sql_s As String
        Dim w_dbdata(,) As String = Nothing
        FNCL_P_003M063_GETFORMAT = "0"
        If keydata(41) = "2" AndAlso p_id = "1" Then
            FNCL_P_003M063_GETFORMAT = ""
        Else
            If SessionAsStr("SG_P_KAISYA_FLG") = "1" Then
                w_sql_s = "SELECT WEB_SP0002230_F(:ORA_2, 10, 2, 0, 0, B.CATEGORY_DIV, B.ITEM_ORDER)"
            Else
                w_sql_s = "SELECT WEB_SP0002230_F(A.KAISYACD, 10, 2, 0, 0, B.CATEGORY_DIV, B.ITEM_ORDER)"
            End If
            w_sql_s = w_sql_s & " FROM WEB_TP0030140_W A"
            If w_gmode = "1" Then
                w_sql_s = w_sql_s & "     ,WEB_TP0010020_M B"
            Else
                w_sql_s = w_sql_s & "     ,WEB_TP4000120_M B"
            End If
            w_sql_s = w_sql_s & " WHERE A.CUSTOMER_ID = :ORA_0"
            w_sql_s = w_sql_s & "   AND A.SELECT_ORDER = :ORA_1"
            w_sql_s = w_sql_s & "   AND A.CATEGORY_DIV=B.CATEGORY_DIV"
            w_sql_s = w_sql_s & "   AND A.ITEM_ORDER=B.ITEM_ORDER"
            ReDim w_orapara(2, 2)
            w_orapara(0, 0) = SessionAsStr("SG_P_RID")
            w_orapara(1, 0) = "2"
            If keydata(41) = "1" Then
                w_orapara(0, 1) = p_id
            Else
                w_orapara(0, 1) = Cstr(Cint(p_id) - 1)
            End If
            w_orapara(1, 1) = "2"
            If SessionAsStr("SG_P_KAISYA_FLG") = "1" Then
                w_orapara(0, 2) = SessionAsStr("SG_P_KAISYA_SELECT")
                w_orapara(1, 2) = "2"
            End If
            If P000S011.FNCG_P_RECORDSET5(1, w_sql_s, w_orapara, w_dbdata) = False Then
                ReDim w_dbdata(0, 0)
                w_dbdata(0, 0) = "0"
            End If
            FNCL_P_003M063_GETFORMAT = w_dbdata(0, 0)
            Erase w_dbdata
        End If
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_003M063_FORMATCHK
    '*  処理：表示書式の判断
    '*  内容：
    '*  備考：
    '*  引数：[I] p_data   -- 表示書式
    '*　 	：[I] p_format -- 判断する表示書式
    '*       ：[R] 0:無,1:有
    '**********************************************************************
    Function FNCL_P_003M063_FORMATCHK(ByRef p_data As String, ByRef p_format As String) As String
        If p_data = p_format Then
            FNCL_P_003M063_FORMATCHK = "1"
        Else
            FNCL_P_003M063_FORMATCHK = "0"
        End If
    End Function

</script>
