<%@ Page Language="vb" Explicit="true" %>

<%=""%>
<%@ Import Namespace="Isid.Positive.Common" %>
<%@ Import Namespace="Isid.Positive.DataAccess" %>
<%@ Import Namespace="Isid.Positive.Env" %>
<%@ Import Namespace="Isid.Positive.Util" %>
<%@ Import Namespace="Isid.Positive.FileSystem" %>
<%@ Import Namespace="Isid.Positive.PE.Common" %>
<%@ Import Namespace="Isid.Positive.PE.Common.P003S003" %>
<%@ Import Namespace="Isid.Positive.Common.PositiveHttpState" %>
<%
    '**********************************************************************
    '*  ｼｽﾃﾑ：STAFFBRAIN-WEB版人事
    '*  機能：個人情報照会
    '*  処理：照会画面  任意選択前処理
    '*  内容：照会画面  任意選択（データ取得と画面遷移）
    '*  FILE：P001M404.aspx
    '*  備考：
    '*
    '*  作成：000-Ver6.3  2002/03/29 T.M
    '*  履歴：001-Ver6.3a 2002/05/31 T.M 給与・賞与を選択された場合の不具合
    '*  履歴：002-Ver6.3a 2002/05/31 S.T 歴ｶﾃｺﾞﾘの抽出条件の不具合対応
    '*  履歴：003-Ver6.3b 2002/08/02 T.M 給与項目マスタ取得不具合対応
    '*  履歴：004-Ver6.3b 2002/08/02 T.M 降順設定時の最新x件時の不具合対応
    '*  履歴：005-Ver6.3b 2002/08/02 T.M 兼務表示時の外部ﾌｧｲﾙ出力不具合対応
    '*  履歴：006-Ver6.3c 2002/11/01 T.M 固定帳票の検索結果で社員番号順以外の場合の不具合対応
    '*  履歴：007-Ver6.3c 2002/11/01 T.M 給与の小数点項目の不具合対応
    '*  履歴：008-Ver7.0  2002/10/01 Y.Y 項目名称変更対応
    '*  履歴：009-Ver8.0x 2003/04/09 T.M 任意選択出力時のソート順の不具合対応
    '*  履歴：010-Ver8.1  2003/05/01 H.T 異動線帳票発行対応
    '*  履歴：011-Ver9.0  2003/xx/xx Y.Y 社員番号の英数字化対応
    '*  履歴：012-Ver7.0c 2003/08/08 Y.Y 辞令書用カテゴリ対応
    '*  履歴：013-Ver9.0  2003/10/03 S.T 考課任意選択出力時の不具合対応
    '*  履歴：014-VerP1.2 2003/10/22 Y.Y 給与カテゴリのソート不具合対応
    '*  履歴：015-VerP1.2a 2004/01/21 Y.Y コード項目の表示時の不具合対応
    '*  履歴：016-VerP1.3 2003/01/05 T.M 給与項目拡張対応
    '*  履歴：017-VerP1.3 2004/01/22 Y.Y 単位表示対応
    '*  履歴：018-VerP1.3 2004/01/27 T.M 入払表対応
    '*  履歴：019-VerP1.3 2004/01/28 Y.Y 日付形式対応
    '*  履歴：020-VerP1.2c 2004/03/02 Y.Y 異動帳票のデータ作成不具合対応
    '*  履歴：021-VerP2.0 2004/04/30 Y.Y テーブル情報-任意選択の出力方法対応
    '*  履歴：022-VerP2.1 2004/05/10 Y.Y ＥＸＣＥＬ出力時のログ出力対応
    '*  履歴：023-VerP2.1 2004/05/12 T.MA 継続処理対応
    '*  履歴：024-VerP2.1 2004/05/13 I.H 発令処理帳票発行対応
    '*  履歴：025-VerP2.11 2004/06/29 Y.Y マトリクス組織対応
    '*  履歴：026-VerP2.11 2004/07/05 T.MA 異動線通常対応
    '*  履歴：027-VerP2.1 2004/07/07 Y.Y テーブル情報の滞留年月の表示対応
    '*  履歴：028-VerP2.1 2004/07/26 T.MA 入払表任意改行対応
    '*  履歴：029-VerP2.1 2004/07/27 I.H 発令処理、発令番号複数選択時のEXCELフォーマット対応
    '*  履歴：030-VerP2.12 2004/08/06 T.M 就業参照対応
    '*  履歴：031-VerP2.1 2004/08/09 T.MA 入払表削除部署対応
    '*  履歴：032-VerP2.1 2004/08/17 T.MA 異動線グループ選択不具合対応
    '*  履歴：033-VerP2.2 2004/08/17 Y.Y 固定帳票ファイル作成の改善対応
    '*  履歴：034-VerP2.2 2004/08/25 Y.Y 兼務表示する場合の不具合対応
    '*  履歴：035-VerP2.12 2004/09/10 T.MA 異動線予備対応の基準日不具合対応
    '*  履歴：036-VerP2.21 2004/10/11 T.M マスタ履歴化対応
    '*  履歴：037-VerP2.21 2004/10/12 I.H 発令処理対応
    '*  履歴：038-VerP2.2a 2004/11/04 T.MA 件数取得不具合対応
    '*  履歴：039-VerP2.31 2004/12/21 Y.Y 異動帳票の社員指定時の不具合対応
    '*  履歴：040-VerP2.31 2004/12/27 Y.Y 固定帳票の給与項目表示の不具合対応
    '*  履歴：041-VerP2.41 2005/05/12 T.M 事業所表示順の追加対応
    '*  履歴：042-VerP3.01 2005/08/31 I.H D100001 マルチカンパニー対応
    '*  履歴：043-VerP3.02 2005/12/07 T.M D100017 発令管理対応
    '*  履歴：044-VerP3.03 2006/01/24 M.I E100149 就業項目(日数項目)表示不具合対応
    '*  履歴：045-VerP3.03 2006/01/25 Y.Y E100152 任意選択の左フレームからの出力対応
    '*  履歴：046-VerP3.04 2006/02/06 M.I D100001 マルチカンパニー対応漏れ(WEB_SP0002415_F対応)
    '*  履歴：047-VerP3.0a 2006/03/09 T.M E100191 兼務解除一意制約不具合対応
    '*  履歴：048-VerP3.0a 2006/03/23 T.M D100017 発令管理対応(所属歴本務関連)
    '*  履歴：049-VerP3.0a 2006/03/24 M.I E100217 任意選択の外部出力時3999/12/31対応
    '*  履歴：049-VerP3.0a 2006/03/28 T.M E100174 マルチカンパニー対応漏れ(採用)
    '*  履歴：050-VerP3.0a 2006/03/31 Y.Y E100174 マルチカンパニー対応漏れ
    '*  履歴：051-VerP3.0b 2006/04/05 T.M E100243 固定帳票設定の基準日参照不具合対応
    '*  履歴：052-VerP3.0b 2006/04/05 T.M D100088 同一セル表示対応
    '*  履歴：053-VerP3.0b 2006/04/11 M.I E100251 異動内示の役職名出力不具合対応
    '*  履歴：054-VerP3.0b 2006/04/17 Y.Y E100174 マルチカンパニー対応漏れ
    '*  履歴：055-VerP3.0b 2006/04/21 Y.Y E100174 マルチカンパニー対応漏れ
    '*  履歴：056-VerP3.0b 2006/04/21 Y.Y E100265 異動表の継続あり時の表示順不具合対応
    '*  履歴：057-VerP3.0b 2006/04/25 Y.Y E100268 異動線－入払表のグループ選択不具合対応
    '*  履歴：058-VerP3.0b 2006/04/25 Y.Y E100174 マルチカンパニー対応漏れ
    '*  履歴：059-VerP3.0b 2006/05/10 Y.Y D100102 Includeファイル最適化対応
    '*  履歴：060-VerP3.0d 2006/06/28 Y.Y D100122 メモリ消費改善対応（CreateObject）
    '*  履歴：061-VerP3.0d 2006/07/11 Y.Y D100122 メモリ消費改善対応（Include分割）
    '*  履歴：062-VerP3.0d 2006/07/24 T.M E100348 社員番号タイプ表示不正
    '*  履歴：063-VerP3.0d 2006/08/17 M.I E100369 任意選択の左フレームからの出力対応漏れ
    '*  履歴：064-VerP3.0d 2006/08/24 T.M E100382 ソート条件取得処理不具合対応
    '*  履歴：065-VerP3.0f 2006/10/25 Y.Y E100431 マルチカンパニー対応漏れ(異動)
    '*  履歴：066-VerP3.1  2006/11/01 Y.Y D100190 固定帳票共通化対応
    '*  履歴：067-VerP3.1  2006/11/29 M.I D100139 給与(明細項目履歴)項目の区別化
    '*  履歴：068-VerP3.1  2006/12/07 M.I D100195 固定帳票設定(異動)－項目設定拡張対応
    '*  履歴：069-VerP3.1  2007/01/09 M.I D100193 対象者設定での照会制御対応
    '*  履歴：070-VerP3.1  2007/01/17 Y.Y D100249 固定帳票拡張対応
    '*  履歴：071-VerP3.1  2007/03/05 M.I E100573 異動線の起点情報取得SQL会社コード漏れ対応
    '*  履歴：072-VerP3.1a 2007/07/13 Y.Y E100675 異動線の入払表の滞留表示不具合対応
    '*  履歴：073-VerP3.2a 2007/08/07 K.T D100303 監査ログ対応（帳票・外部出力）
    '*  履歴：074-VerP4.0  2007/08/14 I.H D100310 SQLインジェクション対応
    '*  履歴：075-VerP3.1a 2007/09/14 Y.Y E100720 兼務の表示する場合の不具合対応
    '*  履歴：076-VerP3.1a 2007/10/11 Y.Y E100736 異動線の一覧表の出力不具合対応
    '*  履歴：077-VerP3.2  2007/11/15 M.I E100784 固定帳票出力時の並び順不具合対応
    '*  履歴：078-VerP4.0  2007/11/20 M.I D100351 単一会社運用対応(固定帳票設定取得部のみ)
    '*  履歴：079-VerP3.1b 2007/11/21 M.I E100791 辞令書用カテゴリ出力不具合対応
    '*  履歴：080-VerP4.0  2007/11/27 Y.N D100351 単一会社運用対応(ログメッセージ対応のみ)
    '*  履歴：081-VerP3.1b 2008/01/24 Y.Y E100885 給与(変動項目履歴)の賞与表示不具合対応
    '*  履歴：082-VerP3.1b 2008/01/28 M.I E100890 E100784対応の採用考慮漏れ不具合対応
    '*  履歴：083-VerP3.1b 2008/01/30 M.I E100895 考課結果外部出力(ユーザー選択) 出力時の不具合対応
    '*  履歴：084-VerP3.1b 2008/01/30 M.I E100896 異動文書(考課) 出力時の不具合対応
    '*  履歴：085-VerP4.0a 2008/03/21 M.I D100431 PB27専用機能拡張対応(照会対象者ログ出力対応)
    '*  履歴：086-VerP4.0a 2008/04/01 M.I E100955 考課-異動文書出力時の不具合対応(履歴化環境)
    '*  履歴：087-VerP4.0a 2008/04/25 Y.Y D100294 固定帳票の拡張対応
    '*  履歴：088-VerP4.0b 2008/08/14 Y.Y E101020 任意選択設定の全社保存条件の不具合対応
    '*  履歴：089-VerP4.0b 2008/09/25 Y.Y E101043 異動表のTXTファイルOPEN方法変更対応
    '*  履歴：090-VerP4.0c 2008/12/09 M.I D100514 人材育成固定帳票追加対応
    '*  履歴：091-VerP4.0c 2008/12/15 M.I E101144 人事通常以外のＤＢ管理対応漏れ
    '*  履歴：092-VerP4.0c 2009/01/20 M.I E101161 基準年度・期カテゴリの取得不具合対応
    '*  履歴：093-VerP4.0c 2009/02/05 Y.Y E101182 全社ﾓｰﾄﾞﾛｸﾞｲﾝ時の考課情報照会対応
    '*  履歴：094-VerP4.0c 2009/03/05 M.I E101200 発令処理の「出力基準日」出力不具合対応
    '*  履歴：095-VerP4.0d 2009/08/06 Y.Y【改善】D100546 セキュリティ対応(EXCEL出力)
    '*  履歴：096-VerP4.0d 2009/09/03 M.I【修正447】E101301 異動（帳票用全）選択時の不具合対応
    '*  履歴：097-VerP4.0d 2009/09/02 C.O【修正445】E101298 発令処理の兼務所属情報出力不具合対応
    '*  履歴：098-VerP4.0e 2009/11/04 C.O【改善】D100561 労基法改正対応に伴うテーブル変更対応
    '*  履歴：099-VerP4.0e 2009/11/06 Y.Y【修正】E101342 有給関連カテゴリ表示不具合対応
    '*  履歴：100-VerP4.0e 2009/12/09 M.I【修正504】E101360 テーブル情報関連の不具合対応
    '*  履歴：101-VerP4.0e 2009/12/17 C.O【修正511】E101366 発令処理のその他条件WHERE句作成処理不具合対応
    '*  履歴：102-VerP4.0f 2010/01/25 C.O【修正527】E101380 発令処理の固定帳票ORDER BY句作成処理不具合対応
    '*  履歴：103-VerP4.0f 2010/02/05 C.O【修正538】E101395 固定帳票の基準日取得不具合対応
    '*  履歴：104-VerP4.0f 2010/03/17 C.O【修正562】E101420 発令処理の出力基準日取得不具合対応
    '*  履歴：105-VerP4.0f 2010/04/19 Y.Y【改善】D100586 セキュリティ対応(固定帳票)
    '*  履歴：106-VerP4.0g 2010/11/22 Y.Y【修正】E101593 保険(今日)・(基準日)表示不具合
    '*  履歴：107-VerP4.2  2011/06/29 Y.I【改善P-11-004】英語対応
    '*  履歴：108-VerP4.2  2011/07/07 M.I【修正P10100】異動線の社員ｿｰﾄ不備による出力不具合
    '*  履歴：109-VerP4.2  2011/11/28 M.K【修正P11190】発令処理－振込口座カテゴリの固定帳票出力不具合
    '*  履歴：110-VerP4.2  2011/11/28 M.I【修正P11200】社員追加後の辞令書出力ｴﾗｰ対応
    '*  履歴：111-VerP4.3  2012/01/12 H.N【改善W-11-008】就業投資改善対応
    '*  履歴：112-VerP4.3  2012/01/26 M.I【修正P11810】帳票ﾛｸﾞ出力時の帳票名ｾｯﾄ漏れ対応
    '*  履歴：113-VerP4.3  2012/02/23 M.I【修正P12060】異動文書の同一社員複数ﾃﾞｰﾀ存在時の並び順不具合
    '*  履歴：114-VerP4.3  2012/03/07 Y.Y【修正P12220】帳票ﾛｸﾞ出力時の項目名ｾｯﾄ漏れ対応
    '*  履歴：115-VerP4.3  2012/05/07 Y.Y【修正P12910】検索設定の兼務表示時不具合対応
    '*  履歴：116-VerP4.3  2012/05/07 M.I【修正P12920】ｼﾝｸﾞﾙ時の有給関連ｶﾃｺﾞﾘ表示不具合
    '*  履歴：117-VerP4.3  2012/05/22 M.K【修正P13250】発令処理－固定帳票出力不具合
    '*  -------------------------------------------------------------------
    '*  作成：000-Ver5.0   2013/05/31 ISID 【Hayabusa】.NET版新規作成
    '*  履歴：001-Ver5.0a  2013/06/04 SHSC 【P14140】考課－出力不具合対応
    '*  履歴：002-Ver5.0a  2013/06/04 SHSC 【P14620】任意選択設定-就業時間項目の表示不具合
    '*  履歴：003-Ver5.0a  2013/06/04 SHSC 【P-12-021】禁則文字対応
    '*  履歴：004-Ver5.0a  2013/08/01 SHSC 【P15870】共通関数の引数不備対応
    '*  履歴：005-Ver5.2   2014/04/16 SHSC ミドルネーム対応
    '*  履歴：006-Ver6.0   2014/10/31 COBA 【P-14-041】タレントマネジメント対応
    '*  履歴：007-Ver6.0   2014/10/31 COBA 【P-14-042】タレントマネジメント対応
    '*  履歴：008-Ver6.0   2014/11/05 SHSC 【P-14-208】禁則文字解除対応（先行）
    '*  履歴：009-Ver6.0   2015/05/11 ISID 【P16370】バージョンアップ後の固定帳票出力エラーについて
    '*  履歴：010-Ver6.0   2015/05/12 ISID 【P16960】改行文字存在時のEXCEL出力不具合  
    '*  履歴：011-Ver6.0   2015/05/13 ISID 【P18380】固定帳票-「昇格歴」項目の固定帳票出力不具合  
    '*  履歴：012-Ver6.0   2015/10/02 ISID 【P19300】異動帳票出力時のシステムエラー
    '*  履歴：013-Ver6.1   2015/04/12 T.M  【P-14-083】
    '*  履歴：014-Ver6.1   2015/05/18 ICOM 【P19200】全社権限各社選択時対応
    '*  履歴：015-Ver6.1   2015/06/18 ICOM 【P19160】帳票出力不具合対応
    '*  履歴：016-Ver6.1   2015/08/19 SHSC 【Ver6.1対応】銀行対応-異動線顔写真表示機能追加
    '*  履歴：017-Ver6.1   2017/02/17 ISID 【P24160】異動線の兼務情報出力制御対応
    '*  履歴：018-Ver6.1   2017/09/21 ISID 【P24850】全社ログイン時の各社帳票出力不備対応
    '*  履歴：019-Ver6.1   2019/06/12 ISID 【P28950】就業関連項目の表示・入力・検索対応
    '*  履歴：020-Ver6.1   2019/10/31 ISID 【P29680】HHMM形式をHH:MM形式に変換する場合のマイナス表示対応
    '*  履歴：021-Ver6.1   2020/10/30 ISID 【P31950】給与明細項目を「全て」で出力する場合の動作不備対応
    '*  履歴：022-Ver6.1   2020/11/17 ISID 【P32150】全社で同一社員番号のデータを出力する場合の動作不備対応
    '**********************************************************************
    Response.Expires = -1
    Response.AddHeader("Cache-Control", "No-Cache")
    '**********************************************************************
    '//**（処理概要）
    '//**  項目選択の「画面表示」より遷移し、データ取得と画面遷移を行う。
    '//**
    '**********************************************************************
    '**********************************************************************
    '*    ログイン認証
    '**********************************************************************
    P000S012.SUBG_P_LOGINCHK("1", "1")
    '*** 一時変数
    '**********************************************************************
    '*    初期処理
    '**********************************************************************
    If P000S011.FNCG_P_DBOBJGET("0", DBOBJ) <> 0 Then
    End If
    '*** 文言情報取得（表示言語）
    If P000S008.FNCG_P_GET_MULTILANGUAGE_WORD("P001M404", -1, "0", "", w_langmsg) <> 0 Then
    End If
    '*** 文言情報取得（出力言語）
    If P000S008.FNCG_P_GET_MULTILANGUAGE_WORD("P001M404", -1, "1", SessionAsStrArray("SG_P_LANGUAGE")(9), w_langmsg_out) <> 0 Then
    End If
    '**********************************************************************
    '* 会社情報取得
    '**********************************************************************
    w_kcode = GetKaisyacdByAllKengen()
    If SessionAsStr("SG_P_KAISYA") = "0" AndAlso _
      (SessionAsStrArray("SL_P000M008_GMODE_S")(0) = "1" OrElse SessionAsStrArray("SL_P000M008_GMODE_S")(0) = "4") Then
      '***全社ログイン、且つ、通常又は個別登録からの遷移
        w_kcode = "0"
    End If
    w_kcd = GetLoginKaisyacdByAllKengen()
    Dim permission As String = GetPermission()
    '**********************************************************************
    '*    w_skbn
    '*         1：任意選択（条件一覧選択時）
    '*         2：任意選択（状況設定画面より呼出）
    '*         3：固定帳票
    '*         4：未使用
    '*        11：システム任意出力設定
    '**********************************************************************
    w_skbn = Request.QueryString("id")
    Select Case w_skbn
        Case "3"
            '*** ﾗﾍﾞﾙ(1)："帳票出力"
            w_title = w_langmsg(0, 1)
            '*** ﾗﾍﾞﾙ(2)："帳票出力"
            w_title2 = w_langmsg(0, 2)
        Case "11"
            '*** ﾗﾍﾞﾙ(3)："システム任意出力設定"
            w_title = w_langmsg(0, 3)
            '*** ﾗﾍﾞﾙ(4)："システム任意出力設定"
            w_title2 = w_langmsg(0, 4)
        Case Else
            '*** ﾗﾍﾞﾙ(5)："任意選択設定"
            w_title = w_langmsg(0, 5)
            '*** ﾗﾍﾞﾙ(6)："項目設定"
            w_title2 = w_langmsg(0, 6)
    End Select
    'If w_skbn = "1" Or w_skbn = "2" Then
    'w_kcode = Session("SG_P_KAISYA")
    'End If
    '**********************************************************************
    '*    セッションの取得
    '**********************************************************************
    w_gmode = SessionAsStr("SL_P000M008_GMODE")
    w_gsmode = SessionAsStrArray("SL_P000M008_GMODE_S")(0)
    '強制変換される可能性有り
    '* 画面モード判断用詳細（各機能共通）
    '* 1=通常・2=異動・3=考課・4=個別登録・5=異動線・6=発令(302)・7=発令処理(303)・8=人材育成
    w_tgsmode = SessionAsStrArray("SL_P000M008_GMODE_S")(0)
    '* 画面モード判断用詳細（各機能共通）
    '* 1=通常・2=異動・3=考課・4=個別登録・5=異動線・6=発令(302)・7=発令処理(303)・8=人材育成
    w_fname = SessionAsStrArray("SG_P_FNAME")
    w_printinf = SessionAsStrArray("SG_P_PRINTINF")
    '**  w_skbn = 1,2,3,4
    '**    0 : 機能区分
    '**    1 : 帳票区分
    '**    2 : 発令日
    '**    3 : 特別フラグ(当ASPXでは参照していない)
    '**    4 : ＳＱＬフラグ
    '**    5 : マクロフラグ
    '**    6 : 社員番号（個別登録－辞令書で使用）
    '**  w_skbn = 11
    '**    0 : 機能区分
    '**    1 : 画面番号
    '**    2 : 基準日
    '**    3 : 管理番号
    '**    4 : 年度・期
    '**    5 : (未使用)
    '**    6 : (未使用)
    '**********************************************************************
    '*    画面遷移モード強制変換
    '**********************************************************************
    If w_skbn = "3" AndAlso w_gsmode = "6" Then
        '** 固定帳票時で発令処理から通常固定帳票処理を実行された場合
        If CStr(P000S001.FNCG_P_NVL(w_printinf(0), "1")) = "1" Then
            w_gsmode = "1"
        End If
    End If
    '**********************************************************************
    '*    特別フラグ取得処理(2:異動表,3:入払表)
    '*     w_tkflg
    '*        2:異動表
    '*        3:入払表
    '**********************************************************************
    w_tkflg = "0"
    If w_skbn <> "11" Then
        sql = "SELECT SPECIAL_FLAG"
        sql = sql & ",DELETE_SECTION"
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062010_M"
        sql = sql & " WHERE KAISYACD = :ORA_2"
        sql = sql & "   AND FUNCTION_DIV   = :ORA_0"
        sql = sql & "   AND REPORT_DIV   = :ORA_1"
        ReDim w_orapara(2, 2)
        w_orapara(0, 0) = w_printinf(0)
        w_orapara(1, 0) = "2"
        w_orapara(0, 1) = w_printinf(1)
        w_orapara(1, 1) = "2"
        w_orapara(0, 2) = w_kcode
        w_orapara(1, 2) = "101"
        If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, w_dbdata) = True Then
            w_tkflg = w_dbdata(0, 0)
            w_delbsyo = CInt(S000S020.NullToZero(w_dbdata(1, 0)))
        End If
    End If
    '**********************************************************************
    '//**（処理内容）
    '//**    1.Session変数(検索情報)をワーク変数に設定する。
    '//**
    '**********************************************************************
    '** 検索情報
    '** P001M004.aspx でセット
    '**    (0) : 項目選択のＩＤ
    '**    (1) : 表示書式
    '**********************************************************************
    '*    初期情報の取得
    '**********************************************************************
    w_jirei = 0
    w_pgflg = 1
    w_kjday = ""
    w_kkbn = "0"
    Select Case w_skbn
        Case "1", "2"
            Select Case w_gmode
                Case "1"
                    w_kinou = "1"
                    Select Case w_gsmode
                        Case "1"
                            '*** 通常
                        Case "3"
                            '*** 考課
                            w_kouka = SessionAsStrArray("SL_P200_INF01")
                            '*** ﾗﾍﾞﾙ(7)："考課帳票発行"
                            w_title = w_langmsg(0, 7)
                            w_kinou = w_printinf(0)
                            If IsNull(P000S001.FNCG_P_NZ(w_printinf(4))) Then
                                w_printinf(4) = "1"
                            End If
                            If w_printinf(4) = "0" Then
                                '*** 異例は除く（※現在未使用ロジック）
                                sql = "SELECT A.EMP_CODE,0"
                                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & " A"
                                sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                sql = sql & " WHERE A.EMP_CODE = B.EMP_CODE"
                                sql = sql & " ORDER BY B.SYAINCD"
                            If P000S011.FNCG_P_RECORDSET1(2, sql, w_scd) = True Then
                            End If
                            Session.Add("SL_P001M004_SCD", w_scd)
                            Session.Add("SL_P001M016_BUTTON", "1")
                            Session.Add("SL_P001M004_SIDX", 0)
                            End If
                    End Select
                Case "2"
                    w_kinou = "400"
            End Select
        Case "3", "4"
            w_pgflg = 2
            '**********************************************************************
            '* 組入れ判断
            '**********************************************************************
            ReDim w_outid(1)
            Select Case w_gmode
                Case "1"
                    Select Case w_gsmode
                        Case "1"
                            '*** 通常
                            If Not IsNull(w_printinf(0)) Then
                                w_kinou = w_printinf(0)
                            Else
                                w_kinou = "1"
                            End If
                        Case "4"
                            '*** 個別登録
                            w_kinou = "1"
                        Case Else
                            w_kinou = w_printinf(0)
                    End Select
                    If w_gsmode = "1" AndAlso w_kinou = "1" Then
                        w_outid(0) = SessionAsStrArray("SL_P001M013_KINOU")(1)
                        '*** 帳票ID
                    Else
                        w_outid(0) = w_printinf(1)
                    End If
                Case "2"
                    w_kinou = "400"
                    w_outid(0) = SessionAsStrArray("SL_P400_INF14")(2)
                    '*** 帳票ID
            End Select
            If w_skbn = "4" Then
                w_outid(0) = SessionAsStrArray("SL_P001M013_KINOU")(1)
            End If
            If w_skbn = "3" AndAlso Not IsNull(P000S001.FNCG_P_NZ(w_outid(0))) Then
                sql = "SELECT NVL(A.INCORPORATE_PROCESS_CONF,'1')"
                sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062010_M A"
                sql = sql & " WHERE A.KAISYACD = :ORA_0"
                sql = sql & "   AND A.FUNCTION_DIV = :ORA_1"
                sql = sql & "   AND A.REPORT_DIV = :ORA_2"
                ReDim w_orapara(2, 2)
                w_orapara(0, 0) = w_kcode
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = w_kinou
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = w_outid(0)
                w_orapara(1, 2) = "2"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                    Select Case w_dbdata(0, 0)
                        Case "2"
                            '*** 組入する（標準データ＋組入データ）
                            w_kkbn = "2"
                        Case "3"
                            '*** 組入する（組入データ）
                            '*** 組入れデータ取得処理
                            P000SU02.SUBG_P_001M404_DATA2(w_kcode, CInt(w_kinou), w_outid(0))
                            Response.Redirect("P001M401.aspx?kkbn=3&kinou=" & w_kinou & "&rkbn=" & w_outid(0))
                            Response.End()
                        Case "4"
                            '*** 組入する（全ての処理）
                            '*** 組入れデータ取得処理
                            P000SU02.SUBG_P_001M404_DATA(w_kcode, CInt(w_kinou), w_outid(0))
                            Response.Redirect("P001M408.aspx?kkbn=" & w_kinou & "&rkbn=" & w_outid(0))
                            Response.End()
                    End Select
                End If
            End If
            Select Case w_gmode
                Case "1"
                    Select Case w_kinou
                        Case "40", "210"
                            Select Case w_kinou
                                Case "40"
                                    '*** 定例帳票
                                    '*** ﾗﾍﾞﾙ(8)："定例帳票"
                                    w_title = w_langmsg(0, 8)
                                Case "210"
                                    '*** 昇降格
                                    '*** ﾗﾍﾞﾙ(9)："昇降格"
                                    w_title = w_langmsg(0, 9)
                            End Select
                            sql = "SELECT A.EMP_CODE,0"
                            sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " A"
                            sql = sql & " ORDER BY A.SYAINCD"
                            If P000S011.FNCG_P_RECORDSET1(2, sql, w_scd) = True Then
                            End If
                            Session.Add("SL_P001M004_SCD", w_scd)
                            Session.Add("SL_P001M016_BUTTON", "1")
                            Session.Add("SL_P001M004_SIDX", 0)
                        Case Else
                            Select Case w_gsmode
                                Case "1"
                                    '*** 通常
                                    sql = "SELECT A.SPECIAL_FLAG,NVL(B.CODE_VALUE,0)"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062010_M A"
                                    sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0050410_T B"
                                    sql = sql & " WHERE A.KAISYACD=:ORA_1"
                                    sql = sql & "   AND A.FUNCTION_DIV=1"
                                    sql = sql & "   AND A.REPORT_DIV=:ORA_0"
                                    sql = sql & "   AND A.KAISYACD=B.KAISYACD(+)"
                                    sql = sql & "   AND A.TARGET_EMP_CONF=B.CODE_VALUE(+)"
                                    ReDim w_orapara(2, 1)
                                    w_orapara(0, 0) = SessionAsStrArray("SL_P001M013_KINOU")(1)
                                    w_orapara(1, 0) = "2"
                                    w_orapara(0, 1) = w_kcode
                                    w_orapara(1, 1) = "101"
                                    If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, w_dbdata) = True Then
                                        '*** 対象者を絞る
                                        If w_dbdata(1, 0) <> "0" Then
                                            sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP0050640_S("
                                            sql = sql & " :ORA_0"
                                            '*** 会社コード
                                            sql = sql & ",:ORA_1"
                                            '*** 対象コード
                                            sql = sql & ",:ORA_2"
                                            '*** 利用者ＩＤ
                                            sql = sql & ",:ORA_3"
                                            '*** 基準日
                                            sql = sql & ",:ORA_ERR); END;"
                                            ReDim w_orapara(3, 3)
                                            w_orapara(0, 0) = w_kcode
                                            w_orapara(1, 0) = "101"
                                            w_orapara(0, 1) = w_dbdata(1, 0)
                                            w_orapara(1, 1) = "2"
                                            w_orapara(0, 2) = SessionAsStr("SG_P_RID")
                                            w_orapara(1, 2) = "2"
                                            If SessionAsStrArray("SG_P_001INF")(6) = "1" Then
                                                '*** 基準日
                                                w_orapara(0, 3) = SessionAsStr("SG_P_TDATE")
                                            Else
                                                w_orapara(0, 3) = SessionAsStrArray("SG_P_001INF")(15)
                                            End If
                                            w_orapara(1, 3) = "1"
                                            If P000S011.FNCG_P_SPEXECUTE1(1, sql, w_orapara, w_err, "") = False Then
                                            End If
                                            If w_err < 0 Then
                                                '*** ﾗﾍﾞﾙ(10)："対象者取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 DBOBJ=WEB_SP0050640_S ID=1)<BR>"
                                                PE_ComVars.Instance.w_errtext = w_langmsg(0, 10)
                                                If w_skbn = "3" Then
                                                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                                Else
                                                    P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                                End If
                                                Response.End()
                                            End If
                                            sql = "DELETE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                                            sql = sql & " WHERE EMP_CODE IN ("
                                            sql = sql & " SELECT EMP_CODE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                                            sql = sql & " MINUS"
                                            sql = sql & " SELECT EMP_CODE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0050400_W_" & SessionAsStr("SG_P_RID")
                                            sql = sql & ")"
                                            DBOBJ.DbExecuteSQL(sql)
                                            sql = "SELECT EMP_CODE,0 FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                                            sql = sql & " ORDER BY SYAINCD"
                                            If P000S011.FNCG_P_RECORDSET1(2, sql, w_scd) = False Then
                                                '*** ﾗﾍﾞﾙ(11)："対象データが存在しません。<BR>"
                                                PE_ComVars.Instance.w_errtext = w_langmsg(0, 11)
                                                If w_skbn = "3" Then
                                                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                                Else
                                                    P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                                End If
                                                Response.End()
                                            End If
                                            Session.Add("SL_P001M004_SCDSRT", w_scd)
                                        End If
                                        If w_dbdata(0, 0) = "1" Then
                                            w_jirei = 1
                                            DBOBJ.Parameters.Remove("ORA_ERR")
                                            DBOBJ.Parameters.Add(("ORA_ERR"), 0, OraConst.ORAPARM_OUTPUT)
                                            w_err = CInt(DBOBJ.Parameters("ORA_ERR").Value)
                                            sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP0010020_S("
                                            sql = sql & " " & w_kcode
                                            sql = sql & ",1"
                                            sql = sql & ",1"
                                            sql = sql & "," & SessionAsStrArray("SL_P001M013_KINOU")(1)
                                            If SessionAsStrArray("SG_P_001INF")(6) = "1" Then
                                                '*** 今日
                                                sql = sql & ",'" & SessionAsStr("SG_P_TDATE") & "'"
                                            Else
                                                sql = sql & ",'" & SessionAsStrArray("SG_P_001INF")(15) & "'"
                                            End If
                                            sql = sql & "," & SessionAsStr("SG_P_RID")
                                            sql = sql & ",:ORA_ERR); END;"
                                            DBOBJ.DbExecuteSQL(sql)
                                            DBOBJ.Parameters.Remove("ORA_ERR")
                                            If w_err < 0 Then
                                                '*** ﾗﾍﾞﾙ(12)："対象者取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 DBOBJ=WEB_SP0010020_S ID=1)<BR>"
                                                PE_ComVars.Instance.w_errtext = w_langmsg(0, 12)
                                                If w_skbn = "3" Then
                                                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                                Else
                                                    P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                                End If
                                                Response.End()
                                            End If
                                            sql = "SELECT A.EMP_CODE,0,A.ANOTHER_POST_DIV"
                                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011040_W_" & SessionAsStr("SG_P_RID") & " A"
                                            sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                            sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                                            sql = sql & " ORDER BY B.KAISYACD,B.SYAINCD,A.ANOTHER_POST_DIV"
                                            If P000S011.FNCG_P_RECORDSET1(3, sql, w_scd) = False Then
                                                '*** ﾗﾍﾞﾙ(13)："対象データが存在しません。<BR>"
                                                PE_ComVars.Instance.w_errtext = w_langmsg(0, 13)
                                                If w_skbn = "3" Then
                                                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                                Else
                                                    P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                                End If
                                                Response.End()
                                            End If
                                        End If
                                    End If
                                Case "2"
                                    '*** 異動
                                    w_ido = SessionAsStrArray("SL_P300_INF01")
                                    w_table = SessionAsStr("SG_C_DBUSER1") & "WEB_TP3001530_W"
                                    '*** ﾗﾍﾞﾙ(14)："異動帳票発行"
                                    w_title = w_langmsg(0, 14)
                                    sql = "SELECT A.EMP_CODE,0,A.JOINKEY"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " A"
                                    sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                    sql = sql & " WHERE A.SELECTED=1"
                                    sql = sql & "   AND A.EMP_CODE=B.EMP_CODE"
                                    sql = sql & " ORDER BY B.SYAINCD,JOINKEY"
                                    If P000S011.FNCG_P_RECORDSET1(3, sql, w_scd) = True Then
                                    End If
                                    Session.Add("SL_P001M004_SCD", w_scd)
                                    Session.Add("SL_P001M016_BUTTON", "1")
                                    Session.Add("SL_P001M004_SIDX", 0)
                                    If w_tkflg = "3" Then
                                        '*** 入払表
                                        sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP3003130_S("
                                        sql = sql & " :ORA_0"
                                        '***
                                        sql = sql & ",:ORA_1"
                                        '***
                                        sql = sql & ",:ORA_2"
                                        '***
                                        sql = sql & ",:ORA_3"
                                        '***
                                        sql = sql & ",:ORA_4"
                                        '***
                                        sql = sql & ",:ORA_5"
                                        '***
                                        sql = sql & ",:ORA_ERR); END;"
                                        ReDim w_orapara(3, 5)
                                        w_orapara(0, 0) = w_kcode
                                        w_orapara(1, 0) = "101"
                                        w_orapara(0, 1) = SessionAsStr("SG_P_RID")
                                        w_orapara(1, 1) = "2"
                                        w_orapara(0, 2) = w_ido(0)
                                        w_orapara(1, 2) = "2"
                                        w_orapara(0, 3) = w_ido(1)
                                        w_orapara(1, 3) = "2"
                                        w_orapara(0, 4) = w_ido(2)
                                        w_orapara(1, 4) = "2"
                                        w_orapara(0, 5) = w_printinf(1)
                                        w_orapara(1, 5) = "2"
                                        If P000S011.FNCG_P_SPEXECUTE1(1, sql, w_orapara, w_err, "") = False Then
                                        End If
                                        If w_err < 0 Then
                                            '*** ﾗﾍﾞﾙ(15)："対象者取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 DBOBJ=WEB_SP3003130_S ID=1)<BR>"
                                            PE_ComVars.Instance.w_errtext = w_langmsg(0, 15)
                                            If w_skbn = "3" Then
                                                P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                            Else
                                                P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                            End If
                                            Response.End()
                                        End If
                                        sql = "SELECT "
                                        sql = sql & " A.NEW_DEPT_DISP_ORDER"
                                        sql = sql & ",A.NEW_EMP_DISP_ORDER"
                                        sql = sql & ",A.NEW_DEPT_RANK || '||' || A.NEW_DEPT_CODE"
                                        sql = sql & ",A.CURRENT_DEPT_DISP_ORDER"
                                        sql = sql & ",A.CURRENT_EMP_DISP_ORDER"
                                        sql = sql & ",A.CURRENT_DEPT_RANK || '||' || A.CURRENT_DEPT_CODE"
                                        sql = sql & ",A.TRANSFER_FLAG"
                                        sql = sql & " FROM " & w_table & " A"
                                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                        sql = sql & " WHERE A.CUSTOMER_ID=" & SessionAsStr("SG_P_RID")
                                        sql = sql & "   AND A.EMP_CODE=B.EMP_CODE"
                                        sql = sql & " ORDER BY B.SYAINCD,A.TRANSFER_FLAG"
                                        If P000S011.FNCG_P_RECORDSET1(7, sql, w_idosenscd) = True Then
                                        End If
                                        sql = "SELECT ISSUE_DATE"
                                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3000110_M "
                                        sql = sql & " WHERE KAISYACD=:ORA_1"
                                        sql = sql & "   AND PROCESS_ID = :ORA_0"
                                        ReDim w_orapara(2, 1)
                                        w_orapara(0, 0) = w_ido(0)
                                        w_orapara(1, 0) = "2"
                                        w_orapara(0, 1) = w_kcode
                                        w_orapara(1, 1) = "101"
                                        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                                            '*** ﾗﾍﾞﾙ(16)："対象データが存在しません。<BR>"
                                            PE_ComVars.Instance.w_errtext = w_langmsg(0, 16)
                                            If w_skbn = "3" Then
                                                P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                            Else
                                                P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                            End If
                                            Response.End()
                                        Else
                                            w_hrday = w_dbdata(0, 0)
                                        End If
                                    End If
                                Case "3"
                                    '*** 考課
                                    w_kouka = SessionAsStrArray("SL_P200_INF01")
                                    '*** ﾗﾍﾞﾙ(17)："考課帳票発行"
                                    w_title = w_langmsg(0, 17)
                                    If w_printinf(4) = "0" Then
                                        '*** 異例は除く（※現在未使用ロジック）
                                        sql = "SELECT A.EMP_CODE,0"
                                        If (w_printinf(1) = "101" OrElse w_printinf(1) = "102") AndAlso w_kouka(3) = "1" Then
                                            '*** 異動文書・更改通知表、かつ、検索結果表示＝1:する
                                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " A"
                                        Else
                                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & " A"
                                        End If
                                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                        sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                                        sql = sql & " ORDER BY B.SYAINCD"
                                        If P000S011.FNCG_P_RECORDSET1(2, sql, w_scd) = True Then
                                        End If
                                        Session.Add("SL_P001M004_SCD", w_scd)
                                        Session.Add("SL_P001M016_BUTTON", "1")
                                        Session.Add("SL_P001M004_SIDX", 0)
                                    End If
                                Case "4"
                                    '*** 個別登録
                                    w_jirei = 1
                                    ReDim w_dbdata(1, 0)
                                    w_dbdata(0, 0) = w_printinf(6)
                                    w_dbdata(1, 0) = "0"
                                    If SessionAsStrArray("SL_P002M008_KINOU")(1) = "1" Then
                                        w_tmp = 3
                                    Else
                                        w_tmp = 1
                                    End If
                                    If CStr(P001S003.FNCG_P_OUTSYAIN(1, 1, w_tmp, "", w_dbdata, w_errmsg)) = "1" Then
                                        '*** 参照対象者保存処理
                                        '*** ﾗﾍﾞﾙ(18)："参照対象者保存処理でエラーが発生しました。<BR>(ASPOBJ=P001M404 DBOBJ=WEB_SP0010010_P ID=1)<BR>"
                                        PE_ComVars.Instance.w_errtext = w_langmsg(0, 18)
                                        If w_skbn = "3" Then
                                            P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                        Else
                                            P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                        End If
                                        Response.End()
                                    End If
                                    DBOBJ.Parameters.Remove("ORA_ERR")
                                    DBOBJ.Parameters.Add(("ORA_ERR"), 0, OraConst.ORAPARM_OUTPUT)
                                    w_err = CInt(DBOBJ.Parameters("ORA_ERR").Value)
                                    sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP0010020_S("
                                    sql = sql & w_kcode
                                    sql = sql & ",1"
                                    sql = sql & ",1"
                                    sql = sql & "," & w_printinf(1)
                                    '*** 帳票区分
                                    sql = sql & ",'" & w_printinf(2) & "'"
                                    '*** 日付
                                    sql = sql & "," & SessionAsStr("SG_P_RID")
                                    sql = sql & ",:ORA_ERR); END;"
                                    DBOBJ.DbExecuteSQL(sql)
                                    DBOBJ.Parameters.Remove("ORA_ERR")
                                    If w_err < 0 Then
                                        '*** ﾗﾍﾞﾙ(19)："対象者取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 DBOBJ=WEB_SP0010020_S ID=1)<BR>"
                                        PE_ComVars.Instance.w_errtext = w_langmsg(0, 19)
                                        If w_skbn = "3" Then
                                            P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                        Else
                                            P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                        End If
                                        Response.End()
                                    End If
                                    sql = "SELECT A.EMP_CODE,0,A.ANOTHER_POST_DIV"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011040_W_" & SessionAsStr("SG_P_RID") & " A"
                                    sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                    sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                                    sql = sql & " ORDER BY B.SYAINCD,A.ANOTHER_POST_DIV"
                                    If P000S011.FNCG_P_RECORDSET1(3, sql, w_scd) = False Then
                                        '*** ﾗﾍﾞﾙ(20)："対象データが存在しません。<BR>"
                                        PE_ComVars.Instance.w_errtext = w_langmsg(0, 20)
                                        If w_skbn = "3" Then
                                            P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                        Else
                                            P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                        End If
                                        Response.End()
                                    End If
                                Case "5"
                                    '*** 異動線
                                    '*** ﾗﾍﾞﾙ(21)："異動線帳票発行"
                                    w_title = w_langmsg(0, 21)
                                    w_table = SessionAsStr("SG_C_DBUSER1") & "WEB_TP3012210_W"
                                    w_idosen = SessionAsStrArray("SL_P301_INF01")
                                    sql = "SELECT TO_CHAR(ISSUE_DATE,'YYYY/MM/DD')"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3011010_M "
                                    sql = sql & " WHERE KAISYACD=:ORA_1"
                                    sql = sql & "   AND PROCESS_ID = :ORA_0"
                                    ReDim w_orapara(2, 1)
                                    w_orapara(0, 0) = w_idosen(0)
                                    w_orapara(1, 0) = "2"
                                    w_orapara(0, 1) = w_kcode
                                    w_orapara(1, 1) = "101"
                                    If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                                        '*** ﾗﾍﾞﾙ(22)："対象データが存在しません。<BR>"
                                        PE_ComVars.Instance.w_errtext = w_langmsg(0, 22)
                                        If w_skbn = "3" Then
                                            P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                        Else
                                            P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                        End If
                                        Response.End()
                                    Else
                                        w_kjday = w_dbdata(0, 0)
                                    End If
                                    sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP3012210_S("
                                    sql = sql & " :ORA_0"
                                    '***
                                    sql = sql & ",:ORA_1"
                                    '***
                                    sql = sql & ",:ORA_2"
                                    '***
                                    sql = sql & ",:ORA_3"
                                    '***
                                    sql = sql & ",:ORA_4"
                                    '***
                                    sql = sql & ",:ORA_ERR); END;"
                                    ReDim w_orapara(3, 4)
                                    w_orapara(0, 0) = w_kcode
                                    w_orapara(1, 0) = "101"
                                    w_orapara(0, 1) = SessionAsStr("SG_P_RID")
                                    w_orapara(1, 1) = "2"
                                    w_orapara(0, 2) = w_idosen(0)
                                    w_orapara(1, 2) = "2"
                                    w_orapara(0, 3) = w_idosen(1)
                                    w_orapara(1, 3) = "2"
                                    w_orapara(0, 4) = w_idosen(2)
                                    w_orapara(1, 4) = "2"
                                    If P000S011.FNCG_P_SPEXECUTE1(1, sql, w_orapara, w_err, "") = False Then
                                    End If
                                    If w_err < 0 Then
                                        '*** ﾗﾍﾞﾙ(23)："対象者取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 DBOBJ=WEB_SP3012210_S ID=1)<BR>"
                                        PE_ComVars.Instance.w_errtext = w_langmsg(0, 23)
                                        If w_skbn = "3" Then
                                            P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                        Else
                                            P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                        End If
                                        Response.End()
                                    End If
                                    If w_tkflg = "2" Then
                                        '*** 異動表
                                        sql = "SELECT B.EMP_CODE,0,B.STATING_POINT_ID ||B.CONTINUATION_ID,B.IDENTIFIER,B.TRANSFER_KIND,B.FIX_FLAG"
                                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3011110_M B"
                                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3011030_M A"
                                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO C"
                                        sql = sql & " WHERE A.KAISYACD = :ORA_0"
                                        sql = sql & "   AND A.PROCESS_ID = :ORA_1"
                                        sql = sql & "   AND A.KAISYACD = B.KAISYACD"
                                        sql = sql & "   AND A.PROCESS_ID = B.PROCESS_ID"
                                        sql = sql & "   AND A.STATING_POINT_ID = B.STATING_POINT_ID"
                                        sql = sql & "   AND A.CONTINUATION_ID = B.CONTINUATION_ID"
                                        sql = sql & "   AND B.PLAN_ID(+) = :ORA_2"
                                        sql = sql & "   AND (A.PLAN_ID = 0 OR A.PLAN_ID = :ORA_2)"
                                        If w_idosen(2) = "-1" Then
                                            sql = sql & " AND A.CLS_ID Is Null"
                                        ElseIf w_idosen(2) = "0" Then
                                        Else
                                            sql = sql & " AND A.CLS_ID = :ORA_3"
                                        End If
                                        sql = sql & "   AND B.EMP_CODE = C.EMP_CODE"
                                        sql = sql & " ORDER BY C.SYAINCD"
                                        ReDim w_orapara(2, 3)
                                        w_orapara(0, 0) = w_kcode
                                        w_orapara(1, 0) = "101"
                                        w_orapara(0, 1) = w_idosen(0)
                                        w_orapara(1, 1) = "2"
                                        w_orapara(0, 2) = w_idosen(1)
                                        w_orapara(1, 2) = "2"
                                        w_orapara(0, 3) = w_idosen(2)
                                        w_orapara(1, 3) = "2"
                                        If P000S011.FNCG_P_RECORDSET5(6, sql, w_orapara, w_scd) = True Then
                                        End If
                                        Session.Add("SL_P001M004_SCD", w_scd)
                                        Session.Add("SL_P001M016_BUTTON", "1")
                                        Session.Add("SL_P001M004_SIDX", 0)
                                    ElseIf w_tkflg = "3" Then
                                        sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP3012220_S("
                                        sql = sql & " :ORA_0"
                                        '***
                                        sql = sql & ",:ORA_1"
                                        '***
                                        sql = sql & ",:ORA_2"
                                        '***
                                        sql = sql & ",:ORA_3"
                                        '***
                                        sql = sql & ",:ORA_4"
                                        '***
                                        sql = sql & ",:ORA_ERR); END;"
                                        ReDim w_orapara(3, 4)
                                        w_orapara(0, 0) = w_kcode
                                        w_orapara(1, 0) = "101"
                                        w_orapara(0, 1) = SessionAsStr("SG_P_RID")
                                        w_orapara(1, 1) = "2"
                                        w_orapara(0, 2) = w_idosen(0)
                                        w_orapara(1, 2) = "2"
                                        w_orapara(0, 3) = w_idosen(1)
                                        w_orapara(1, 3) = "2"
                                        w_orapara(0, 4) = w_idosen(2)
                                        w_orapara(1, 4) = "2"
                                        If P000S011.FNCG_P_SPEXECUTE1(1, sql, w_orapara, w_err, "") = False Then
                                        End If
                                        If w_err < 0 Then
                                            '*** ﾗﾍﾞﾙ(24)："対象者取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 DBOBJ=WEB_SP3012220_S ID=1)<BR>"
                                            PE_ComVars.Instance.w_errtext = w_langmsg(0, 24)
                                            If w_skbn = "3" Then
                                                P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                            Else
                                                P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                            End If
                                            Response.End()
                                        End If
                                        sql = "SELECT A.EMP_CODE,0"
                                        sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " A"
                                        sql = sql & "     , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                        sql = sql & " WHERE A.EMP_CODE = B.EMP_CODE"
                                        sql = sql & " ORDER BY B.SYAINCD"
                                        If P000S011.FNCG_P_RECORDSET1(2, sql, w_scd) = True Then
                                        End If
                                        Session.Add("SL_P001M004_SCD", w_scd)
                                        Session.Add("SL_P001M016_BUTTON", "1")
                                        Session.Add("SL_P001M004_SIDX", 0)
                                        sql = "SELECT "
                                        sql = sql & " A.NEW_DEPT_DISP_ORDER"
                                        sql = sql & ",A.NEW_EMP_DISP_ORDER"
                                        sql = sql & ",A.NEW_DEPT_RANK || '||' || A.NEW_DEPT_CODE"
                                        sql = sql & ",A.CURRENT_DEPT_DISP_ORDER"
                                        sql = sql & ",A.CURRENT_EMP_DISP_ORDER"
                                        sql = sql & ",A.CURRENT_DEPT_RANK || '||' || A.CURRENT_DEPT_CODE"
                                        sql = sql & ",A.TRANSFER_FLAG"
                                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3012210_W A"
                                        sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                        sql = sql & " WHERE A.CUSTOMER_ID=" & SessionAsStr("SG_P_RID")
                                        sql = sql & "   AND A.EMP_CODE = B.EMP_CODE"
                                        sql = sql & " ORDER BY B.SYAINCD,A.TRANSFER_FLAG"
                                        'sql = sql & " ORDER BY A.社員コード,A.異動フラグ"
                                        If P000S011.FNCG_P_RECORDSET1(7, sql, w_idosenscd) = True Then
                                        End If
                                        sql = "SELECT ISSUE_DATE"
                                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3011010_M "
                                        sql = sql & " WHERE KAISYACD=:ORA_1"
                                        sql = sql & "   AND PROCESS_ID = :ORA_0"
                                        ReDim w_orapara(2, 1)
                                        w_orapara(0, 0) = w_idosen(0)
                                        w_orapara(1, 0) = "2"
                                        w_orapara(0, 1) = w_kcode
                                        w_orapara(1, 1) = "101"
                                        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                                            '*** ﾗﾍﾞﾙ(25)："対象データが存在しません。<BR>"
                                            PE_ComVars.Instance.w_errtext = w_langmsg(0, 25)
                                            If w_skbn = "3" Then
                                                P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                                            Else
                                                P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                            End If
                                            Response.End()
                                        Else
                                            w_hrday = w_dbdata(0, 0)
                                        End If
                                    Else
                                        '*** 辞令書(通常)
                                        sql = "SELECT A.EMP_CODE,0"
                                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " A"
                                        sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                        sql = sql & " WHERE A.EMP_CODE = B.EMP_CODE"
                                        sql = sql & " ORDER BY B.SYAINCD"
                                        If P000S011.FNCG_P_RECORDSET1(2, sql, w_scd) = True Then
                                        End If
                                        Session.Add("SL_P001M004_SCD", w_scd)
                                        Session.Add("SL_P001M016_BUTTON", "1")
                                        Session.Add("SL_P001M004_SIDX", 0)
                                    End If
                                Case "6"
                                    '*** 発令処理(302)
                                    w_title = "発令処理帳票発行"
                                    sql = "SELECT A.EMP_CODE,0"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " A"
                                    sql = sql & "    , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                    sql = sql & " WHERE A.EMP_CODE = B.EMP_CODE"
                                    sql = sql & " ORDER BY B.SYAINCD"
                                    If P000S011.FNCG_P_RECORDSET1(3, sql, w_scd) = True Then
                                    End If
                                    Session.Add("SL_P001M004_SCD", w_scd)
                                    Session.Add("SL_P001M016_BUTTON", "1")
                                    Session.Add("SL_P001M004_SIDX", 0)
                                    w_kjday = w_printinf(2)
                                Case "7"
                                    '*** 発令処理(303)
                                    '*** ﾗﾍﾞﾙ(26)："発令処理帳票発行"
                                    w_title = w_langmsg(0, 26)
                                    sql = "SELECT EMP_CODE,0,JOINKEY,DISP_ORDER,TO_CHAR(ISSUE_ISSUE_DATE,'YYYY/MM/DD')"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                                    sql = sql & " ORDER BY DISP_ORDER"
                                    If P000S011.FNCG_P_RECORDSET1(5, sql, w_scd) = True Then
                                    End If
                                    Session.Add("SL_P001M004_SCD", w_scd)
                                    Session.Add("SL_P001M016_BUTTON", "1")
                                    Session.Add("SL_P001M004_SIDX", 0)
                                Case "8"
                                    '*** 研修検定管理
                                    '*** ﾗﾍﾞﾙ(27)："研修検定管理帳票発行"
                                    w_title = w_langmsg(0, 27)
                                    sql = "SELECT EMP_CODE,0,JOINKEY,DISP_ORDER"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                                    sql = sql & " ORDER BY DISP_ORDER"
                                    If P000S011.FNCG_P_RECORDSET1(4, sql, w_scd) = True Then
                                    End If
                                    Session.Add("SL_P001M004_SCD", w_scd)
                                    Session.Add("SL_P001M016_BUTTON", "1")
                                    Session.Add("SL_P001M004_SIDX", 0)
                            End Select
                    End Select
            End Select
        Case "11"
            Select Case w_gmode
                Case "1"
                    Select Case w_gsmode
                        Case "6"
                            '*** 発令処理
                            w_title = ""
                            w_kinou = w_printinf(0)
                            w_kjday = w_printinf(2)
                            sql = "SELECT EMP_CODE,0"
                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                            sql = sql & " ORDER BY EMP_CODE"
                            If P000S011.FNCG_P_RECORDSET1(2, sql, w_scd) = False Then
                                PE_ComVars.Instance.w_errtext = "対象データが存在しません。<BR>"
                                P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                                Response.End()
                            End If
                            Session.Add("SL_P001M004_SCD", w_scd)
                            Session.Add("SL_P001M016_BUTTON", "1")
                            Session.Add("SL_P001M004_SIDX", 0)
                    End Select
            End Select
    End Select
    '**********************************************************************
    '*    ログ条件の取得
    '**********************************************************************
    Select Case w_skbn
        Case "1", "2"
            '*** 任意選択
            Select Case w_gmode
                Case "1"
                    Select Case w_kinou
                        Case "120"
                            '*** 人材育成
                        Case "210"
                            '*** 昇降格
                        Case Else
                            Select Case w_gsmode
                                Case "1"
                                    '*** 通常
                                    w_logkkbn = "1"
                                    w_logsyrno = "2"
                                    P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
                                    w_logmsg = w_logmsg & "、"
                                    P000S017.FNCG_P_GETLOGNAME("100", "0", w_kcode, "", w_logmsg)
                                    'P000S057.FNCG_P_KENSAKULOG("1", "", w_kensaku)
                                    'w_logmsg = w_logmsg & "、検索条件:" & w_kensaku
                                Case "2"
                                    '*** 異動
                                Case "3"
                                    '*** 考課
                                    w_logkkbn = "200"
                                    w_logsyrno = "80"
                                    P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
                                    w_logmsg = w_logmsg & "、"
                                    P000S017.FNCG_P_GETLOGNAME("100", "0", w_kcode, "", w_logmsg)
                                    If w_kouka(0) = "1111" Then
                                        w_logmsg = w_logmsg & "、考課パターン:全て"
                                    Else
                                        sql = "SELECT A.EVAL_PATTERN"
                                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "EVAL_PATTERN A"
                                        sql = sql & " WHERE A.KAISYACD = :ORA_0"
                                        sql = sql & "   AND A.CODE_VALUE     = :ORA_1"
                                        ReDim w_orapara(2, 1)
                                        w_orapara(0, 0) = w_kcode
                                        w_orapara(1, 0) = "101"
                                        w_orapara(0, 1) = w_kouka(0)
                                        w_orapara(1, 1) = "1"
                                        If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, w_dbdata) = False Then
                                            ReDim w_dbdata(0, 0)
                                        End If
                                        w_logmsg = w_logmsg & "、考課パターン:" & w_dbdata(0, 0)
                                    End If
                                    sql = "SELECT A.NAME"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP2000010 A"
                                    sql = sql & " WHERE A.KAISYACD = :ORA_0"
                                    sql = sql & "   AND A.CODE_VALUE     = :ORA_1"
                                    ReDim w_orapara(2, 1)
                                    w_orapara(0, 0) = w_kcode
                                    w_orapara(1, 0) = "101"
                                    w_orapara(0, 1) = w_kouka(1)
                                    w_orapara(1, 1) = "1"
                                    If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                                        ReDim w_dbdata(0, 0)
                                    End If
                                    w_logmsg = w_logmsg & "、考課時期:" & w_dbdata(0, 0)
                                    If w_kouka(0) <> "1111" Then
                                        w_logmsg = w_logmsg & "、昇級時期:" & w_kouka(3)
                                    End If
                                    Select Case w_kouka(4)
                                        Case "1"
                                            w_logmsg = w_logmsg & "、対象者:全" & SessionAsStrArray("SG_P_SYSTEM")(7)
                                        Case "2"
                                            P000S057.FNCG_P_KENSAKULOG("200", "", w_kensaku)
                                            w_logmsg = w_logmsg & "、対象者:検索条件(" & w_kensaku & ")"
                                    End Select
                                    Select Case w_kouka(10)
                                        Case "1"
                                            w_logmsg = w_logmsg & "、考課存在者のみを対象:しない"
                                        Case "2"
                                            w_logmsg = w_logmsg & "、考課存在者のみを対象:する"
                                    End Select
                            End Select
                    End Select
                Case "2"
                    '*** 採用
                    w_logkkbn = "400"
                    w_logsyrno = "40"
                    P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
                    w_logmsg = w_logmsg & "、"
                    P000S017.FNCG_P_GETLOGNAME("100", "0", w_kcode, "", w_logmsg)
                    Select Case SessionAsStrArray("SL_P400_INF14")(14)
                        Case "0"
                            '*** 簡易
                            w_logmsg = w_logmsg & "、対象者：簡易"
                            If Not IsNull(SessionAsStrArray("SL_P400_INF14")(15)) OrElse Not IsNull(SessionAsStrArray("SL_P400_INF14")(16)) Then
                                w_logmsg = w_logmsg & "(" & SessionAsStrArray("SL_P400_INF14")(15) & "～" & SessionAsStrArray("SL_P400_INF14")(16) & ")"
                            End If
                        Case "1"
                            '*** 詳細
                            P000S057.FNCG_P_KENSAKULOG("400", "", w_kensaku)
                            w_logmsg = w_logmsg & "、対象者：詳細(" & w_kensaku & ")"
                    End Select
            End Select
        Case "3"
            '*** 固定帳票
            sql = "SELECT REPORT_NAME"
            sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062010_M A"
            sql = sql & " WHERE A.KAISYACD = :ORA_0"
            sql = sql & "   AND A.FUNCTION_DIV   = :ORA_1"
            sql = sql & "   AND A.REPORT_DIV   = :ORA_2"
            ReDim w_orapara(2, 2)
            w_orapara(0, 0) = w_kcode
            w_orapara(1, 0) = "101"
            If w_gmode = "1" AndAlso w_gsmode = "1" Then
                w_orapara(0, 1) = "1"
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = SessionAsStrArray("SL_P001M013_KINOU")(1)
                w_orapara(1, 2) = "2"
            Else
                w_orapara(0, 1) = w_printinf(0)
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = w_printinf(1)
                w_orapara(1, 2) = "2"
            End If
            If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                w_rptname = w_dbdata(0, 0)
            End If
            Select Case w_gmode
                Case "1"
                    Select Case w_kinou
                        Case "120"
                            '*** 人材育成
                        Case "210"
                            '*** 昇降格
                            w_logkkbn = "210"
                            w_logsyrno = "50"
                            P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
                            w_logmsg = w_logmsg & "、"
                            P000S017.FNCG_P_GETLOGNAME("100", "0", w_kcode, "", w_logmsg)
                            w_logmsg = w_logmsg & "、帳票名：" & w_rptname
                        Case Else
                            Select Case w_gsmode
                                Case "1"
                                    '*** 通常
                                    w_logkkbn = "1"
                                    w_logsyrno = "4"
                                    P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
                                    w_logmsg = w_logmsg & "、"
                                    P000S017.FNCG_P_GETLOGNAME("100", "0", w_kcode, "", w_logmsg)
                                    w_logmsg = w_logmsg & "、帳票名：" & w_rptname
                                    'P000S057.FNCG_P_KENSAKULOG("1","",w_kensaku)
                                    'w_logmsg = w_logmsg & "、検索条件:" & w_kensaku
                                Case "2"
                                    '*** 異動
                                    w_logkkbn = "300"
                                    w_logsyrno = "20"
                                    P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
                                    w_logmsg = w_logmsg & "、"
                                    P000S017.FNCG_P_GETLOGNAME("100", "0", w_kcode, "", w_logmsg)
                                    w_logmsg = w_logmsg & "、帳票名：" & w_rptname
                                    sql = "SELECT A.NAME"
                                    '*** 0 履歴名称
                                    sql = sql & ",B.NAME"
                                    '*** 1 案名称
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3000110_M A"
                                    sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3000200_T B"
                                    sql = sql & " WHERE A.KAISYACD = :ORA_0"
                                    sql = sql & "   AND A.PROCESS_ID   = :ORA_1"
                                    sql = sql & "   AND A.KAISYACD = B.KAISYACD"
                                    sql = sql & "   AND A.PROCESS_ID   = B.PROCESS_ID"
                                    sql = sql & "   AND B.OPEN_ID   = :ORA_2"
                                    sql = sql & "   AND B.PLAN_ID     = :ORA_3"
                                    ReDim w_orapara(2, 3)
                                    w_orapara(0, 0) = w_kcode
                                    w_orapara(1, 0) = "101"
                                    w_orapara(0, 1) = w_ido(0)
                                    w_orapara(1, 1) = "2"
                                    w_orapara(0, 2) = w_ido(1)
                                    w_orapara(1, 2) = "2"
                                    w_orapara(0, 3) = w_ido(2)
                                    w_orapara(1, 3) = "2"
                                    If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, w_dbdata) = True Then
                                        w_logmsg = w_logmsg & "、履歴名称：" & w_dbdata(0, 0)
                                        w_logmsg = w_logmsg & "、案名称：" & w_dbdata(1, 0)
                                    End If
                                    If w_ido(3) <> "00000000000" Then
                                        w_logmsg = w_logmsg & "、異動昇格対象："
                                        For w_i = 1 To GetLength(w_ido(3))
                                            If Mid(w_ido(3), w_i, 1) = "1" Then
                                                Select Case w_i
                                                    Case 1
                                                        '*** 本務異動
                                                        w_logmsg = w_logmsg & "本務異動・"
                                                    Case 2
                                                        '*** 兼務異動
                                                        w_logmsg = w_logmsg & "兼務異動・"
                                                    Case 3
                                                        '*** 兼務解除
                                                        w_logmsg = w_logmsg & "兼務解除・"
                                                    Case 4
                                                        '*** 社員区分
                                                        w_logmsg = w_logmsg & w_fname(0) & "・"
                                                    Case 5
                                                        '*** 役職
                                                        w_logmsg = w_logmsg & w_fname(1) & "・"
                                                    Case 6
                                                        '*** 職級
                                                        w_logmsg = w_logmsg & w_fname(2) & "・"
                                                    Case 7
                                                        '*** 社内資格
                                                        w_logmsg = w_logmsg & w_fname(3) & "・"
                                                    Case 8
                                                        '*** 職掌・職種
                                                        w_logmsg = w_logmsg & w_fname(4) & w_fname(5) & "・"
                                                    Case 9
                                                        '*** 職能給号級
                                                        w_logmsg = w_logmsg & w_fname(7) & "・"
                                                    Case 10
                                                        '*** 本給号級
                                                        w_logmsg = w_logmsg & w_fname(6) & "・"
                                                    Case 11
                                                        '*** 事業所
                                                        w_logmsg = w_logmsg & "事業所・"
                                                End Select
                                            End If
                                        Next
                                    End If
                                    sql = "SELECT"
                                    sql = sql & " A.BELONG_NAME"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS A"
                                    sql = sql & " WHERE A.KAISYACD = :ORA_0"
                                    sql = sql & "   AND A.RANK     = :ORA_1"
                                    sql = sql & "   AND A.CODE_VALUE     = :ORA_2"
                                    ReDim w_orapara(2, 2)
                                    w_orapara(0, 0) = w_kcode
                                    w_orapara(1, 0) = "101"
                                    w_orapara(0, 1) = VBSplit(w_ido(4), "-", -1, 0)(0)
                                    w_orapara(1, 1) = "2"
                                    w_orapara(0, 2) = VBSplit(w_ido(4), "-", -1, 0)(1)
                                    w_orapara(1, 2) = "2"
                                    If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                                        w_logmsg = w_logmsg & "、対象部署：" & w_dbdata(0, 0)
                                    Else
                                        w_logmsg = w_logmsg & "、対象部署：全部署を対象"
                                    End If
                                Case "3"
                                    '*** 考課
                                    Select Case w_printinf(1)
                                        Case "1"
                                            '*** 部署別考課結果一覧表(最終考課)
                                            w_logkkbn = "200"
                                            w_logsyrno = "110"
                                        Case "2"
                                            '*** 部署別考課結果一覧表(確定考課)
                                            w_logkkbn = "200"
                                            w_logsyrno = "120"
                                        Case "3"
                                            '*** 部署別考課平均一覧表
                                            w_logkkbn = "200"
                                            w_logsyrno = "130"
                                        Case "101"
                                            '*** 異動文書
                                            w_logkkbn = "200"
                                            w_logsyrno = "90"
                                        Case "102"
                                            '*** 更改通知表
                                            w_logkkbn = "200"
                                            w_logsyrno = "100"
                                    End Select
                                    P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
                                    w_logmsg = w_logmsg & "、"
                                    P000S017.FNCG_P_GETLOGNAME("100", "0", w_kcode, "", w_logmsg)
                                    w_logmsg = w_logmsg & "、帳票名：" & w_rptname
                                    Select Case w_printinf(1)
                                        Case "1", "2", "3"
                                            '*** 部署別考課結果一覧表(最終考課)・部署別考課結果一覧表(確定考課)・部署別考課平均一覧表
                                            sql = "SELECT A.EVAL_PATTERN"
                                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "EVAL_PATTERN A"
                                            sql = sql & " WHERE A.KAISYACD = :ORA_0"
                                            sql = sql & "   AND A.CODE_VALUE     = :ORA_1"
                                            ReDim w_orapara(2, 1)
                                            w_orapara(0, 0) = w_kcode
                                            w_orapara(1, 0) = "101"
                                            w_orapara(0, 1) = w_kouka(1)
                                            w_orapara(1, 1) = "1"
                                            If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, w_dbdata) = False Then
                                                ReDim w_dbdata(0, 0)
                                            End If
                                            w_logmsg = w_logmsg & "、考課パターン:" & w_dbdata(0, 0)
                                            sql = "SELECT A.NAME"
                                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_VP2000010 A"
                                            sql = sql & " WHERE A.KAISYACD = :ORA_0"
                                            sql = sql & "   AND A.CODE_VALUE     = :ORA_1"
                                            ReDim w_orapara(2, 1)
                                            w_orapara(0, 0) = w_kcode
                                            w_orapara(1, 0) = "101"
                                            w_orapara(0, 1) = w_kouka(2)
                                            w_orapara(1, 1) = "1"
                                            If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
                                                ReDim w_dbdata(0, 0)
                                            End If
                                            w_logmsg = w_logmsg & "、考課時期:" & w_dbdata(0, 0)
                                            w_logmsg = w_logmsg & "、昇級日付:" & w_printinf(2)
                                            Select Case w_kouka(3)
                                                Case "1"
                                                    w_logmsg = w_logmsg & "、対象者:全" & SessionAsStrArray("SG_P_SYSTEM")(7)
                                                Case "2"
                                                    P000S057.FNCG_P_KENSAKULOG("200", "", w_kensaku)
                                                    w_logmsg = w_logmsg & "、対象者:検索条件(" & w_kensaku & ")"
                                            End Select
                                            Select Case w_kouka(4)
                                                Case "1"
                                                    w_logmsg = w_logmsg & "、未入力" & SessionAsStrArray("SG_P_SYSTEM")(7) & ":含む"
                                                Case "2"
                                                    w_logmsg = w_logmsg & "、未入力" & SessionAsStrArray("SG_P_SYSTEM")(7) & ":含まない"
                                            End Select
                                        Case "101", "102"
                                            '*** 異動文書・更改通知表
                                            w_logmsg = w_logmsg & "、発令日:" & w_printinf(2)
                                            Select Case w_kouka(2)
                                                Case "1"
                                                    w_logmsg = w_logmsg & "、対象者:全" & SessionAsStrArray("SG_P_SYSTEM")(7)
                                                Case "2"
                                                    P000S057.FNCG_P_KENSAKULOG("200", "", w_kensaku)
                                                    w_logmsg = w_logmsg & "、対象者:検索条件(" & w_kensaku & ")"
                                            End Select
                                    End Select
                                Case "5"
                                    '*** 異動線
                                    w_logkkbn = "301"
                                    w_logsyrno = "30"
                                    P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
                                    w_logmsg = w_logmsg & "、"
                                    P000S017.FNCG_P_GETLOGNAME("100", "0", w_kcode, "", w_logmsg)
                                    w_logmsg = w_logmsg & "、帳票名：" & w_rptname
                                    sql = "SELECT A.NAME"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3011010_M A"
                                    sql = sql & " WHERE A.KAISYACD = :ORA_0"
                                    sql = sql & "   AND A.PROCESS_ID   = :ORA_1"
                                    ReDim w_orapara(2, 1)
                                    w_orapara(0, 0) = w_kcode
                                    w_orapara(1, 0) = "101"
                                    w_orapara(0, 1) = w_idosen(0)
                                    w_orapara(1, 1) = "2"
                                    If P000S011.FNCG_P_RECORDSET5(3, sql, w_orapara, w_dbdata) = False Then
                                        ReDim w_dbdata(0, 0)
                                    End If
                                    w_logmsg = w_logmsg & "、履歴名称：" & w_dbdata(0, 0)
                                    sql = "SELECT NAME"
                                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3011020_M"
                                    sql = sql & " WHERE KAISYACD    = :ORA_0"
                                    sql = sql & "   AND PROCESS_ID    = :ORA_1"
                                    sql = sql & "   AND PLAN_ID        = :ORA_2"
                                    ReDim w_orapara(2, 2)
                                    w_orapara(0, 0) = w_kcode
                                    w_orapara(1, 0) = "101"
                                    w_orapara(0, 1) = w_idosen(0)
                                    w_orapara(1, 1) = "2"
                                    w_orapara(0, 2) = w_idosen(1)
                                    w_orapara(1, 2) = "2"
                                    If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, w_dbdata) = False Then
                                        ReDim w_dbdata(0, 0)
                                    End If
                                    w_logmsg = w_logmsg & "、異動案：" & w_dbdata(0, 0)
                                    Select Case w_idosen(2)
                                        Case "0"
                                            w_logmsg = w_logmsg & "、グループ選択：全て"
                                        Case "-1"
                                            w_logmsg = w_logmsg & "、グループ選択：未選択"
                                        Case Else
                                            sql = "SELECT A.CLS_NAME"
                                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3011060_M A"
                                            sql = sql & " WHERE A.KAISYACD = :ORA_0"
                                            sql = sql & "   AND A.PROCESS_ID   = :ORA_1"
                                            sql = sql & "   AND A.CLS_ID   = :ORA_2"
                                            ReDim w_orapara(2, 2)
                                            w_orapara(0, 0) = w_kcode
                                            w_orapara(1, 0) = "101"
                                            w_orapara(0, 1) = w_idosen(0)
                                            w_orapara(1, 1) = "2"
                                            w_orapara(0, 2) = w_idosen(2)
                                            w_orapara(1, 2) = "2"
                                            If P000S011.FNCG_P_RECORDSET5(2, sql, w_orapara, w_dbdata) = False Then
                                                ReDim w_dbdata(0, 0)
                                            End If
                                            w_logmsg = w_logmsg & "、グループ選択：" & w_dbdata(0, 0)
                                    End Select
                            End Select
                    End Select
                Case "2"
                    '*** 採用
                    w_logkkbn = "400"
                    w_logsyrno = "50"
                    P000S057.FNCG_P_SYORI_NAMEGET(w_logkkbn, w_logsyrno, w_logmsg)
                    w_logmsg = w_logmsg & "、"
                    P000S017.FNCG_P_GETLOGNAME("100", "0", w_kcode, "", w_logmsg)
                    w_logmsg = w_logmsg & "、帳票名：" & w_rptname
                    Select Case SessionAsStrArray("SL_P400_INF14")(14)
                        Case "0"
                            '*** 簡易
                            w_logmsg = w_logmsg & "、対象者：簡易"
                            If Not IsNull(SessionAsStrArray("SL_P400_INF14")(15)) OrElse Not IsNull(SessionAsStrArray("SL_P400_INF14")(16)) Then
                                w_logmsg = w_logmsg & "(" & SessionAsStrArray("SL_P400_INF14")(15) & "～" & SessionAsStrArray("SL_P400_INF14")(16) & ")"
                            End If
                        Case "1"
                            '*** 詳細
                            P000S057.FNCG_P_KENSAKULOG("400", "", w_kensaku)
                            w_logmsg = w_logmsg & "、対象者：詳細(" & w_kensaku & ")"
                    End Select
            End Select
            '*** ファイル名称管理
            ReDim w_fnmdt(5, 9)
            '* (0,x)：インデックス
            '* (1,x)：ダウンロード可否（0=不可、1=可）
            '* (2,x)：ファイル名
            '* (3,x)：画面表示名
            '* (4,x)：拡張子（1=TXT、2=CSV、3=XLS、4=VBS）
            '* (5,x)：マクロ判断
            w_fnmdt(0, 0) = "0"
            w_fnmdt(1, 0) = "1"
            w_fnmdt(2, 0) = SessionAsStr("SG_P_RID") & "_SYUTURYOKU.VBS"
            w_fnmdt(3, 0) = SessionAsStr("SG_P_RID") & "_SYUTURYOKU.VBS"
            w_fnmdt(4, 0) = "4"
            w_fnmdt(5, 0) = "0"
            w_fnmdt(0, 1) = "1"
            w_fnmdt(1, 1) = "0"
            w_fnmdt(2, 1) = ""
            w_fnmdt(3, 1) = SessionAsStr("SG_P_RID") & "_SETTEI.XLS"
            w_fnmdt(4, 1) = "3"
            w_fnmdt(5, 1) = "0"
            w_fnmdt(0, 2) = "2"
            w_fnmdt(1, 2) = "0"
            w_fnmdt(2, 2) = SessionAsStr("SG_P_RID") & "_0.txt"
            w_fnmdt(3, 2) = SessionAsStr("SG_P_RID") & "_KIJUN.TXT"
            w_fnmdt(4, 2) = "1"
            w_fnmdt(5, 2) = "0"
            w_fnmdt(0, 3) = "3"
            w_fnmdt(1, 3) = "0"
            w_fnmdt(2, 3) = SessionAsStr("SG_P_RID") & ".txt"
            w_fnmdt(3, 3) = SessionAsStr("SG_P_RID") & "_DATA.TXT"
            w_fnmdt(4, 3) = "1"
            w_fnmdt(5, 3) = "0"
            w_fnmdt(0, 4) = "4"
            w_fnmdt(1, 4) = "0"
            w_fnmdt(2, 4) = SessionAsStr("SG_P_RID") & "_1.txt"
            w_fnmdt(3, 4) = SessionAsStr("SG_P_RID") & "_PARA.TXT"
            w_fnmdt(4, 4) = "1"
            w_fnmdt(5, 4) = "0"
            w_fnmdt(0, 5) = "5"
            w_fnmdt(1, 5) = "0"
            w_fnmdt(2, 5) = SessionAsStr("SG_P_RID") & "_301.TXT"
            w_fnmdt(3, 5) = SessionAsStr("SG_P_RID") & "_ID_DATA.TXT"
            w_fnmdt(4, 5) = "1"
            w_fnmdt(5, 5) = "0"
            w_fnmdt(0, 6) = "6"
            w_fnmdt(1, 6) = "0"
            w_fnmdt(2, 6) = SessionAsStr("SG_P_RID") & "_302.TXT"
            w_fnmdt(3, 6) = SessionAsStr("SG_P_RID") & "_ID_SORT.TXT"
            w_fnmdt(4, 6) = "1"
            w_fnmdt(5, 6) = "0"
            w_fnmdt(0, 7) = "7"
            w_fnmdt(1, 7) = "0"
            w_fnmdt(2, 7) = SessionAsStr("SG_P_RID") & "_KITEN.CSV"
            w_fnmdt(3, 7) = SessionAsStr("SG_P_RID") & "_KITEN.CSV"
            w_fnmdt(4, 7) = "2"
            w_fnmdt(5, 7) = "0"
            w_fnmdt(0, 8) = "8"
            w_fnmdt(1, 8) = "1"
            w_fnmdt(2, 8) = ""
            w_fnmdt(3, 8) = SessionAsStr("SG_P_RID") & "_GAMEN.XLS"
            w_fnmdt(4, 8) = "3"
            w_fnmdt(5, 8) = "0"
            w_fnmdt(0, 9) = "9"
            w_fnmdt(1, 9) = "0"
            w_fnmdt(2, 9) = ""
            w_fnmdt(3, 9) = SessionAsStr("SG_P_RID") & "_JYOKEN.XLS"
            w_fnmdt(4, 9) = "3"
            w_fnmdt(5, 9) = "0"
            Session.Add("SL_P001M404_FNM", w_fnmdt)
    End Select
    Select Case w_skbn
        Case "1"
            w_outid = SessionAsStrArray("SL_P001M311_ID")
            w_hozonid = VBSplit(w_outid(0), "|||", -1, 0)
            sql = "SELECT DISP_FORM,SINGLE_DISP_CONF,UNIT_DISP_CONF"
            If w_gmode = "1" Then
                '*** 通常
                sql = sql & " FROM  " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010210_T "
            Else
                '*** 採用
                sql = sql & " FROM  " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP4001110_T "
            End If
            sql = sql & " WHERE KAISYACD = :ORA_3"
            If w_hozonid(0) = "1" Then
                sql = sql & "   AND CREATOR_CODE = :ORA_0"
            Else
                sql = sql & "   AND CREATOR_CODE = :ORA_1"
            End If
            sql = sql & "   AND IDENTIFIER = :ORA_2"
            ReDim w_orapara(2, 3)
            w_orapara(0, 0) = "-1"
            w_orapara(1, 0) = "0"
            w_orapara(0, 1) = SessionAsStr("SG_P_SID")
            w_orapara(1, 1) = "0"
            w_orapara(0, 2) = w_hozonid(1)
            w_orapara(1, 2) = "2"
            w_orapara(0, 3) = w_kcd
            w_orapara(1, 3) = "101"
            If P000S011.FNCG_P_RECORDSET5(3, sql, w_orapara, w_dbdata) = True Then
                w_outfmt = w_dbdata(0, 0)
                w_outset = w_dbdata(1, 0)
                w_outtan = w_dbdata(2, 0)
            End If
        Case "2"
            w_outfmt = SessionAsStrArray("SL_P001M301_KEY")(4)
            w_outset = SessionAsStrArray("SL_P001M301_KEY")(5)
            w_outtan = SessionAsStrArray("SL_P001M301_KEY")(9)
            w_outid = SessionAsStrArray("SL_P001M311_ID")
        Case "3"
            w_irei = "0"
            w_outfmt = "2"
            w_outset = "1"
            w_outtan = "1"
            Select Case w_gmode
                Case "1"
                    Select Case w_gsmode
                        Case "2"
                            '*** 異動
                            w_outset = "2"
                            w_irei = w_printinf(4)
                            w_syori = w_ido(0)
                        Case "3"
                            '*** 考課
                            w_irei = w_printinf(4)
                        Case "5"
                            '*** 異動線
                            w_syori = w_idosen(0)
                    End Select
            End Select
            If w_irei = "1" Then
                '******************************************************************
                '* 開始ログ出力
                '******************************************************************
                Session.Add("PSSO_OPERATIONNO", CDbl(SessionAsStr("PSSO_OPERATIONNO")) + 1)
                POCOM001.POCOM_ProcessStart(w_logmsg, "P000-00136", DBOBJ, "")
                If FNCL_P_IREICSVMAKE(w_printinf, w_cate_wk, PE_ComVars.Instance.w_errtext) = 1 Then
                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                    Response.End()
                End If
                ReDim w_log3(0)
                ReDim w_log4(0)
                ReDim w_log5(0)
                w_log3(0) = "出力カテゴリ"
                w_log4(0) = "1"
                w_log5(0) = "出力項目"
                '**************************************************************
                '* 終了ログ出力
                '**************************************************************
                POCOM001.POCOM_DataOutComplete(w_logmsg, CInt(w_logcnt), w_log3, w_log4, w_log5, "P000-00137", DBOBJ, "")
                Session.Add("SG_P_EXCELOUTPUT", New Object() {"2", w_cate_wk, w_logmsg, w_logcnt, w_log3, w_log4, w_log5, w_logkkbn, w_logsyrno})
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
                Response.Redirect("P001M401.aspx")
                Response.End()
            End If
        Case "4"
            w_outfmt = "2"
            w_outset = "1"
            w_outtan = "1"
        Case "11"
            ReDim w_outid(1)
            w_outid(0) = w_printinf(1)
            sql = "SELECT"
            sql = sql & "          '2' As DISP_FORM"
            '*** (0)
            sql = sql & "         ,SINGLE_DISP_CONF"
            '*** (1)
            sql = sql & "         ,UNIT_DISP_CONF"
            '*** (2)
            sql = sql & " FROM   " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062820_T "
            sql = sql & " WHERE    KAISYACD = :ORA_3"
            sql = sql & "   AND    FUNCTION_DIV = :ORA_0"
            sql = sql & "   AND    SCREEN_NUMBER = :ORA_1"
            sql = sql & "   AND    MANAGEMENT_NUMBER = :ORA_2"
            ReDim w_orapara(2, 3)
            w_orapara(0, 0) = w_printinf(0)
            w_orapara(1, 0) = "2"
            w_orapara(0, 1) = w_printinf(1)
            w_orapara(1, 1) = "2"
            w_orapara(0, 2) = w_printinf(3)
            w_orapara(1, 2) = "2"
            w_orapara(0, 3) = w_kcode
            w_orapara(1, 3) = "101"
            If P000S011.FNCG_P_RECORDSET5(3, sql, w_orapara, w_dbdata) = True Then
                w_outfmt = w_dbdata(0, 0)
                w_outset = w_dbdata(1, 0)
                w_outtan = w_dbdata(2, 0)
            Else
                w_outfmt = "2"
                '* 出力表示形式(2:表形式(横))
                w_outset = "2"
                '* 1:単一項目は先頭のみ,2:常に表示
                w_outtan = "1"
                '* 表示単位設定(0:表示しない,1:表示する)
            End If
    End Select
    If w_gsmode = "4" Then
        '*** 個別登録
        w_scdidx = "0"
        'Redim w_scd(1,0)
        'w_scd(0,0) = w_printinf(6)
        'w_scd(1,0) = 0
    Else
        If w_jirei = 0 Then
            w_scdidx = SessionAsStr("SL_P001M004_SIDX")
            If SessionAsStr("SL_P001M016_BUTTON") = "2" OrElse SessionAsStr("SL_P001M016_BUTTON") = "3" Then
                w_scd = SessionAsStrArray2D("SL_P001M004_SCDSRT")
            Else
                w_scd = SessionAsStrArray2D("SL_P001M004_SCD")
            End If
        Else
            w_scdidx = "0"
        End If
    End If
    Select Case w_outfmt
        Case "3", "4"
            w_min = CInt(w_scdidx)
            '** 現在対象の社員
            w_max = CInt(w_scdidx)
            '** 現在対象の社員
        Case Else
            w_min = 0
            w_max = UBound(w_scd, 2)
    End Select
    '**********************************************************************
    '*    項目情報の取得（任意選択時のみ）
    '**********************************************************************
    If Not IsNull(P000S001.FNCG_P_NZ(Request.QueryString("pidx"))) Then
        w_ctgdata = SessionAsStrArray2D("SL_P001M311_VP01")
        '*** 項目情報
    Else
        Select Case w_skbn
            Case "1", "2"
                If FNCL_P_GET_DATA(w_skbn, w_hozonid, permission) = 1 Then
                    '*** ﾗﾍﾞﾙ(28)："表示情報取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 ID=1)<BR>"
                    PE_ComVars.Instance.w_errtext = w_langmsg(0, 28)
                    P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                    Response.End()
                End If
        End Select
    End If
    '**********************************************************************
    '* 開始ログ出力
    '**********************************************************************
    Session.Add("PSSO_OPERATIONNO", CDbl(SessionAsStr("PSSO_OPERATIONNO")) + 1)
    POCOM001.POCOM_ProcessStart(w_logmsg, "P000-00136", DBOBJ, "")
    '**********************************************************************
    '*    固定帳票で発令処理（旧）時
    '**********************************************************************
    If w_skbn = "3" AndAlso w_tgsmode = "6" Then
        '******************************************************************
        '*    基準日の取得
        '******************************************************************
        ReDim w_hkjday(0, -1)
        If w_skbn = "3" Then
            If FNCL_P_GETKJDAY(w_gsmode, CInt(w_kinou), w_outid(0), w_hkjday) = 1 Then
                '*** ﾗﾍﾞﾙ(29)："基準日取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 ID=2)<BR>"
                PE_ComVars.Instance.w_errtext = w_langmsg(0, 29)
                P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                Response.End()
            End If
        End If
        If UBound(w_hkjday, 2) = -1 Then
            '** 基準日無し
            w_kjcnt = 0
            '無しでも一回は処理するように0を格納
        Else
            '** 基準日有り
            w_kjcnt = UBound(w_hkjday, 2)
        End If
        '******************************************************************
        '*    データ取得ＳＱＬの作成 & 外部データの作成処理（出力データ）
        '******************************************************************
        For w_i = 0 To w_kjcnt
            '** 基準日の設定
            If UBound(w_hkjday, 2) = -1 Then
                w_kjday = ""
            Else
                w_kjday = w_hkjday(0, w_i)
                If w_skbn = "3" Then
                    If FNCL_P_GETKJDAYSCD(w_gsmode, CInt(w_kinou), w_outid(0), w_kjday, w_scd) = 1 Then
                        '*** ﾗﾍﾞﾙ(30)："基準日対象データ取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 ID=4)<BR>"
                        PE_ComVars.Instance.w_errtext = w_langmsg(0, 30)
                        P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                        Response.End()
                    End If
                End If
                Select Case w_outfmt
                    Case "3", "4"
                    Case Else
                        w_min = 0
                        w_max = UBound(w_scd, 2)
                End Select
            End If
            '**************************************************************
            '*    表示順情報の取得（固定帳票時のみ）
            '**************************************************************
            w_sortflg = "0"
            If w_skbn = "3" Then
                If FNCL_P_SYAINSORT(w_sortflg, w_sortdata) = 1 Then
                    '*** ﾗﾍﾞﾙ(31)：SessionAsStrArray("SG_P_SYSTEM")(7) & "ソート取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 ID=5)<BR>"
                    PE_ComVars.Instance.w_errtext = P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 31), SessionAsStrArray("SG_P_SYSTEM")(7), "")
                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                    Response.End()
                End If
            End If
            '**************************************************************
            '*    データ取得ＳＱＬの作成
            '**************************************************************
            If FNCL_P_SQLMAKE(w_skbn, w_kinou, w_outid(0), w_outfmt, w_ctgdata, w_scd, w_min, w_max, w_skensu, w_cate_wk, w_printinf, w_kjday, PE_ComVars.Instance.w_errtext, permission) = 1 Then
                If w_skbn = "3" Then
                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                Else
                    P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                End If
                Response.End()
            End If
            Session.Add("SL_P001M311_VP01", w_ctgdata)
            '*** 項目情報
            If w_max = -1 Then
                '*** ﾗﾍﾞﾙ(32)："データが存在しません。<BR>"
                PE_ComVars.Instance.w_errtext = w_langmsg(0, 32)
                If w_skbn = "3" Then
                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                Else
                    P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
                End If
                Response.End()
            End If
            '/* Excelフォーマット情報は最初の一回目のみ */
            '/* (FNCL_P_SQLMAKEでw_cate_wk変数に値が連結されるので最初の一回目だけ保持しておく) */
            If w_i = 0 Then
                w_cate_wk_sv = w_cate_wk
            Else
                w_cate_wk = w_cate_wk_sv
            End If
            '**************************************************************
            '*    外部データの作成処理（出力データ）
            '**************************************************************
            FNCL_P_CSVMAKE(w_skbn, w_ctgdata, w_skensu, w_scd, w_min, w_max, w_outset, w_sortflg, w_sortdata, w_idosenscd, w_cate_wk)
            '**************************************************************
            '*    外部データファイル名称の変更 →ファイル名に基準日を付加する
            '**************************************************************
            If w_kjcnt > 0 Then
                FNCL_P_CSVNAMEUPD(w_skbn, w_kjday)
            End If
        Next
        '******************************************************************
        '*    基準日を付加した外部データを一本化する
        '******************************************************************
        If w_kjcnt > 0 Then
            FNCL_P_CSVUNION(w_skbn, w_hkjday)
        End If
        '******************************************************************
        '*    外部データの連結処理（出力データ）
        '******************************************************************
        If w_gsmode = "6" Then
            FNCL_P_CSVMAKE2(w_skbn, CInt(w_kinou), w_outid(0), w_ctgdata, w_cate_wk)
        End If
        '**********************************************************************
        '*    固定帳票で発令処理（旧）以外時
        '**********************************************************************
    Else
        '******************************************************************
        '*    表示順情報の取得（固定帳票時のみ）
        '******************************************************************
        w_sortflg = "0"
        If w_skbn = "3" Then
            If w_gsmode <> "7" AndAlso w_gsmode <> "8" Then
                If FNCL_P_SYAINSORT(w_sortflg, w_sortdata) = 1 Then
                    '*** ﾗﾍﾞﾙ(33)：SessionAsStrArray("SG_P_SYSTEM")(7) & "ソート取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 ID=2)<BR>"
                    PE_ComVars.Instance.w_errtext = P000S008.FNCG_P_SUBWORD(1, w_langmsg(0, 33), SessionAsStrArray("SG_P_SYSTEM")(7), "")
                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                    Response.End()
                End If
            End If
        End If
        '******************************************************************
        '*    データ取得ＳＱＬの作成
        '******************************************************************
        If FNCL_P_SQLMAKE(w_skbn, w_kinou, w_outid(0), w_outfmt, w_ctgdata, w_scd, w_min, w_max, w_skensu, w_cate_wk, w_printinf, w_kjday, PE_ComVars.Instance.w_errtext, permission) = 1 Then
            'w_errtext = "出力情報取得処理で<BR>エラーが発生しました。<BR>(ASPOBJ=P001M404 ID=3)<BR>"
            If w_skbn = "3" Then
                P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
            Else
                P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
            End If
            Response.End()
        End If
        Session.Add("SL_P001M311_VP01", w_ctgdata)
        '*** 項目情報
        If w_max = -1 Then
            '*** ﾗﾍﾞﾙ(34)："データが存在しません。<BR>"
            PE_ComVars.Instance.w_errtext = w_langmsg(0, 34)
            If w_skbn = "3" Then
                P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
            Else
                P000S004.SUBG_P_ERRVIEW(w_title, "1", PE_ComVars.Instance.w_errtext, "", "_self")
            End If
            Response.End()
        End If
        '******************************************************************
        '*    外部データの作成処理（出力データ）
        '******************************************************************
        FNCL_P_CSVMAKE(w_skbn, w_ctgdata, w_skensu, w_scd, w_min, w_max, w_outset, w_sortflg, w_sortdata, w_idosenscd, w_cate_wk)
    End If
    '**********************************************************************
    '*    その他外部データの作成処理（異動表の起点情報作成 特別フラグ=2）
    '**********************************************************************
    Select Case w_tkflg
        '******************************************************************
        '*    異動表の起点情報作成 （特別フラグ=2）
        '******************************************************************
        Case "2"
            If w_gsmode = "5" Then
                If FNCL_P_KITENCSVMAKE(w_idosen, PE_ComVars.Instance.w_errtext) = 1 Then
                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                    Response.End()
                End If
            End If
            '******************************************************************
            '*    入払表の情報作成 （特別フラグ=3）
            '******************************************************************
        Case "3"
            If w_gsmode = "2" OrElse w_gsmode = "5" Then
                If FNCL_P_TOKU5_CSVMAKE(w_syori, w_hrday, w_printinf, PE_ComVars.Instance.w_errtext) = 1 Then
                    '*** _301.txt
                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                    Response.End()
                End If
                If FNCL_P_TOKU6_CSVMAKE(w_printinf, PE_ComVars.Instance.w_errtext) = 1 Then
                    '*** _301.txt
                    P000S004.SUBG_P_ERRVIEWPOP(w_title, PE_ComVars.Instance.w_errtext)
                    Response.End()
                End If
            End If
    End Select
    '**********************************************************************
    '*    その他情報作成処理
    '**********************************************************************
    '** 表形式（横）用の歴区分（一覧）での社員毎のレコード数
    Session.Add("SL_P001M311_KAZU", w_skensu)
    '* EXCEL ガテゴリ情報の表示形式
    If w_outtan = "0" Then
        w_split = VBSplit(w_cate_wk, ",", -1, 0)
        w_cate_wk = ""
        For w_i = 1 To UBound(w_split)
            If Not IsNull(P000S001.FNCG_P_NZ(w_split(w_i))) Then
                Select Case w_split(w_i)
                    Case "52", "53", "57", "58", "62", "63", "64", "67", "68", "69"
                        w_split(w_i) = "31"
                End Select
                w_cate_wk = w_cate_wk & "," & w_split(w_i)
            Else
                w_cate_wk = w_cate_wk & ","
            End If
        Next
    End If
    Select Case w_gsmode
        Case "7"
            '*** 発令のみ発令発令日分付加
            w_cate_wk = w_cate_wk & ",02"
    End Select
    '**********************************************************************
    '* 照会対象者ログ出力
    '**********************************************************************
    If w_gmode = "1" AndAlso w_gsmode = "1" Then
        If w_skbn = "2" Then
            If SessionAsStr("PSSO_TSSYAINLOG") = "1" Then
                ReDim p_session(7)
                p_session(0) = "1"
                p_session(1) = w_kcode
                p_session(2) = "0"
                p_session(6) = "テーブル情報(任意選択設定)"
                '*** (0):データ取得先区分(0:ワークテーブル,1:社員番号指定)
                '*** (1):参照時の会社コード
                '*** (2):社員コード区分(0:内部社員コード,1:表示社員コード)
                '*** (3):取得先テーブル名
                '*** (4):取得先項目名
                '*** (5):取得先テーブル名
                '*** (6):取得条件
                '*** (7):機能名称
                Session.Add("PSSO_TSSYAININFO", p_session)
                P000S017.FNCG_P_TSSYAINLOG(SessionAsStrArray2D("SL_P001M004_SCD"))
            End If
        End If
    End If
    '**********************************************************************
    '* 終了ログ出力
    '**********************************************************************
    w_logcnt = CStr(w_max + 1)
    POCOM001.POCOM_DataOutComplete(w_logmsg, CInt(w_logcnt), w_log3, w_log4, w_log5, "P000-00137", DBOBJ, "")
    Session.Add("SG_P_EXCELOUTPUT", New Object() {"2", Mid(w_cate_wk, 2), w_logmsg, w_logcnt, w_log3, w_log4, w_log5, w_logkkbn, w_logsyrno})
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
    Select Case w_skbn
        Case "1", "2"
            Response.Redirect("P001M405.aspx")
        Case "3", "4"
            Response.Redirect("P001M401.aspx")
        Case "11"
            Response.Redirect("P001M421.aspx?menu=2")
    End Select
    '*** 配列変数の開放
    If IsArray(w_langmsg) Then
        Erase w_langmsg
    End If
    If IsArray(w_langmsg_out) Then
        Erase w_langmsg_out
    End If
    Response.End()
%>
<script language="vb" runat="server">
    '**********************************************************************
    '*    変数宣言
    '**********************************************************************
    Dim DBOBJ As OraDatabase        '* データベースオブジェクト
    Dim sql As String               '* sql
    Dim w_min As Integer            '* 社員配列ＩＤ（開始位置）
    Dim w_max As Integer            '* 社員配列ＩＤ（終了位置）
    Dim w_ctgdata(,) As String      '* カテゴリ情報
    Dim w_cate_wk As String         '* ガテゴリ情報の表示形式格納 WORK
    Dim w_scd(,) As String          '* 選択社員情報配列
    Dim w_scdidx As String          '* 選択社員情報（現在配列ＩＤ）
    Dim w_outid() As String         '* 任意選択ＩＤ
    Dim w_skbn As String            '* 処理区分(1:ナビより,2:設定画面より,3:帳票出力より,4:????)
    Dim w_title As String           '* エラー用タイトル
    Dim w_title2 As String          '* エラー用タイトル
    Dim w_kinou As String
    Dim w_skensu(,) As Integer
    Dim w_outfmt As String          '* 出力表示形式(1:表形式(縦),2:表形式(横),3:縦･表形式1,4:縦･表形式2)
    Dim w_outset As String
    Dim w_hozonid() As String       '* 保存ＩＤ（任意選択）
    Dim w_dbdata(,) As String
    Dim w_gmode As String           '*** 1=通常・2=採用
    Dim w_gsmode As String          '*** 1=通常・2=異動・3=考課・4=個別登録・5=異動線・6=発令処理・7=発令処理(303)・8=人材育成
    Dim w_tgsmode As String         '*** 1=通常・2=異動・3=考課・4=個別登録・5=異動線・6=発令処理・7=発令処理(303)・8=人材育成
    Dim w_kouka() As String
    Dim w_sortflg As String         '* ソート設定（0:簡易,1:詳細）
    Dim w_sortdata(,) As String     '* ソートデータ
    Dim w_ido() As String
    Dim w_irei As String            '* 固定帳票異例フラグ(0:通常,1:異例)
    Dim w_err As Integer
    Dim w_errmsg As String
    Dim w_printinf() As String      '* 帳票選択内容
    Dim w_i As Integer
    Dim w_jirei As Integer          '* 辞令書フラグ（0:辞令書以外,1:辞令書）w_gsmode(1:通常,4:個別登録)のみ利用
    Dim w_pgflg As Integer          '* 1:テーブル情報,2:固定帳票
    Dim w_fname() As String
    Dim w_orapara(,) As String      '* SQL
    Dim w_outtan As String          '* 表示単位設定（0:表示しない,1:表示する）
    Dim w_split() As String         '* スピリット用
    Dim w_tkflg As String           '* 特別フラグ(1:辞令書,2:異動表,3:入払表) w_gsmode(2:異動,5:異動線)のみ利用
    Dim w_idosenscd(,) As String    '* 入払表用社員データ
    Dim w_syori As String           '* 処理ＩＤ
    Dim w_hrday As String           '* 発令日(入払表-世代取得用)
    Dim w_table As String           '* 入払表ワークテーブル名称
    Dim w_hkjday(,) As String       '* 基準日データ取得用(2次元配列)
    Dim w_kjday As String           '* 基準日
    Dim w_cate_wk_sv As String      '* Excelフォーマット情報の保持用
    Dim w_delbsyo As Integer        '* 削除部署(0:削除部署を全て出力,1:削除部署をまとめて(1件)出力)
    Dim w_tdata(,) As String        '* 時間取得
    Dim w_kcode As String           '*** 選択会社コード
    Dim w_kcd As String             '*** 選択会社コード
    Dim w_kkbn As String            '*** 組入れ区分（1:しない、2:する(標準＋組入れデータ)、3:する(組入れデータ)、4:する(全て組入れ)）
    Dim w_rptname As String         '*** 帳票名称
    Dim w_kensaku As String         '*** 検索設定
    Dim w_logmsg As String = String.Empty         '*** 監査ログ：条件
    Dim w_logcnt As String          '*** 監査ログ：データ件数
    Dim w_logkkbn As String         '*** 監査ログ：機能区分
    Dim w_logsyrno As String        '*** 監査ログ：処理番号
    Dim w_log3() As String            '*** 共通ログ関数用（カテゴリ区分）
    Dim w_log4() As String            '*** 共通ログ関数用（出力順序）
    Dim w_log5() As String            '*** 共通ログ関数用（名称）
    Dim w_ctnm(,) As String            '*** カテゴリ名称
    Dim w_fnmdt(,) As String        '*** ファイル名称管理
    Dim w_langmsg(,) As String      '*** 文言情報取得用
    Dim w_langmsg_out(,) As String  '*** 文言情報取得用（出力言語）
    Dim w_tmp As Integer            '*** 一時変数
    Dim w_idosen() As String
    Dim w_kjcnt As Integer
    Dim w_fio_read() As TextStream
    Dim w_brankbuff() As String
    Dim w_mainbuff() As String
    Dim w_usetb(,) As String
    Dim w_usetb2(,) As String
    Dim fdata(,) As String
    Dim w_divdata(,) As String
    Dim p_session() As String
    Dim w_midname_flg_old As String '* もともと環境設定のミドルネーム使用区分
    Dim w_fdata7() As String        '* 環境設定
    Dim w_ENVIR_001_chg As Boolean  '* 環境設定変更区分
    '**********************************************************************
    '*        表示情報取得処理
    '**********************************************************************
    Function FNCL_P_GET_DATA(ByRef p_skbn As String, ByRef p_id() As String, ByVal permission As String) As Integer
        Dim w_err As OraParameter
        FNCL_P_GET_DATA = 0
        DBOBJ.Parameters.Remove("ORA_ERR")
        DBOBJ.Parameters.Add(("ORA_ERR"), 2, OraConst.ORAPARM_BOTH)
        w_err = DirectCast(DBOBJ.Parameters("ORA_ERR"), OraParameter)
        sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP0010340_S("
        sql = sql & " " & SessionAsStr("SL_P000M008_GMODE") & ", "
        sql = sql & " " & p_skbn & ", "
        sql = sql & " " & SessionAsStr("SG_P_RID") & ", "
        sql = sql & " " & P000S001.FNCG_P_CANGEVALUE(101, w_kcd) & ", "
        If p_skbn = "1" Then
            If SessionAsStr("SG_P_STYPE") = "0" Then
                Select Case p_id(0)
                    Case "1"
                        sql = sql & "-1,"
                    Case "2"
                        sql = sql & " " & SessionAsStr("SG_P_SID") & ", "
                End Select
            Else
                Select Case p_id(0)
                    Case "1"
                        sql = sql & "'-1',"
                    Case "2"
                        sql = sql & " '" & SessionAsStr("SG_P_SID") & "', "
                End Select
            End If
            sql = sql & "" & p_id(1) & ", "
        Else
            If SessionAsStr("SG_P_STYPE") = "0" Then
                sql = sql & "0,"
            Else
                sql = sql & "'0',"
            End If
            sql = sql & "0,"
        End If
        sql = sql & "" & permission & ","
        sql = sql & ":ORA_ERR); END;"
        DBOBJ.DbExecuteSQL(sql)
        If CInt(w_err.Value) < 0 Then
            FNCL_P_GET_DATA = 1
        End If
        DBOBJ.Parameters.Remove("ORA_ERR")
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_SYAINSORT
    '*  処理：社員ソート情報の作成
    '*  内容：
    '*  備考：
    '*  引数：[I] p_sortflg  -- ソートフラグ
    '*
    '*  作成：000-Ver6.3  2002/02/01 T.M
    '*  履歴：
    '**********************************************************************
    Function FNCL_P_SYAINSORT(ByRef p_sortflg As String, ByRef p_sortdata(,) As String) As Integer
        Dim w_err As OraParameter
        '**********************************************************************
        '*    初期処理
        '**********************************************************************
        FNCL_P_SYAINSORT = 0
        '**********************************************************************
        '*    簡易・詳細判断
        '**********************************************************************
        If SessionAsStr("SL_P000M008_GMODE") = "1" Then
            If SessionAsStrArray("SG_P_001INF")(13) = "0" AndAlso Mid(SessionAsStrArray("SG_P_001INF")(14), 1, 1) = "5" AndAlso SessionAsStr("SG_P_STYPE") = "0" Then
                Exit Function
            Else
                p_sortflg = "1"
            End If
        Else
            If Mid(SessionAsStrArray("SG_P_001INF")(11), 1, 1) = "5" Then
                Exit Function
            Else
                p_sortflg = "1"
            End If
        End If
        '**********************************************************************
        '*    ソートデータDB作成
        '**********************************************************************
        P000S011.SUBG_P_ORAPDEL(DBOBJ, "ORA_ERR")
        DBOBJ.Parameters.Add(("ORA_ERR"), 0, OraConst.ORAPARM_OUTPUT)
        w_err = DirectCast(DBOBJ.Parameters("ORA_ERR"), OraParameter)
        sql = "BEGIN " & SessionAsStr("SG_C_DBUSER1") & "WEB_SP0010510_S("
        sql = sql & P000S001.FNCG_P_CANGEVALUE(101, w_kcode)
        '*** 会社コード
        sql = sql & "," & SessionAsStr("SL_P000M008_GMODE")
        '*** 機能区分(1:通常,2:採用)
        sql = sql & ",1"
        '*** 1:照会選択結果,2:検索結果,3:全社員
        sql = sql & ",1"
        '*** 1:照会設定,2:ソート設定(未開発)
        If SessionAsStr("SG_P_STYPE") = "0" Then
            sql = sql & ",0"
            '*** ソート作成者ＩＤ(未開発)
        Else
            sql = sql & ",'0'"
            '*** ソート作成者ＩＤ(未開発)
        End If
        sql = sql & ",0"
        '*** ソートＩＤ(未開発)
        sql = sql & "," & SessionAsStrArray("SG_P_001INF")(20)
        '*** 組織種別
        sql = sql & "," & SessionAsStrArray("SG_P_001INF")(21)
        '*** 改行指定
        sql = sql & "," & SessionAsStrArray("SG_P_001INF")(19)
        '*** 事業所種別
        If SessionAsStr("SL_P000M008_GMODE") = "1" Then
            sql = sql & ",'" & SessionAsStrArray("SG_P_001INF")(14) & "'"
            '*** 並び順
        Else
            sql = sql & ",'" & SessionAsStrArray("SG_P_001INF")(11) & "'"
            '*** 並び順
        End If
        sql = sql & "," & SessionAsStrArray("SG_P_001INF")(6)
        '*** 1:今日,2:基準日
        sql = sql & ",'" & SessionAsStrArray("SG_P_001INF")(15) & "'"
        '*** 基準日
        sql = sql & ",'" & SessionAsStrArray("SG_P_001INF")(16) & "'"
        '*** 基準年度・期
        If SessionAsStr("SL_P000M008_GMODE") = "1" Then
            sql = sql & ",''"
            '*** 応募年度
        Else
            sql = sql & ",'" & SessionAsStrArray("SL_P400_INF14")(1) & "'"
            '*** 応募年度
        End If
        sql = sql & "," & SessionAsStr("SG_P_RID")
        '*** 利用者ＩＤ
        sql = sql & ",:ORA_ERR); END;"
        '*** エラー区分
        DBOBJ.DbExecuteSQL(sql)
        P000S011.SUBG_P_ORAPDEL(DBOBJ, "ORA_ERR")
        If CInt(w_err.Value) < 0 Then
            FNCL_P_SYAINSORT = 1
        End If
        '**********************************************************************
        '*    ソートデータ取得
        '**********************************************************************
        If w_jirei = 0 Then
            If SessionAsStr("SL_P000M008_GMODE") = "1" Then
                sql = "SELECT DISP_ORDER"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011030_W_" & SessionAsStr("SG_P_RID") & " A"
                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                sql = sql & " ORDER BY B.KAISYACD,B.SYAINCD,A.DISP_ORDER"
            Else
                sql = "SELECT DISP_ORDER"
                sql = sql & " FROM  " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011030_W_" & SessionAsStr("SG_P_RID")
                sql = sql & " ORDER BY RECEIPT_NUMBER"
            End If
        Else
            If SessionAsStr("SL_P000M008_GMODE") = "1" Then
                sql = "SELECT A.DISP_ORDER,B.ANOTHER_POST_DIV"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011030_W_" & SessionAsStr("SG_P_RID") & " A"
                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011040_W_" & SessionAsStr("SG_P_RID") & " B"
                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO C"
                sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                sql = sql & "   AND A.EMP_CODE=C.EMP_CODE"
                sql = sql & " ORDER BY C.KAISYACD,C.SYAINCD"
            Else
                sql = "SELECT A.DISP_ORDER,B.ANOTHER_POST_DIV"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011030_W_" & SessionAsStr("SG_P_RID") & " A"
                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011040_W_" & SessionAsStr("SG_P_RID") & " B"
                sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                sql = sql & " ORDER BY A.RECEIPT_NUMBER"
            End If
        End If
        If P000S011.FNCG_P_RECORDSET1(0, sql, p_sortdata) = False Then
        End If
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_CSVMAKE
    '*  処理：外部出力ファイル作成処理
    '*  内容：
    '*  備考：
    '*  引数：[I] p_skbn  -- 処理区分
    '*                            1：任意選択（条件一覧選択時）
    '*                            2：任意選択（状況設定画面より呼出）
    '*                            3：固定帳票
    '*                            4：未使用
    '*      ：[I] p_kdata -- 出力項目内容
    '*        ：[I] p_kensu -- 社員毎のレコード数
    '*        ：[I] p_scd   -- 出力対象者
    '*        ：[I] p_min   -- 出力対象者の開始配列ＩＤ
    '*        ：[I] p_max   -- 出力対象者の終了配列ＩＤ
    '*
    '*  作成：000-Ver6.0  2000/11/01 T.M
    '*  履歴：001-VerP2.1 2004/05/25 I.H 発令処理対応
    '*  履歴：002-VerP4.3a 2012/12/26 H.N【改善P-12-021】禁則文字対応
    '**********************************************************************
    Function FNCL_P_CSVMAKE(ByRef p_skbn As String, ByRef p_kdata(,) As String, ByRef p_kensu(,) As Integer, ByRef p_scd(,) As String, ByRef p_min As Integer, ByRef p_max As Integer, ByRef p_outset As String, ByRef p_sortflg As String, ByRef p_sortdata(,) As String, ByRef p_idosenscd(,) As String, ByRef p_cate_wk As String) As String
        '**********************************************************************
        '*    変数宣言
        '**********************************************************************
        Dim filename As String                      '/* 物理ファイル名
        Dim fileobject As FileSystemObject          '/* Server CreateObject
        Dim w_fio_out As TextStream                 '/* テキスト変数(書込用)
        Dim w_fio_kijun As TextStream = Nothing     '/* テキスト変数(基準書込用)
        Dim w_dbuff As String                       '/* 書込内容
        Dim w_ctgcnt As Integer                     '/* カテゴリ配列数
        Dim w_wdata() As String                     '/* ワークデータ
        Dim w_wcnt As Integer                       '/* ワークカウント
        Dim w_i As Integer                          '/* ワークカウント
        Dim w_j As Integer                          '/* ワークカウント
        Dim w_k As Integer                          '/* ワークカウント
        Dim w_l As Integer                          '/* ワークカウント
        Dim w_rscnt As Integer                      '/* 開始行件数
        Dim w_recnt As Integer                      '/* 終了行件数
        Dim w_kmcnt As Integer                      '/* 項目件数
        Dim w_kmdata() As String                    '/* 項目データ
        Dim w_hbuff() As String                     '/* 書込内容（配列）
        Dim w_hsort() As String                     '/* 表示順（配列）
        Dim w_kmsortflg As String
        Dim w_hfmt() As String
        Dim w_kmfmt() As String
        Dim w_jincnt As Integer                     '/* 給与項目の開始位置 */
        Dim w_plus As Integer                       '/* 給与項目の開始位置(加算用) */
        Dim objFolder As Folder
        Dim w_fcnt As Integer
        Dim w_finame As String
        Dim objFile As File
        Dim w_kaisyacd As String                    '/* 会社コード
        Dim w_hscd As String                        '/* 表示社員コード
        '**********************************************************************
        '*    初期処理
        '**********************************************************************
        FNCL_P_CSVMAKE = PSTNullString
        If p_skbn = "11" Then
            w_kmsortflg = "2"
        Else
            w_kmsortflg = SessionAsStrArray("SG_P_ENVIR_001")(29)
        End If
        w_ctgcnt = UBound(p_kdata, 2)
        '*** カテゴリ配列数
        ReDim w_fio_read(w_ctgcnt)
        '*** テキスト変数(読出用)
        ReDim w_brankbuff(w_ctgcnt)
        '*** カテゴリ毎のブランクデータ(配列)
        ReDim w_mainbuff(w_ctgcnt)
        '*** カテゴリ毎単一データの基準内容(配列)
        '**********************************************************************
        '*    各社員毎の最大レコード数抽出処理
        '**********************************************************************
        For w_i = p_min To p_max
            w_wcnt = 1
            For w_j = 0 To w_ctgcnt
                If w_wcnt < p_kensu(w_j, w_i) Then
                    w_wcnt = p_kensu(w_j, w_i)
                End If
            Next
            p_kensu(w_ctgcnt + 1, w_i) = w_wcnt
        Next
        '**********************************************************************
        '*    カテゴリ毎のブランクデータ作成
        '**********************************************************************
        For w_i = 0 To w_ctgcnt
            w_dbuff = ""
            For w_j = 0 To CInt(p_kdata(15, w_i))
                w_dbuff = w_dbuff & ","""""
            Next
            w_brankbuff(w_i) = Mid(w_dbuff, 2)
        Next
        '**********************************************************************
        '*    ファイルオープン処理
        '**********************************************************************
        fileobject = New FileSystemObject()
        '*** 読込用
        For w_i = 0 To w_ctgcnt
            If p_skbn = "1" OrElse p_skbn = "2" Then
                filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_" & CStr(w_i) & ".CSV"
            ElseIf p_skbn = "3" Then
                filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & "_" & CStr(w_i) & ".CSV"
            Else
                filename = SessionAsStr("SG_C_OUTPUTPATH02_B") & SessionAsStr("SG_P_RID") & "_" & CStr(w_i) & ".CSV"
            End If
            w_fio_read(w_i) = POCOM001.POCOM_OpenTextFile(filename, 1, False)
        Next
        '*** 書込用
        If w_skbn = "3" AndAlso (w_gsmode = "1" OrElse w_gsmode = "4" OrElse w_gsmode = "6" OrElse w_gsmode = "7" OrElse w_gsmode = "8") Then
            '*** 固定帳票
            objFolder = fileobject.GetFolder(SessionAsStr("SG_C_OUTPUTPATH03_B"))
            w_fcnt = objFolder.Files.Count
            If w_fcnt > 0 Then
                w_j = 0
                For Each objFile In objFolder.Files
                    w_finame = objFile.Name
                    If UBound(VBSplit(w_finame, "_", -1, 0)) > 0 Then
                        If VBSplit(w_finame, "_", -1, 0)(0) = SessionAsStr("SG_P_RID") AndAlso P000S001.FNCG_P_LENB(VBSplit(w_finame, "_", -1, 0)(1)) = 18 Then
                            On Error Resume Next
                            fileobject.DeleteFile(SessionAsStr("SG_C_OUTPUTPATH03_B") & w_finame)
                        End If
                    End If
                Next
            End If
            objFolder = Nothing
            sql = "SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') FROM DUAL"
            If P000S011.FNCG_P_RECORDSET1(1, sql, w_tdata) = True Then
            End If
            Session.Add("SG_P_KTNAME_TIME", w_tdata(0, 0))
            filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & "_" & SessionAsStr("SG_P_KTNAME_TIME") & ".CSV"
        Else
            If p_skbn = "1" OrElse p_skbn = "2" Then
                filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & ".CSV"
            ElseIf p_skbn = "3" Then
                filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & ".CSV"
            Else
                filename = SessionAsStr("SG_C_OUTPUTPATH02_B") & SessionAsStr("SG_P_RID") & ".CSV"
            End If
        End If
        w_fio_out = POCOM001.POCOM_CreateTextFile(filename, System.Text.Encoding.Unicode, True)
        '*** 帳票基準データ用
        Select Case p_skbn
            Case "3"
                filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & "_0.txt"
                w_fio_kijun = POCOM001.POCOM_CreateTextFile(filename, System.Text.Encoding.Unicode, True)
            Case "4"
                filename = SessionAsStr("SG_C_OUTPUTPATH02_B") & SessionAsStr("SG_P_RID") & "_0.txt"
                w_fio_kijun = POCOM001.POCOM_CreateTextFile(filename, System.Text.Encoding.Unicode, True)
        End Select
        '**********************************************************************
        '*    ファイル作成処理（見出し部）
        '**********************************************************************
        If w_kmsortflg = "1" Then
            Select Case p_skbn
                Case "1", "2"
                    w_dbuff = ""
                    For w_i = 0 To w_ctgcnt
                        For w_j = 0 To CInt(p_kdata(15, w_i))
                            If w_j = 0 Then
                                w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(p_kdata(2, w_i)) & """"
                            Else
                                w_dbuff = w_dbuff & ","""""
                            End If
                        Next
                    Next
                    w_fio_out.WriteLine(Mid(w_dbuff, 2))
            End Select
        End If
        '**********************************************************************
        '*    ファイル作成処理（項目部）
        '**********************************************************************
        '/**********************************************/
        '/* キー部のヘッダー、EXCEL書式の定義            */
        '/**********************************************/
        Select Case p_skbn
            Case "1", "2", "11"
                w_dbuff = ""
            Case "3", "4"
                If w_gsmode = "6" Then
                    '*** 発令処理は「FNCL_P_CSVMAKE2」でキー情報を作成する
                    w_dbuff = ""
                Else
                    If w_tkflg = "3" Then
                        w_dbuff = ",""新部門表示順"",""新社員表示順"",""新部門ランク||コード"",""現部門表示順"",""現社員表示順"",""現部門ランク||コード"",""発令種類"""
                        p_cate_wk = ",31,31,,31,31,,31" & p_cate_wk
                    Else
                        w_dbuff = ",""ＩＤ"",""ソート１"",""ソート２"""
                        If w_sortflg = "0" Then
                            p_cate_wk = ",31,31,31" & p_cate_wk
                        Else
                            p_cate_wk = ",1,31,31" & p_cate_wk
                        End If
                    End If
                End If
            Case Else
                w_dbuff = ""
        End Select
        '/**********************************************/
        '/* 画面項目名の書出し                          */
        '/**********************************************/
        If ((p_skbn = "1" OrElse p_skbn = "2") AndAlso w_kmsortflg = "2") OrElse (p_skbn = "11") Then
            '//  選択順
            '///////////////////////////////////////////////
            w_kmcnt = 0
            w_jincnt = 0
            For w_i = 0 To w_ctgcnt
                w_wdata = VBSplit(p_kdata(17, w_i), "|||", -1, 0)
                If (p_skbn = "1" OrElse p_skbn = "2") AndAlso p_kdata(21, w_i) = "2" AndAlso w_jincnt = 0 Then
                    '/* 任意選択の場合、給与項目は通常項目の後に追加する為 */
                    '/* 別途給与項目開始位置を取得する */
                    w_jincnt = w_kmcnt
                End If
                For w_j = 0 To UBound(w_wdata)
                    w_kmcnt = w_kmcnt + 1
                Next
            Next
            ReDim w_kmdata(w_kmcnt)
            ReDim w_kmfmt(w_kmcnt)
            For w_i = 0 To w_ctgcnt
                w_plus = 0
                If p_kdata(21, w_i) = "2" Then
                    w_plus = w_jincnt
                End If
                w_wdata = VBSplit(p_kdata(17, w_i), "|||", -1, 0)
                w_hsort = VBSplit(p_kdata(35, w_i), ",", -1, 0)
                If IsNull(P000S001.FNCG_P_NZ(p_kdata(16, w_i))) Then
                    ReDim w_hfmt(0)
                Else
                    w_hfmt = VBSplit(p_kdata(16, w_i), ",", -1, 0)
                End If
                For w_j = 0 To UBound(w_wdata)
                    w_kmdata(CInt(w_hsort(w_j)) + w_plus) = "(" & p_kdata(2, w_i) & ")" & w_wdata(w_j)
                    w_kmfmt(CInt(w_hsort(w_j)) + w_plus) = w_hfmt(w_j)
                Next
            Next
            w_dbuff = ""
            w_cate_wk = ""
            For w_k = 1 To w_kmcnt
                w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_kmdata(w_k)) & """"
                w_cate_wk = w_cate_wk & "," & w_kmfmt(w_k)
            Next
            w_fio_out.WriteLine(Mid(w_dbuff, 2))
        Else
            '//  カテゴリ順
            '///////////////////////////////////////////////
            For w_i = 0 To w_ctgcnt
                w_wdata = VBSplit(p_kdata(17, w_i), "|||", -1, 0)
                For w_j = 0 To UBound(w_wdata)
                    w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_wdata(w_j)) & """"
                Next
            Next
            w_fio_out.WriteLine(Mid(w_dbuff, 2))
        End If
        '**********************************************************************
        '*    ファイル作成処理（データ部）
        '**********************************************************************
        w_rscnt = 0
        w_recnt = 0
        If ((p_skbn = "1" OrElse p_skbn = "2") AndAlso w_kmsortflg = "2") OrElse (p_skbn = "11") Then
            For w_i = p_min To p_max
                For w_j = 1 To p_kensu(w_ctgcnt + 1, w_i)
                    w_recnt = w_recnt + 1
                    If w_j = 1 Then
                        w_rscnt = w_recnt
                    End If
                    ReDim w_kmdata(w_kmcnt)
                    For w_k = 0 To w_ctgcnt
                        w_plus = 0
                        If p_kdata(21, w_k) = "2" Then
                            w_plus = w_jincnt
                        End If
                        If w_j = 1 Then
                            w_mainbuff(w_k) = w_fio_read(w_k).ReadLine
                            w_dbuff = w_mainbuff(w_k)
                        Else
                            '*** 単一項目
                            If p_kdata(13, w_k) = "1" Then
                                '*** 先頭のみ
                                If p_outset = "1" Then
                                    w_dbuff = w_brankbuff(w_k)
                                    '*** 全行
                                Else
                                    w_dbuff = w_mainbuff(w_k)
                                End If
                                '*** 歴項目
                            Else
                                If p_kensu(w_k, w_i) < w_j Then
                                    w_dbuff = w_brankbuff(w_k)
                                Else
                                    w_dbuff = w_fio_read(w_k).ReadLine
                                End If
                            End If
                        End If
                        w_hbuff = P000S001.FNCG_P_SPLIT(w_dbuff)
                        w_hsort = VBSplit(p_kdata(35, w_k), ",", -1, 0)
                        For w_l = 0 To UBound(w_hbuff)
                            w_kmdata(CInt(w_hsort(w_l)) + w_plus) = w_hbuff(w_l)
                        Next
                    Next
                    w_dbuff = ""
                    For w_k = 1 To w_kmcnt
                        w_dbuff = w_dbuff & ",""" & w_kmdata(w_k) & """"
                    Next
                    w_fio_out.WriteLine(Mid(w_dbuff, 2))
                Next
            Next
        Else
            For w_i = p_min To p_max
                '** 社員コード毎
                For w_j = 1 To p_kensu(w_ctgcnt + 1, w_i)
                    '** カテゴリ毎
                    w_recnt = w_recnt + 1
                    '** 各社員コードの終了行の設定
                    If w_j = 1 Then
                        w_rscnt = w_recnt
                        '** 各社員コードの開始行の設定
                    End If
                    '/***************************************/
                    '/* キー情報の作成                        */
                    '/***************************************/
                    Select Case p_skbn
                        Case "3"
                            Select Case w_gsmode
                                Case "6"
                                    '*** 発令処理は「FNCL_P_CSVMAKE2」でキー情報を作成する
                                    w_dbuff = ""
                                Case "7", "8"
                                    w_dbuff = ",""" & p_scd(3, w_i) & """,""" & p_scd(3, w_i) & """,""" & CStr(w_j) & """"
                                Case Else
                                    If w_tkflg = "3" Then
                                        '/*/
                                        w_dbuff = ",""" & p_idosenscd(0, w_i) & """"
                                        w_dbuff = w_dbuff & ",""" & p_idosenscd(1, w_i) & """"
                                        w_dbuff = w_dbuff & ",""" & p_idosenscd(2, w_i) & """"
                                        w_dbuff = w_dbuff & ",""" & p_idosenscd(3, w_i) & """"
                                        w_dbuff = w_dbuff & ",""" & p_idosenscd(4, w_i) & """"
                                        w_dbuff = w_dbuff & ",""" & p_idosenscd(5, w_i) & """"
                                        w_dbuff = w_dbuff & ",""" & p_idosenscd(6, w_i) & """"
                                    Else
                                        If w_jirei = 0 Then
                                            If w_sortflg = "0" Then
                                                w_dbuff = ",""" & p_scd(0, w_i) & """,""" & p_scd(0, w_i) & """,""" & CStr(w_j) & """"
                                            Else
                                                If w_gmode = "1" Then
                                                    '*** 通常
                                                    If P003S003.GetKaisyacdByAllKengen() = "0" AndAlso SessionAsStr("SG_P_KAISYA_FLG") = "1" Then
                                                        '*** 全社、又は、全社参照の場合
                                                        w_dbuff = ",""" & p_scd(3, w_i) & "A" & P000S006.FNCG_P_SCD_CHG2("0", p_scd(0, w_i)) & """,""" & p_sortdata(0, w_i) & """,""" & CStr(w_j) & """"
                                                    Else
                                                        w_dbuff = ",""" & P000S006.FNCG_P_SCD_CHG2("0", p_scd(0, w_i)) & """,""" & p_sortdata(0, w_i) & """,""" & CStr(w_j) & """"
                                                    End If
                                                Else
                                                    '*** 採用
                                                    w_dbuff = ",""" & p_scd(0, w_i) & """,""" & p_sortdata(0, w_i) & """,""" & CStr(w_j) & """"
                                                End If
                                            End If
                                        Else
                                            If w_sortflg = "0" Then
                                                w_dbuff = ",""" & p_scd(0, w_i) & "A" & p_scd(2, w_i) & """,""" & p_scd(0, w_i) & """,""" & CStr(w_j) & """"
                                            Else
                                                If w_gmode = "1" Then
                                                    '*** 通常
                                                    If P003S003.GetKaisyacdByAllKengen() = "0" AndAlso SessionAsStr("SG_P_KAISYA_FLG") = "1" Then
                                                        '*** 全社、又は、全社参照の場合
                                                        w_kaisyacd = ""
                                                        w_hscd = ""
                                                        P000S006.FNCG_P_SCD_CHG("0", p_scd(0, w_i), w_kaisyacd, w_hscd)
                                                        '** 社員コードから会社コードと表示社員コードを取得する。
                                                        w_dbuff = ",""" & w_kaisyacd & "A" & w_hscd & "A" & p_sortdata(1, w_i) & """,""" & p_sortdata(0, w_i) & """,""" & CStr(w_j) & """"
                                                    Else
                                                        w_dbuff = ",""" & P000S006.FNCG_P_SCD_CHG2("0", p_scd(0, w_i)) & "A" & p_sortdata(1, w_i) & """,""" & p_sortdata(0, w_i) & """,""" & CStr(w_j) & """"
                                                    End If
                                                Else
                                                    '*** 採用
                                                    w_dbuff = ",""" & p_scd(0, w_i) & "A" & p_sortdata(1, w_i) & """,""" & p_sortdata(0, w_i) & """,""" & CStr(w_j) & """"
                                                End If
                                            End If
                                        End If
                                    End If
                            End Select
                        Case Else
                            w_dbuff = ""
                    End Select
                    '/***************************************/
                    '/* データ連結処理                        */
                    '/***************************************/
                    For w_k = 0 To w_ctgcnt
                        If w_j = 1 Then
                            w_mainbuff(w_k) = w_fio_read(w_k).ReadLine
                            w_dbuff = w_dbuff & "," & w_mainbuff(w_k)
                        Else
                            '*** 単一項目
                            If p_kdata(13, w_k) = "1" Then
                                '*** 先頭のみ
                                If p_outset = "1" Then
                                    w_dbuff = w_dbuff & "," & w_brankbuff(w_k)
                                    '*** 全行
                                Else
                                    w_dbuff = w_dbuff & "," & w_mainbuff(w_k)
                                End If
                                '*** 歴項目
                            Else
                                If p_kensu(w_k, w_i) < w_j Then
                                    w_dbuff = w_dbuff & "," & w_brankbuff(w_k)
                                Else
                                    w_dbuff = w_dbuff & "," & w_fio_read(w_k).ReadLine
                                End If
                            End If
                        End If
                    Next
                    Select Case w_gsmode
                        Case "7"
                            '** 発令処理のみ最後に発令発令日をセット
                            w_dbuff = w_dbuff & ",""" & p_scd(4, w_i) & """"
                    End Select
                    w_fio_out.WriteLine(Mid(w_dbuff, 2))
                Next
                '/*****************************************************/
                '/* 社員コード毎の開始行数＆終了行数の書出し             */
                '/* [利用者ＩＤ]_0.TXT                                 */
                '/* 1:社員コード(ID),2:開始位置,3:終了位置,4:ソート順    */
                '/*****************************************************/
                Select Case p_skbn
                    Case "3"
                        Select Case w_gsmode
                            Case "7", "8"
                                '***                    w_fio_kijun.WriteLine """" & p_scd(3,w_i) & """,""" & w_rscnt & """,""" & w_recnt & """,""" & p_scd(3,w_i) & """"
                                w_fio_kijun.WriteLine("""" & p_scd(0, w_i) & """,""" & CStr(w_rscnt) & """,""" & CStr(w_recnt) & """,""" & p_scd(3, w_i) & """")
                            Case Else
                                If w_tkflg = "2" Then
                                    '*** 異動表
                                    w_fio_kijun.WriteLine("""" & p_scd(0, w_i) & """,""" & p_scd(2, w_i) & """,""" & p_scd(3, w_i) & """,""" & CStr(w_rscnt) & """,""" & CStr(w_recnt) & """,""" & p_scd(0, w_i) & """,""" & p_scd(4, w_i) & """,""" & p_scd(5, w_i) & """")
                                ElseIf w_jirei = 0 Then
                                    If w_sortflg = "0" Then
                                        w_fio_kijun.WriteLine("""" & p_scd(0, w_i) & """,""" & CStr(w_rscnt) & """,""" & CStr(w_recnt) & """,""" & p_scd(0, w_i) & """")
                                    Else
                                        w_fio_kijun.WriteLine("""" & p_scd(0, w_i) & """,""" & CStr(w_rscnt) & """,""" & CStr(w_recnt) & """,""" & p_sortdata(0, w_i) & """")
                                    End If
                                Else
                                    If w_sortflg = "0" Then
                                        w_fio_kijun.WriteLine("""" & p_scd(0, w_i) & "A" & p_scd(2, w_i) & """,""" & CStr(w_rscnt) & """,""" & CStr(w_recnt) & """,""" & p_scd(0, w_i) & """")
                                    Else
                                        w_fio_kijun.WriteLine("""" & p_scd(0, w_i) & "A" & p_sortdata(1, w_i) & """,""" & CStr(w_rscnt) & """,""" & CStr(w_recnt) & """,""" & p_sortdata(0, w_i) & """")
                                    End If
                                End If
                        End Select
                End Select
            Next
        End If
        '**********************************************************************
        '*    ファイルクローズ
        '**********************************************************************
        For w_i = 0 To w_ctgcnt
            w_fio_read(w_i).Close()
            w_fio_read(w_i) = Nothing
        Next
        w_fio_out.Close()
        w_fio_out = Nothing
        Select Case p_skbn
            Case "1", "2"
                '*** ログ処理
                If CStr(P001S002.FNCG_P_SYOUKAI_LOGU_SET(1, 2, filename, 2, "")) = "1" Then
                End If
            Case "3", "4"
                w_fio_kijun.Close()
                w_fio_kijun = Nothing
        End Select
        '**********************************************************************
        '*    ファイル削除
        '**********************************************************************
        On Error Resume Next
        For w_i = 0 To w_ctgcnt
            Select Case p_skbn
                Case "1", "2"
                    filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_" & CStr(w_i) & ".CSV"
                Case "3"
                    filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & "_" & CStr(w_i) & ".CSV"
                Case Else
                    filename = SessionAsStr("SG_C_OUTPUTPATH02_B") & SessionAsStr("SG_P_RID") & "_" & CStr(w_i) & ".CSV"
            End Select
            fileobject.DeleteFile(filename, True)
        Next
        On Error GoTo 0
        fileobject = Nothing
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_CSVMAKE2
    '*  処理：外部出力ファイル作成処理
    '*  内容：
    '*  備考：
    '*  引数：[I] p_skbn  -- 処理区分
    '*                            1：任意選択（条件一覧選択時）
    '*                            2：任意選択（状況設定画面より呼出）
    '*                            3：固定帳票
    '*                            4：未使用
    '*      ：[I] p_kinou -- （帳票）機能区分
    '*        ：[I] p_rpkbn -- （帳票）帳票区分
    '*        ：[I] p_kdata -- 出力項目内容
    '*
    '*  作成：000-VerP2.1    2004/05/27    I.H
    '*  履歴：
    '**********************************************************************
    Function FNCL_P_CSVMAKE2(ByRef p_skbn As String, ByRef p_kinou As Integer, ByRef p_rpkbn As String, ByRef p_kdata(,) As String, ByRef p_cate_wk As String) As String
        '**********************************************************************
        '*    変数宣言
        '**********************************************************************
        Dim w_filename As String                  '/* 物理ファイル名
        Dim fileobject As FileSystemObject        '/* Server CreateObject
        Dim w_fio_read As TextStream              '/* テキスト変数([内部]読込用) 
        Dim w_fio_etc(2) As TextStream            '/* テキスト変数([外部]読込用)
        Dim w_fio_out As TextStream               '/* テキスト変数([結合後]書込用)
        Dim w_fio_kijun As TextStream             '/* テキスト変数([結合後]帳票基準データ用)
        Dim w_dbuff As String                     '/* 書込内容
        Dim w_hdbuff As String                    '/* 書込内容
        Dim w_ctgcnt As Integer                   '/* カテゴリ配列数
        Dim w_i As Integer                        '/* ワークカウント
        Dim w_j As Integer                        '/* ワークカウント
        Dim w_k As Integer                        '/* ワークカウント
        Dim w_n As Integer                        '/* ワークカウント
        Dim w_rscnt As Integer                    '/* 開始行件数
        Dim w_recnt As Integer                    '/* 終了行件数
        Dim w_scnt As Integer                     '/* 社員人数カウント
        Dim w_fldcnt As Integer                   '/* [外部]メインデータの項目数
        Dim w_brankbuff As String                 '/* [内部]メインデータのブランクデータ作成
        Dim w_etcbrankbuff As String              '/* [外部]メインデータのブランクデータ作成
        Dim w_readbuff As String = Nothing        '/* [内部]メインデータ読込データ一時保存用(配列)
        Dim w_readbuff2() As String = Nothing
        Dim w_etcbuff(2) As String                '/* [外部]メインデータ読込データ一時保存用
        Dim w_csvn(,) As String                   '/* [内部]基準データ(配列)
        Dim w_csve(,) As String                   '/* [外部]基準データ(配列)
        Dim w_split() As String                   '/* スプリット変数        
        '**********************************************************************
        '*    初期処理
        '**********************************************************************
        FNCL_P_CSVMAKE2 = PSTNullString
        w_ctgcnt = UBound(p_kdata, 2)
        '*** カテゴリ配列数
        '*** ファイルオブジェクト定義
        fileobject = New FileSystemObject()
        '**********************************************************************
        '*    [内部]カテゴリ毎のブランクデータ作成
        '**********************************************************************
        w_brankbuff = ""
        For w_i = 0 To w_ctgcnt
            For w_j = 0 To CInt(p_kdata(15, w_i))
                w_brankbuff = w_brankbuff & ","""""
            Next
        Next
        w_brankbuff = Mid(w_brankbuff, 2)
        '**********************************************************************
        '*    [外部]出力項目数分のブランクデータ作成
        '**********************************************************************
        w_fldcnt = FNCL_P_GETFLDCNT(p_kinou, p_rpkbn)
        w_etcbrankbuff = ""
        For w_i = 0 To w_fldcnt
            w_etcbrankbuff = w_etcbrankbuff & ","""""
        Next
        w_etcbrankbuff = Mid(w_etcbrankbuff, 2)
        '**********************************************************************
        '*    セッション定義
        '**********************************************************************
        w_csve = SessionAsStrArray2D("SL_P001M404_CSVE")
        '(0):社員コード(ID)
        '(1):開始位置
        '(2):終了位置
        '(3):ソート順
        '**********************************************************************
        '*    [内部]基準CSVより基準データの配列作成
        '**********************************************************************
        '*** [内部]基準CSV
        w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_0.txt"
        w_fio_read = POCOM001.POCOM_OpenTextFile(w_filename, 1, False)
        w_k = -1
        ReDim w_csvn(3, -1)
        Do While Not w_fio_read.AtEndOfStream
            w_k = w_k + 1
            w_dbuff = w_fio_read.ReadLine()
            w_dbuff = Replace(w_dbuff, """", "")
            ReDim Preserve w_csvn(3, w_k)
            w_split = VBSplit(w_dbuff, ",")
            For w_i = 0 To UBound(w_split, 1)
                w_csvn(w_i, w_k) = w_split(w_i)
            Next
        Loop
        w_fio_read.Close()
        w_fio_read = Nothing
        '**********************************************************************
        '*    ファイルオープン処理
        '**********************************************************************
        '*** [内部]読込用(このASPX外で作成されたCSV)
        If w_skbn = "3" AndAlso (w_gsmode = "1" OrElse w_gsmode = "4" OrElse w_gsmode = "6" OrElse w_gsmode = "7" OrElse w_gsmode = "8") Then
            '*** 固定帳票
            w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_" & SessionAsStr("SG_P_KTNAME_TIME") & ".CSV"
        Else
            w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & ".CSV"
        End If
        w_fio_read = POCOM001.POCOM_OpenTextFile(w_filename, 1, False)
        '*** [外部]読込用
        For w_n = 0 To 2
            w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_etc_" & w_n & ".CSV"
            w_fio_etc(w_n) = POCOM001.POCOM_OpenTextFile(w_filename, 1, False)
        Next
        '*** [結合後]書込用
        w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_etc" & ".CSV"
        w_fio_out = POCOM001.POCOM_CreateTextFile(w_filename, System.Text.Encoding.Unicode, True)
        '*** [結合後]帳票基準データ用
        w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_etc_0.txt"
        w_fio_kijun = POCOM001.POCOM_CreateTextFile(w_filename, System.Text.Encoding.Unicode, True)
        '/**********************************************/
        '/* キー部のヘッダー、EXCEL書式の定義            */
        '/**********************************************/
        Select Case p_skbn
            Case "3", "4"
                For w_n = 0 To 2
                    w_etcbuff(w_n) = w_fio_etc(w_n).ReadLine
                Next
                p_cate_wk = w_etcbuff(1) & "," & w_etcbuff(0) & p_cate_wk & "," & w_etcbuff(2) & ",31"
        End Select
        '**********************************************************************
        '*    ファイル作成処理（データ部）
        '**********************************************************************
        w_rscnt = 0
        w_recnt = 0
        w_scnt = 0
        For w_i = 0 To UBound(w_csve, 2)
            '** 社員コード,ID2毎
            If w_i = 0 Then
                '// 1行目はヘッダー項目なのでそのまま編集
                '/////////////////////////////////////////
                For w_n = 0 To 2
                    w_etcbuff(w_n) = w_fio_etc(w_n).ReadLine
                Next
                w_readbuff = w_fio_read.ReadLine()
                w_fio_out.WriteLine(w_etcbuff(1) & "," & w_etcbuff(0) & "," & w_readbuff & "," & w_etcbuff(2) & ",ソート順３")
            End If
            '// 2行目以降はデータ項目
            '/////////////////////////////////////////
            w_rscnt = w_recnt + 1
            '** [結合後]社員毎の開始位置取得（基準データ）
            If w_csve(0, w_i) <> w_csvn(0, w_scnt) OrElse w_i = 0 Then
                If w_i <> 0 Then
                    w_scnt = w_scnt + 1
                End If
                w_n = CInt(w_csvn(2, w_scnt)) - CInt(w_csvn(1, w_scnt))
                '** [内部]社員毎のデータ件数取得
                ReDim w_readbuff2(w_n)
                '** [内部]社員毎のデータ件数で配列作成
                For w_j = 0 To UBound(w_readbuff2, 1)
                    w_readbuff2(w_j) = w_fio_read.ReadLine()
                    '** [内部]その社員情報を全て保持する
                Next
            End If
            For w_k = CInt(w_csve(1, w_i)) To CInt(w_csve(2, w_i))
                '** [外部]社員コード毎の開始～終了位置までループ
                For w_n = 0 To 2
                    w_etcbuff(w_n) = w_fio_etc(w_n).ReadLine
                Next
                For w_j = 0 To UBound(w_readbuff2, 1)
                    '** [外部]データに[内部]データを付加する
                    '// 基準データ用
                    w_recnt = w_recnt + 1
                    '** [結合後]件数カウント:社員毎の終了位置（基準データ）
                    '// キー部＋外部+内部 のファイル書出し
                    If w_j = 0 Then
                        '// 一件目
                        w_fio_out.WriteLine(w_etcbuff(1) & "," & w_etcbuff(0) & "," & w_readbuff(w_j) & "," & w_etcbuff(2) & "," & CStr(w_j))
                    Else
                        '// 2件目以降
                        w_fio_out.WriteLine(w_etcbuff(1) & "," & w_etcbrankbuff & "," & w_readbuff(w_j) & "," & w_etcbuff(2) & "," & CStr(w_j))
                    End If
                Next
            Next
            '/********************************************/
            '/* 社員コード毎の開始行数＆終了行数の書出し    */
            '/* [利用者ＩＤ]_0.TXT                        */
            '/********************************************/
            Select Case p_skbn
                Case "3"
                    w_fio_kijun.WriteLine("""" & w_csve(0, w_i) & """,""" & CStr(w_rscnt) & """,""" & CStr(w_recnt) & """,""" & w_csve(3, w_i) & """")
            End Select
        Next
        '**********************************************************************
        '*    ファイルクローズ
        '**********************************************************************
        For w_n = 0 To 2
            w_fio_etc(w_n).Close()
            w_fio_etc(w_n) = Nothing
        Next
        w_fio_read.Close()
        w_fio_out.Close()
        w_fio_kijun.Close()
        w_fio_read = Nothing
        w_fio_out = Nothing
        w_fio_kijun = Nothing
        '**********************************************************************
        '*    ファイル名称変更
        '**********************************************************************
        On Error Resume Next
        '[内部]メインCSVの削除
        If w_skbn = "3" AndAlso (w_gsmode = "1" OrElse w_gsmode = "4" OrElse w_gsmode = "6" OrElse w_gsmode = "7" OrElse w_gsmode = "8") Then
            '*** 固定帳票
            w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_" & SessionAsStr("SG_P_KTNAME_TIME") & ".CSV"
        Else
            w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & ".CSV"
        End If
        fileobject.DeleteFile(w_filename, True)
        '[結合後]メインCSVのファイル名を[内部]メインCSVと同名にする
        w_hdbuff = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_etc" & ".CSV"
        fileobject.CopyFile(w_hdbuff, w_filename, True)
        '[外部]メインCSVのの削除
        fileobject.DeleteFile(w_hdbuff, True)
        '[内部]基準TXTの削除
        w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_0.txt"
        fileobject.DeleteFile(w_filename, True)
        '[結合後]基準TXTのファイル名を[内部]基準TXTと同名にする
        w_hdbuff = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_etc_0.txt"
        fileobject.CopyFile(w_hdbuff, w_filename, True)
        '[外部]基準TXTのの削除
        fileobject.DeleteFile(w_hdbuff, True)
        On Error GoTo 0
        fileobject = Nothing
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_CSVNAMEUPD
    '*  処理：外部データファイル名称の変更 →ファイル名に基準日を付加する
    '*  内容：
    '*  備考：
    '*  引数：[I] p_skbn  -- 処理区分
    '*                            1：任意選択（条件一覧選択時）
    '*                            2：任意選択（状況設定画面より呼出）
    '*                            3：固定帳票
    '*                            4：未使用
    '*      ：[I] p_kjday  -- ファイル名に付加する基準日
    '*
    '*  作成：000-VerP2.1    2004/06/07    I.H
    '*  履歴：
    '**********************************************************************
    Function FNCL_P_CSVNAMEUPD(ByRef p_skbn As String, ByRef p_kjday As String) As String
        '**********************************************************************
        '*    変数宣言
        '**********************************************************************
        Dim fileobject As FileSystemObject           '/* Server CreateObject
        Dim w_filenameA As String                    '/* 物理ファイル名
        Dim w_filenameB As String                    '/* 物理ファイル名
        Dim w_kjday As String                        '/* ファイル付加用基準日
        fileobject = New FileSystemObject()
        w_kjday = Replace(p_kjday, "/", "")
        '**********************************************************************
        '*    [内部]メインCSVのファイル名称変更
        '**********************************************************************
        FNCL_P_CSVNAMEUPD = PSTNullString
        If w_skbn = "3" AndAlso (w_gsmode = "1" OrElse w_gsmode = "4" OrElse w_gsmode = "6" OrElse w_gsmode = "7" OrElse w_gsmode = "8") Then
            '*** 固定帳票
            w_filenameA = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_" & SessionAsStr("SG_P_KTNAME_TIME") & ".CSV"
        Else
            w_filenameA = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & ".CSV"
        End If
        w_filenameB = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_" & w_kjday & ".CSV"
        On Error Resume Next
        '[内部]メインCSVのファイル名称に基準日を付加する
        fileobject.CopyFile(w_filenameA, w_filenameB, True)
        On Error GoTo 0
        '**********************************************************************
        '*    [内部]基準CSVのファイル名称変更
        '**********************************************************************
        Select Case p_skbn
            Case "3", "4"
                w_filenameA = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_0.txt"
                w_filenameB = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_0" & "_" & w_kjday & ".txt"
                On Error Resume Next
                '[内部]基準CSVのファイル名称に基準日を付加する
                fileobject.CopyFile(w_filenameA, w_filenameB, True)
                On Error GoTo 0
        End Select
        fileobject = Nothing
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_CSVUNION
    '*  処理：基準日を付加した外部データを一本化する
    '*  内容：
    '*  備考：
    '*  引数：[I] p_skbn  -- 処理区分
    '*                            1：任意選択（条件一覧選択時）
    '*                            2：任意選択（状況設定画面より呼出）
    '*                            3：固定帳票
    '*                            4：未使用
    '*      ：[I] p_kjday  -- ファイル名に付加する基準日
    '*
    '*  作成：000-VerP2.1    2004/06/07    I.H
    '*  履歴：
    '**********************************************************************
    Function FNCL_P_CSVUNION(ByRef p_skbn As String, ByRef p_hkjday(,) As String) As String
        '**********************************************************************
        '*    変数宣言
        '**********************************************************************
        Dim fileobject As FileSystemObject         '/* Server CreateObject
        Dim w_filename As String                   '/* 物理ファイル名
        Dim w_fio_read As TextStream               '/* テキスト変数(読込書込用)
        Dim w_fio_out As TextStream                '/* テキスト変数(書込用)
        Dim w_buff As String                       '/* テキスト文字列取得用
        Dim w_i As Integer                         '/* ループカウント
        Dim w_k As Integer                         '/* ループカウント
        Dim w_kjday As String                      '/* ファイル付加用基準日
        fileobject = New FileSystemObject()
        '**********************************************************************
        '*    [内部]メインCSVの一本化
        '**********************************************************************
        FNCL_P_CSVUNION = PSTNullString
        If w_skbn = "3" AndAlso (w_gsmode = "1" OrElse w_gsmode = "4" OrElse w_gsmode = "6" OrElse w_gsmode = "7" OrElse w_gsmode = "8") Then
            '*** 固定帳票
            w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_" & SessionAsStr("SG_P_KTNAME_TIME") & ".CSV"
        Else
            w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & ".CSV"
        End If
        w_fio_out = POCOM001.POCOM_CreateTextFile(w_filename, System.Text.Encoding.Unicode, True)
        For w_i = 0 To UBound(p_hkjday, 2)
            w_kjday = Replace(p_hkjday(0, w_i), "/", "")
            w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_" & w_kjday & ".CSV"
            w_fio_read = POCOM001.POCOM_OpenTextFile(w_filename, 1, False)
            w_k = 0
            Do While Not w_fio_read.AtEndOfStream
                w_k = w_k + 1
                '** ヘッダーの読み飛ばし
                '** 注）ヘッダーは最初のファイルの一件目のみ取得
                If w_k = 1 AndAlso w_i > 0 Then
                    w_fio_read.SkipLine()
                Else
                    w_buff = w_fio_read.ReadLine()
                    w_fio_out.WriteLine(w_buff)
                End If
            Loop
            w_fio_read.Close()
            w_fio_read = Nothing
            '不要ファイル削除
            On Error Resume Next
            'FileObject.DeleteFile w_filename,true
            On Error GoTo 0
        Next
        w_fio_out.Close()
        w_fio_out = Nothing
        '**********************************************************************
        '*    [内部]基準CSVの一本化
        '**********************************************************************
        Select Case p_skbn
            Case "3", "4"
                w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_0.txt"
                w_fio_out = POCOM001.POCOM_CreateTextFile(w_filename, System.Text.Encoding.Unicode, True)
                For w_i = 0 To UBound(p_hkjday, 2)
                    w_kjday = Replace(p_hkjday(0, w_i), "/", "")
                    w_filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_0" & "_" & w_kjday & ".txt"
                    w_fio_read = POCOM001.POCOM_OpenTextFile(w_filename, 1, False)
                    Do While Not w_fio_read.AtEndOfStream
                        w_buff = w_fio_read.ReadLine()
                        w_fio_out.WriteLine(w_buff)
                    Loop
                    w_fio_read.Close()
                    w_fio_read = Nothing
                    '不要ファイル削除
                    On Error Resume Next
                    On Error GoTo 0
                Next
                w_fio_out.Close()
                w_fio_out = Nothing
        End Select
        fileobject = Nothing
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_KYRITB
    '*  処理：履歴テーブル確認処理
    '*  内容：
    '*  備考：
    '*  引数：[I] p_data -- 取得データ
    '*        ：[I] p_id   -- 配列ID
    '*
    '*  作成：000-Ver6.1  2001/05/01 T.M
    '*  履歴：
    '**********************************************************************
    Function FNCL_P_KYRITB(ByRef p_data(,) As String, ByRef p_id As Integer) As String
        Dim sql As String
        Dim w_dbdata(,) As String = Nothing
        Dim w_datekbn1 As String              '*** 履歴情報を参照 0=しない・1=する
        Dim w_datekbn2 As String             '*** 参照可能期間（自）
        Dim w_datekbn3 As String             '*** 参照可能期間（至）
        FNCL_P_KYRITB = PSTNullString
        w_datekbn1 = P000S027.FNCG_P_0001020GETUPD(1, 7, 2, 4, 1, "")
        w_datekbn2 = P000S027.FNCG_P_0001020GETUPD(1, 7, 2, 4, 2, "")
        w_datekbn3 = P000S027.FNCG_P_0001020GETUPD(1, 7, 2, 4, 3, "")
        If p_data(1, p_id) <> "501" Then
            If Not IsNull(P000S001.FNCG_P_NZ(w_datekbn2)) Then
                If IsNull(P000S001.FNCG_P_NZ(p_data(24, p_id))) Then
                    p_data(24, p_id) = w_datekbn2
                Else
                    If p_data(24, p_id) < w_datekbn2 Then
                        p_data(24, p_id) = w_datekbn2
                    End If
                End If
            End If
            If Not IsNull(P000S001.FNCG_P_NZ(w_datekbn3)) Then
                If IsNull(P000S001.FNCG_P_NZ(p_data(25, p_id))) Then
                    p_data(25, p_id) = w_datekbn3
                Else
                    If p_data(25, p_id) > w_datekbn3 Then
                        p_data(25, p_id) = w_datekbn3
                    End If
                End If
            End If
            If w_datekbn1 = "1" Then
                sql = "SELECT COUNT(*) FROM " & SessionAsStr("SG_C_DBUSER1") & "SYKKRRK_TR"
                If IsNull(p_data(22, p_id)) Then
                    sql = sql & " WHERE 1 = 1"
                Else
                    sql = sql & " WHERE KAISYACD = :ORA_0"
                End If
                sql = sql & "   AND SYORIKB  = :ORA_1"
                sql = sql & "   AND RIREKFLG = 1"
                If Not IsNull(P000S001.FNCG_P_NZ(p_data(24, p_id))) Then
                    sql = sql & " AND SIKYUNGP>=:ORA_2"
                End If
                If Not IsNull(P000S001.FNCG_P_NZ(p_data(25, p_id))) Then
                    sql = sql & " AND SIKYUNGP<=:ORA_3"
                End If
                ReDim w_orapara(2, 3)
                w_orapara(0, 0) = p_data(22, p_id)
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = p_data(23, p_id)
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = p_data(24, p_id)
                w_orapara(1, 2) = "12"
                w_orapara(0, 3) = p_data(25, p_id)
                w_orapara(1, 3) = "12"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                    If CInt(w_dbdata(0, 0)) > 0 Then
                        Select Case p_data(1, p_id)
                            Case "502"
                                p_data(11, p_id) = "WEB_VP0003411"
                            Case "503"
                                p_data(11, p_id) = "WEB_VP0003412"
                            Case "504"
                                p_data(11, p_id) = "WEB_VP0003413"
                            Case "505"
                                p_data(11, p_id) = "WEB_VP0003414"
                        End Select
                    End If
                End If
            End If
        End If
        Return Nothing
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_SQLMAKE
    '*  処理：カテゴリ（ＩＤ）単位の外部ファイル作成処理
    '*  内容：
    '*  備考：
    '*  引数：[I] p_skbn  -- 1:ナビより,2:設定画面より,3:帳票出力
    '*                            1：任意選択（条件一覧選択時）
    '*                            2：任意選択（状況設定画面より呼出）
    '*                            3：固定帳票
    '*                            4：未使用
    '*        ：[I] p_kinou -- 機能区分
    '*        ：[I] p_rpkbn -- 帳票区分
    '*        ：[I] p_scd   -- 対象社員情報
    '*        ：[I] p_skensu-- 対象社員毎のデータ件数
    '*        ：[I] p_kjday -- 基準日(入力時のみ判断)
    '*        ：[O] p_err   -- エラー情報
    '*
    '*  作成：000-Ver6.0  2000/11/01 T.M
    '*  履歴：001-VerP2.1 2004/05/02 I.H 引数に基準日を追加
    '*  履歴：002-VerP4.0d 2009/09/02 C.O 【修正445】E101298 発令処理の兼務所属情報出力不具合対応
    '*  履歴：003-VerP4.0e 2009/11/04 C.O 【改善】D100561 労基法改正対応に伴うテーブル変更対応
    '*  履歴：004-VerP4.0f 2010/02/05 C.O 【修正538】E101395 固定帳票の基準日取得不具合対応
    '*  履歴：005-VerP4.3a 2012/12/26 H.N 【改善P-12-021】禁則文字対応
    '**********************************************************************
    Function FNCL_P_SQLMAKE(ByRef p_skbn As String, ByRef p_kinou As String, ByRef p_rpkbn As String, ByRef p_outfmt As String, _
                            ByRef w_kdata(,) As String, ByRef p_scd(,) As String, ByRef p_min As Integer, ByRef p_max As Integer, ByRef p_skensu(,) As Integer, ByRef p_excelfmt As String, ByRef p_printinf() As String, ByRef p_kjday As String, ByRef p_err As String, _
                            ByVal permission As String) As Integer
        Dim sql As String
        Dim w_fdata(,) As String = Nothing          '*** 項目データ
        Dim w_tempdata() As Object = Nothing        '*** 必要項目の保存
        Dim w_tempdata1(,) As String = Nothing
        Dim w_i As Integer
        Dim w_j As Integer
        Dim w_k As Integer
        Dim w_h As Integer
        Dim w_l As Integer
        Dim w_x As Integer
        Dim w_y As Integer
        Dim w_z As Integer
        Dim w_cnt As Integer
        Dim w_table1 As String                      '*** テーブル情報
        Dim w_table2 As String                      '*** テーブル項目情報
        Dim w_table3 As String                      '*** グループ情報
        Dim w_table4 As String                      '*** 照会情報
        Dim w_table5 As String                      '*** 照会項目情報
        Dim w_dbdata(,) As String = Nothing
        Dim w_nendo As String
        Dim w_sql_s As String
        Dim w_sql_f As String
        Dim w_sql_w As String
        Dim w_sql_o As String
        Dim w_sql_s2 As String                      '*** (人事所属・予備所属)兼務用
        Dim w_sql_f2 As String                      '*** (人事所属・予備所属)兼務用
        Dim w_sql_w2 As String                      '*** (人事所属・予備所属)兼務用
        Dim w_sql_o2 As String                      '*** (人事所属・予備所属)兼務用
        Dim w_sql_o2_temp As String                 '*** (人事所属・予備所属)兼務用
        Dim w_sql_s_add As String                   '*** (人事所属・予備所属)兼務用、ORDER BY用のSELECT句
        Dim w_sql_s2_add As String                  '*** (人事所属・予備所属)兼務用、ORDER BY用のSELECT句
        Dim w_sql_s_add_num As Integer              '*** (人事所属・予備所属)兼務用
        Dim w_kflg As String                        '*** 兼務取得フラグ(0:取得不要、1:取得必要)
        Dim w_mstcnt As Integer
        Dim filename As String
        Dim fileobject As FileSystemObject
        Dim outstream As TextStream
        Dim w_fmt As String = String.Empty               '*** 表示書式
        Dim w_fmt2() As String
        Dim w_oname As String                       '*** 表示名称
        Dim w_fldcnt As Integer                     '*** 項目配列数
        Dim w_brankbuff As String                   '*** 外部用ブランクデータ
        Dim w_dbuff As String
        Dim w_value As String
        Dim w_tmpvalue As String    '*** 出力文言（画面出力時の外部出力一時格納用）
        Dim w_dbcnt As Integer                      '*** データ取得現在配列位置
        Dim w_dstart As Long
        Dim w_dend As Long
        Dim w_sdate As String
        Dim w_name As String
        Dim w_allkbn As String       '*** 一括処理区分(1:１件毎,2:一括) 
        Dim w_rc As String
        Dim w_reccnt As Long
        Dim icnt As Integer
        Dim w_syosu() As String = Nothing
        Dim w_hukakbn As String      '*** 付加文字区分
        Dim w_hukakbn2() As String = Nothing
        Dim w_hukamoji As String     '*** 付加文字
        Dim w_hukamoji2() As String
        Dim w_hdata() As String
        Dim w_flg As Integer
        Dim w_orikae As String      '*** 折返し設定
        Dim w_orikae2() As String
        Dim w_work As String
        Dim w_work2() As String
        Dim w_wdate As String        '*** ワーク日付
        Dim w_cflg As String                        '*** 基準日変更フラグ
        Dim w_field As String
        Dim w_midname_flg As String             '*** ミドルネーム（0：使用しない；1：半角スペース；2：全角スペース；）
        Dim w_midname() As String = Nothing     '*** ミドルネームが関するデータの保存
        Dim w_gname() As String = Nothing       '*** ミドルネームの連結結果
        Dim w_kzkkb As Integer                  '*** 家族区分（NAME家族氏名）
        w_orikae = ""
        w_allkbn = ""
        w_sql_f = ""
        w_field = ""
        w_sql_w = ""
        w_hukakbn = ""
        w_wdate = ""
        w_hukamoji = ""
        FNCL_P_SQLMAKE = 0
        w_nendo = ""
        w_midname_flg = "0"
        SUBL_P_GETMIDNAME_FLG(w_midname_flg)
        '**********************************************************************
        '* 使用テーブル変数化
        '**********************************************************************
        Select Case p_kinou
            Case "400"
                w_table1 = SessionAsStr("SG_C_DBUSER1") & "WEB_TP4000010_M"
                w_table2 = "(" & P000S055.FNCG_P_WEB_TP4000020_M(w_kcode) & ")"
                w_table3 = SessionAsStr("SG_C_DBUSER1") & "WEB_TP4000030_M"
                w_table4 = "(" & P000S055.FNCG_P_WEB_TP4000110_M(w_kcode) & ")"
                w_table5 = "(" & P000S055.FNCG_P_WEB_TP4000120_M(w_kcode) & ")"
                w_nendo = SessionAsStrArray("SL_P400_INF14")(1)
            Case Else
                w_table1 = SessionAsStr("SG_C_DBUSER1") & "WEB_TP0000010_M"
                w_table2 = "(" & P000S050.FNCG_P_WEB_TP0000020_M(w_kcode) & ")"
                w_table3 = SessionAsStr("SG_C_DBUSER1") & "WEB_TP0000030_M"
                w_table4 = "(" & P000S051.FNCG_P_WEB_TP0010010_M(w_kcode) & ")"
                w_table5 = "(" & P000S051.FNCG_P_WEB_TP0010020_M(w_kcode) & ")"
        End Select
        '**********************************************************************
        '* 出力分類カテゴリの取得
        '**********************************************************************
        '******************************************************************
        '* テーブル情報任意選択
        '******************************************************************
        Select Case p_skbn
            Case "1", "2"
                sql = "SELECT"
                sql = sql & " A.DISP_ORDER"
                '***  0:表示順
                sql = sql & ",A.CATEGORY_DIV"
                '***  1:カテゴリ区分
                sql = sql & ",B.CATEGORY_NAME"
                '***  2:カテゴリ名
                sql = sql & ",NVL(D.SORT_CONF,C.SORT_DIV)"
                '*** 3:ソート設定
                sql = sql & ",NVL(D.DISP_CONF,'0')"
                '***  4:表示設定
                sql = sql & ",NVL(D.COUNT_CONF,0)"
                '***  5:件数設定
                sql = sql & ",TO_CHAR(D.PERIOD_FROM,'YYYY/MM/DD')"
                '***  6:期間自
                sql = sql & ",TO_CHAR(D.PERIOD_TO,'YYYY/MM/DD')"
                '***  7:期間至
                sql = sql & ",:ORA_1"
                '***  8:基準日
                sql = sql & ",:ORA_2"
                '***  9:基準目年度期
                sql = sql & ",C.DIV"
                '*** 10:区分
                sql = sql & ",B.CRITERIA_TBL"
                '*** 11:基準テーブル
                sql = sql & ",NVL(B.EMP_KEY1,C.EMP_KEY1)"
                '*** 12:社員ＫＥＹ
                sql = sql & ",B.HISTORY_DIV"
                '*** 13:歴区分
                sql = sql & ",''"
                '*** 14:取得ＳＱＬ）
                sql = sql & ",0"
                '*** 15:(項目配列数）
                sql = sql & ",''"
                '*** 16:(表示書式）
                sql = sql & ",''"
                '*** 17:(画面項目名）
                sql = sql & ",''"
                '*** 18:小数桁数
                sql = sql & ",A.REFERENCE_RANGE"
                '*** 19:参照範囲
                sql = sql & ",''"
                '*** 20:（画面項目名）
                sql = sql & ",A.DIV"
                '*** 21:区分(1:人事,2:給与・就業)
                sql = sql & ",A.KAISYACD"
                '*** 22:会社コード
                sql = sql & ",A.PROCESS_DIV"
                '*** 23:処理区分
                sql = sql & ",TO_CHAR(A.PAYMENT_YMD_FROM,'YYYY/MM/DD')"
                '*** 24:支給年月日自
                sql = sql & ",TO_CHAR(A.PAYMENT_YMD_TO,'YYYY/MM/DD')"
                '*** 25:支給年月日至
                sql = sql & ",E.KAISYANM"
                '*** 26:会社名
                sql = sql & ",A.SELECT_ORDER_FROM"
                '*** 27:選択順自
                sql = sql & ",A.SELECT_ORDER_TO"
                '*** 28:選択順至
                sql = sql & ",:ORA_3"
                '*** 29:表示書式
                sql = sql & ",''"
                '*** 30:付加文字区分
                sql = sql & ",''"
                '*** 31:付加文字
                sql = sql & ",1"
                '*** 32:利用設定
                sql = sql & ",0"
                '*** 33:折返しフラグ
                sql = sql & ",''"
                '*** 34:折返し設定
                sql = sql & ",''"
                '*** 35:表示順設定
                sql = sql & ",NVL(A.CALC_GROUP,0)"
                '*** 36:計算グループ
                sql = sql & ",NVL(A.BONUS_CODE,0)"
                '*** 37:賞与コード
                sql = sql & ",1"
                '*** 38:参照先設定(1:通常,2:発令考慮)
                sql = sql & ",0"
                '*** 39:参照先設定(0:通常のみ)
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010240_W A"
                sql = sql & "     ," & w_table4 & " B"
                sql = sql & "     ," & w_table1 & " C"
                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010260_W D"
                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "KAISYA_MS E"
                sql = sql & " WHERE A.CUSTOMER_ID=:ORA_0"
                sql = sql & "   AND A.CATEGORY_DIV = B.CATEGORY_DIV (+)"
                sql = sql & "   AND B.CRITERIA_TBL=C.TBL_NAME"
                sql = sql & "   AND A.CUSTOMER_ID = D.CUSTOMER_ID (+)"
                sql = sql & "   AND A.CATEGORY_DIV = D.CATEGORY_DIV (+)"
                sql = sql & "   AND A.KAISYACD = E.KAISYACD(+)"
                sql = sql & " ORDER BY A.DIV,A.DISP_ORDER"
                ReDim w_orapara(2, 3)
                w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                w_orapara(1, 0) = "2"
                If Not IsNull(P000S001.FNCG_P_NZ(p_kjday)) Then
                    w_orapara(0, 1) = p_kjday
                Else
                    w_orapara(0, 1) = SessionAsStrArray("SG_P_001INF")(15)
                End If
                w_orapara(1, 1) = "1"
                w_orapara(0, 2) = SessionAsStrArray("SG_P_001INF")(16)
                w_orapara(1, 2) = "1"
                w_orapara(0, 3) = p_outfmt
                w_orapara(1, 3) = "1"
                If P000S011.FNCG_P_RECORDSET5(40, sql, w_orapara, w_kdata) = False Then
                    '*** ﾗﾍﾞﾙ(35)："出力項目が存在しません。"
                    PE_ComVars.Instance.w_errtext = w_langmsg(0, 35)
                    FNCL_P_SQLMAKE = 1
                    Exit Function
                End If
                For w_i = 0 To UBound(w_kdata, 2)
                    '**************************************************************
                    '* 給与・就業項目内用取得
                    '**************************************************************
                    If w_kdata(21, w_i) = "2" Then
                        '**********************************************************
                        '* 給与項目
                        '**********************************************************
                        Select Case w_kdata(1, w_i)
                            Case "501", "502", "503", "504", "505"
                                '*** 履歴テーブル使用確認
                                FNCL_P_KYRITB(w_kdata, w_i)
                                '*** カテゴリ名称取得
                                w_name = w_kdata(2, w_i) & "(" & w_kdata(26, w_i)
                                If w_kdata(1, w_i) <> "501" Then
                                    Select Case w_kdata(23, w_i)
                                        Case "0"
                                            w_name = w_name & "：給与"
                                        Case "1"
                                            w_name = w_name & "：賞与"
                                    End Select
                                    If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(24, w_i))) OrElse Not IsNull(P000S001.FNCG_P_NZ(w_kdata(25, w_i))) Then
                                        w_name = w_name & "：" & w_kdata(24, w_i) & "～" & w_kdata(25, w_i)
                                    End If
                                End If
                                w_kdata(2, w_i) = w_name & ")"
                                '*** 項目名称取得
                                sql = "SELECT "
                                sql = sql & " B.DISP_FORMAT"
                                '*** 0:表示書式
                                '*** 変数ＩＤを付与する
                                If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                    '*** 1:画面項目名
                                    If w_kdata(1, w_i) = "503" AndAlso w_kdata(23, w_i) = "1" Then
                                        '*** 変動（賞与の場合）
                                        sql = sql & ",NVL(C.MANAGEMENT_NAME,'(' || 'B' || SUBSTR(D.HENSUID,2) || ')' || D.KOUMOKME)"
                                    Else
                                        sql = sql & ",NVL(C.MANAGEMENT_NAME,'(' || D.HENSUID || ')' || D.KOUMOKME)"
                                    End If
                                Else
                                    sql = sql & ",NVL(C.MANAGEMENT_NAME,D.KOUMOKME)"
                                    '*** 1:画面項目名
                                End If
                                sql = sql & ",NVL(D.SYOSUKTS,0)"
                                '*** 2:小数点桁数
                                sql = sql & ",C.MASTER_ID"
                                '*** 3:マスタＩＤ
                                sql = sql & ",B.ITEM_NAME"
                                '*** 4:項目名
                                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010230_W A"
                                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010020_M B"
                                sql = sql & "     ,(" & P000S050.FNCG_P_WEB_TP0000020_M(w_kcode) & ") C"
                                If w_kdata(1, w_i) = "503" AndAlso w_kdata(23, w_i) = "1" Then
                                    '*** 変動（賞与の場合）
                                    sql = sql & "     ,(" & P000S030.FNCG_P_KYHENDOTBNAME(1, "") & ") D"
                                Else
                                    sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "KOUMOKU_MS D"
                                End If
                                sql = sql & " WHERE A.CUSTOMER_ID=:ORA_0"
                                sql = sql & "   AND A.DIV='2'"
                                sql = sql & "   AND A.SELECT_ORDER>=:ORA_1"
                                sql = sql & "   AND A.SELECT_ORDER<=:ORA_2"
                                sql = sql & "   AND B.CATEGORY_DIV=:ORA_3"
                                sql = sql & "   AND A.ITEM_ORDER = B.ITEM_ORDER"
                                sql = sql & "   AND B.DIV = C.DIV(+)"
                                sql = sql & "   AND B.ITEM_NAME = C.ITEM_NAME(+)"
                                sql = sql & "   AND D.KAISYACD(+)=:ORA_4"
                                sql = sql & "   AND B.ITEM_NAME = D.HENSUID(+)"
                                sql = sql & "   AND NVL(C.MANAGEMENT_NAME,D.KOUMOKME) IS NOT NULL"
                                sql = sql & " ORDER BY A.SELECT_ORDER"
                                ReDim w_orapara(2, 4)
                                w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                                w_orapara(1, 0) = "2"
                                w_orapara(0, 1) = w_kdata(27, w_i)
                                w_orapara(1, 1) = "2"
                                w_orapara(0, 2) = w_kdata(28, w_i)
                                w_orapara(1, 2) = "2"
                                w_orapara(0, 3) = w_kdata(1, w_i)
                                w_orapara(1, 3) = "2"
                                w_orapara(0, 4) = w_kdata(22, w_i)
                                w_orapara(1, 4) = "101"
                                If P000S011.FNCG_P_RECORDSET5(5, sql, w_orapara, w_dbdata) = True Then
                                    For w_j = 0 To UBound(w_dbdata, 2)
                                        If w_j > 0 Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & ","
                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "|||"
                                            w_kdata(18, w_i) = w_kdata(18, w_i) & ","
                                        End If
                                        w_kdata(17, w_i) = w_kdata(17, w_i) & w_dbdata(1, w_j)
                                        If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 1) = "0" Then
                                            If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M01" AndAlso w_dbdata(4, w_j) <= "M99") OrElse (w_dbdata(4, w_j) >= "H01" AndAlso w_dbdata(4, w_j) <= "H99") OrElse (w_dbdata(4, w_j) >= "D01" AndAlso w_dbdata(4, w_j) <= "D99") OrElse (w_dbdata(4, w_j) >= "V01" AndAlso w_dbdata(4, w_j) <= "V99") OrElse (w_dbdata(4, w_j) >= "F01" AndAlso w_dbdata(4, w_j) <= "F99")) Then
                                                w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                            Else
                                                w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                            End If
                                        Else
                                            If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M001" AndAlso w_dbdata(4, w_j) <= "M999") OrElse (w_dbdata(4, w_j) >= "H001" AndAlso w_dbdata(4, w_j) <= "H999") OrElse (w_dbdata(4, w_j) >= "D001" AndAlso w_dbdata(4, w_j) <= "D999") OrElse (w_dbdata(4, w_j) >= "V001" AndAlso w_dbdata(4, w_j) <= "V999") OrElse (w_dbdata(4, w_j) >= "B001" AndAlso w_dbdata(4, w_j) <= "B999") OrElse (w_dbdata(4, w_j) >= "F001" AndAlso w_dbdata(4, w_j) <= "F999")) Then
                                                w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                            Else
                                                w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                            End If
                                        End If
                                        w_kdata(18, w_i) = w_kdata(18, w_i) & w_dbdata(2, w_j)
                                    Next
                                End If
                                '**********************************************************
                                '* 就業項目
                                '**********************************************************
                            Case Else
                                '*** 履歴テーブル使用確認
                                'Call FNCL_P_KYRITB(w_kdata,w_i)
                                '*** カテゴリ名称取得
                                w_name = w_kdata(2, w_i) & "(" & w_kdata(26, w_i)
                                Select Case w_kdata(1, w_i)
                                    Case "551", "552", "553", "554", "555", "556", "557", "558"
                                        If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(24, w_i))) OrElse Not IsNull(P000S001.FNCG_P_NZ(w_kdata(25, w_i))) Then
                                            w_name = w_name & "：" & w_kdata(24, w_i) & "～" & w_kdata(25, w_i)
                                        End If
                                    Case "559", "560", "561", "562", "563", "564"
                                        Select Case w_kdata(23, w_i)
                                            Case "1"
                                                w_name = w_name & "：給与"
                                            Case "2"
                                                w_name = w_name & "：賞与"
                                        End Select
                                        '*** 計算グループ
                                        If w_kdata(36, w_i) <> "0" Then
                                            w_name = w_name & "：" & FNCL_P_MST_NAVALUEGET(1, "252", "", "", 2, w_kdata(22, w_i), CInt(w_kdata(36, w_i)), 0, 0, 0)
                                        End If
                                        '*** 賞与コード
                                        If w_kdata(37, w_i) <> "0" Then
                                            w_name = w_name & "：" & FNCL_P_MST_NAVALUEGET(1, "251", "", "", 2, w_kdata(22, w_i), CInt(w_kdata(37, w_i)), 0, 0, 0)
                                        End If
                                        '*** 支給年月日
                                        If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(24, w_i))) OrElse Not IsNull(P000S001.FNCG_P_NZ(w_kdata(25, w_i))) Then
                                            w_name = w_name & "：" & Mid(w_kdata(24, w_i), 1, 4) & Mid(w_kdata(24, w_i), 6, 2) & "～" & Mid(w_kdata(25, w_i), 1, 4) & Mid(w_kdata(25, w_i), 6, 2)
                                        End If
                                End Select
                                w_kdata(2, w_i) = w_name & ")"
                                '*** 項目名称取得
                                sql = "SELECT "
                                If SessionAsStr("SG_P_KAISYA_FLG") = "1" Then
                                    sql = sql & " WEB_SP0002230_F(:ORA_5, 10, 2, 0, 0, B.CATEGORY_DIV, B.ITEM_ORDER)"
                                Else
                                    sql = sql & " WEB_SP0002230_F(A.KAISYACD, 10, 2, 0, 0, B.CATEGORY_DIV, B.ITEM_ORDER)"
                                End If
                                '*** 0:表示書式
                                Select Case w_kdata(1, w_i)
                                    Case "550"
                                        '*** 変数ＩＤを付与する
                                        If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,'(' || D.HENSUID || ')' || D.KOUMOKME)"
                                        Else
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,D.KOUMOKME)"
                                            '*** 1:画面項目名
                                        End If
                                        sql = sql & ",NVL(D.SYOSUKTS,0)"
                                        '*** 2:小数点桁数
                                    Case "551"
                                        '*** 変数ＩＤを付与する
                                        If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,'(' || B.ITEM_NAME || ')' || D.JIKNKMNM)"
                                        Else
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,D.JIKNKMNM)"
                                        End If
                                        sql = sql & ",0"
                                        '*** 2:小数点桁数
                                    Case "557", "562"
                                        '*** 変数ＩＤを付与する
                                        If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                            '*** 1:画面項目名
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,'(' || D.JIKNKMCD || ')' || D.JIKNKMNM)"
                                        Else
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,D.JIKNKMNM)"
                                            '*** 1:画面項目名
                                        End If
                                        sql = sql & ",0"
                                        '*** 2:小数点桁数
                                    Case "561"
                                        '*** 変数ＩＤを付与する
                                        If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,'(' || D.KISUKMCD || ')' || D.KISUKMNM)"
                                        Else
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,D.KISUKMNM)"
                                            '*** 1:画面項目名
                                        End If
                                        sql = sql & ",0"
                                        '*** 2:小数点桁数
                                    Case "563"
                                        '*** 変数ＩＤを付与する
                                        If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                            '*** 1:画面項目名
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,'(' || D.NISUKMCD || ')' || D.NISUKMNM)"
                                        Else
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,D.NISUKMNM)"
                                            '*** 1:画面項目名
                                        End If
                                        sql = sql & ",0"
                                        '*** 2:小数点桁数
                                    Case "564"
                                        '*** 変数ＩＤを付与する
                                        If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                            '*** 1:画面項目名
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,'(' || D.SINSKMCD || ')' || D.SINSKMNM)"
                                        Else
                                            sql = sql & ",NVL(C.MANAGEMENT_NAME,D.SINSKMNM)"
                                            '*** 1:画面項目名
                                        End If
                                        sql = sql & ",0"
                                        '*** 2:小数点桁数
                                    Case Else
                                        sql = sql & ",C.MANAGEMENT_NAME"
                                        '*** 1:画面項目名
                                        sql = sql & ",0"
                                        '*** 2:小数点桁数
                                End Select
                                sql = sql & ",C.MASTER_ID"
                                '*** 3:マスタＩＤ
                                sql = sql & ",B.ITEM_NAME"
                                '*** 4:項目名
                                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010230_W A"
                                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010020_M B"
                                sql = sql & "     ,(" & P000S050.FNCG_P_WEB_TP0000020_M(w_kcode) & ") C"
                                Select Case w_kdata(1, w_i)
                                    Case "550"
                                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "TIM_KOUMOKU_MS D"
                                    Case "551", "557", "562"
                                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "TIM_JIKANKM_MS D"
                                    Case "561"
                                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "TIM_KAISUKM_MS D"
                                    Case "563"
                                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "TIM_NISSUKM_MS D"
                                    Case "564"
                                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "TIM_SINSEKM_MS D"
                                End Select
                                sql = sql & " WHERE A.CUSTOMER_ID=:ORA_0"
                                sql = sql & "   AND A.DIV='2'"
                                sql = sql & "   AND A.SELECT_ORDER>=:ORA_1"
                                sql = sql & "   AND A.SELECT_ORDER<=:ORA_2"
                                sql = sql & "   AND B.CATEGORY_DIV=:ORA_3"
                                sql = sql & "   AND A.ITEM_ORDER = B.ITEM_ORDER"
                                sql = sql & "   AND B.DIV = C.DIV(+)"
                                sql = sql & "   AND B.ITEM_NAME = C.ITEM_NAME(+)"
                                Select Case w_kdata(1, w_i)
                                    Case "550"
                                        sql = sql & "   AND D.KAISYACD(+)=:ORA_4"
                                        sql = sql & "   AND B.ITEM_NAME = D.HENSUID(+)"
                                        sql = sql & "   AND NVL(C.MANAGEMENT_NAME,D.KOUMOKME) IS NOT NULL"
                                    Case "551", "557", "562"
                                        sql = sql & "   AND D.KAISYACD(+)=:ORA_4"
                                        sql = sql & "   AND 'J' || SUBSTR(B.ITEM_NAME,2,2) = D.JIKNKMCD(+)"
                                        sql = sql & "   AND NVL(C.MANAGEMENT_NAME,D.JIKNKMNM) IS NOT NULL"
                                    Case "561"
                                        sql = sql & "   AND D.KAISYACD(+)=:ORA_4"
                                        sql = sql & "   AND B.ITEM_NAME = D.KISUKMCD(+)"
                                        sql = sql & "   AND NVL(C.MANAGEMENT_NAME,D.KISUKMNM) IS NOT NULL"
                                    Case "563"
                                        sql = sql & "   AND D.KAISYACD(+)=:ORA_4"
                                        sql = sql & "   AND B.ITEM_NAME = D.NISUKMCD(+)"
                                        '***                        sql = sql & "   AND NVL(C.管理名称,D.NISUKMNM) IS NOT NULL"
                                    Case "564"
                                        sql = sql & "   AND D.KAISYACD(+)=:ORA_4"
                                        sql = sql & "   AND B.ITEM_NAME = D.SINSKMCD(+)"
                                        sql = sql & "   AND NVL(C.MANAGEMENT_NAME,D.SINSKMNM) IS NOT NULL"
                                End Select
                                sql = sql & " ORDER BY A.SELECT_ORDER"
                                ReDim w_orapara(2, 5)
                                w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                                w_orapara(1, 0) = "2"
                                w_orapara(0, 1) = w_kdata(27, w_i)
                                w_orapara(1, 1) = "2"
                                w_orapara(0, 2) = w_kdata(28, w_i)
                                w_orapara(1, 2) = "2"
                                w_orapara(0, 3) = w_kdata(1, w_i)
                                w_orapara(1, 3) = "2"
                                w_orapara(0, 4) = w_kdata(22, w_i)
                                w_orapara(1, 4) = "101"
                                If SessionAsStr("SG_P_KAISYA_FLG") = "1" Then
                                    w_orapara(0, 5) = SessionAsStr("SG_P_KAISYA_SELECT")
                                    w_orapara(1, 5) = "101"
                                End If
                                If P000S011.FNCG_P_RECORDSET5(5, sql, w_orapara, w_dbdata) = True Then
                                    For w_j = 0 To UBound(w_dbdata, 2)
                                        If w_j > 0 Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & ","
                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "|||"
                                            w_kdata(18, w_i) = w_kdata(18, w_i) & ","
                                        End If
                                        Select Case w_kdata(1, w_i)
                                            Case "558"
                                                If w_dbdata(4, w_j) >= "G01" AndAlso w_dbdata(4, w_j) <= "G10" Then
                                                    w_name = FNCL_P_MST_NAVALUEGET(3, "SELECT KMNMGSYT FROM " & SessionAsStr("SG_C_DBUSER1") & "TIM_CONTROL_MS WHERE KAISYACD=:ORA_0", "", "", 1, w_kdata(22, w_i), 0, 0, 0, 0)
                                                    If IsNull(P000S001.FNCG_P_NZ(w_name)) Then
                                                        w_name = "外出"
                                                    End If
                                                    '*** 変数ＩＤを付与する
                                                    If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                                        w_kdata(17, w_i) = w_kdata(17, w_i) & "(" & w_dbdata(4, w_j) & ")" & w_name & "時間" & CInt(Mid(w_dbdata(4, w_j), 2))
                                                    Else
                                                        w_kdata(17, w_i) = w_kdata(17, w_i) & w_name & "時間" & CInt(Mid(w_dbdata(4, w_j), 2))
                                                    End If
                                                ElseIf w_dbdata(4, w_j) >= "G51" AndAlso w_dbdata(4, w_j) <= "G55" Then
                                                    '*** 変数ＩＤを付与する
                                                    If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                                        w_kdata(17, w_i) = w_kdata(17, w_i) & "(" & w_dbdata(4, w_j) & ")" & "時間休暇" & Mid(w_dbdata(4, w_j), 3, 1)
                                                    Else
                                                        w_kdata(17, w_i) = w_kdata(17, w_i) & "時間休暇" & Mid(w_dbdata(4, w_j), 3, 1)
                                                    End If
                                                Else
                                                    w_kdata(17, w_i) = w_kdata(17, w_i) & w_dbdata(1, w_j)
                                                End If
                                                w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                                w_kdata(18, w_i) = w_kdata(18, w_i) & w_dbdata(2, w_j)
                                            Case "563"
                                                '*** 変数ＩＤを付与する
                                                If SessionAsStrArray("SG_P_ENVIR_001")(68) = "1" Then
                                                    Select Case w_dbdata(4, w_j)
                                                        Case "U01"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "(U01)代休発生日数"
                                                        Case "U02"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "(U02)代休取得日数"
                                                        Case "U03"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "(U03)代休取得日数の内無効日数"
                                                        Case "U04"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "(U04)代休消滅日数"
                                                        Case "U05"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "(U05)代休残日数"
                                                        Case "U06"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "(U06)振休日数"
                                                        Case "U07"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "(U07)振出日数"
                                                        Case "U08"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "(U08)買取日数"
                                                        Case Else
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & w_dbdata(1, w_j)
                                                    End Select
                                                Else
                                                    Select Case w_dbdata(4, w_j)
                                                        Case "U01"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "代休発生日数"
                                                        Case "U02"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "代休取得日数"
                                                        Case "U03"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "代休取得日数の内無効日数"
                                                        Case "U04"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "代休消滅日数"
                                                        Case "U05"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "代休残日数"
                                                        Case "U06"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "振休日数"
                                                        Case "U07"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "振出日数"
                                                        Case "U08"
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & "買取日数"
                                                        Case Else
                                                            w_kdata(17, w_i) = w_kdata(17, w_i) & w_dbdata(1, w_j)
                                                    End Select
                                                End If
                                                w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                                w_kdata(18, w_i) = w_kdata(18, w_i) & w_dbdata(2, w_j)
                                            Case Else
                                                w_kdata(17, w_i) = w_kdata(17, w_i) & w_dbdata(1, w_j)
                                                w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                                w_kdata(18, w_i) = w_kdata(18, w_i) & w_dbdata(2, w_j)
                                        End Select
                                    Next
                                End If
                        End Select
                    End If
                Next
            Case "3"
                sql = "SELECT"
                sql = sql & " A.IDENTIFIER"
                '*** 0
                sql = sql & ",A.CATEGORY_DIV"
                '*** 1
                sql = sql & ",A.MAX_DISP_COUNT"
                '*** 2
                sql = sql & ",NVL(A.SORT_CONF,C.SORT_DIV)"
                '*** 3:
                sql = sql & ",NVL(A.DISP_CONF,'0')"
                '*** 4:
                sql = sql & ",NVL(A.COUNT_CONF,0)"
                '*** 5:
                sql = sql & ",TO_CHAR(A.PERIOD_FROM,'YYYY/MM/DD')"
                '*** 6
                sql = sql & ",TO_CHAR(A.PERIOD_TO,'YYYY/MM/DD')"
                '*** 7
                If Not IsNull(P000S001.FNCG_P_NZ(p_kjday)) Then
                    sql = sql & ",'" & p_kjday & "'"
                    '***  8:基準日
                Else
                    If w_kinou = "120" Then
                        sql = sql & ",NVL(NVL('" & SessionAsStrArray("SL_P120_INF02")(2) & "',TO_CHAR(A.BASE_DATE,'YYYY/MM/DD')),'" & SessionAsStr("SG_P_TDATE") & "')"
                        '*** 8 SL_120-13_009 詳細は、P120M311.aspxを参照
                        '//* 発令処理の場合
                    ElseIf w_kinou = "303" Then
                        If SessionAsStrArray("SL_P303_INF01")(33) = "1" Then
                            '*** 基準日区分：今日
                            '** ① 固定帳票の基準日  ② 今日日付
                            sql = sql & ",NVL(TO_CHAR(A.BASE_DATE,'YYYY/MM/DD'),'" & SessionAsStr("SG_P_TDATE") & "')"
                            '*** 8
                        Else
                            '*** 基準日区分：基準日
                            '** ① 固定帳票の基準日  ② 画面で指定した基準日(NULLの場合は今日日付)
                            sql = sql & ",NVL(TO_CHAR(A.BASE_DATE,'YYYY/MM/DD'),'" & w_printinf(2) & "')"
                            '*** 8
                        End If
                    Else
                        If SessionAsStrArray("SG_P_001INF")(6) = "1" Then
                            '*** 今日
                            'sql = sql & ",'" & SessionAsStr("SG_P_TDATE") & "'"        '*** 8
                            sql = sql & ",NVL(TO_CHAR(A.BASE_DATE,'YYYY/MM/DD'),'" & SessionAsStr("SG_P_TDATE") & "')"
                            '*** 8
                        Else
                            '*** 基準日
                            sql = sql & ",NVL(TO_CHAR(A.BASE_DATE,'YYYY/MM/DD'),'" & SessionAsStrArray("SG_P_001INF")(15) & "')"
                            '*** 8
                        End If
                    End If
                End If
                If w_kinou = "120" Then
                    sql = sql & ",DECODE(NVL('" & SessionAsStrArray("SL_P120_INF02")(3) & "',A.BASE_YEAR_PERIOD),'00000-0','" & SessionAsStrArray("SG_P_001INF")(16) & "',NVL('" & SessionAsStrArray("SL_P120_INF02")(3) & "',A.BASE_YEAR_PERIOD))"
                    '*** 9 SL_120-13_009 詳細は、P120M311.aspxを参照
                ElseIf w_kinou = "303" Then
                    '** ① 固定帳票の基準年度・期  ② 画面で指定した基準年度・期
                    sql = sql & ",DECODE(A.BASE_YEAR_PERIOD,'00000-0','" & SessionAsStrArray("SL_P303_INF01")(32) & "',NVL(A.BASE_YEAR_PERIOD,'" & SessionAsStrArray("SL_P303_INF01")(32) & "'))"
                    '*** 9 SL_303-5_002 詳細は、P303M401.aspxを参照
                Else
                    sql = sql & ",DECODE(A.BASE_YEAR_PERIOD,'00000-0','" & SessionAsStrArray("SG_P_001INF")(16) & "',NVL(A.BASE_YEAR_PERIOD,'" & SessionAsStrArray("SG_P_001INF")(16) & "'))"
                    '*** 9
                End If
                sql = sql & ",C.DIV"
                '*** 10
                sql = sql & ",B.CRITERIA_TBL"
                '*** 11
                sql = sql & ",NVL(B.EMP_KEY1,C.EMP_KEY1)"
                '*** 12
                sql = sql & ",B.HISTORY_DIV"
                '*** 13
                sql = sql & ",''"
                '*** 14（取得ＳＱＬ）
                sql = sql & ",0"
                '*** 15（項目配列数）
                sql = sql & ",''"
                '*** 16（表示書式）
                sql = sql & ",''"
                '*** 17（画面項目名）
                sql = sql & ",''"
                '*** 18:小数桁数
                If p_kinou = "1" AndAlso permission <> "0" Then
                    sql = sql & ",NVL(D.REFERENCE_RANGE,0)"
                    '*** 19:参照範囲
                Else
                    sql = sql & ",0"
                    '*** 19:参照範囲
                End If
                sql = sql & ",''"
                '*** 20:（画面項目名）
                sql = sql & ",A.SALARY_DIV"
                '*** 21:区分(1:人事,2:給与(指定会社),3:給与(全会社))
                If w_gsmode = "7" AndAlso SessionAsStr("SG_P_KAISYA_FLG") = "0" Then
                    '*** 発令(303)、且つ、シングルカンパニーの場合
                    sql = sql & ",NVL(A.LINK_CORP_CODE,0)"
                    '*** 22:連携会社コード
                Else
                    sql = sql & ",A.LINK_CORP_CODE"
                    '*** 22:連携会社コード
                End If
                sql = sql & ",A.PROCESS_DIV"
                '*** 23:処理区分
                sql = sql & ",TO_CHAR(A.PAYMENT_YMD_FROM,'YYYY/MM/DD')"
                '*** 24:支給年月日自
                sql = sql & ",TO_CHAR(A.PAYMENT_YMD_TO,'YYYY/MM/DD')"
                '*** 25:支給年月日至
                sql = sql & ",''"
                '*** 26:会社名
                sql = sql & ",''"
                '*** 27:選択順自
                sql = sql & ",''"
                '*** 28:選択順至
                sql = sql & ",''"
                '*** 29:表示書式
                sql = sql & ",''"
                '*** 30:付加文字区分
                sql = sql & ",''"
                '*** 31:付加文字
                If p_kinou = "1" AndAlso permission <> "0" Then
                    sql = sql & ",NVL(D.USE_CONF,0)"
                    '*** 32:利用設定
                Else
                    sql = sql & ",1"
                    '*** 32:利用設定
                End If
                sql = sql & ",0"
                '*** 33:折返しフラグ
                sql = sql & ",''"
                '*** 34:折返し設定
                sql = sql & ",''"
                '*** 35:表示順設定
                sql = sql & ",''"
                '*** 36:計算グループ
                sql = sql & ",''"
                '*** 37:賞与コード
                sql = sql & ",1"
                '*** 38:参照先設定(1:通常,2:発令考慮)
                sql = sql & ",NVL(A.REFERENCE_DIV,0)"
                '*** 39:参照先区分(0:通常,1:発令前,2:発令内容,3:発令後)
                sql = sql & ",A.PREFERENTIAL_ORDER SORT1"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062020_M A"
                sql = sql & "     ," & w_table4 & " B"
                sql = sql & "     ," & w_table1 & " C"
                If p_kinou = "1" AndAlso permission <> "0" Then
                    sql = sql & ",(SELECT PERMISSION,SUB_DIV,DIV,USE_CONF,REFERENCE_RANGE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0050030_M"
                    sql = sql & " WHERE KAISYACD=:ORA_4"
                    sql = sql & " UNION SELECT " & permission & " PERMISSION,2,CATEGORY_DIV,'1',0"
                    sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010020_M"
                    sql = sql & " WHERE CATEGORY_DIV IN (620,621,622)) D"
                End If
                sql = sql & " WHERE A.KAISYACD=:ORA_3"
                sql = sql & "   AND A.FUNCTION_DIV=:ORA_0"
                sql = sql & "   AND A.REPORT_DIV=:ORA_1"
                sql = sql & "   AND A.CATEGORY_DIV=B.CATEGORY_DIV"
                sql = sql & "   AND B.CRITERIA_TBL=C.TBL_NAME"
                If p_kinou = "1" AndAlso permission <> "0" Then
                    sql = sql & " AND D.PERMISSION(+)=:ORA_2"
                    sql = sql & " AND D.SUB_DIV(+)=2"
                    sql = sql & " AND A.CATEGORY_DIV=D.DIV(+)"
                End If
                If w_kinou = "120" Then
                    sql = sql & " UNION "
                    sql = sql & " SELECT"
                    sql = sql & " A.IDENTIFIER"
                    '*** 0
                    sql = sql & ",A.CATEGORY_DIV"
                    '*** 1
                    sql = sql & ",A.MAX_DISP_COUNT"
                    '*** 2
                    sql = sql & ",NVL(A.SORT_CONF,'0')"
                    '*** 3:
                    sql = sql & ",NVL(A.DISP_CONF,'0')"
                    '*** 4:
                    sql = sql & ",NVL(A.COUNT_CONF,0)"
                    '*** 5:
                    sql = sql & ",TO_CHAR(A.PERIOD_FROM,'YYYY/MM/DD')"
                    '*** 6
                    sql = sql & ",TO_CHAR(A.PERIOD_TO,'YYYY/MM/DD')"
                    '*** 7
                    If Not IsNull(P000S001.FNCG_P_NZ(p_kjday)) Then
                        sql = sql & ",'" & p_kjday & "'"
                        '***  8:基準日
                    Else
                        sql = sql & ",NVL(NVL('" & SessionAsStrArray("SL_P120_INF02")(2) & "',TO_CHAR(A.BASE_DATE,'YYYY/MM/DD')),'" & SessionAsStr("SG_P_TDATE") & "')"
                        '*** 8 SL_120-13_009 詳細は、P120M311.aspxを参照
                    End If
                    sql = sql & ",DECODE(NVL('" & SessionAsStrArray("SL_P120_INF02")(3) & "',A.BASE_YEAR_PERIOD),'00000-0','" & SessionAsStrArray("SG_P_001INF")(16) & "',NVL('" & SessionAsStrArray("SL_P120_INF02")(3) & "',A.BASE_YEAR_PERIOD))"
                    '*** 9 SL_120-13_009 詳細は、P120M311.aspxを参照
                    sql = sql & ",0"
                    '*** 10
                    sql = sql & ",B.CRITERIA_TBL"
                    '*** 11
                    sql = sql & ",'社員コード'"
                    '*** 12
                    sql = sql & ",B.HISTORY_DIV"
                    '*** 13
                    sql = sql & ",''"
                    '*** 14（取得ＳＱＬ）
                    sql = sql & ",0"
                    '*** 15（項目配列数）
                    sql = sql & ",''"
                    '*** 16（表示書式）
                    sql = sql & ",''"
                    '*** 17（画面項目名）
                    sql = sql & ",''"
                    '*** 18:小数桁数
                    sql = sql & ",0"
                    '*** 19:参照範囲
                    sql = sql & ",''"
                    '*** 20:（画面項目名）
                    sql = sql & ",A.SALARY_DIV"
                    '*** 21:区分(1:人事,2:給与(指定会社),3:給与(全会社))
                    sql = sql & ",NVL(A.LINK_CORP_CODE,0)"
                    '*** 22:連携会社コード
                    sql = sql & ",A.PROCESS_DIV"
                    '*** 23:処理区分
                    sql = sql & ",TO_CHAR(A.PAYMENT_YMD_FROM,'YYYY/MM/DD')"
                    '*** 24:支給年月日自
                    sql = sql & ",TO_CHAR(A.PAYMENT_YMD_TO,'YYYY/MM/DD')"
                    '*** 25:支給年月日至
                    sql = sql & ",''"
                    '*** 26:会社名
                    sql = sql & ",''"
                    '*** 27:選択順自
                    sql = sql & ",''"
                    '*** 28:選択順至
                    sql = sql & ",''"
                    '*** 29:表示書式
                    sql = sql & ",''"
                    '*** 30:付加文字区分
                    sql = sql & ",''"
                    '*** 31:付加文字
                    sql = sql & ",1"
                    '*** 32:利用設定
                    sql = sql & ",0"
                    '*** 33:折返しフラグ
                    sql = sql & ",''"
                    '*** 34:折返し設定
                    sql = sql & ",''"
                    '*** 35:表示順設定
                    sql = sql & ",''"
                    '*** 36:計算グループ
                    sql = sql & ",''"
                    '*** 37:賞与コード
                    sql = sql & ",1"
                    '*** 38:参照先設定(1:通常,2:発令考慮)
                    sql = sql & ",NVL(A.REFERENCE_DIV,0)"
                    '*** 39:参照先区分(0:通常,1:発令前,2:発令内容,3:発令後)
                    sql = sql & ",A.PREFERENTIAL_ORDER SORT1"
                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062020_M A"
                    sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062090_M B"
                    sql = sql & " WHERE A.KAISYACD=:ORA_3"
                    sql = sql & "   AND A.FUNCTION_DIV=:ORA_0"
                    sql = sql & "   AND A.REPORT_DIV=:ORA_1"
                    sql = sql & "   AND A.CATEGORY_DIV=B.CATEGORY_DIV"
                End If
                'sql = sql & " ORDER BY A.ＩＤ"
                sql = sql & " ORDER BY SORT1"
                ReDim w_orapara(2, 4)
                w_orapara(0, 0) = p_kinou
                w_orapara(1, 0) = "2"
                w_orapara(0, 1) = p_rpkbn
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = permission
                w_orapara(1, 2) = "2"
                w_orapara(0, 3) = w_kcode
                w_orapara(1, 3) = "101"
                w_orapara(0, 4) = w_kcd
                w_orapara(1, 4) = "101"
                If P000S011.FNCG_P_RECORDSET5(40, sql, w_orapara, w_kdata) = False Then
                    '*** ﾗﾍﾞﾙ(36)："帳票設定が存在しません。"
                    PE_ComVars.Instance.w_errtext = w_langmsg(0, 36)
                    FNCL_P_SQLMAKE = 1
                    Exit Function
                End If
                '*** 給与項目内容取得
                For w_i = 0 To UBound(w_kdata, 2)
                    Select Case w_kdata(21, w_i)
                        Case "2"
                            '*** 給与(会社指定あり)
                            '*** 履歴テーブル使用確認
                            FNCL_P_KYRITB(w_kdata, w_i)
                            '*** 項目名称取得
                            sql = "SELECT "
                            sql = sql & " B.DISP_FORMAT"
                            '*** 0:表示書式
                            sql = sql & ",NVL(C.MANAGEMENT_NAME,D.KOUMOKME)"
                            '*** 1:画面項目名
                            sql = sql & ",NVL(D.SYOSUKTS,0)"
                            '*** 2:小数点桁数
                            sql = sql & ",C.MASTER_ID"
                            '*** 3:マスタＩＤ
                            sql = sql & ",B.ITEM_NAME"
                            '*** 4:項目名
                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062030_M A"
                            sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010020_M B"
                            sql = sql & "     ,(" & P000S050.FNCG_P_WEB_TP0000020_M(w_kcode) & ") C"
                            If w_kdata(1, w_i) = "503" AndAlso w_kdata(23, w_i) = "1" Then
                                '*** 変動（賞与の場合）
                                'sql = sql & ",(SELECT KAISYACD,SUBSTR(HENSUID,1,1) || TO_CHAR(TO_NUMBER(SUBSTR(HENSUID,2))-66,'FM00') HENSUID,KOUMOKME,SYOSUKTS"
                                'sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "KOUMOKU_MS) D"
                                sql = sql & "     ,(" & P000S030.FNCG_P_KYHENDOTBNAME(1, "") & ") D"
                            Else
                                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "KOUMOKU_MS D"
                            End If
                            sql = sql & " WHERE A.KAISYACD=:ORA_5"
                            sql = sql & "   AND A.FUNCTION_DIV=:ORA_0"
                            sql = sql & "   AND A.REPORT_DIV=:ORA_1"
                            sql = sql & "   AND A.IDENTIFIER=:ORA_2"
                            sql = sql & "   AND B.CATEGORY_DIV=:ORA_3"
                            sql = sql & "   AND A.ITEM_ORDER = B.ITEM_ORDER"
                            sql = sql & "   AND B.DIV = C.DIV(+)"
                            sql = sql & "   AND B.ITEM_NAME = C.ITEM_NAME(+)"
                            sql = sql & "   AND D.KAISYACD(+)=:ORA_4"
                            sql = sql & "   AND B.ITEM_NAME = D.HENSUID(+)"
                            sql = sql & "   AND NVL(C.MANAGEMENT_NAME,D.KOUMOKME) IS NOT NULL"
                            sql = sql & " ORDER BY A.ROW_INFO,A.COLUMN_INFO,A.PREFERENTIAL_ORDER,A.ITEM_ORDER"
                            ReDim w_orapara(2, 5)
                            w_orapara(0, 0) = p_kinou
                            w_orapara(1, 0) = "2"
                            w_orapara(0, 1) = p_rpkbn
                            w_orapara(1, 1) = "2"
                            w_orapara(0, 2) = w_kdata(0, w_i)
                            w_orapara(1, 2) = "2"
                            w_orapara(0, 3) = w_kdata(1, w_i)
                            w_orapara(1, 3) = "2"
                            w_orapara(0, 4) = w_kdata(22, w_i)
                            w_orapara(1, 4) = "101"
                            w_orapara(0, 5) = w_kcode
                            w_orapara(1, 5) = "101"
                            If P000S011.FNCG_P_RECORDSET5(5, sql, w_orapara, w_dbdata) = True Then
                                For w_j = 0 To UBound(w_dbdata, 2)
                                    If w_j > 0 Then
                                        w_kdata(16, w_i) = w_kdata(16, w_i) & ","
                                        w_kdata(17, w_i) = w_kdata(17, w_i) & "|||"
                                        w_kdata(18, w_i) = w_kdata(18, w_i) & ","
                                    End If
                                    w_kdata(17, w_i) = w_kdata(17, w_i) & w_dbdata(1, w_j)
                                    If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 1) = "0" Then
                                        If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M01" AndAlso w_dbdata(4, w_j) <= "M99") OrElse (w_dbdata(4, w_j) >= "H01" AndAlso w_dbdata(4, w_j) <= "H99") OrElse (w_dbdata(4, w_j) >= "D01" AndAlso w_dbdata(4, w_j) <= "D99") OrElse (w_dbdata(4, w_j) >= "V01" AndAlso w_dbdata(4, w_j) <= "V99") OrElse (w_dbdata(4, w_j) >= "F01" AndAlso w_dbdata(4, w_j) <= "F99")) Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                        Else
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                        End If
                                    Else
                                        If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M001" AndAlso w_dbdata(4, w_j) <= "M999") OrElse (w_dbdata(4, w_j) >= "H001" AndAlso w_dbdata(4, w_j) <= "H999") OrElse (w_dbdata(4, w_j) >= "D001" AndAlso w_dbdata(4, w_j) <= "D999") OrElse (w_dbdata(4, w_j) >= "V001" AndAlso w_dbdata(4, w_j) <= "V999") OrElse (w_dbdata(4, w_j) >= "B001" AndAlso w_dbdata(4, w_j) <= "B999") OrElse (w_dbdata(4, w_j) >= "F001" AndAlso w_dbdata(4, w_j) <= "F999")) Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                        Else
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                        End If
                                    End If
                                    w_kdata(18, w_i) = w_kdata(18, w_i) & w_dbdata(2, w_j)
                                Next
                            End If
                        Case "3"
                            '*** 給与(会社指定無し)
                            '*** 履歴テーブル使用確認
                            FNCL_P_KYRITB(w_kdata, w_i)
                            '*** 項目名称取得
                            sql = "SELECT "
                            sql = sql & " B.DISP_FORMAT"
                            '*** 0:表示書式
                            sql = sql & ",NVL(C.MANAGEMENT_NAME,C.ITEM_NAME)"
                            '*** 1:画面項目名
                            sql = sql & ",0"
                            '*** 2:小数点桁数
                            sql = sql & ",C.MASTER_ID"
                            '*** 3:マスタＩＤ
                            sql = sql & ",B.ITEM_NAME"
                            '*** 4:項目名
                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062030_M A"
                            sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010020_M B"
                            sql = sql & "     ,(" & P000S050.FNCG_P_WEB_TP0000020_M(w_kcode) & ") C"
                            sql = sql & " WHERE A.KAISYACD=:ORA_4"
                            sql = sql & "   AND A.FUNCTION_DIV=:ORA_0"
                            sql = sql & "   AND A.REPORT_DIV=:ORA_1"
                            sql = sql & "   AND A.IDENTIFIER=:ORA_2"
                            sql = sql & "   AND B.CATEGORY_DIV=:ORA_3"
                            sql = sql & "   AND A.ITEM_ORDER = B.ITEM_ORDER"
                            sql = sql & "   AND B.DIV = C.DIV(+)"
                            sql = sql & "   AND B.ITEM_NAME = C.ITEM_NAME(+)"
                            sql = sql & " ORDER BY A.ROW_INFO,A.COLUMN_INFO,A.PREFERENTIAL_ORDER,A.ITEM_ORDER"
                            ReDim w_orapara(2, 4)
                            w_orapara(0, 0) = p_kinou
                            w_orapara(1, 0) = "2"
                            w_orapara(0, 1) = p_rpkbn
                            w_orapara(1, 1) = "2"
                            w_orapara(0, 2) = w_kdata(0, w_i)
                            w_orapara(1, 2) = "2"
                            w_orapara(0, 3) = w_kdata(1, w_i)
                            w_orapara(1, 3) = "2"
                            w_orapara(0, 4) = w_kcode
                            w_orapara(1, 4) = "101"
                            If P000S011.FNCG_P_RECORDSET5(5, sql, w_orapara, w_dbdata) = True Then
                                For w_j = 0 To UBound(w_dbdata, 2)
                                    If w_j > 0 Then
                                        w_kdata(16, w_i) = w_kdata(16, w_i) & ","
                                        w_kdata(17, w_i) = w_kdata(17, w_i) & "|||"
                                        w_kdata(18, w_i) = w_kdata(18, w_i) & ","
                                    End If
                                    w_kdata(17, w_i) = w_kdata(17, w_i) & w_dbdata(1, w_j)
                                    If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 1) = "0" Then
                                        If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M01" AndAlso w_dbdata(4, w_j) <= "M99") OrElse (w_dbdata(4, w_j) >= "H01" AndAlso w_dbdata(4, w_j) <= "H99") OrElse (w_dbdata(4, w_j) >= "D01" AndAlso w_dbdata(4, w_j) <= "D99") OrElse (w_dbdata(4, w_j) >= "V01" AndAlso w_dbdata(4, w_j) <= "V99") OrElse (w_dbdata(4, w_j) >= "F01" AndAlso w_dbdata(4, w_j) <= "F99")) Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                        Else
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                        End If
                                    Else
                                        If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M001" AndAlso w_dbdata(4, w_j) <= "M999") OrElse (w_dbdata(4, w_j) >= "H001" AndAlso w_dbdata(4, w_j) <= "H999") OrElse (w_dbdata(4, w_j) >= "D001" AndAlso w_dbdata(4, w_j) <= "D999") OrElse (w_dbdata(4, w_j) >= "V001" AndAlso w_dbdata(4, w_j) <= "V999") OrElse (w_dbdata(4, w_j) >= "B001" AndAlso w_dbdata(4, w_j) <= "B999") OrElse (w_dbdata(4, w_j) >= "F001" AndAlso w_dbdata(4, w_j) <= "F999")) Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                        Else
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                        End If
                                    End If
                                    w_kdata(18, w_i) = w_kdata(18, w_i) & w_dbdata(2, w_j)
                                Next
                            End If
                    End Select
                Next
            Case "11"
                sql = "SELECT"
                sql = sql & " A.IDENTIFIER"
                '*** 0
                sql = sql & ",A.CATEGORY_DIV"
                '*** 1
                sql = sql & ",NVL(A.カテゴリ名称,B.CATEGORY_NAME)"
                '*** 2:カテゴリ名
                sql = sql & ",NVL(A.SORT_CONF,C.SORT_DIV)"
                '*** 3:
                sql = sql & ",NVL(A.DISP_CONF,'0')"
                '*** 4:
                sql = sql & ",NVL(A.COUNT_CONF,0)"
                '*** 5:
                sql = sql & ",TO_CHAR(A.PERIOD_FROM,'YYYY/MM/DD')"
                '*** 6
                sql = sql & ",TO_CHAR(A.PERIOD_TO,'YYYY/MM/DD')"
                '*** 7
                sql = sql & ",NVL("
                sql = sql & "        DECODE(A.BASE_DATE_DIV"
                '* (1:実行画面,2:設定画面,3:基準日設定)
                sql = sql & "            ,2,A.BASE_DATE"
                '* 固定
                sql = sql & "            ,NULL"
                sql = sql & "        )"
                sql = sql & "    ,:ORA_4)"
                '*** 8:基準日
                sql = sql & ",NVL("
                sql = sql & "        DECODE(A.BASE_DATE_DIV"
                '* (1:実行画面,2:設定画面,3:基準日設定)
                sql = sql & "            ,2,A.BASE_DATE"
                sql = sql & "            ,NULL"
                sql = sql & "        )"
                sql = sql & "    ,:ORA_5)"
                '*** 9:基準年度期
                sql = sql & ",C.DIV"
                '*** 10
                sql = sql & ",B.CRITERIA_TBL"
                '*** 11
                sql = sql & ",NVL(B.EMP_KEY1,C.EMP_KEY1)"
                '*** 12
                sql = sql & ",B.HISTORY_DIV"
                '*** 13
                sql = sql & ",''"
                '*** 14（取得ＳＱＬ）
                sql = sql & ",0"
                '*** 15（項目配列数）
                sql = sql & ",''"
                '*** 16（表示書式）
                sql = sql & ",''"
                '*** 17（画面項目名）
                sql = sql & ",''"
                '*** 18:小数桁数
                sql = sql & ",0"
                '*** 19:参照範囲
                sql = sql & ",''"
                '*** 20:（画面項目名）
                sql = sql & ",A.SALARY_DIV"
                '*** 21:区分(1:人事,2:給与(指定会社),3:給与(全会社))
                sql = sql & ",A.KAISYACD"
                '*** 22:会社コード
                sql = sql & ",A.PROCESS_DIV"
                '*** 23:処理区分
                sql = sql & ",TO_CHAR(A.PAYMENT_YMD_FROM,'YYYY/MM/DD')"
                '*** 24:支給年月日自
                sql = sql & ",TO_CHAR(A.PAYMENT_YMD_TO,'YYYY/MM/DD')"
                '*** 25:支給年月日至
                sql = sql & ",E.KAISYANM"
                '*** 26:会社名
                sql = sql & ",''"
                '*** 27:選択順自
                sql = sql & ",''"
                '*** 28:選択順至
                sql = sql & ",''"
                '*** 29:表示書式
                sql = sql & ",''"
                '*** 30:付加文字区分
                sql = sql & ",''"
                '*** 31:付加文字
                sql = sql & ",1"
                '*** 32:利用設定
                sql = sql & ",0"
                '*** 33:折返しフラグ
                sql = sql & ",''"
                '*** 34:折返し設定
                sql = sql & ",''"
                '*** 35:表示順設定
                sql = sql & ",NVL(A.CALC_GROUP,0)"
                '*** 36:計算グループ
                sql = sql & ",NVL(A.BONUS_CODE,0)"
                '*** 37:賞与コード
                sql = sql & ",NVL(A.参照先設定,1)"
                '*** 38:参照先設定(1:通常,2:発令考慮)
                sql = sql & ",0"
                '*** 39:参照先設定(0:通常のみ)
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062830_T A"
                sql = sql & "     ," & w_table4 & " B"
                '* WEB_TP0010010_M,WEB_TP4000110_M
                sql = sql & "     ," & w_table1 & " C"
                '* WEB_TP0000010_M,WEB_TP4000010_M
                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "KAISYA_MS E"
                sql = sql & " WHERE    A.KAISYACD = :ORA_3"
                sql = sql & "   AND A.FUNCTION_DIV = :ORA_0"
                sql = sql & "   AND A.SCREEN_NUMBER = :ORA_1"
                sql = sql & "   AND A.MANAGEMENT_NUMBER = :ORA_2"
                sql = sql & "   AND A.CATEGORY_DIV = B.CATEGORY_DIV"
                sql = sql & "   AND B.CRITERIA_TBL = C.TBL_NAME"
                sql = sql & "   AND A.KAISYACD = E.KAISYACD(+)"
                sql = sql & " ORDER BY A.IDENTIFIER"
                ReDim w_orapara(2, 5)
                w_orapara(0, 0) = w_printinf(0)
                w_orapara(1, 0) = "2"
                w_orapara(0, 1) = w_printinf(1)
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = w_printinf(3)
                w_orapara(1, 2) = "2"
                w_orapara(0, 3) = w_kcode
                w_orapara(1, 3) = "101"
                w_orapara(0, 4) = w_printinf(2)
                w_orapara(1, 4) = "1"
                w_orapara(0, 5) = w_printinf(4)
                w_orapara(1, 5) = "1"
                If P000S011.FNCG_P_RECORDSET5(40, sql, w_orapara, w_kdata) = False Then
                    '*** ﾗﾍﾞﾙ(37)："出力項目が存在しません。"
                    PE_ComVars.Instance.w_errtext = w_langmsg(0, 37)
                    FNCL_P_SQLMAKE = 1
                    Exit Function
                End If
                '*** 給与項目内容取得
                For w_i = 0 To UBound(w_kdata, 2)
                    Select Case w_kdata(21, w_i)
                        Case "2"
                            '*** 給与(会社指定あり)
                            '*** 履歴テーブル使用確認
                            FNCL_P_KYRITB(w_kdata, w_i)
                            '*** カテゴリ名称取得
                            w_name = w_kdata(2, w_i) & "(" & w_kdata(26, w_i)
                            If w_kdata(1, w_i) <> "501" Then
                                Select Case w_kdata(23, w_i)
                                    Case "0"
                                        w_name = w_name & "：給与"
                                    Case "1"
                                        w_name = w_name & "：賞与"
                                End Select
                                If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(24, w_i))) OrElse Not IsNull(P000S001.FNCG_P_NZ(w_kdata(25, w_i))) Then
                                    w_name = w_name & "：" & w_kdata(24, w_i) & "～" & w_kdata(25, w_i)
                                End If
                            End If
                            w_kdata(2, w_i) = w_name & ")"
                            '*** 項目名称取得
                            sql = "SELECT "
                            sql = sql & " B.DISP_FORMAT"
                            '*** 0:表示書式
                            sql = sql & ",NVL(A.MANAGEMENT_NAME,NVL(C.MANAGEMENT_NAME,D.KOUMOKME))"
                            '***1:画面名称
                            sql = sql & ",NVL(D.SYOSUKTS,0)"
                            '*** 2:小数点桁数
                            sql = sql & ",C.MASTER_ID"
                            '*** 3:マスタＩＤ
                            sql = sql & ",B.ITEM_NAME"
                            '*** 4:項目名
                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062840_T A"
                            sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010020_M B"
                            sql = sql & "     ,(" & P000S050.FNCG_P_WEB_TP0000020_M(w_kcode) & ") C"
                            If w_kdata(1, w_i) = "503" AndAlso w_kdata(23, w_i) = "1" Then
                                '*** 変動（賞与の場合）
                                sql = sql & "     ,(" & P000S030.FNCG_P_KYHENDOTBNAME(1, "") & ") D"
                            Else
                                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "KOUMOKU_MS D"
                            End If
                            sql = sql & " WHERE    A.KAISYACD = :ORA_6"
                            sql = sql & "   AND A.FUNCTION_DIV = :ORA_0"
                            sql = sql & "   AND A.SCREEN_NUMBER = :ORA_1"
                            sql = sql & "   AND A.MANAGEMENT_NUMBER = :ORA_5"
                            sql = sql & "   AND A.IDENTIFIER = :ORA_2"
                            sql = sql & "   AND B.CATEGORY_DIV = :ORA_3"
                            sql = sql & "   AND A.ITEM_ORDER = B.ITEM_ORDER"
                            sql = sql & "   AND B.DIV = C.DIV(+)"
                            sql = sql & "   AND B.ITEM_NAME = C.ITEM_NAME(+)"
                            sql = sql & "   AND D.KAISYACD(+)=:ORA_4"
                            sql = sql & "   AND B.ITEM_NAME = D.HENSUID(+)"
                            sql = sql & "   AND NVL(C.MANAGEMENT_NAME,D.KOUMOKME) IS NOT NULL"
                            sql = sql & " ORDER BY A.OUTPUT_ORDER,A.ITEM_ORDER"
                            ReDim w_orapara(2, 6)
                            w_orapara(0, 0) = w_printinf(0)
                            w_orapara(1, 0) = "2"
                            w_orapara(0, 1) = w_printinf(1)
                            w_orapara(1, 1) = "2"
                            w_orapara(0, 0) = p_kinou
                            w_orapara(1, 0) = "2"
                            w_orapara(0, 1) = p_rpkbn
                            w_orapara(1, 1) = "2"
                            w_orapara(0, 2) = w_kdata(0, w_i)
                            w_orapara(1, 2) = "2"
                            w_orapara(0, 3) = w_kdata(1, w_i)
                            w_orapara(1, 3) = "2"
                            w_orapara(0, 4) = w_kdata(22, w_i)
                            w_orapara(1, 4) = "101"
                            w_orapara(0, 5) = w_printinf(3)
                            w_orapara(1, 5) = "2"
                            w_orapara(0, 6) = w_kcode
                            w_orapara(1, 6) = "101"
                            If P000S011.FNCG_P_RECORDSET5(5, sql, w_orapara, w_dbdata) = True Then
                                For w_j = 0 To UBound(w_dbdata, 2)
                                    If w_j > 0 Then
                                        w_kdata(16, w_i) = w_kdata(16, w_i) & ","
                                        w_kdata(17, w_i) = w_kdata(17, w_i) & "|||"
                                        w_kdata(18, w_i) = w_kdata(18, w_i) & ","
                                    End If
                                    w_kdata(17, w_i) = w_kdata(17, w_i) & w_dbdata(1, w_j)
                                    If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 1) = "0" Then
                                        If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M01" AndAlso w_dbdata(4, w_j) <= "M99") OrElse (w_dbdata(4, w_j) >= "H01" AndAlso w_dbdata(4, w_j) <= "H99") OrElse (w_dbdata(4, w_j) >= "D01" AndAlso w_dbdata(4, w_j) <= "D99") OrElse (w_dbdata(4, w_j) >= "V01" AndAlso w_dbdata(4, w_j) <= "V99") OrElse (w_dbdata(4, w_j) >= "F01" AndAlso w_dbdata(4, w_j) <= "F99")) Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                        Else
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                        End If
                                    Else
                                        If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M001" AndAlso w_dbdata(4, w_j) <= "M999") OrElse (w_dbdata(4, w_j) >= "H001" AndAlso w_dbdata(4, w_j) <= "H999") OrElse (w_dbdata(4, w_j) >= "D001" AndAlso w_dbdata(4, w_j) <= "D999") OrElse (w_dbdata(4, w_j) >= "V001" AndAlso w_dbdata(4, w_j) <= "V999") OrElse (w_dbdata(4, w_j) >= "B001" AndAlso w_dbdata(4, w_j) <= "B999") OrElse (w_dbdata(4, w_j) >= "F001" AndAlso w_dbdata(4, w_j) <= "F999")) Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                        Else
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                        End If
                                    End If
                                    w_kdata(18, w_i) = w_kdata(18, w_i) & w_dbdata(2, w_j)
                                Next
                            End If
                        Case "3"
                            '*** 給与(会社指定無し)
                            '*** 項目名称取得
                            sql = "SELECT "
                            sql = sql & " B.DISP_FORMAT"
                            '*** 0:表示書式
                            sql = sql & ",NVL(A.MANAGEMENT_NAME,NVL(C.MANAGEMENT_NAME,C.ITEM_NAME))"
                            '***1:画面名称
                            sql = sql & ",0"
                            '*** 2:小数点桁数
                            sql = sql & ",C.MASTER_ID"
                            '*** 3:マスタＩＤ
                            sql = sql & ",B.ITEM_NAME"
                            '*** 4:項目名
                            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062840_T A"
                            sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010020_M B"
                            sql = sql & "     ,(" & P000S050.FNCG_P_WEB_TP0000020_M(w_kcode) & ") C"
                            sql = sql & " WHERE    A.KAISYACD = :ORA_5"
                            sql = sql & "   AND A.FUNCTION_DIV = :ORA_0"
                            sql = sql & "   AND A.SCREEN_NUMBER = :ORA_1"
                            sql = sql & "   AND A.MANAGEMENT_NUMBER = :ORA_4"
                            sql = sql & "   AND A.IDENTIFIER=:ORA_2"
                            sql = sql & "   AND B.CATEGORY_DIV=:ORA_3"
                            sql = sql & "   AND A.ITEM_ORDER = B.ITEM_ORDER"
                            sql = sql & "   AND B.DIV = C.DIV(+)"
                            sql = sql & "   AND B.ITEM_NAME = C.ITEM_NAME(+)"
                            sql = sql & " ORDER BY A.OUTPUT_ORDER,A.ITEM_ORDER"
                            ReDim w_orapara(2, 5)
                            w_orapara(0, 0) = w_printinf(0)
                            w_orapara(1, 0) = "2"
                            w_orapara(0, 1) = w_printinf(1)
                            w_orapara(1, 1) = "2"
                            w_orapara(0, 2) = w_kdata(0, w_i)
                            w_orapara(1, 2) = "2"
                            w_orapara(0, 3) = w_kdata(1, w_i)
                            w_orapara(1, 3) = "2"
                            w_orapara(0, 4) = w_printinf(3)
                            w_orapara(1, 4) = "2"
                            w_orapara(0, 5) = w_kcode
                            w_orapara(1, 5) = "101"
                            If P000S011.FNCG_P_RECORDSET5(5, sql, w_orapara, w_dbdata) = True Then
                                For w_j = 0 To UBound(w_dbdata, 2)
                                    If w_j > 0 Then
                                        w_kdata(16, w_i) = w_kdata(16, w_i) & ","
                                        w_kdata(17, w_i) = w_kdata(17, w_i) & "|||"
                                        w_kdata(18, w_i) = w_kdata(18, w_i) & ","
                                    End If
                                    w_kdata(17, w_i) = w_kdata(17, w_i) & w_dbdata(1, w_j)
                                    If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 1) = "0" Then
                                        If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M01" AndAlso w_dbdata(4, w_j) <= "M99") OrElse (w_dbdata(4, w_j) >= "H01" AndAlso w_dbdata(4, w_j) <= "H99") OrElse (w_dbdata(4, w_j) >= "D01" AndAlso w_dbdata(4, w_j) <= "D99") OrElse (w_dbdata(4, w_j) >= "V01" AndAlso w_dbdata(4, w_j) <= "V99") OrElse (w_dbdata(4, w_j) >= "F01" AndAlso w_dbdata(4, w_j) <= "F99")) Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                        Else
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                        End If
                                    Else
                                        If IsNull(P000S001.FNCG_P_NZ(w_dbdata(3, w_j))) AndAlso ((w_dbdata(4, w_j) >= "M001" AndAlso w_dbdata(4, w_j) <= "M999") OrElse (w_dbdata(4, w_j) >= "H001" AndAlso w_dbdata(4, w_j) <= "H999") OrElse (w_dbdata(4, w_j) >= "D001" AndAlso w_dbdata(4, w_j) <= "D999") OrElse (w_dbdata(4, w_j) >= "V001" AndAlso w_dbdata(4, w_j) <= "V999") OrElse (w_dbdata(4, w_j) >= "B001" AndAlso w_dbdata(4, w_j) <= "B999") OrElse (w_dbdata(4, w_j) >= "F001" AndAlso w_dbdata(4, w_j) <= "F999")) Then
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & "31"
                                        Else
                                            w_kdata(16, w_i) = w_kdata(16, w_i) & w_dbdata(0, w_j)
                                        End If
                                    End If
                                    w_kdata(18, w_i) = w_kdata(18, w_i) & w_dbdata(2, w_j)
                                Next
                            End If
                    End Select
                Next
        End Select
        '**********************************************************************
        '* 出力ＳＱＬ作成
        '**********************************************************************
        ReDim w_tempdata(UBound(w_kdata, 2))
        For w_i = 0 To UBound(w_kdata, 2)
            '******************************************************************
            '* 初期化
            '******************************************************************
            w_sql_s2 = ""
            w_sql_f2 = ""
            w_sql_w2 = ""
            w_sql_o2 = ""
            w_sql_o2_temp = ""
            w_sql_s_add = ""
            w_sql_s2_add = ""
            w_sql_s_add_num = 0
            w_kflg = "0"
            '******************************************************************
            '* 出力項目の取得
            '******************************************************************
            Select Case p_skbn
                Case "1", "2"
                    sql = "SELECT "
                    sql = sql & " B.DISP_FORMAT"
                    '*** 0:表示書式
                    sql = sql & ",A.ITEM_ORDER"
                    '*** 1:カテゴリ区分
                    sql = sql & ",C.CRITERIA_TBL"
                    '*** 2:テーブル名
                    sql = sql & ",B.DIV"
                    '*** 3:区分
                    sql = sql & ",B.ITEM_NAME"
                    '*** 4:項目名
                    sql = sql & ",B.DISP_TYPE"
                    '*** 5:表示タイプ
                    sql = sql & ",D.DATA_TYPE"
                    '*** 6:タイプ
                    sql = sql & ",D.REFERENCE_DIV"
                    '*** 7:参照区分
                    sql = sql & ",D.LITERAL_CONTENT"
                    '*** 8:リテラル内容
                    sql = sql & ",D.MASTER_LINK_ITEM"
                    '*** 9:マスタリンク項目
                    sql = sql & ",F.OBJECT_NAME"
                    '***10:マスタ名
                    sql = sql & ",F.CODE_ITEM"
                    '***11:マスタコード項目
                    sql = sql & ",F.NAME_ITEM"
                    '***12:マスタ名称項目
                    
                    sql = sql & ", (CASE NVL(A.MASTER_AUX_DIV, '0')"
                    sql = sql & " 	WHEN '0' THEN CAST(NVL(B.SUPPORT_ACTION_NAME, D.MANAGEMENT_NAME) AS VARCHAR2(100))"
                    sql = sql & " 	ELSE CAST("
                    sql = sql & "       NVL(B.SUPPORT_ACTION_NAME, D.MANAGEMENT_NAME)"
                    sql = sql & "       || '(' || WEB_SP0002610_F(1, :ORA_4, D.MASTER_ID, A.MASTER_AUX_DIV, A.MASTER_AUX_KAISYACD, A.MASTER_AUX_ID, " & SessionAsStrArray("SG_P_LANGUAGE")(9) & ") || ')'"
                    sql = sql & "    AS VARCHAR2(100))"
                    sql = sql & " END)"
                    '***13:画面名称

                    sql = sql & ",''"
                    '***14:付加文字区分
                    sql = sql & ",''"
                    '***15:付加文字
                    sql = sql & ",F.MASTER_KIND"
                    '***16:マスタ種類
                    sql = sql & ",F.CODE_DIGIT"
                    '***17:マスタコード桁数
                    sql = sql & ",0"
                    '***18:折返し桁数
                    sql = sql & ",A.SELECT_ORDER"
                    '***19:選択順
                    sql = sql & ",D.MASTER_ID"
                    '***20:マスタＩＤ
                    sql = sql & ",F.CORP_DIV"
                    '***21:会社区分
                    sql = sql & ",D.SUPPORT_DIV"
                    '***22:補助区分
                    sql = sql & ",0 SORT1"
                    '***23:SORT用
                    sql = sql & ",0 SORT2"
                    '***24:SORT用
                    sql = sql & ",0 SORT3"
                    '***25:SORT用
                    sql = sql & ",0 SORT4"
                    '***26:SORT用
                    sql = sql & ",NVL(A.MASTER_AUX_DIV,'0')"
                    '***27:マスタ補助区分
                    sql = sql & ",A.MASTER_AUX_KAISYACD"
                    '***28:マスタ補助会社コード
                    sql = sql & ",A.MASTER_AUX_ID"
                    '***29:マスタ補助ＩＤ
                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010230_W A"
                    sql = sql & "," & w_table5 & " B"
                    sql = sql & "," & w_table4 & " C"
                    sql = sql & "," & w_table2 & " D"
                    sql = sql & "," & w_table1 & " E"
                    sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0110210_M F"
                    sql = sql & " WHERE A.CUSTOMER_ID=:ORA_0"
                    sql = sql & "   AND A.CATEGORY_DIV=:ORA_1"
                    If w_kdata(21, w_i) = "2" Then
                        sql = sql & "   AND A.DIV=2"
                        sql = sql & "   AND A.SELECT_ORDER>=:ORA_2"
                        sql = sql & "   AND A.SELECT_ORDER<=:ORA_3"
                    End If
                    sql = sql & "   AND A.CATEGORY_DIV=B.CATEGORY_DIV"
                    sql = sql & "   AND A.ITEM_ORDER=B.ITEM_ORDER"
                    sql = sql & "   AND A.CATEGORY_DIV=C.CATEGORY_DIV(+)"
                    sql = sql & "   AND B.DIV=D.DIV(+)"
                    sql = sql & "   AND B.ITEM_NAME=D.ITEM_NAME(+)"
                    sql = sql & "   AND D.DIV=E.DIV(+)"
                    sql = sql & "   AND D.MASTER_ID=F.IDENTIFIER(+)"
                    sql = sql & " ORDER BY A.SELECT_ORDER"
                    ReDim w_orapara(1, 4)
                    w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                    w_orapara(1, 0) = "2"
                    w_orapara(0, 1) = w_kdata(1, w_i)
                    w_orapara(1, 1) = "2"
                    w_orapara(0, 2) = w_kdata(27, w_i)
                    w_orapara(1, 2) = "2"
                    w_orapara(0, 3) = w_kdata(28, w_i)
                    w_orapara(1, 3) = "2"
                    
                    w_orapara(0, 4) = w_kcode
                    w_orapara(1, 4) = CStr(OraConst.ORATYPE_NUMBER)
                    
                    If P000S011.FNCG_P_RECORDSET5(0, sql, w_orapara, w_fdata) = True Then
                        w_work = ""
                        For w_j = 0 To UBound(w_fdata, 2)
                            w_work = w_work & "," & w_fdata(19, w_j)
                        Next
                        w_kdata(35, w_i) = Mid(w_work, 2)
                    End If
                    w_tempdata(w_i) = w_fdata
                Case "3", "4"
                    sql = "SELECT "
                    sql = sql & " B.DISP_FORMAT"
                    '*** 0:表示書式
                    sql = sql & ",A.ITEM_ORDER"
                    '*** 1:カテゴリ区分
                    sql = sql & ",C.CRITERIA_TBL"
                    '*** 2:テーブル名
                    sql = sql & ",B.DIV"
                    '*** 3:社員ＫＥＹ１
                    Select Case CInt(w_kdata(39, w_i))
                        Case 1, 2, 3
                            If (CLng(w_kdata(1, w_i)) >= 700 AndAlso CLng(w_kdata(1, w_i)) <= 999) OrElse (CLng(w_kdata(1, w_i)) >= 10000 AndAlso CLng(w_kdata(1, w_i)) <= 59999)
                                sql = sql & ",DECODE(D.DATA_TYPE,'DATE','DATE_','NUMBER','NUMBER_','CHAR_') || B.ITEM_NAME"
                                '*** 4:項目名
                            Else
                                sql = sql & ",B.ITEM_NAME"
                                '*** 4:項目名
                            End If
                        Case Else
                            sql = sql & ",B.ITEM_NAME"
                            '*** 4:項目名
                    End Select
                    sql = sql & ",B.DISP_TYPE"
                    '*** 5:表示タイプ
                    sql = sql & ",D.DATA_TYPE"
                    '*** 6:タイプ
                    sql = sql & ",D.REFERENCE_DIV"
                    '*** 7:参照区分
                    sql = sql & ",D.LITERAL_CONTENT"
                    '*** 8:リテラル内容
                    sql = sql & ",D.MASTER_LINK_ITEM"
                    '*** 9:マスタリンク項目
                    sql = sql & ",F.OBJECT_NAME"
                    '***10:マスタ名
                    sql = sql & ",F.CODE_ITEM"
                    '***11:マスタコード項目
                    sql = sql & ",F.NAME_ITEM"
                    '***12:マスタ名称項目
                    sql = sql & ",NVL(B.SUPPORT_ACTION_NAME,D.MANAGEMENT_NAME)"
                    '***13:画面名称
                    sql = sql & ",NVL(A.APPEND_CHAR_DIV,'0')"
                    '***14:付加文字区分
                    sql = sql & ",NVL(WEB_SP0060120_F('WEB_TP0062030_M',1,A.KAISYACD,A.FUNCTION_DIV,A.REPORT_DIV,A.IDENTIFIER,A.ITEM_ORDER,A.MASTER_AUX_DIV || '-' || TO_CHAR(A.MASTER_AUX_KAISYACD) || '-' || TO_CHAR(A.MASTER_AUX_ID),NULL,1,NULL,:ORA_5), A.APPEND_CHAR)"
                    '***15:付加文字
                    sql = sql & ",F.MASTER_KIND"
                    '***16:マスタ種類
                    sql = sql & ",F.CODE_DIGIT"
                    '***17:マスタコード桁数
                    sql = sql & ",NVL(A.WRAP_DIGIT_NUMBER,0)"
                    '***18:折返し桁数
                    sql = sql & ",0"
                    '***19:未使用
                    sql = sql & ",D.MASTER_ID"
                    '***20:マスタＩＤ
                    sql = sql & ",F.CORP_DIV"
                    '***21:会社区分
                    sql = sql & ",D.SUPPORT_DIV"
                    '***22:補助区分
                    sql = sql & ",A.ROW_INFO SORT1"
                    '***23:SORT用
                    sql = sql & ",A.COLUMN_INFO SORT2"
                    '***24:SORT用
                    sql = sql & ",A.PREFERENTIAL_ORDER SORT3"
                    '***25:SORT用
                    sql = sql & ",A.ITEM_ORDER SORT4"
                    '***26:SORT用
                    sql = sql & ",NVL(A.MASTER_AUX_DIV,'0')"
                    '***27:マスタ補助区分
                    sql = sql & ",A.MASTER_AUX_KAISYACD"
                    '***28:マスタ補助会社コード
                    sql = sql & ",A.MASTER_AUX_ID"
                    '***29:マスタ補助ＩＤ
                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062030_M A"
                    sql = sql & "     ," & w_table5 & " B"
                    sql = sql & "     ," & w_table4 & " C"
                    sql = sql & "     ," & w_table2 & " D"
                    sql = sql & "     ," & w_table1 & " E"
                    sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0110210_M F"
                    sql = sql & " WHERE A.KAISYACD=:ORA_4"
                    sql = sql & "   AND A.FUNCTION_DIV=:ORA_0"
                    sql = sql & "   AND A.REPORT_DIV=:ORA_1"
                    sql = sql & "   AND A.IDENTIFIER=:ORA_2"
                    sql = sql & "   AND B.CATEGORY_DIV=:ORA_3"
                    sql = sql & "   AND A.ITEM_ORDER=B.ITEM_ORDER"
                    sql = sql & "   AND B.CATEGORY_DIV=C.CATEGORY_DIV(+)"
                    sql = sql & "   AND B.DIV=D.DIV(+)"
                    sql = sql & "   AND B.ITEM_NAME=D.ITEM_NAME(+)"
                    sql = sql & "   AND D.DIV=E.DIV(+)"
                    sql = sql & "   AND D.MASTER_ID=F.IDENTIFIER(+)"
                    If w_kinou = "120" Then
                        sql = sql & " UNION "
                        sql = sql & " SELECT "
                        sql = sql & " B.DISP_FORMAT"
                        '*** 0:表示書式
                        sql = sql & ",A.ITEM_ORDER"
                        '*** 1:カテゴリ区分
                        sql = sql & ",C.CRITERIA_TBL"
                        '*** 2:テーブル名
                        sql = sql & ",NULL"
                        '*** 3:社員ＫＥＹ１
                        sql = sql & ",B.ITEM_NAME"
                        '*** 4:項目名
                        sql = sql & ",NULL"
                        '*** 5:表示タイプ
                        sql = sql & ",NULL"
                        '*** 6:タイプ
                        sql = sql & ",B.REFERENCE_DIV"
                        '*** 7:参照区分
                        sql = sql & ",B.LITERAL_CONTENT"
                        '*** 8:リテラル内容
                        sql = sql & ",B.REFERENCE_FROM_KEY_ITEM"
                        '*** 9:マスタリンク項目
                        sql = sql & ",B.REFERENCE_TO_MASTER"
                        '***10:マスタ名
                        sql = sql & ",B.REFERENCE_TO_KEY_ITEM"
                        '***11:マスタコード項目
                        sql = sql & ",B.REFERENCE_ITEM"
                        '***12:マスタ名称項目
                        sql = sql & ",B.SCREEN_NAME"
                        '***13:画面名称
                        sql = sql & ",NVL(A.APPEND_CHAR_DIV,'0')"
                        '***14:付加文字区分
                        sql = sql & ",NVL(WEB_SP0060120_F('WEB_TP0062030_M',1,A.KAISYACD,A.FUNCTION_DIV,A.REPORT_DIV,A.IDENTIFIER,A.ITEM_ORDER,A.MASTER_AUX_DIV || '-' || TO_CHAR(A.MASTER_AUX_KAISYACD) || '-' || TO_CHAR(A.MASTER_AUX_ID),NULL,1,NULL,:ORA_5), A.APPEND_CHAR)"
                        '***15:付加文字
                        sql = sql & ",NULL"
                        '***16:マスタ種類
                        sql = sql & ",NULL"
                        '***17:マスタコード桁数
                        sql = sql & ",NVL(A.WRAP_DIGIT_NUMBER,0)"
                        '***18:折返し桁数
                        sql = sql & ",0"
                        '***19:未使用
                        sql = sql & ",NULL"
                        '***20:マスタＩＤ
                        sql = sql & ",1"
                        '***21:会社区分
                        sql = sql & ",NULL"
                        '***22:補助区分
                        sql = sql & ",A.ROW_INFO SORT1"
                        '***23:SORT用
                        sql = sql & ",A.COLUMN_INFO SORT2"
                        '***24:SORT用
                        sql = sql & ",A.PREFERENTIAL_ORDER SORT3"
                        '***25:SORT用
                        sql = sql & ",A.ITEM_ORDER SORT4"
                        '***26:SORT用
                        sql = sql & ",NVL(A.MASTER_AUX_DIV,'0')"
                        '***27:マスタ補助区分
                        sql = sql & ",A.MASTER_AUX_KAISYACD"
                        '***28:マスタ補助会社コード
                        sql = sql & ",A.MASTER_AUX_ID"
                        '***29:マスタ補助ＩＤ
                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062030_M A"
                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062091_M B"
                        sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062090_M C"
                        sql = sql & " WHERE A.KAISYACD=:ORA_4"
                        sql = sql & "   AND A.FUNCTION_DIV=:ORA_0"
                        sql = sql & "   AND A.REPORT_DIV=:ORA_1"
                        sql = sql & "   AND A.IDENTIFIER=:ORA_2"
                        sql = sql & "   AND B.CATEGORY_DIV=:ORA_3"
                        sql = sql & "   AND A.ITEM_ORDER=B.ITEM_ORDER"
                        sql = sql & "   AND B.CATEGORY_DIV=C.CATEGORY_DIV(+)"
                    End If
                    'sql = sql & " ORDER BY A.項目順"
                    sql = sql & " ORDER BY SORT1,SORT2,SORT3,SORT4"
                    ReDim w_orapara(2, 5)
                    w_orapara(0, 0) = p_kinou
                    w_orapara(1, 0) = "2"
                    w_orapara(0, 1) = p_rpkbn
                    w_orapara(1, 1) = "2"
                    w_orapara(0, 2) = w_kdata(0, w_i)
                    w_orapara(1, 2) = "2"
                    w_orapara(0, 3) = w_kdata(1, w_i)
                    w_orapara(1, 3) = "2"
                    w_orapara(0, 4) = w_kcode
                    w_orapara(1, 4) = "101"
                    w_orapara(0, 5) = SessionAsStrArray("SG_P_LANGUAGE")(9)
                    w_orapara(1, 5) = "2"
                    If P000S011.FNCG_P_RECORDSET5(30, sql, w_orapara, w_fdata) = True Then
                    End If
                    w_tempdata(w_i) = w_fdata
                Case "11"
                    sql = "SELECT "
                    sql = sql & " B.DISP_FORMAT"
                    '*** 0:表示書式
                    sql = sql & ",A.ITEM_ORDER"
                    '*** 1:カテゴリ区分
                    sql = sql & ",C.CRITERIA_TBL"
                    '*** 2:テーブル名
                    sql = sql & ",B.DIV"
                    '*** 3:社員ＫＥＹ１
                    sql = sql & ",B.ITEM_NAME"
                    '*** 4:項目名
                    sql = sql & ",B.DISP_TYPE"
                    '*** 5:表示タイプ
                    sql = sql & ",D.DATA_TYPE"
                    '*** 6:タイプ
                    sql = sql & ",D.REFERENCE_DIV"
                    '*** 7:参照区分
                    sql = sql & ",D.LITERAL_CONTENT"
                    '*** 8:リテラル内容
                    sql = sql & ",D.MASTER_LINK_ITEM"
                    '*** 9:マスタリンク項目
                    sql = sql & ",F.OBJECT_NAME"
                    '***10:マスタ名
                    sql = sql & ",F.CODE_ITEM"
                    '***11:マスタコード項目
                    sql = sql & ",F.NAME_ITEM"
                    '***12:マスタ名称項目
                    sql = sql & ",NVL(A.MANAGEMENT_NAME,NVL(B.SUPPORT_ACTION_NAME,D.MANAGEMENT_NAME))"
                    '***13:画面名称
                    sql = sql & ",''"
                    '***14:付加文字区分
                    sql = sql & ",''"
                    '***15:付加文字
                    sql = sql & ",F.MASTER_KIND"
                    '***16:マスタ種類
                    sql = sql & ",F.CODE_DIGIT"
                    '***17:マスタコード桁数
                    sql = sql & ",0"
                    '***18:折返し桁数
                    sql = sql & ",A.OUTPUT_ORDER"
                    '***19:選択順
                    sql = sql & ",D.MASTER_ID"
                    '***20:マスタＩＤ
                    sql = sql & ",F.CORP_DIV"
                    '***21:会社区分
                    sql = sql & ",D.SUPPORT_DIV"
                    '***22:補助区分
                    sql = sql & ",0 SORT1"
                    '***23:SORT用
                    sql = sql & ",0 SORT2"
                    '***24:SORT用
                    sql = sql & ",0 SORT3"
                    '***25:SORT用
                    sql = sql & ",0 SORT4"
                    '***26:SORT用
                    sql = sql & ",'0'"
                    '***27:マスタ補助区分
                    sql = sql & ",0"
                    '***28:マスタ補助会社コード
                    sql = sql & ",0"
                    '***29:マスタ補助ＩＤ
                    sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062840_T A"
                    sql = sql & "     ," & w_table5 & " B"
                    sql = sql & "     ," & w_table4 & " C"
                    sql = sql & "     ," & w_table2 & " D"
                    sql = sql & "     ," & w_table1 & " E"
                    sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0110210_M F"
                    sql = sql & " WHERE    A.KAISYACD = :ORA_5"
                    sql = sql & "   AND A.FUNCTION_DIV = :ORA_0"
                    sql = sql & "   AND A.SCREEN_NUMBER = :ORA_1"
                    sql = sql & "   AND A.MANAGEMENT_NUMBER = :ORA_4"
                    sql = sql & "   AND A.IDENTIFIER=:ORA_2"
                    sql = sql & "   AND B.CATEGORY_DIV=:ORA_3"
                    sql = sql & "   AND A.ITEM_ORDER=B.ITEM_ORDER"
                    sql = sql & "   AND B.CATEGORY_DIV=C.CATEGORY_DIV(+)"
                    sql = sql & "   AND B.DIV=D.DIV(+)"
                    sql = sql & "   AND B.ITEM_NAME=D.ITEM_NAME(+)"
                    sql = sql & "   AND D.DIV=E.DIV(+)"
                    sql = sql & "   AND D.MASTER_ID=F.IDENTIFIER(+)"
                    sql = sql & " ORDER BY A.OUTPUT_ORDER,A.ITEM_ORDER"
                    ReDim w_orapara(2, 5)
                    w_orapara(0, 0) = w_printinf(0)
                    w_orapara(1, 0) = "2"
                    w_orapara(0, 1) = w_printinf(1)
                    w_orapara(1, 1) = "2"
                    w_orapara(0, 2) = w_kdata(0, w_i)
                    w_orapara(1, 2) = "2"
                    w_orapara(0, 3) = w_kdata(1, w_i)
                    w_orapara(1, 3) = "2"
                    w_orapara(0, 4) = w_printinf(3)
                    w_orapara(1, 4) = "2"
                    w_orapara(0, 5) = w_kcode
                    w_orapara(1, 5) = "101"
                    If P000S011.FNCG_P_RECORDSET5(30, sql, w_orapara, w_fdata) = True Then
                        w_work = ""
                        For w_j = 0 To UBound(w_fdata, 2)
                            w_work = w_work & "," & w_fdata(19, w_j)
                        Next
                        w_kdata(35, w_i) = Mid(w_work, 2)
                    End If
            End Select
            '******************************************************************
            '* ＳＱＬの作成
            '******************************************************************
            '******************************************************************
            '*    基準FROM句
            '******************************************************************
            ReDim w_usetb(4, 0)
            '*** 0:テーブル名
            '*** 1:テーブルエイリアス名
            '*** 2:社員ＫＥＹ
            '*** 3:マスタＬＩＮＫビット
            '1:今日部門マスタ表示順
            '2:部門マスタ
            '3:部門マスタ表示順
            '4:部門マスタ
            '5:部門会社連携
            '//* 発令関連発令処理－人事所属・予備所属の兼務情報取得時に使用
            ReDim w_usetb2(4, 0)
            '*** 0:テーブル名
            '*** 1:テーブルエイリアス名
            '*** 2:社員ＫＥＹ
            '*** 3:マスタＬＩＮＫビット
            '1:今日部門マスタ表示順
            '2:部門マスタ
            '3:部門マスタ表示順
            '4:部門マスタ
            '5:部門会社連携
            '*** 4:基準テーブル
            '*** 発令関連発令処理時
            If w_kdata(39, w_i) <> "0" Then
                Select Case CInt(w_kdata(39, w_i))
                    Case 1, 2, 3
                        sql = "SELECT WEB_SP3030050_F(2,:ORA_0,0)"
                        sql = sql & " FROM DUAL"
                        ReDim w_orapara(2, 0)
                        If w_kdata(10, w_i) = "107" Then     '*** 家族
                            w_orapara(0, 0) = "24"
                        Else
                            w_orapara(0, 0) = w_kdata(10, w_i)
                        End If
                        w_orapara(1, 0) = "2"
                        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                            w_usetb(0, 0) = w_dbdata(0, 0)
                        End If
                        w_usetb(4, 0) = w_kdata(11, w_i)
                        w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                        w_sql_f = " FROM " & SessionAsStr("SG_C_DBUSER1") & w_usetb(0, 0) & " " & w_usetb(1, 0)
                        '*** 人事所属、予備所属の場合(兼務情報も取得)
                        Select Case w_kdata(1, w_i)
                            Case "106", "181", "182", "183", "184", "185"
                                sql = "SELECT WEB_SP3030050_F(2,:ORA_0,1)"
                                sql = sql & " FROM DUAL"
                                ReDim w_orapara(2, 0)
                                w_orapara(0, 0) = w_kdata(10, w_i)
                                w_orapara(1, 0) = "2"
                                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                                    w_usetb2(0, 0) = w_dbdata(0, 0)
                                    w_kflg = "1"
                                End If
                                w_usetb2(4, 0) = w_kdata(11, w_i)
                                w_usetb2(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                                w_sql_f2 = " FROM " & SessionAsStr("SG_C_DBUSER1") & w_usetb2(0, 0) & " " & w_usetb2(1, 0)
                                w_usetb2(2, 0) = w_kdata(12, w_i)
                                w_usetb2(3, 0) = "0000000000"
                        End Select
                    Case 4, 5
                        Select Case w_kdata(10, w_i)
                            Case "102", "181", "182", "183", "184", "185"
                                sql = "SELECT WEB_SP3030120_F(:ORA_0,3,:ORA_2,:ORA_3,'','0',:ORA_1)"
                            Case Else
                                sql = "SELECT WEB_SP3030120_F(:ORA_0,3,:ORA_2,:ORA_3,'','2',:ORA_1)"
                        End Select
                        sql = sql & " FROM DUAL"
                        ReDim w_orapara(2, 3)
                        w_orapara(0, 0) = w_kcode
                        w_orapara(1, 0) = "101"
                        w_orapara(0, 1) = SessionAsStr("SG_P_RID")
                        w_orapara(1, 1) = "2"
                        w_orapara(0, 2) = w_kdata(10, w_i)
                        w_orapara(1, 2) = "2"
                        w_orapara(0, 3) = w_kdata(39, w_i)
                        w_orapara(1, 3) = "2"
                        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                            w_usetb(0, 0) = w_dbdata(0, 0)
                        End If
                        w_usetb(4, 0) = w_kdata(11, w_i)
                        w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                        w_sql_f = " FROM (" & w_usetb(0, 0) & ") " & w_usetb(1, 0)
                End Select
                '*** 基準日、基準年度・期項目
            ElseIf w_kdata(38, w_i) = "2" Then
                '// システム任意選択の発令処理時
                '//////////////////////////////////
                sql = "SELECT WEB_SP3020530_F(2," & w_kdata(10, w_i) & ",'" & w_kdata(8, w_i) & "','" & w_kdata(9, w_i) & "'," & SessionAsStr("SG_P_RID") & ")"
                sql = sql & " FROM DUAL"
                If P000S011.FNCG_P_RECORDSET1(1, sql, w_dbdata) = True Then
                    w_usetb(0, 0) = w_dbdata(0, 0)
                    w_usetb(4, 0) = w_kdata(11, w_i)
                End If
                w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                w_sql_f = " FROM (" & w_usetb(0, 0) & ") " & w_usetb(1, 0)
            ElseIf (CInt(w_kdata(10, w_i)) >= 200 AndAlso CInt(w_kdata(10, w_i)) < 300) OrElse (CInt(w_kdata(10, w_i)) >= 900 AndAlso CInt(w_kdata(10, w_i)) <= 999) OrElse (CLng(w_kdata(10, w_i)) >= 50000 AndAlso CLng(w_kdata(10, w_i)) <= 59999) Then
                sql = "SELECT WEB_SP0002130_F(:ORA_0, 2, :ORA_1 ,:ORA_2, :ORA_3)"
                sql = sql & " FROM DUAL"
                ReDim w_orapara(2, 3)
                w_orapara(0, 0) = w_kcode
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = w_kdata(10, w_i)
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = w_kdata(8, w_i)
                w_orapara(1, 2) = "1"
                w_orapara(0, 3) = w_kdata(9, w_i)
                w_orapara(1, 3) = "1"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                    w_usetb(0, 0) = w_dbdata(0, 0)
                    w_usetb(4, 0) = w_kdata(11, w_i)
                End If
                w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                w_sql_f = " FROM (" & w_usetb(0, 0) & ") " & w_usetb(1, 0)
            ElseIf CInt(w_kdata(10, w_i)) >= 600 AndAlso CInt(w_kdata(10, w_i)) <= 609 Then
                sql = "SELECT WEB_SP0002130_F(:ORA_0, 2, :ORA_1 ,:ORA_2, :ORA_3)"
                sql = sql & " FROM DUAL"
                ReDim w_orapara(2, 3)
                w_orapara(0, 0) = w_kcode
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = w_kdata(10, w_i)
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = p_printinf(2)
                w_orapara(1, 2) = "1"
                w_orapara(0, 3) = w_ido(0) & "," & w_ido(1) & "," & w_ido(2)
                w_orapara(1, 3) = "1"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                    w_usetb(0, 0) = w_dbdata(0, 0)
                    w_usetb(4, 0) = w_kdata(11, w_i)
                    sql = "SELECT WEB_SP0002131_F(:ORA_0, 2, :ORA_1 ,:ORA_2, :ORA_3)"
                    sql = sql & " FROM DUAL"
                    ReDim w_orapara(2, 3)
                    w_orapara(0, 0) = w_kcode
                    w_orapara(1, 0) = "101"
                    w_orapara(0, 1) = w_kdata(10, w_i)
                    w_orapara(1, 1) = "2"
                    w_orapara(0, 2) = p_printinf(2)
                    w_orapara(1, 2) = "1"
                    w_orapara(0, 3) = w_ido(0) & "," & w_ido(1) & "," & w_ido(2)
                    w_orapara(1, 3) = "1"
                    If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                        w_usetb(0, 0) = w_usetb(0, 0) & w_dbdata(0, 0)
                    End If
                End If
                w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                w_sql_f = " FROM (" & w_usetb(0, 0) & ") " & w_usetb(1, 0)
            ElseIf CInt(w_kdata(10, w_i)) >= 610 AndAlso CInt(w_kdata(10, w_i)) < 619 Then
                sql = "SELECT WEB_SP0002130_F(:ORA_0, 2, :ORA_1 ,:ORA_2, :ORA_3)"
                sql = sql & " FROM DUAL"
                ReDim w_orapara(2, 3)
                w_orapara(0, 0) = w_kcode
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = w_kdata(10, w_i)
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = w_kouka(0)
                w_orapara(1, 2) = "1"
                w_orapara(0, 3) = w_kouka(1)
                w_orapara(1, 3) = "1"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                    w_usetb(0, 0) = w_dbdata(0, 0)
                    w_usetb(4, 0) = w_kdata(11, w_i)
                End If
                w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                w_sql_f = " FROM (" & w_usetb(0, 0) & ") " & w_usetb(1, 0)
                '*** 辞令書関連
            ElseIf CInt(w_kdata(10, w_i)) >= 620 AndAlso CInt(w_kdata(10, w_i)) < 630 Then
                w_work = p_kinou & "-" & p_rpkbn & "-" & w_kdata(0, w_i)
                Select Case w_gsmode
                    Case "1"
                        '*** 通常
                        w_wdate = w_kdata(8, w_i)
                    Case "2"
                        '*** 異動
                        w_wdate = p_printinf(2)
                        w_work = w_work & "-" & w_ido(0) & "-" & w_ido(1) & "-" & w_ido(2)
                    Case "3"
                        '*** 考課
                        w_wdate = p_printinf(2)
                    Case "4"
                        '*** 登録
                        w_wdate = p_printinf(2)
                End Select
                sql = "SELECT WEB_SP0002130_F(:ORA_0, 2, :ORA_1 ,:ORA_2, :ORA_3)"
                sql = sql & " FROM DUAL"
                ReDim w_orapara(2, 3)
                w_orapara(0, 0) = w_kcode
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = w_kdata(10, w_i)
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = w_wdate
                w_orapara(1, 2) = "1"
                w_orapara(0, 3) = w_work
                w_orapara(1, 3) = "1"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                    'Response.Write w_dbdata(0,0) & "<BR>"
                    w_usetb(0, 0) = w_dbdata(0, 0)
                    w_usetb(4, 0) = w_kdata(11, w_i)
                End If
                w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                w_sql_f = " FROM (" & w_usetb(0, 0) & ") " & w_usetb(1, 0)
                '*** 異動線関連
            ElseIf CInt(w_kdata(10, w_i)) >= 630 AndAlso CInt(w_kdata(10, w_i)) < 640 Then
                sql = "SELECT WEB_SP0002130_F(:ORA_0, 2, :ORA_1 ,:ORA_2, :ORA_3)"
                sql = sql & " FROM DUAL"
                ReDim w_orapara(2, 3)
                w_orapara(0, 0) = w_kcode
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = w_kdata(10, w_i)
                w_orapara(1, 1) = "2"
                w_orapara(0, 2) = w_idosen(0)
                w_orapara(1, 2) = "1"
                w_orapara(0, 3) = w_idosen(1)
                w_orapara(1, 3) = "1"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                    w_usetb(0, 0) = w_dbdata(0, 0) & " AND ANOTHER_POST_DIV = '0'"
                    w_usetb(4, 0) = w_kdata(11, w_i)
                End If
                w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                w_sql_f = " FROM (" & w_usetb(0, 0) & ") " & w_usetb(1, 0)
                '*** 人材育成関連
            ElseIf w_kdata(10, w_i) = "0" Then
                w_usetb(0, 0) = w_kdata(11, w_i)
                w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                w_usetb(4, 0) = w_kdata(11, w_i)
                w_sql_f = " FROM " & SessionAsStr("SG_C_DBUSER1") & w_usetb(0, 0) & " " & w_usetb(1, 0)
            Else
                w_usetb(0, 0) = w_kdata(11, w_i)
                w_usetb(1, 0) = "T" & w_kdata(0, w_i) & "_1"
                w_usetb(4, 0) = w_kdata(11, w_i)
                w_sql_f = " FROM " & SessionAsStr("SG_C_DBUSER1") & w_usetb(0, 0) & " " & w_usetb(1, 0)
            End If
            Select Case w_usetb(0, 0)
                Case "WEB_TP3031020_T", "WEB_TP3031040_T"
                    w_usetb(2, 0) = "EMP_CODE"
                Case Else
                    w_usetb(2, 0) = w_kdata(12, w_i)
            End Select
            w_usetb(3, 0) = "0000000000"
            '******************************************************************
            '*    基準WHERE句
            '******************************************************************
            '**************************************************************
            '*    社員単位の場合
            '**************************************************************
            If (p_skbn = "1" OrElse p_skbn = "2") AndAlso (SessionAsStr("SL_P001M016_BUTTON") <> "2" OrElse (p_outfmt = "3" OrElse p_outfmt = "4")) Then
                w_allkbn = "1"
                If w_kdata(21, w_i) = "1" Then
                    If p_kinou = "400" Then
                        w_sql_w = " WHERE " & w_usetb(1, 0) & ".KAISYACD=" & w_kcode
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".APPLY_YEAR=TO_DATE('" & w_nendo & "','YYYY/MM/DD')"
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "=:ORA_0"
                    Else
                        w_sql_w = " WHERE " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "=:ORA_0"
                        Select Case w_kdata(10, w_i)
                            Case "311", "312", "313", "314"
                                If SessionAsStr("SG_P_KAISYA_FLG") = "1" AndAlso w_kcode <> "0" Then
                                    w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".KAISYACD=" & P000S001.FNCG_P_CANGEVALUE(101, w_kcode)
                                End If
                        End Select
                    End If
                Else
                    w_sql_w = " WHERE " & w_usetb(1, 0) & ".KAISYACD=" & P000S001.FNCG_P_CANGEVALUE(101, w_kdata(22, w_i))
                    w_sql_w = w_sql_w & "   AND " & w_usetb(1, 0) & ".SYAINCD=:ORA_0"
                End If
                '**************************************************************
                '*    一括の場合
                '**************************************************************
            Else
                w_allkbn = "2"
                Select Case w_kdata(21, w_i)
                    Case "1"
                        If p_kinou = "400" Then
                            w_sql_w = " WHERE " & w_usetb(1, 0) & ".KAISYACD=" & w_kcode
                            w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".APPLY_YEAR=TO_DATE('" & w_nendo & "','YYYY/MM/DD')"
                            w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "=T_KEY.RECEIPT_NUMBER"
                        ElseIf p_kinou = "300" Then
                            w_sql_w = " WHERE " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "=T_KEY.EMP_CODE"
                        ElseIf w_kdata(10, w_i) = "0" Then
                            '*** 人材育成関連
                            w_sql_w = " WHERE " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "=T_KEY.EMP_CODE"
                            w_sql_w = w_sql_w & "   AND " & w_usetb(1, 0) & ".KAISYACD=" & P000S001.FNCG_P_CANGEVALUE(101, w_kdata(22, w_i))
                            w_sql_w = w_sql_w & "   AND " & w_usetb(1, 0) & ".PROCESS_DIV=T_KEY.PROCESS_DIV"
                            w_sql_w = w_sql_w & "   AND " & w_usetb(1, 0) & ".OFFER_NUMBER=T_KEY.OFFER_NUMBER"
                            '***                        w_sql_w = w_sql_w & "   AND " & w_usetb(1,0) & ".コード１=T_KEY.コード１"
                        Else
                            Select Case w_kdata(10, w_i)
                                Case "301", "311", "312", "313", "314"
                                    w_sql_w = " WHERE " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "=T_KEY.SYAINCD"
                                    If SessionAsStr("SG_P_KAISYA_FLG") = "1" Then
                                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".KAISYACD=T_KEY.KAISYACD"
                                        If w_kcode <> "0" Then
                                            w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".KAISYACD=" & P000S001.FNCG_P_CANGEVALUE(101, w_kcode)
                                        End If
                                    End If
                                Case Else
                                    w_sql_w = " WHERE " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "=T_KEY.EMP_CODE"
                                    If w_kflg = "1" Then
                                        '*** 人事所属・予備所属の兼務を含む場合
                                        w_sql_w2 = " WHERE " & w_usetb2(1, 0) & "." & w_usetb2(2, 0) & "=T_KEY.EMP_CODE"
                                    End If
                            End Select
                        End If
                    Case "2"
                        w_sql_w = " WHERE " & w_usetb(1, 0) & ".KAISYACD=" & P000S001.FNCG_P_CANGEVALUE(101, w_kdata(22, w_i))
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".SYAINCD=T_KEY.SYAINCD"
                    Case "3"
                        w_sql_w = " WHERE " & w_usetb(1, 0) & ".SYAINCD=T_KEY.SYAINCD"
                End Select
                '**** セキュリティ情報
                w_rc = P000S029.FNCG_P_REFCHK(2, "", CInt(w_kdata(19, w_i)), 0)
                If Not IsNull(w_rc) Then
                    If w_gsmode = "3" Then  '*** 考課の場合　※現在は考課結果外部出力(ユーザー選択)のみ
                        w_sql_w = w_sql_w & " AND T_KEY3.DIV IN (" & w_rc & ")"
                        If w_kflg = "1" Then    '*** 人事所属・予備所属の兼務を含む場合
                            w_sql_w2 = w_sql_w2 & " AND T_KEY3.DIV IN (" & w_rc & ")"
                        End If
                    Else
                        w_sql_w = w_sql_w & " AND T_KEY.DIV IN (" & w_rc & ")"
                        If w_kflg = "1" Then
                            '*** 人事所属・予備所属の兼務を含む場合
                            w_sql_w2 = w_sql_w2 & " AND T_KEY.DIV IN (" & w_rc & ")"
                        End If
                    End If
                End If
                Select Case w_gsmode
                    Case "3"
                        '*** 考課の場合 ※現在は考課結果外部出力(ユーザー選択)のみ
                        w_sql_f = w_sql_f & " , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO T_KEY"
                        w_sql_f = w_sql_f & " , " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & "  T_KEY3"
                        w_sql_w = w_sql_w & " AND T_KEY.EMP_CODE=T_KEY3.EMP_CODE"
                        If w_kouka(10) = "2" Then '
                            w_sql_f = w_sql_f & ",EVAL_TAKE_DATA T_KEY2"
                            If w_kouka(0) <> "1111" Then
                                w_sql_w = w_sql_w & " AND T_KEY2.EVAL_PATTERN='" & w_kouka(0) & "'"
                            End If
                            w_sql_w = w_sql_w & " AND T_KEY2.EVAL_PERIOD='" & w_kouka(1) & "'"
                            If w_kdata(21, w_i) = "1" Then
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "=T_KEY2.EMP_CODE"
                            Else
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "=WEB_SP0002470_F(1,T_KEY2.EMP_CODE)"
                            End If
                        End If
                    Case Else
                        If p_kinou = "400" Then
                            w_sql_f = w_sql_f & "," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " T_KEY"
                        Else
                            If w_jirei = 1 Then
                                w_sql_f = w_sql_f & "," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011040_W_" & SessionAsStr("SG_P_RID") & " T_KEY"
                                If CInt(w_kdata(10, w_i)) >= 621 AndAlso CInt(w_kdata(10, w_i)) < 630 Then
                                    w_sql_w = w_sql_w & " AND DECODE(" & w_usetb(1, 0) & ".ANOTHER_POST_DIV,NULL,T_KEY.ANOTHER_POST_DIV," & w_usetb(1, 0) & ".ANOTHER_POST_DIV)=T_KEY.ANOTHER_POST_DIV"
                                End If
                            Else
                                If SessionAsStrArray("SG_P_003INF")(4) = "1" AndAlso w_gsmode = "1" Then
                                    w_sql_f = w_sql_f & ",(SELECT DISTINCT A.EMP_CODE,A.DIV,B.SYAINCD,B.KAISYACD "
                                    w_sql_f = w_sql_f & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " A"
                                    w_sql_f = w_sql_f & "       , " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO B"
                                    w_sql_f = w_sql_f & "   WHERE A.EMP_CODE = B.EMP_CODE) T_KEY"
                                Else
                                    w_sql_f = w_sql_f & "," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " T_KEY"
                                End If
                            End If
                            If w_kflg = "1" Then
                                '*** 人事所属・予備所属の兼務を含む場合
                                w_sql_f2 = w_sql_f2 & "," & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " T_KEY"
                            End If
                        End If
                End Select
                '*** 異動の場合、KEYをJOIN
                Select Case CInt(w_kdata(10, w_i))
                    Case 600, 601, 602, 603, 604, 605, 606, 607, 608, 609
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".JOINKEY=T_KEY.JOINKEY"
                    Case 621, 622
                        If w_gsmode = "2" Then
                            w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".JOINKEY=T_KEY.JOINKEY"
                        End If
                End Select
                If w_gsmode = "2" Then
                    w_sql_w = w_sql_w & " AND T_KEY.SELECTED = 1"
                End If
                Select Case w_kdata(39, w_i)
                    Case "1", "2", "3"
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".KAISYACD=" & P000S001.FNCG_P_CANGEVALUE(101, w_kdata(22, w_i))
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".ISSUE_BUSINESS=T_KEY.ISSUE_BUSINESS"
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".ISSUE_ISSUE_DATE=T_KEY.ISSUE_ISSUE_DATE"
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".ISSUE_ID=T_KEY.ISSUE_ID"
                        Select Case w_kdata(10, w_i)
                            Case "102"
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".DIV=5"
                            Case "105"  '*** 保険（人事）
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".DIV=31"
                            Case "107"  '*** 家族
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".DIV=24"
                            Case "109"  '*** 担当歴
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".DIV=69"
                            Case "181", "182", "183", "184", "185"
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".DIV=" & CStr(CInt(w_kdata(10, w_i)) - 100)
                            Case Else
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".DIV=" & w_kdata(10, w_i)
                        End Select
                        Select Case w_kdata(39, w_i)
                            Case "1"
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".DATA_DIV=1"
                            Case "2"
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".DATA_DIV=2"
                            Case "3"
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".DATA_DIV=3"
                        End Select
                        If w_kflg = "1" Then
                            '*** 人事所属・予備所属の兼務を含む場合
                            w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".KAISYACD=" & P000S001.FNCG_P_CANGEVALUE(101, w_kdata(22, w_i))
                            w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".ISSUE_BUSINESS=T_KEY.ISSUE_BUSINESS"
                            w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".ISSUE_ISSUE_DATE=T_KEY.ISSUE_ISSUE_DATE"
                            w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".ISSUE_ID=T_KEY.ISSUE_ID"
                            Select Case w_kdata(10, w_i)
                                Case "102"
                                    w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".DIV=5"
                                Case "181", "182", "183", "184", "185"
                                    w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".DIV=" & CStr(CInt(w_kdata(10, w_i)) - 100)
                                Case Else
                                    w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".DIV=" & w_kdata(10, w_i)
                            End Select
                            Select Case w_kdata(39, w_i)
                                Case "1"
                                    w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".DATA_DIV=1"
                                Case "2"
                                    w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".DATA_DIV=2"
                                Case "3"
                                    w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & ".DATA_DIV=3"
                            End Select
                        End If
                    Case "4", "5"
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".JOINKEY=T_KEY.JOINKEY"
                End Select
            End If
            '**************************************************************
            '*    給与・就業その他部分
            '**************************************************************
            Select Case w_kdata(21, w_i)
                Case "2", "3"
                    Select Case w_kdata(1, w_i)
                        Case "502", "503", "504", "505"
                            w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".SYORIKB=" & w_kdata(23, w_i)
                            If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(24, w_i))) Then
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".SIKYUNGP>=TO_DATE('" & w_kdata(24, w_i) & "','YYYY/MM/DD')"
                            End If
                            If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(25, w_i))) Then
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".SIKYUNGP<=TO_DATE('" & w_kdata(25, w_i) & "','YYYY/MM/DD')"
                            End If
                        Case "551", "552", "553", "554", "555", "556", "557", "558"
                            Select Case w_kdata(1, w_i)
                                Case "551"
                                    w_field = "YOTEINGP"
                                Case "552"
                                    w_field = "SINSENGP"
                                Case Else
                                    w_field = "KINMUNGP"
                            End Select
                            '*** 支給年月日自
                            If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(24, w_i))) Then
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_field & ">=TO_DATE('" & w_kdata(24, w_i) & "','YYYY/MM/DD')"
                            End If
                            '*** 支給年月日至
                            If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(25, w_i))) Then
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_field & "<=TO_DATE('" & w_kdata(25, w_i) & "','YYYY/MM/DD')"
                            End If
                        Case "559", "560", "561", "562", "563", "564"
                            w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".SYORIKB=" & w_kdata(23, w_i)
                            '*** 支給年月日自
                            If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(24, w_i))) Then
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".KYUYONGT>=" & Mid(w_kdata(24, w_i), 1, 4) & Mid(w_kdata(24, w_i), 6, 2)
                            End If
                            '*** 支給年月日至
                            If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(25, w_i))) Then
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".KYUYONGT<=" & Mid(w_kdata(25, w_i), 1, 4) & Mid(w_kdata(25, w_i), 6, 2)
                            End If
                            '*** 賞与コード
                            If w_kdata(37, w_i) <> "0" Then
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".SYOYOCD=" & w_kdata(37, w_i)
                            End If
                            '*** 計算グループ
                            If w_kdata(36, w_i) <> "0" Then
                                w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".KYKSNGRP=" & w_kdata(36, w_i)
                            End If
                    End Select
            End Select
            '**************************************************************
            '*    考課情報は自分自身を参照できない
            '**************************************************************
            Select Case w_kdata(1, w_i)
                Case "121", "265", "610", "611"
                    If SessionAsStr("SG_P_STYPE") = "0" Then
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "<>" & SessionAsStr("SG_P_SID")
                    Else
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_usetb(2, 0) & "<> '" & SessionAsStr("SG_P_SID") & "'"
                    End If
                    If SessionAsStr("SG_P_KAISYA_FLG") = "1" AndAlso w_kcd = "0" Then
                        '*** 全社ログイン時
                        w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_usetb(2, 0) & " NOT IN ("
                        w_sql_w = w_sql_w & "    SELECT CMN2.INNERSYAINCD"
                        w_sql_w = w_sql_w & "      FROM " & SessionAsStr("SG_C_DBUSER1") & "CMN_OPERATOR_MS CMN1"
                        w_sql_w = w_sql_w & "         , " & SessionAsStr("SG_C_DBUSER1") & "CMN_PERSONALLINK_MS CMN2"
                        w_sql_w = w_sql_w & "     WHERE CMN1.KAISYACD = 0"
                        w_sql_w = w_sql_w & "       AND CMN1.OPERATORCODE = " & P000S001.FNCG_P_CANGEVALUE(CInt(SessionAsStr("SG_P_HTYPE")) + 1, SessionAsStr("SG_P_HID"))
                        w_sql_w = w_sql_w & "       AND CMN1.SYSTEMDEV = 0"
                        w_sql_w = w_sql_w & "       AND CMN1.PERSONALID = CMN2.PERSONALID)"
                    End If
            End Select
            If SessionAsStr("SG_P_KAISYA_FLG") = "0" Then
                Select Case w_skbn
                    Case "1", "2", "3"
                        '*** 保険（今日）
                        If w_kdata(1, w_i) = "220" Then
                            w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".KAISYACD = "
                            w_sql_w = w_sql_w & " NVL((SELECT MIN(B.LINK_CORP_CODE)"
                            w_sql_w = w_sql_w & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_PAY_BELONG_HIS_INFO A"
                            w_sql_w = w_sql_w & "     , " & SessionAsStr("SG_C_DBUSER1") & "DEPT_CORP_COLLABO_MS B"
                            w_sql_w = w_sql_w & " WHERE A.EMP_CODE = " & w_usetb(1, 0) & ".EMP_CODE"
                            w_sql_w = w_sql_w & "   AND A.ISSUE_DATE <= TRUNC(SYSDATE,'DD')"
                            w_sql_w = w_sql_w & "   AND A.END_DAY >= TRUNC(SYSDATE,'DD')"
                            w_sql_w = w_sql_w & "   AND A.KAISYACD = B.KAISYACD"
                            w_sql_w = w_sql_w & "   AND A.DEPT_CODE1 = B.DEPT_CODE)"
                            w_sql_w = w_sql_w & ",(SELECT MIN(B.LINK_CORP_CODE)"
                            w_sql_w = w_sql_w & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO A"
                            w_sql_w = w_sql_w & "       , " & SessionAsStr("SG_C_DBUSER1") & "DEPT_CORP_COLLABO_MS B"
                            w_sql_w = w_sql_w & "   WHERE A.EMP_CODE = " & w_usetb(1, 0) & ".EMP_CODE"
                            w_sql_w = w_sql_w & "     AND A.ANOTHER_POST_DIV = '0'"
                            w_sql_w = w_sql_w & "     AND A.ISSUE_DATE <= TRUNC(SYSDATE,'DD')"
                            w_sql_w = w_sql_w & "     AND A.END_DAY >= TRUNC(SYSDATE,'DD')"
                            w_sql_w = w_sql_w & "     AND A.KAISYACD = B.KAISYACD"
                            w_sql_w = w_sql_w & "     AND A.DEPT_CODE1 = B.DEPT_CODE))"
                            '*** 保険（基準日）
                        ElseIf w_kdata(1, w_i) = "291" Then
                            w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & ".KAISYACD = "
                            w_sql_w = w_sql_w & " NVL((SELECT MIN(B.LINK_CORP_CODE)"
                            w_sql_w = w_sql_w & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_PAY_BELONG_HIS_INFO A"
                            w_sql_w = w_sql_w & "     , " & SessionAsStr("SG_C_DBUSER1") & "DEPT_CORP_COLLABO_MS B"
                            w_sql_w = w_sql_w & " WHERE A.EMP_CODE = " & w_usetb(1, 0) & ".EMP_CODE"
                            w_sql_w = w_sql_w & "   AND A.ISSUE_DATE <= '" & w_kdata(8, w_i) & "'"
                            w_sql_w = w_sql_w & "   AND A.END_DAY >= '" & w_kdata(8, w_i) & "'"
                            w_sql_w = w_sql_w & "   AND A.KAISYACD = B.KAISYACD"
                            w_sql_w = w_sql_w & "   AND A.DEPT_CODE1 = B.DEPT_CODE)"
                            w_sql_w = w_sql_w & ",(SELECT MIN(B.LINK_CORP_CODE)"
                            w_sql_w = w_sql_w & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO A"
                            w_sql_w = w_sql_w & "       , " & SessionAsStr("SG_C_DBUSER1") & "DEPT_CORP_COLLABO_MS B"
                            w_sql_w = w_sql_w & "   WHERE A.EMP_CODE = " & w_usetb(1, 0) & ".EMP_CODE"
                            w_sql_w = w_sql_w & "     AND A.ANOTHER_POST_DIV = '0'"
                            w_sql_w = w_sql_w & "     AND A.ISSUE_DATE <= '" & w_kdata(8, w_i) & "'"
                            w_sql_w = w_sql_w & "     AND A.END_DAY >= '" & w_kdata(8, w_i) & "'"
                            w_sql_w = w_sql_w & "     AND A.KAISYACD = B.KAISYACD"
                            w_sql_w = w_sql_w & "     AND A.DEPT_CODE1 = B.DEPT_CODE))"
                        End If
                End Select
            End If
            '******************************************************************
            '*    出力条件WHERE句
            '******************************************************************
            Select Case w_kdata(4, w_i)
                '*** 出力条件
                Case "2", "3"
                    '*** 条件項目の取得（ソート項目の先頭）
                    sql = "SELECT "
                    sql = sql & " C.ITEM_NAME"
                    sql = sql & " FROM " & w_table4 & " A"
                    sql = sql & "     ," & w_table1 & " B"
                    sql = sql & "     ," & w_table2 & " C"
                    sql = sql & " WHERE A.CATEGORY_DIV=:ORA_0"
                    sql = sql & "   AND A.CRITERIA_TBL=B.TBL_NAME"
                    sql = sql & "   AND B.DIV=C.DIV"
                    sql = sql & "   AND C.SORT_DIV=1"
                    ReDim w_orapara(2, 0)
                    w_orapara(0, 0) = w_kdata(1, w_i)
                    w_orapara(1, 0) = "2"
                    If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                        Select Case w_kdata(4, w_i)
                            Case "2"
                                '*** 過去x年
                                If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(5, w_i))) Then
                                    w_sdate = P000S031.FNCG_P_DATEADD(1, SessionAsStr("SG_P_TDATE"), CStr(-1 * (CInt(w_kdata(5, w_i)))))
                                    w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_dbdata(0, 0) & ">TO_DATE('" & w_sdate & "','YYYY/MM/DD')"
                                    If w_kflg = "1" Then
                                        '*** 人事所属・予備所属の兼務を含む場合
                                        w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & "." & w_dbdata(0, 0) & ">TO_DATE('" & w_sdate & "','YYYY/MM/DD')"
                                    End If
                                End If
                            Case "3"
                                '*** 期間
                                If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(6, w_i))) Then
                                    w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_dbdata(0, 0) & ">= TO_DATE('" & w_kdata(6, w_i) & "','YYYY/MM/DD')"
                                    If w_kflg = "1" Then
                                        '*** 人事所属・予備所属の兼務を含む場合
                                        w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & "." & w_dbdata(0, 0) & ">= TO_DATE('" & w_kdata(6, w_i) & "','YYYY/MM/DD')"
                                    End If
                                End If
                                If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(7, w_i))) Then
                                    w_sql_w = w_sql_w & " AND " & w_usetb(1, 0) & "." & w_dbdata(0, 0) & "<= TO_DATE('" & w_kdata(7, w_i) & "','YYYY/MM/DD')"
                                    If w_kflg = "1" Then
                                        '*** 人事所属・予備所属の兼務を含む場合
                                        w_sql_w2 = w_sql_w2 & " AND " & w_usetb2(1, 0) & "." & w_dbdata(0, 0) & "<= TO_DATE('" & w_kdata(7, w_i) & "','YYYY/MM/DD')"
                                    End If
                                End If
                        End Select
                    End If
            End Select
            '******************************************************************
            '*    昇格歴WHERE句
            '******************************************************************
            Select Case p_skbn
                Case "3", "4"
                    Select Case w_kdata(1, w_i)
                        Case "108"
                            w_flg = 0
                            For w_j = 0 To UBound(w_fdata, 2)
                                If CInt(w_fdata(1, w_j)) > 3 Then
                                    If w_flg = 0 Then
                                        w_flg = 1
                                        w_sql_w = w_sql_w & " AND ("
                                    Else
                                        w_sql_w = w_sql_w & " OR "
                                    End If
                                    If w_fdata(4, w_j) = "BELONG_NAME" Then
                                        w_sql_w = w_sql_w & " (" & w_usetb(1, 0) & "." & w_fdata(4, w_j) & " IS NOT NULL OR " & w_usetb(1, 0) & ".DEPT_NAME1 IS NOT NULL)"
                                    Else
                                        w_sql_w = w_sql_w & " " & w_usetb(1, 0) & "." & w_fdata(4, w_j) & " IS NOT NULL"
                                    End If
                                End If
                            Next
                            If w_flg = 1 Then
                                w_sql_w = w_sql_w & " )"
                            End If
                    End Select
            End Select
            '******************************************************************
            '*    その他条件WHERE句
            '******************************************************************
            If CStr(P000S001.FNCG_P_NZ(w_kdata(13, w_i))) = "2" Then
                sql = "SELECT "
                sql = sql & " A.UNION_SPECIFY"
                sql = sql & ",A.BRACKET1"
                sql = sql & ",A.BRACKET2"
                sql = sql & ",A.COMPARISON_DIV"
                sql = sql & ",A.CONTENT1"
                sql = sql & ",A.CONTENT2"
                Select Case w_kdata(39, w_i)
                    Case "1", "2", "3"
                        '*** 参照先区分（1:発令前,2:発令内容,3:発令後）
                        If (CLng(w_kdata(1, w_i)) >= 700 AndAlso CLng(w_kdata(1, w_i)) <= 999) OrElse (CLng(w_kdata(1, w_i)) >= 10000 AndAlso CLng(w_kdata(1, w_i)) <= 59999)
                            sql = sql & ",DECODE(D.DATA_TYPE,'DATE','DATE_','NUMBER','NUMBER_','CHAR_') || C.ITEM_NAME"
                        Else
                            sql = sql & ",C.ITEM_NAME"
                        End If
                    Case Else
                        sql = sql & ",C.ITEM_NAME"
                End Select
                sql = sql & ",C.DISP_FORMAT"
                sql = sql & ",C.COMPOUND_SEARCH_DIV"
                sql = sql & ",D.MASTER_LINK_ITEM"
                sql = sql & ",C.CATEGORY_DIV"
                Select Case p_skbn
                    Case "1", "2"
                        sql = sql & ",NVL(A.COMPARISON_LANG_ID,0)"
                        sql = sql & ",D.MASTER_ID"
                        sql = sql & ",NVL(WEB_SP0002420_F(1,D.MASTER_ID),0)"
                        sql = sql & ",NVL(A.MASTER_AUX_DIV,'0')"
                        sql = sql & ",A.MASTER_AUX_KAISYACD"
                        sql = sql & ",A.MASTER_AUX_ID"
                        sql = sql & ",E.MASTER_HISTORY_DIV"
                        sql = sql & ",E.MASTER_HISTORY_ITEM_NAME"
                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010280_W A"
                    Case "3"
                        sql = sql & ",NVL(A.COMPARISON_LANG_ID,0)"
                        sql = sql & ",D.MASTER_ID"
                        sql = sql & ",NVL(WEB_SP0002420_F(1,D.MASTER_ID),0)"
                        sql = sql & ",NVL(A.MASTER_AUX_DIV,'0')"
                        sql = sql & ",A.MASTER_AUX_KAISYACD"
                        sql = sql & ",A.MASTER_AUX_ID"
                        sql = sql & ",E.MASTER_HISTORY_DIV"
                        sql = sql & ",E.MASTER_HISTORY_ITEM_NAME"
                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062040_M A"
                    Case "11"
                        sql = sql & ",0"
                        sql = sql & ",D.MASTER_ID"
                        sql = sql & ",NVL(WEB_SP0002420_F(1,D.MASTER_ID),0)"
                        sql = sql & ",'0'"
                        sql = sql & ",0"
                        sql = sql & ",0"
                        sql = sql & ",E.MASTER_HISTORY_DIV"
                        sql = sql & ",E.MASTER_HISTORY_ITEM_NAME"
                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062850_T A"
                End Select
                sql = sql & "     ," & w_table5 & " C"
                sql = sql & "     ," & w_table2 & " D"
                sql = sql & "     ," & w_table1 & " E"
                Select Case p_skbn
                    Case "1", "2"
                        sql = sql & " WHERE A.CUSTOMER_ID=:ORA_0"
                        sql = sql & "   AND A.IDENTIFIER=:ORA_1"
                        sql = sql & "   AND A.IDENTIFIER=C.CATEGORY_DIV"
                        sql = sql & "   AND A.ITEM_ORDER=C.ITEM_ORDER"
                        sql = sql & "   AND C.DIV=D.DIV"
                        sql = sql & "   AND C.ITEM_NAME=D.ITEM_NAME"
                        sql = sql & "   AND D.DIV=E.DIV"
                        sql = sql & " ORDER BY A.SELECT_ORDER"
                        ReDim w_orapara(2, 1)
                        w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                        w_orapara(1, 0) = "2"
                        w_orapara(0, 1) = w_kdata(1, w_i)
                        w_orapara(1, 1) = "2"
                    Case "3"
                        sql = sql & " WHERE A.KAISYACD=:ORA_4"
                        sql = sql & "   AND A.FUNCTION_DIV=:ORA_0"
                        sql = sql & "   AND A.REPORT_DIV=:ORA_1"
                        sql = sql & "   AND A.IDENTIFIER=:ORA_2"
                        sql = sql & "   AND C.CATEGORY_DIV=:ORA_3"
                        sql = sql & "   AND A.ITEM_ORDER=C.ITEM_ORDER"
                        sql = sql & "   AND C.DIV=D.DIV"
                        sql = sql & "   AND C.ITEM_NAME=D.ITEM_NAME"
                        sql = sql & "   AND D.DIV=E.DIV"
                        sql = sql & " ORDER BY A.SELECT_ORDER"
                        ReDim w_orapara(2, 4)
                        w_orapara(0, 0) = p_kinou
                        w_orapara(1, 0) = "2"
                        w_orapara(0, 1) = p_rpkbn
                        w_orapara(1, 1) = "2"
                        w_orapara(0, 2) = w_kdata(0, w_i)
                        w_orapara(1, 2) = "2"
                        w_orapara(0, 3) = w_kdata(1, w_i)
                        w_orapara(1, 3) = "2"
                        w_orapara(0, 4) = w_kcode
                        w_orapara(1, 4) = "101"
                    Case "11"
                        sql = sql & " WHERE A.KAISYACD=:ORA_5"
                        sql = sql & "   AND A.FUNCTION_DIV = :ORA_0"
                        sql = sql & "   AND A.SCREEN_NUMBER = :ORA_1"
                        sql = sql & "   AND A.MANAGEMENT_NUMBER = :ORA_4"
                        sql = sql & "   AND A.IDENTIFIER=:ORA_2"
                        sql = sql & "   AND C.CATEGORY_DIV=:ORA_3"
                        sql = sql & "   AND A.ITEM_ORDER=C.ITEM_ORDER"
                        sql = sql & "   AND C.DIV=D.DIV"
                        sql = sql & "   AND C.ITEM_NAME=D.ITEM_NAME"
                        sql = sql & "   AND D.DIV=E.DIV"
                        sql = sql & " ORDER BY A.SELECT_ORDER"
                        ReDim w_orapara(2, 5)
                        w_orapara(0, 0) = p_kinou
                        w_orapara(1, 0) = "2"
                        w_orapara(0, 1) = p_rpkbn
                        w_orapara(1, 1) = "2"
                        w_orapara(0, 2) = w_kdata(0, w_i)
                        w_orapara(1, 2) = "2"
                        w_orapara(0, 3) = w_kdata(1, w_i)
                        w_orapara(1, 3) = "2"
                        w_orapara(0, 4) = w_printinf(3)
                        w_orapara(1, 4) = "2"
                        w_orapara(0, 5) = w_kcode
                        w_orapara(1, 5) = "101"
                End Select
                If P000S011.FNCG_P_RECORDSET5(19, sql, w_orapara, w_dbdata) = True Then
                    w_sql_w = w_sql_w & " AND "
                    P000S027.FNCG_P_COMSQL_WHERE(w_usetb(1, 0), w_dbdata, w_sql_w, w_sql_f, w_kdata(8, w_i))
                    If w_kflg = "1" Then
                        '*** 人事所属・予備所属の兼務を含む場合
                        w_sql_w2 = w_sql_w2 & " AND "
                        P000S027.FNCG_P_COMSQL_WHERE(w_usetb2(1, 0), w_dbdata, w_sql_w2, w_sql_f2, w_kdata(8, w_i))
                    End If
                End If
            End If
            '**************************************************************
            '*    基準ORDER BY句
            '**************************************************************
            Select Case w_gsmode
                Case "7"
                    'w_sql_o = " ORDER BY T_KEY.JOINKEY"
                    w_sql_o = " ORDER BY T_KEY.DISP_ORDER"
                Case "8"
                    If w_kdata(10, w_i) = "0" Then
                        w_sql_o = " ORDER BY T_KEY.DISP_ORDER," & w_usetb(1, 0) & ".CODE_VALUE1"
                    Else
                        w_sql_o = " ORDER BY T_KEY.DISP_ORDER"
                    End If
                Case Else
                    'If w_allkbn = "1" Then
                    If w_gsmode = "5" AndAlso w_tkflg = "3" Then
                        'w_sql_o = " ORDER BY " & w_usetb(1,0) & ".表示社員コード"
                        w_sql_o = " ORDER BY " & "T_KEY.SYAINCD"
                        'Else
                        'w_sql_o = " ORDER BY " & w_usetb(1,0) & "." & w_usetb(2,0)
                        'End If
                    Else
                        If w_allkbn = "2" Then
                            If p_kinou = "400" Then
                                w_sql_o = " ORDER BY " & w_usetb(1, 0) & "." & w_usetb(2, 0)
                            Else
                                If w_kcode = "0" AndAlso SessionAsStr("SG_P_KAISYA_FLG") = "1" Then
                                    w_sql_o = " ORDER BY T_KEY.KAISYACD,T_KEY.SYAINCD"
                                Else
                                    w_sql_o = " ORDER BY T_KEY.SYAINCD"
                                End If
                            End If
                        Else
                            w_sql_o = " ORDER BY " & w_usetb(1, 0) & "." & w_usetb(2, 0)
                        End If
                    End If
                    If w_jirei = 1 Then
                        w_sql_o = w_sql_o & ",T_KEY.ANOTHER_POST_DIV"
                    End If
                    Select Case w_gsmode
                        Case "2"
                            w_sql_o = w_sql_o & ",T_KEY.JOINKEY"
                    End Select
            End Select
            If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(3, w_i))) Then
                sql = "SELECT "
                Select Case CInt(w_kdata(39, w_i))
                    Case 1, 2, 3
                        If (CLng(w_kdata(1, w_i)) >= 700 AndAlso CLng(w_kdata(1, w_i)) <= 999) OrElse (CLng(w_kdata(1, w_i)) >= 10000 AndAlso CLng(w_kdata(1, w_i)) <= 59999)
                            sql = sql & "DECODE(ITEM_NAME,'HISTORY_ID','',DECODE(DATA_TYPE,'DATE','DATE_','NUMBER','NUMBER_','CHAR_')) || ITEM_NAME"
                            '*** 4:項目名
                        Else
                            sql = sql & "ITEM_NAME"
                        End If
                    Case Else
                        sql = sql & "ITEM_NAME"
                End Select
                sql = sql & " FROM " & w_table2
                sql = sql & " WHERE DIV=:ORA_0"
                sql = sql & "   AND SORT_DIV IS NOT NULL"
                sql = sql & " ORDER BY SORT_DIV"
                ReDim w_orapara(2, 0)
                w_orapara(0, 0) = w_kdata(10, w_i)
                w_orapara(1, 0) = "1"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                    For w_j = 0 To UBound(w_dbdata, 2)
                        w_sql_o = w_sql_o & "," & w_usetb(1, 0) & "." & w_dbdata(0, w_j)
                        If Mid(w_kdata(3, w_i), w_j + 1, 1) = "1" Then
                            w_sql_o = w_sql_o & " DESC"
                        End If
                    Next
                End If
            End If
            Select Case w_kdata(21, w_i)
                Case "2", "3"
                    Select Case w_kdata(1, w_i)
                        Case "502", "503", "504", "505"
                            w_sql_o = w_sql_o & "," & w_usetb(1, 0) & ".SIKYUNGP"
                            If Mid(w_kdata(3, w_i), 1, 1) = "1" Then
                                w_sql_o = w_sql_o & " DESC"
                            End If
                        Case "551", "552", "553", "554", "555", "556", "557", "558"
                            w_sql_o = w_sql_o & "," & w_usetb(1, 0) & "." & w_field
                            If Mid(w_kdata(3, w_i), 1, 1) = "1" Then
                                w_sql_o = w_sql_o & " DESC"
                            End If
                        Case "559", "560", "561", "562", "563", "564"
                            w_sql_o = w_sql_o & "," & w_usetb(1, 0) & ".KYUYONGT"
                            If Mid(w_kdata(3, w_i), 1, 1) = "1" Then
                                w_sql_o = w_sql_o & " DESC"
                            End If
                    End Select
            End Select
            w_cflg = "0"
            Select Case w_gsmode
                '*** 機能：1=通常・2=異動・4=個別登録
                Case "1", "2", "4"
                    '*** 固定帳票、且つ、参照先区分：通常の場合
                    If p_skbn = "3" AndAlso w_kdata(38, w_i) = "1" Then
                        Select Case w_kdata(1, w_i)
                            '* 102:基本,128:身上調書
                            Case "102", "128"
                                '** 基準日変更フラグを立てる
                                w_cflg = "1"
                        End Select
                    End If
                    '*** 機能：7=発令処理(303)
                Case "7"
                    '*** 固定帳票、且つ、参照先区分：通常の場合
                    If p_skbn = "3" AndAlso w_kdata(38, w_i) = "1" Then
                        Select Case w_kdata(1, w_i)
                            '* 102:基本,128:身上調書
                            Case "102", "128"
                                '** 基準日変更フラグを立てる
                                w_cflg = "2"
                        End Select
                    End If
            End Select
            '**************************************************************
            '*    SELECT句作成
            '**************************************************************
            w_mstcnt = 0
            w_sql_s = "SELECT "
            If w_kflg = "1" Then
                '*** 人事所属・予備所属の兼務を含む場合
                w_sql_s2 = "SELECT "
            End If
            w_cnt = 0
            w_fmt = ""
            w_oname = ""
            For w_j = 0 To UBound(w_fdata, 2)
                w_cnt = w_cnt + 1
                If w_cnt = 1 Then
                    w_fmt = w_fdata(0, w_j)
                    w_oname = w_fdata(13, w_j)
                    If w_fdata(5, w_j) = "02" Then
                        '*** ﾗﾍﾞﾙ(38)：w_oname & "(ｺｰﾄﾞ)"
                        w_oname = P000S008.FNCG_P_SUBWORD(1, w_langmsg_out(0, 38), w_oname, "|-|")
                        '*** "||"（パイプライン2本）で判断されないように、無効な区切り文字を指定
                    End If
                    w_hukakbn = w_fdata(14, w_j)
                    w_hukamoji = w_fdata(15, w_j)
                    w_orikae = w_fdata(18, w_j)
                Else
                    w_sql_s = w_sql_s & ","
                    If w_kflg = "1" Then
                        '*** 人事所属・予備所属の兼務を含む場合
                        w_sql_s2 = w_sql_s2 & ","
                    End If
                    w_fmt = w_fmt & "," & w_fdata(0, w_j)
                    w_oname = w_oname & "|||" & w_fdata(13, w_j)
                    '*** 区切り文字"|_-_|"で結合
                    w_hukakbn = w_hukakbn & "|_-_|" & w_fdata(14, w_j)
                    w_hukamoji = w_hukamoji & "|_-_|" & w_fdata(15, w_j)
                    If w_fdata(5, w_j) = "02" Then
                        '*** ﾗﾍﾞﾙ(39)：w_oname & "(ｺｰﾄﾞ)"
                        w_oname = P000S008.FNCG_P_SUBWORD(1, w_langmsg_out(0, 39), w_oname, "|-|")
                        '*** "||"（パイプライン2本）で判断されないように、無効な区切り文字を指定
                    End If
                    w_orikae = w_orikae & "," & w_fdata(18, w_j)
                End If
                If CInt(w_fdata(18, w_j)) > 0 Then
                    w_kdata(33, w_i) = "1"
                End If
                If w_gsmode = "5" AndAlso w_tkflg = "3" AndAlso w_fdata(4, w_j) = "社員コード" Then
                    w_fdata(4, w_j) = "表示社員コード"
                End If
                w_wdate = w_kdata(8, w_i)
                '*** 異動機能特別処理（「新部門～」項目は新世代番号から情報取得）
                If w_gsmode = "2" Then
                    If (w_kdata(1, w_i) = "605" OrElse w_kdata(1, w_i) = "607") AndAlso Mid(w_fdata(0, w_j), 1, 1) = "E" Then
                        sql = "SELECT TO_CHAR(VALID_DATE,'YYYY/MM/DD')"
                        sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "DEPT_AGE_CONTROL_TBL"
                        sql = sql & " WHERE KAISYACD = :ORA_0"
                        sql = sql & "   AND AGE_NUMBER = :ORA_1"
                        ReDim w_orapara(2, 1)
                        w_orapara(0, 0) = w_kcode
                        w_orapara(1, 0) = "101"
                        w_orapara(0, 1) = w_ido(6)
                        w_orapara(1, 1) = "2"
                        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                            w_wdate = w_dbdata(0, 0)
                            '*** 基準日
                        End If
                    End If
                End If
                '*** 基準日項目を固定帳票出力する場合、
                '*** 時点は固定帳票設定の基準日、又は、照会設定の「基準日」
                '*** （照会設定の「出力基準日」には影響されない）
                Select Case w_cflg
                    Case "1"
                        Select Case w_fdata(0, w_j)
                            '* 56:年月数,57:年数,58:月数(基準日勤続,滞留)
                            '* 66:年月数,67:年数,68:月数,69:年代(基準日年齢)
                            '* 72:基準日みなし年齢
                            Case "56", "57", "58", "66", "67", "68", "69", "72"
                                '* 照会設定の基準日
                                w_wdate = SessionAsStrArray("SG_P_001INF")(15)
                        End Select
                        '*** 基準日項目を固定帳票出力する場合、
                        '*** 時点は固定帳票設定の基準日、又は、出力画面の「基準日」
                        '*** （出力画面の「基準日区分」には影響されない）
                    Case "2"
                        Select Case w_fdata(0, w_j)
                            '* 56:年月数,57:年数,58:月数(基準日勤続,滞留)
                            '* 66:年月数,67:年数,68:月数,69:年代(基準日年齢)
                            '* 72:基準日みなし年齢
                            Case "56", "57", "58", "66", "67", "68", "69", "72"
                                '* 照会設定の基準日
                                w_wdate = w_printinf(2)
                        End Select
                End Select
                P000S027.FNCG_P_COMSQL_SELECT(CStr(w_pgflg), CInt(w_kdata(38, w_i)), w_kdata(0, w_i), 1, CInt(w_kdata(1, w_i)), w_fdata(1, w_j), w_fdata(27, w_j), w_fdata(28, w_j), w_fdata(29, w_j), w_usetb, w_wdate, w_sql_s, w_sql_f, w_sql_w, w_fdata(4, w_j), w_fdata(0, w_j), w_fdata(5, w_j), w_fdata(7, w_j), w_fdata(8, w_j), w_mstcnt, w_fdata(9, w_j), w_fdata(10, w_j), w_fdata(11, w_j), w_fdata(12, w_j), w_fdata(16, w_j), w_fdata(17, w_j), w_fdata(20, w_j), w_fdata(21, w_j), w_fdata(22, w_j), w_kdata(39, w_i))
                If w_kflg = "1" Then
                    '*** 人事所属・予備所属の兼務を含む場合
                    P000S027.FNCG_P_COMSQL_SELECT(CStr(w_pgflg), CInt(w_kdata(38, w_i)), w_kdata(0, w_i), 1, CInt(w_kdata(1, w_i)), w_fdata(1, w_j), w_fdata(27, w_j), w_fdata(28, w_j), w_fdata(29, w_j), w_usetb2, w_kdata(8, w_i), w_sql_s2, w_sql_f2, w_sql_w2, w_fdata(4, w_j), w_fdata(0, w_j), w_fdata(5, w_j), w_fdata(7, w_j), w_fdata(8, w_j), w_mstcnt, w_fdata(9, w_j), w_fdata(10, w_j), w_fdata(11, w_j), w_fdata(12, w_j), w_fdata(16, w_j), w_fdata(17, w_j), w_fdata(20, w_j), w_fdata(21, w_j), w_fdata(22, w_j), w_kdata(39, w_i))
                End If
            Next
            '*** 比較判断のため社員コード・受付番号を最後にダミーでセットする。
            Select Case w_gsmode
                Case "2"
                    w_sql_s = w_sql_s & "," & w_usetb(1, 0) & "." & w_usetb(2, 0) & " || T_KEY.JOINKEY"
                Case "7", "8"
                    'w_sql_s = w_sql_s & "," & w_usetb(1,0) & "." & w_usetb(2,0) & " || T_KEY.JOINKEY"
                    w_sql_s = w_sql_s & ",T_KEY.JOINKEY"
                    If w_kflg = "1" Then
                        '*** 人事所属・予備所属の兼務を含む場合
                        '*** ORDER BY句に必要な項目をSELECT句に追加する
                        If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(3, w_i))) Then
                            sql = "SELECT "
                            Select Case CInt(w_kdata(39, w_i))
                                Case 1, 2, 3
                                    If (CLng(w_kdata(1, w_i)) >= 700 AndAlso CLng(w_kdata(1, w_i)) <= 999) OrElse (CLng(w_kdata(1, w_i)) >= 10000 AndAlso CLng(w_kdata(1, w_i)) <= 59999)
                                        sql = sql & "DECODE(DATA_TYPE,'DATE','DATE_','NUMBER','NUMBER_','CHAR_') || ITEM_NAME"
                                        '*** 4:項目名
                                    Else
                                        sql = sql & "ITEM_NAME"
                                    End If
                                Case Else
                                    sql = sql & "ITEM_NAME"
                            End Select
                            sql = sql & " FROM " & w_table2
                            sql = sql & " WHERE DIV=:ORA_0"
                            sql = sql & "   AND SORT_DIV IS NOT NULL"
                            sql = sql & " ORDER BY SORT_DIV"
                            ReDim w_orapara(2, 0)
                            w_orapara(0, 0) = w_kdata(10, w_i)
                            w_orapara(1, 0) = "1"
                            w_sql_s_add_num = 0
                            '*    SELECT句作成準備
                            w_sql_s_add = ",T_KEY.DISP_ORDER"
                            w_sql_s2_add = ",T_KEY.DISP_ORDER"
                            If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
                                For w_j = 0 To UBound(w_dbdata, 2)
                                    '*    SELECT句作成準備
                                    w_sql_s_add_num = w_sql_s_add_num + 1
                                    w_sql_s_add = w_sql_s_add & "," & w_usetb(1, 0) & "." & w_dbdata(0, w_j)
                                    w_sql_s2_add = w_sql_s2_add & "," & w_usetb2(1, 0) & "." & w_dbdata(0, w_j)
                                Next
                            End If
                        End If
                        w_sql_s = w_sql_s & w_sql_s_add
                        w_sql_s2 = w_sql_s2 & ",T_KEY.JOINKEY"
                        w_sql_s2 = w_sql_s2 & w_sql_s2_add
                        w_sql_o2 = " ORDER BY "
                        w_k = 0
                        w_sql_o2_temp = ""
                        For w_j = w_cnt + 2 To w_cnt + 2 + w_sql_s_add_num
                            w_k = w_k + 1
                            w_sql_o2_temp = w_sql_o2_temp & "," & w_j
                            If w_k > 1 Then
                                If Mid(w_kdata(3, w_i), w_k - 1, 1) = "1" Then
                                    w_sql_o2_temp = w_sql_o2_temp & " DESC "
                                End If
                            End If
                        Next
                        w_sql_o2 = w_sql_o2 & Mid(w_sql_o2_temp, 2)
                    End If
                Case Else
                    w_sql_s = w_sql_s & "," & w_usetb(1, 0) & "." & w_usetb(2, 0)
            End Select
            If w_kflg = "1" Then
                '*** 人事所属・予備所属の兼務を含む場合
                w_kdata(14, w_i) = w_sql_s & w_sql_f & w_sql_w
                w_kdata(14, w_i) = w_kdata(14, w_i) & " UNION ALL "
                w_kdata(14, w_i) = w_kdata(14, w_i) & w_sql_s2 & w_sql_f2 & w_sql_w2 & w_sql_o2
            Else
                w_kdata(14, w_i) = w_sql_s & w_sql_f & w_sql_w & w_sql_o
            End If
            '***Response.Write w_kdata(14,w_i) & "<BR><BR>"
            If w_kdata(21, w_i) = "1" Then
                w_kdata(16, w_i) = w_fmt
                w_kdata(17, w_i) = w_oname
            End If
            w_kdata(30, w_i) = w_hukakbn
            w_kdata(31, w_i) = w_hukamoji
            w_kdata(34, w_i) = w_orikae
            p_excelfmt = p_excelfmt & "," & w_kdata(16, w_i)
        Next
        '***Response.end
        
        '*** ログ情報取得
        w_cnt = 0
        ReDim w_log3(UBound(w_kdata, 2))
        ReDim w_log4(UBound(w_kdata, 2))
        ReDim w_log5(UBound(w_kdata, 2))
        For w_i = 0 To UBound(w_kdata, 2)
            w_fmt2 = VBSplit(w_kdata(17, w_i), "|||", -1, 0)

            sql = "SELECT NVL(B.CATEGORY_NAME,A.CATEGORY_NAME)"
            sql = sql & "  FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010010_M A"
            sql = sql & "     , " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0010011_M B"
            sql = sql & " WHERE B.KAISYACD(+) = :ORA_0"
            sql = sql & "   AND A.CATEGORY_DIV = B.CATEGORY_DIV(+)"
            sql = sql & "   AND A.CATEGORY_DIV = :ORA_1"
            ReDim w_orapara(2, 1)
            w_orapara(0, 0) = w_kcode
            w_orapara(1, 0) = "101"
            w_orapara(0, 1) = w_kdata(1, w_i)
            w_orapara(1, 1) = "2"
            If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_ctnm) = False Then
                ReDim w_ctnm(0, 0)
                w_ctnm(0, 0) = w_kdata(1, w_i)
            End If

            If UBound(w_fmt2) > 0 Then
                ReDim Preserve w_log3(UBound(w_log3) + UBound(w_fmt2))
                ReDim Preserve w_log4(UBound(w_log4) + UBound(w_fmt2))
                ReDim Preserve w_log5(UBound(w_log5) + UBound(w_fmt2))
                For w_j = 0 To UBound(w_fmt2)
                    w_cnt = w_cnt + 1
                    w_log3(w_cnt - 1) = w_ctnm(0, 0)
                    w_log4(w_cnt - 1) = CStr(w_cnt)
                    w_log5(w_cnt - 1) = w_fmt2(w_j)
                Next
            Else
                w_cnt = w_cnt + 1
                w_log3(w_cnt - 1) = w_ctnm(0, 0)
                w_log4(w_cnt - 1) = CStr(w_cnt)
                w_log5(w_cnt - 1) = w_kdata(17, w_i)
            End If
        Next
        '**********************************************************************
        '* 外部ファイル作成処理
        '**********************************************************************
        '*** カテゴリ・社員毎の件数（最終配列は最大レコード数をセットするためのもの）
        ReDim p_skensu(UBound(w_kdata, 2) + 1, UBound(p_scd, 2))
        fileobject = New FileSystemObject()
        For w_i = 0 To UBound(w_kdata, 2)
            '******************************************************************
            '*    初期処理
            '******************************************************************
            If Not IsNull(P000S001.FNCG_P_NZ(w_kdata(18, w_i))) Then
                w_syosu = VBSplit(w_kdata(18, w_i), ",", -1, 0)
            End If
            '*** 表示書式の配列化
            If IsNull(P000S001.FNCG_P_NZ(w_kdata(16, w_i))) Then
                ReDim w_fmt2(0)
                w_fmt2(0) = ""
            Else
                w_fmt2 = VBSplit(w_kdata(16, w_i), ",", -1, 0)
            End If
            If IsNull(P000S001.FNCG_P_NZ(w_kdata(31, w_i))) Then
                ReDim w_hukakbn2(0)
                ReDim w_hukamoji2(0)
                w_hukakbn2(0) = ""
                w_hukamoji2(0) = ""
            Else
                '*** 区切り文字"|_-_|"で分割
                w_hukakbn2 = VBSplit(w_kdata(30, w_i), "|_-_|", -1, 0)
                w_hukamoji2 = VBSplit(w_kdata(31, w_i), "|_-_|", -1, 0)
            End If
            w_kdata(15, w_i) = CStr(UBound(w_fmt2))
            '*** 折返し桁数の配列化
            w_orikae2 = VBSplit(w_kdata(34, w_i), ",", -1, 0)
            '*** 項目件数(配列数)
            w_fldcnt = UBound(w_fmt2)
            '******************************************************************
            '*    外部出力用ブランクデータ作成
            '******************************************************************
            w_brankbuff = ""
            For w_j = 0 To w_fldcnt
                w_brankbuff = w_brankbuff & ","""""
            Next
            w_brankbuff = Mid(w_brankbuff, 2)
            '******************************************************************
            '*    外部出力用ファイルオープン
            '******************************************************************
            If p_skbn = "1" OrElse p_skbn = "2" Then
                filename = SessionAsStr("SG_C_OUTPUTPATH_B") & SessionAsStr("SG_P_RID") & "_" & w_i & ".CSV"
            ElseIf p_skbn = "3" Then
                filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & "_" & w_i & ".CSV"
            Else
                filename = SessionAsStr("SG_C_OUTPUTPATH02_B") & SessionAsStr("SG_P_RID") & "_" & w_i & ".CSV"
            End If
            outstream = POCOM001.POCOM_CreateTextFile(filename, System.Text.Encoding.Unicode, True)
            '******************************************************************
            '*    社員データ取得（社員単位）
            '******************************************************************
            If w_allkbn = "1" Then
                For w_cnt = p_min To p_max
                    w_rc = "False"
                    If P000S029.FNCG_P_REFCHK(1, p_scd(0, w_cnt), CInt(w_kdata(19, w_i)), CInt(p_scd(1, w_cnt))) = "-1" Then
                        w_rc = "False"
                    Else
                        ReDim w_orapara(2, 0)
                        Select Case w_kdata(1, w_i)
                            Case "401", "411", "412", "413", "414", "501", "502", "503", "504", "505", "550", "551", "552", "553", "554", "555", "556", "557", "558", "559", "560", "561", "562", "563", "564"
                                w_orapara(0, 0) = P000S006.FNCG_P_SCD_CHG2("1", p_scd(0, w_cnt))
                            Case Else
                                w_orapara(0, 0) = p_scd(0, w_cnt)
                        End Select
                        w_orapara(1, 0) = "1"
                        w_rc = CStr(P000S011.FNCG_P_RECORDSET5(0, w_kdata(14, w_i), w_orapara, w_dbdata))
                    End If
                    
                    '*** 家族か否かの判断
                    If w_kdata(1, w_i) <> "263" Then
                        w_kzkkb = 0
                    Else
                        w_kzkkb = 1
                    End If
                    w_reccnt = 0
                    w_dstart = 0
                    w_dend = -1
                    If CBool(w_rc) = True Then
                        w_reccnt = UBound(w_dbdata, 2)
                        '*** 最新x件制御
                        Select Case w_kdata(4, w_i)
                            Case "0", "2", "3"
                                w_dstart = 0
                                w_dend = w_reccnt
                            Case "1"
                                If w_kdata(5, w_i) = "0" OrElse CInt(w_kdata(5, w_i)) >= (w_reccnt + 1) Then
                                    w_dstart = 0
                                    w_dend = w_reccnt
                                Else
                                    '* 昇順設定
                                    If Mid(w_kdata(3, w_i), 1, 1) = "0" Then
                                        w_dstart = w_reccnt - CLng(w_kdata(5, w_i)) + 1
                                        w_dend = w_reccnt
                                        '* 降順設定
                                    Else
                                        w_dstart = 0
                                        w_dend = CLng(w_kdata(5, w_i)) - 1
                                    End If
                                    w_reccnt = CLng(w_kdata(5, w_i)) - 1
                                End If
                        End Select
                    End If
                    '** エリアを確保する。
                    If w_cnt = p_min Then
                        ReDim fdata(w_fldcnt, CInt(w_reccnt))
                        icnt = 0
                    Else
                        '** 確保済エリア＋新たなエリアを確保する。
                        icnt = UBound(fdata, 2) + 1
                        ReDim Preserve fdata(w_fldcnt, UBound(fdata, 2) + CInt(w_reccnt) + 1)
                    End If
                    '*** 対象データ無し
                    If w_dend - w_dstart < 0 Then
                        p_skensu(w_i, w_cnt) = 1
                        w_dbuff = w_brankbuff
                        outstream.WriteLine(w_dbuff)
                    Else
                        For w_k = CInt(w_dstart) To CInt(w_dend)
                            w_dbuff = ""
                            For w_h = 0 To w_fldcnt
                                w_value = w_dbdata(w_h, w_k)
                                'w_value = P001S003.FNCG_P_SYAINFORMAT_MAE(w_data(0,p_ix),w_dbdata,w_i,w_j,w_fmt(w_j))
                                '*** 改行文字を<BR>へ置換
                                '*** 外部出力用に改行コードを空白に置換
                                w_tmpvalue = P000S001.FNCG_P_VBCRLF(1, w_value)
                                '*** 画面出力用に改行コードを<BR>に置換
                                w_value = P000S001.FNCG_P_VBCRLF(2, w_value)
                                If w_kdata(21, w_i) = "2" Then
                                    w_value = P000S001.FNCG_P_SYOSUFMT(w_value, CInt(w_syosu(w_h)))
                                    '*** 小数変換処理
                                End If
                                'If w_fmt(w_h) = "34" Then
                                'w_value = P000S031.FNCG_P_NUM2TIME2(w_value)                '*** 時刻変換処理
                                'End If
                                Select Case p_skbn
                                    Case "1", "2"
                                        If SessionAsStrArray("SG_P_001INF")(17) = "1" AndAlso w_fmt2(w_h) = "02" Then
                                            '*** EXCEL優先で日付形式
                                            w_dbuff = w_dbuff & ",""" & P001S003.FNCG_P_SYAINFORMAT4(w_tmpvalue, w_fmt2(w_h)) & """"
                                        End If
                                        If CStr(P000S001.FNCG_P_NZ(w_outtan)) = "0" Then
                                            w_value = FNCL_P_SYAINFORMAT3(w_value, w_fmt2(w_h))
                                        Else
                                            w_value = P001S003.FNCG_P_SYAINFORMAT2(w_value, w_fmt2(w_h))
                                        End If
                                        If SessionAsStrArray("SG_P_001INF")(17) <> "1" OrElse w_fmt2(w_h) <> "02" Then
                                            '*** CSV優先、または、日付形式以外
                                            w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_tmpvalue) & """"
                                        End If
                                    Case "3", "4"
                                        If CStr(P000S001.FNCG_P_NZ(w_outtan)) = "0" Then
                                            w_value = FNCL_P_SYAINFORMAT3(w_value, w_fmt2(w_h))
                                        Else
                                            w_value = P001S003.FNCG_P_SYAINFORMAT2(w_value, w_fmt2(w_h))
                                        End If
                                        w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_tmpvalue) & """"
                                End Select
                                fdata(w_h, icnt) = w_value
                            Next
                            outstream.WriteLine(Mid(w_dbuff, 2))
                            icnt = icnt + 1
                        Next
                        p_skensu(w_i, w_cnt) = CInt(w_dend - w_dstart + 1)
                    End If
                Next
                outstream.Close()
                Session.Add("SL_P001M311_" & Right("00" & w_i, 3), fdata)
                '******************************************************************
                '*    社員データ取得（一括）
                '******************************************************************
            Else
                If w_kdata(32, w_i) = "0" Then
                    w_rc = "False"
                Else
                    'Response.Write w_kdata(14,w_i) & "<BR>"
                    w_rc = CStr(P000S011.FNCG_P_RECORDSET1(0, CStr(w_kdata(14, w_i)), w_dbdata))
                End If
                '*** 家族か否かの判断
                If w_kdata(1, w_i) <> "263" Then
                    w_kzkkb = 0
                Else
                    w_kzkkb = 1
                End If

                If CBool(w_rc) = True Then
                    w_dbcnt = 0
                    For w_j = 0 To UBound(p_scd, 2)
                        w_cnt = 0
                        '*** レコード件数(対象者)
                        w_dstart = w_dbcnt
                        w_dend = -1
                        Do
                            If w_dbcnt > UBound(w_dbdata, 2) Then
                                Exit Do
                            End If
                            If w_jirei = 1 Then
                                w_dend = w_dbcnt
                                w_cnt = w_cnt + 1
                                w_dbcnt = w_dbcnt + 1
                                Exit Do
                            End If
                            Select Case w_gsmode
                                Case "2"
                                    If w_dbdata(w_fldcnt + 1, w_dbcnt) <> w_scd(0, w_j) & w_scd(2, w_j) Then
                                        Exit Do
                                    End If
                                Case "7", "8"
                                    If w_dbdata(w_fldcnt + 1, w_dbcnt) <> w_scd(2, w_j) Then
                                        Exit Do
                                    End If
                                Case Else
                                    If SessionAsStr("SG_P_STYPE") = "0" Then
                                        If CLng(w_dbdata(w_fldcnt + 1, w_dbcnt)) <> CLng(w_scd(0, w_j)) Then
                                            Exit Do
                                        End If
                                    Else
                                        Select Case w_kdata(1, w_i)
                                            Case "401", "411", "412", "413", "414", "501", "502", "503", "504", "505", "550", "551", "552", "553", "554", "555", "556", "557", "558", "559", "560", "561", "562", "563", "564"
                                                If w_dbdata(w_fldcnt + 1, w_dbcnt) <> P000S006.FNCG_P_SCD_CHG2("1", w_scd(0, w_j)) Then
                                                    Exit Do
                                                End If
                                            Case Else
                                                If w_dbdata(w_fldcnt + 1, w_dbcnt) <> w_scd(0, w_j) Then
                                                    Exit Do
                                                End If
                                        End Select
                                    End If
                            End Select
                            w_dend = w_dbcnt
                            w_cnt = w_cnt + 1
                            w_dbcnt = w_dbcnt + 1
                        Loop
                        If w_cnt = 0 Then
                            '*** 対象データ無
                            p_skensu(w_i, w_j) = 1
                            outstream.WriteLine(w_brankbuff)
                        Else
                            If w_jirei = 0 Then
                                '*** 最新x件制御
                                Select Case w_kdata(4, w_i)
                                    Case "0", "2", "3"
                                    Case "1"
                                        If CLng(w_kdata(5, w_i)) = 0 OrElse CLng(w_kdata(5, w_i)) >= w_cnt Then
                                        Else
                                            '* 昇順設定
                                            If Mid(w_kdata(3, w_i), 1, 1) = "0" Then
                                                w_dstart = w_dend - CLng(w_kdata(5, w_i)) + 1
                                                '* 降順設定
                                            Else
                                                w_dend = w_dstart + CLng(w_kdata(5, w_i)) - 1
                                            End If
                                        End If
                                End Select
                            End If
                            '**************************************************
                            '*    折り返し指定無しの場合
                            '**************************************************
                            If w_kdata(33, w_i) = "0" Then
                                For w_k = CInt(w_dstart) To CInt(w_dend)
                                    w_dbuff = ""
                                    For w_h = 0 To w_fldcnt
                                        'w_value = P001S003.FNCG_P_SYAINFORMAT_MAE(w_data(0,p_ix),w_dbdata,w_i,w_j,w_fmt(w_j))
                                        w_value = w_dbdata(w_h, w_k)
										'*** 改行文字を削除
				       					 w_value = P000S001.FNCG_P_VBCRLF(1,w_value)
                                        '*** 給与項目時
                                        If w_kdata(21, w_i) = "2" Then
                                            w_value = P000S001.FNCG_P_SYOSUFMT(w_value, CInt(w_syosu(w_h)))
                                            '*** 小数変換処理
                                        End If
                                        Select Case p_skbn
                                            Case "1", "2", "11"
                                                If SessionAsStrArray("SG_P_001INF")(17) = "1" AndAlso w_fmt2(w_h) = "02" Then
                                                    '*** EXCEL優先で日付形式
                                                    w_value = P001S003.FNCG_P_SYAINFORMAT4(w_value, w_fmt2(w_h))
                                                End If
                                                If SessionAsStrArray("SG_P_001INF")(17) <> "1" OrElse w_fmt2(w_h) <> "02" Then
                                                    '*** CSV優先、または、日付形式以外
                                                    If CStr(P000S001.FNCG_P_NZ(w_outtan)) = "0" Then
                                                        w_value = FNCL_P_SYAINFORMAT3(w_value, w_fmt2(w_h))
                                                    Else
                                                        w_value = P001S003.FNCG_P_SYAINFORMAT2(w_value, w_fmt2(w_h))
                                                    End If
                                                End If
                                                w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_value) & """"
                                            Case "3", "4"
                                                If CStr(P000S001.FNCG_P_NZ(w_outtan)) = "0" Then
                                                    w_value = FNCL_P_SYAINFORMAT3(w_value, w_fmt2(w_h))
                                                Else
                                                    w_value = P001S003.FNCG_P_SYAINFORMAT2(w_value, w_fmt2(w_h))
                                                End If
                                                '*** 付加文字処理
                                                If Not IsNull(P000S001.FNCG_P_NZ(w_hukamoji2(w_h))) Then
                                                    If (Not IsNull(P000S001.FNCG_P_NZ(w_value)) OrElse w_hukakbn2(w_h) = "1") AndAlso w_value IsNot Nothing Then
                                                        w_hdata = VBSplit(w_hukamoji2(w_h), "|||", -1, 0)
                                                        If Not IsNull(P000S001.FNCG_P_NZ(w_hdata(0))) Then
                                                            w_value = w_hdata(0) & w_value
                                                        End If
                                                        If Not IsNull(P000S001.FNCG_P_NZ(w_hdata(1))) Then
                                                            w_value = w_value & w_hdata(1)
                                                        End If
                                                    End If
                                                End If
                                                w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_value) & """"
                                        End Select
                                    Next
                                    outstream.WriteLine(Mid(w_dbuff, 2))
                                Next
                                p_skensu(w_i, w_j) = CInt(w_dend - w_dstart + 1)
                                '**************************************************
                                '*    折り返し指定有りの場合
                                '**************************************************
                            Else
                                p_skensu(w_i, w_j) = 0
                                For w_k = CInt(w_dstart) To CInt(w_dend)
                                    ReDim w_divdata(w_fldcnt, 0)
                                    For w_h = 0 To w_fldcnt
                                        w_value = P000S001.FNCG_P_VBCRLF(1, w_dbdata(w_h, w_k))
                                        If CStr(P000S001.FNCG_P_NZ(w_outtan)) = "0" Then
                                            w_value = FNCL_P_SYAINFORMAT3(w_value, w_fmt2(w_h))
                                        Else
                                            w_value = P001S003.FNCG_P_SYAINFORMAT2(w_value, w_fmt2(w_h))
                                        End If
                                        '*** 付加文字処理
                                        If Not IsNull(P000S001.FNCG_P_NZ(w_hukamoji2(w_h))) Then
                                            If Not IsNull(P000S001.FNCG_P_NZ(w_value)) OrElse w_hukakbn2(w_h) = "1" Then
                                                w_hdata = VBSplit(w_hukamoji2(w_h), "|||", -1, 0)
                                                If Not IsNull(P000S001.FNCG_P_NZ(w_hdata(0))) Then
                                                    w_value = w_hdata(0) & w_value
                                                End If
                                                If Not IsNull(P000S001.FNCG_P_NZ(w_hdata(1))) Then
                                                    w_value = w_value & w_hdata(1)
                                                End If
                                            End If
                                        End If
                                        If CLng(w_orikae2(w_h)) > 0 Then
                                            w_work2 = FNCL_P_STR_CUT(w_value, CDbl(w_orikae2(w_h)))
                                            If UBound(w_work2) > UBound(w_divdata, 2) Then
                                                ReDim Preserve w_divdata(w_fldcnt, UBound(w_work2))
                                            End If
                                            For w_l = 0 To UBound(w_work2)
                                                w_divdata(w_h, w_l) = w_work2(w_l)
                                            Next
                                        Else
                                            w_divdata(w_h, 0) = w_value
                                        End If
                                    Next
                                    For w_l = 0 To UBound(w_divdata, 2)
                                        w_dbuff = ""
                                        For w_h = 0 To w_fldcnt
                                            w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_divdata(w_h, w_l)) & """"
                                        Next
                                        outstream.WriteLine(Mid(w_dbuff, 2))
                                    Next
                                    p_skensu(w_i, w_j) = p_skensu(w_i, w_j) + UBound(w_divdata, 2) + 1
                                Next
                            End If
                        End If
                    Next
                    '**************************************************************
                    '* データ未存在時処理
                    '**************************************************************
                Else
                    For w_j = 0 To UBound(p_scd, 2)
                        outstream.WriteLine(w_brankbuff)
                        p_skensu(w_i, w_j) = 1
                    Next
                End If
                outstream.Close()
            End If
            outstream = Nothing
        Next
        fileobject = Nothing
        '* 環境設定の回復
        If w_ENVIR_001_chg Then
            w_fdata7(108) = w_midname_flg_old
            Session.Add("SG_P_ENVIR_001", w_fdata7)
        End If
    End Function

    Function FNCL_P_IREICSVMAKE(ByRef p_printinf() As String, ByRef p_excelfmt As String, ByRef p_err As String) As Integer
        Dim sql As String
        Dim w_flg() As String
        Dim w_i As Integer
        Dim w_j As Integer
        Dim w_dbdata(,) As String = Nothing
        Dim w_fcnt As Integer
        Dim filename As String                     '/* 物理ファイル名
        Dim fileobject As FileSystemObject         '/* Server CreateObject
        Dim w_fio_out As TextStream                '/* テキスト変数(書込用)
        Dim w_dbuff As String                      '/* 書込内容
        Dim w_head As String
        Dim w_fmt() As String
        sql = ""
        w_head = ""
        FNCL_P_IREICSVMAKE = 0
        ReDim w_orapara(2, -1)
        Select Case p_printinf(0)
            Case "1"
            Case "200"
                '*** 考課
                w_flg = SessionAsStrArray("SL_P200_INF01")
                '人事考課
                '* (0):帳票区分
                '* (1):考課パターン
                '* (2):考課時期
                '* (3):対象者（1:全社員,2:検索条件）
                '* (4):未入力社員
                '* (5):表示順
                '* (6):改頁設定
                '昇給昇格
                '* (0):帳票区分
                '* (1):
                '* (2):対象者（1:全社員,2:検索条件）
                '* (3):検索結果表示（1:する、2:しない）
                Select Case p_printinf(1)
                    Case "1"
                        '*** 部署別考課結果一覧表(最終考課)
                        w_fcnt = 40
                        w_head = """" & SessionAsStrArray("SG_P_SYSTEM")(8) & """,""氏名"",""部門ランク"",""部門コード"""
                        w_head = w_head & ",""コード1"",""コード2"",""コード3"",""コード4"",""コード5"",""コード6"",""コード7"",""コード8"",""コード9"""
                        w_head = w_head & ",""名称1"",""名称2"",""名称3"",""名称4"",""名称5"",""名称6"",""名称7"",""名称8"",""名称9"""
                        w_head = w_head & ",""総表示順位"",""昇給点数"",""昇給格付"",""賞与点数"",""賞与格付"""
                        w_head = w_head & ",""昇格点数"",""昇格格付"",""昇進点数"",""昇進格付"""
                        w_head = w_head & ",""職級名"",""職能給号級"",""点数１"",""点数２"",""点数３"",""点数４"",""点数５"""
                        w_head = w_head & ",""内部コード"",""表示順"""
                        p_excelfmt = "01,,31,31"
                        p_excelfmt = p_excelfmt & ",31,31,31,31,31,31,31,31,31"
                        p_excelfmt = p_excelfmt & ",,,,,,,,,"
                        p_excelfmt = p_excelfmt & ",31,,,,"
                        p_excelfmt = p_excelfmt & ",,,,"
                        p_excelfmt = p_excelfmt & ",,,31,31,31,31,31"
                        p_excelfmt = p_excelfmt & ",31,31"
                        sql = "SELECT"
                        sql = sql & " D.SYAINCD"
                        sql = sql & ",D.NAME"
                        sql = sql & ",E.DEPT_RANK"
                        sql = sql & ",E.DEPT_CODE"
                        sql = sql & ",M1.CODE_VALUE1,M1.CODE_VALUE2,M1.CODE_VALUE3,M1.CODE_VALUE4,M1.CODE_VALUE5,M1.CODE_VALUE6,M1.CODE_VALUE7,M1.CODE_VALUE8,M1.CODE_VALUE9"
                        sql = sql & ",M1.NAME1,M1.NAME2,M1.NAME3,M1.NAME4,M1.NAME5,M1.NAME6,M1.NAME7,M1.NAME8,M1.NAME9"
                        sql = sql & ",M2.TOTAL_DISP_ORDER"
                        sql = sql & ",B.RAISE_POINT"
                        sql = sql & ",M4.TEXT1"
                        sql = sql & ",B.BONUS_POINT"
                        sql = sql & ",M5.TEXT1"
                        sql = sql & ",B.PROMOTION_POINT"
                        sql = sql & ",M6.TEXT1"
                        sql = sql & ",B.PREFERMENT_POINT"
                        sql = sql & ",M7.TEXT1"
                        If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 9) = "1" Then
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,200," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,G.GRADE_CODE,NULL,G.ABILITY_SALARY_GRADE,NULL,G.ISSUE_DATE)"
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2, 17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,G.GRADE_CODE,NULL,NULL,NULL,G.ISSUE_DATE)"
                        Else
                            sql = sql & ",M9.NAME "
                            sql = sql & ",M8.TEXT1"
                        End If
                        sql = sql & ",C.SCORE1,C.SCORE2,C.SCORE3,C.SCORE4,C.SCORE5"
                        sql = sql & ",F.INTERNAL_CODE"
                        sql = sql & ",M3.DISP_ORDER"
                        sql = sql & " FROM "
                        sql = sql & " (SELECT DISTINCT EMP_CODE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & ") A"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EVAL_FIX_DATA B"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EVAL_TAKE_DATA C"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO D"
                        sql = sql & ",(SELECT EMP_CODE,DEPT_RANK,DEPT_CODE,KAISYACD"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO"
                        sql = sql & "   WHERE ANOTHER_POST_DIV='0'"
                        sql = sql & "     AND ISSUE_DATE<=:ORA_4"
                        sql = sql & "     AND END_DAY>=:ORA_4) E"
                        sql = sql & ",(SELECT EMP_CODE,INTERNAL_CODE"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_OFFICE_HISTORY_INFO"
                        sql = sql & "   WHERE (EMP_CODE,ISSUE_DATE) IN ("
                        sql = sql & "     SELECT EMP_CODE,MAX(ISSUE_DATE)"
                        sql = sql & "       FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_OFFICE_HISTORY_INFO"
                        sql = sql & "      WHERE ISSUE_DATE<=:ORA_4"
                        sql = sql & "     GROUP BY EMP_CODE)) F"
                        sql = sql & ",(SELECT EMP_CODE,GRADE_CODE,ABILITY_SALARY_GRADE,ISSUE_DATE,KAISYACD"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO"
                        sql = sql & "   WHERE ISSUE_DATE<=:ORA_4"
                        sql = sql & "     AND END_DAY>=:ORA_4) G"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS M1"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER M2"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "OFFICE_MS M3"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_EVAL_RATING M4"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_EVAL_RATING M5"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_EVAL_RATING M6"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_EVAL_RATING M7"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_JOB_GRADE M8"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "JOB_GRADE_NAME M9"
                        End If
                        If w_flg(4) = "1" Then
                            sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE(+)"
                            sql = sql & "   AND B.KAISYACD(+)=:ORA_0"
                            sql = sql & "   AND B.EVAL_PATTERN(+)=:ORA_1"
                            sql = sql & "   AND B.EVAL_PERIOD(+)=:ORA_2"
                            sql = sql & "   AND A.EMP_CODE=C.EMP_CODE(+)"
                            sql = sql & "   AND C.KAISYACD(+)=:ORA_0"
                            sql = sql & "   AND C.EVAL_PATTERN(+)=:ORA_1"
                            sql = sql & "   AND C.EVAL_PERIOD(+)=:ORA_2"
                        Else
                            sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                            sql = sql & "   AND B.KAISYACD(+)=:ORA_0"
                            sql = sql & "   AND B.EVAL_PATTERN=:ORA_1"
                            sql = sql & "   AND B.EVAL_PERIOD=:ORA_2"
                            sql = sql & "   AND A.EMP_CODE=C.EMP_CODE"
                            sql = sql & "   AND C.KAISYACD(+)=:ORA_0"
                            sql = sql & "   AND C.EVAL_PATTERN=:ORA_1"
                            sql = sql & "   AND C.EVAL_PERIOD=:ORA_2"
                        End If
                        sql = sql & "   AND A.EMP_CODE=D.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=E.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=F.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=G.EMP_CODE(+)"
                        sql = sql & "   AND E.KAISYACD=M1.KAISYACD(+)"
                        sql = sql & "   AND E.DEPT_RANK=M1.RANK(+)"
                        sql = sql & "   AND E.DEPT_CODE=M1.CODE_VALUE(+)"
                        sql = sql & "   AND M2.AGE_NUMBER(+)=:ORA_3"
                        sql = sql & "   AND E.KAISYACD=M2.KAISYACD(+)"
                        sql = sql & "   AND E.DEPT_RANK=M2.RANK(+)"
                        sql = sql & "   AND E.DEPT_CODE=M2.CODE_VALUE(+)"
                        sql = sql & "   AND F.INTERNAL_CODE=M3.INTERNAL_ASSIGN_CODE(+)"
                        sql = sql & "   AND B.KAISYACD=M4.KAISYACD(+)"
                        sql = sql & "   AND B.RAISE_RATING=M4.CODE_VALUE(+)"
                        sql = sql & "   AND B.KAISYACD=M5.KAISYACD(+)"
                        sql = sql & "   AND B.BONUS_RATING=M5.CODE_VALUE(+)"
                        sql = sql & "   AND B.KAISYACD=M6.KAISYACD(+)"
                        sql = sql & "   AND B.PROMOTION_RATING=M6.CODE_VALUE(+)"
                        sql = sql & "   AND B.KAISYACD=M7.KAISYACD(+)"
                        sql = sql & "   AND B.PREFERMENT_RATING=M7.CODE_VALUE(+)"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "   AND G.KAISYACD=M8.KAISYACD(+)"
                            sql = sql & "   AND G.GRADE_CODE=M8.CODE_VALUE(+)"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
                            sql = sql & "   AND G.KAISYACD=M9.KAISYACD(+)"
                            sql = sql & "   AND G.GRADE_CODE=M9.GRADE_CODE(+)"
                            sql = sql & "   AND G.ABILITY_SALARY_GRADE=M9.GRADE(+)"
                        End If
                    Case "2"
                        '*** 部署別考課結果一覧表(確定考課)
                        w_fcnt = 32
                        w_head = """" & SessionAsStrArray("SG_P_SYSTEM")(8) & """,""氏名"",""部門ランク"",""部門コード"""
                        w_head = w_head & ",""コード1"",""コード2"",""コード3"",""コード4"",""コード5"",""コード6"",""コード7"",""コード8"",""コード9"""
                        w_head = w_head & ",""名称1"",""名称2"",""名称3"",""名称4"",""名称5"",""名称6"",""名称7"",""名称8"",""名称9"""
                        w_head = w_head & ",""総表示順位"",""最終昇給格付"",""最終賞与格付"",""最終昇格格付"",""最終昇進格付"",""昇給号数"""
                        w_head = w_head & ",""職級名"",""職能給号級"",""内部コード"",""表示順"""
                        p_excelfmt = "01,,,"
                        p_excelfmt = p_excelfmt & ",31,31,31,31,31,31,31,31,31"
                        p_excelfmt = p_excelfmt & ",,,,,,,,,"
                        p_excelfmt = p_excelfmt & ",31,,,,,"
                        p_excelfmt = p_excelfmt & ",,,31,31"
                        sql = "SELECT"
                        sql = sql & " D.SYAINCD"
                        sql = sql & ",D.NAME"
                        sql = sql & ",E.DEPT_RANK"
                        sql = sql & ",E.DEPT_CODE"
                        sql = sql & ",M1.CODE_VALUE1,M1.CODE_VALUE2,M1.CODE_VALUE3,M1.CODE_VALUE4,M1.CODE_VALUE5,M1.CODE_VALUE6,M1.CODE_VALUE7,M1.CODE_VALUE8,M1.CODE_VALUE9"
                        sql = sql & ",M1.NAME1,M1.NAME2,M1.NAME3,M1.NAME4,M1.NAME5,M1.NAME6,M1.NAME7,M1.NAME8,M1.NAME9"
                        sql = sql & ",M2.TOTAL_DISP_ORDER"
                        sql = sql & ",M4.TEXT1"
                        sql = sql & ",M5.TEXT1"
                        sql = sql & ",M6.TEXT1"
                        sql = sql & ",M7.TEXT1"
                        sql = sql & ",B.RAISE_GRADE"
                        If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 9) = "1" Then
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,200," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,G.GRADE_CODE,NULL,G.ABILITY_SALARY_GRADE,NULL,G.ISSUE_DATE)"
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2, 17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,G.GRADE_CODE,NULL,NULL,NULL,G.ISSUE_DATE)"
                        Else
                            sql = sql & ",M9.NAME "
                            sql = sql & ",M8.TEXT1"
                        End If
                        sql = sql & ",F.INTERNAL_CODE"
                        sql = sql & ",M3.DISP_ORDER"
                        sql = sql & " FROM "
                        sql = sql & " (SELECT DISTINCT EMP_CODE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & ") A"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EVAL_FIX_DATA B"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO D"
                        sql = sql & ",(SELECT EMP_CODE,DEPT_RANK,DEPT_CODE,KAISYACD"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO"
                        sql = sql & "   WHERE ANOTHER_POST_DIV='0'"
                        sql = sql & "     AND ISSUE_DATE<=:ORA_4"
                        sql = sql & "     AND END_DAY>=:ORA_4) E"
                        sql = sql & ",(SELECT EMP_CODE,INTERNAL_CODE"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_OFFICE_HISTORY_INFO"
                        sql = sql & "   WHERE (EMP_CODE,ISSUE_DATE) IN ("
                        sql = sql & "     SELECT EMP_CODE,MAX(ISSUE_DATE)"
                        sql = sql & "       FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_OFFICE_HISTORY_INFO"
                        sql = sql & "      WHERE ISSUE_DATE<=:ORA_4"
                        sql = sql & "     GROUP BY EMP_CODE)) F"
                        sql = sql & ",(SELECT EMP_CODE,GRADE_CODE,ABILITY_SALARY_GRADE,ISSUE_DATE,KAISYACD"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO"
                        sql = sql & "   WHERE ISSUE_DATE<=:ORA_4"
                        sql = sql & "     AND END_DAY>=:ORA_4) G"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS M1"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER M2"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "OFFICE_MS M3"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_EVAL_RATING M4"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_EVAL_RATING M5"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_EVAL_RATING M6"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_EVAL_RATING M7"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_JOB_GRADE M8"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "JOB_GRADE_NAME M9"
                        End If
                        If w_flg(4) = "1" Then
                            sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE(+)"
                            sql = sql & "   AND B.KAISYACD(+)=:ORA_0"
                            sql = sql & "   AND B.EVAL_PATTERN(+)=:ORA_1"
                            sql = sql & "   AND B.EVAL_PERIOD(+)=:ORA_2"
                        Else
                            sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                            sql = sql & "   AND B.KAISYACD(+)=:ORA_0"
                            sql = sql & "   AND B.EVAL_PATTERN=:ORA_1"
                            sql = sql & "   AND B.EVAL_PERIOD=:ORA_2"
                        End If
                        sql = sql & "   AND A.EMP_CODE=D.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=E.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=F.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=G.EMP_CODE(+)"
                        sql = sql & "   AND E.KAISYACD=M1.KAISYACD(+)"
                        sql = sql & "   AND E.DEPT_RANK=M1.RANK(+)"
                        sql = sql & "   AND E.DEPT_CODE=M1.CODE_VALUE(+)"
                        sql = sql & "   AND M2.AGE_NUMBER(+)=:ORA_3"
                        sql = sql & "   AND E.KAISYACD=M2.KAISYACD(+)"
                        sql = sql & "   AND E.DEPT_RANK=M2.RANK(+)"
                        sql = sql & "   AND E.DEPT_CODE=M2.CODE_VALUE(+)"
                        sql = sql & "   AND F.INTERNAL_CODE=M3.INTERNAL_ASSIGN_CODE(+)"
                        sql = sql & "   AND B.KAISYACD=M4.KAISYACD(+)"
                        sql = sql & "   AND B.FINAL_RAISE_RATING=M4.CODE_VALUE(+)"
                        sql = sql & "   AND B.KAISYACD=M5.KAISYACD(+)"
                        sql = sql & "   AND B.FINAL_BONUS_RATING=M5.CODE_VALUE(+)"
                        sql = sql & "   AND B.KAISYACD=M6.KAISYACD(+)"
                        sql = sql & "   AND B.FINAL_PROMOTION_RATING=M6.CODE_VALUE(+)"
                        sql = sql & "   AND B.KAISYACD=M7.KAISYACD(+)"
                        sql = sql & "   AND B.FINAL_PREFERMENT_RATING=M7.CODE_VALUE(+)"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "   AND G.KAISYACD=M8.KAISYACD(+)"
                            sql = sql & "   AND G.GRADE_CODE=M8.CODE_VALUE(+)"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
                            sql = sql & "   AND G.KAISYACD=M9.KAISYACD(+)"
                            sql = sql & "   AND G.GRADE_CODE=M9.GRADE_CODE(+)"
                            sql = sql & "   AND G.ABILITY_SALARY_GRADE=M9.GRADE(+)"
                        End If
                    Case "3"
                        '*** 部署別考課平均一覧表
                        w_fcnt = 19
                        w_head = """内部コード"",""ランク"",""コード"",""会社コード"",""表示順"",""総表示順位"",""部門名称"""
                        w_head = w_head & ",""合計点数"",""昇給点数"",""賞与点数"",""昇格点数"",""昇進点数"""
                        w_head = w_head & ",""素点合計点数"",""点数1"",""点数2"",""点数3"",""点数4"",""点数5"",""件数"""
                        p_excelfmt = "01,01,01,01,01,01,"
                        p_excelfmt = p_excelfmt & ",01,01,01,01,01"
                        p_excelfmt = p_excelfmt & ",01,01,01,01,01,01,01"
                        sql = "SELECT"
                        sql = sql & " A.INTERNAL_CODE"
                        sql = sql & ",A.RANK"
                        sql = sql & ",A.CODE_VALUE"
                        sql = sql & ",NVL(D.KAISYACD,0)"
                        sql = sql & ",NVL(D.DISP_ORDER,0)"
                        sql = sql & ",C.TOTAL_DISP_ORDER"
                        sql = sql & ",B.DEPT_NAME1"
                        sql = sql & ",A.TOTAL_SCORE"
                        sql = sql & ",A.RAISE_POINT"
                        sql = sql & ",A.BONUS_POINT"
                        sql = sql & ",A.PROMOTION_POINT"
                        sql = sql & ",A.PREFERMENT_POINT"
                        sql = sql & ",A.RAW_SCORE_TOTAL"
                        sql = sql & ",A.SCORE1"
                        sql = sql & ",A.SCORE2"
                        sql = sql & ",A.SCORE3"
                        sql = sql & ",A.SCORE4"
                        sql = sql & ",A.SCORE5"
                        sql = sql & ",A.COEFFICIENT"
                        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0009000_W_" & SessionAsStr("SG_P_RID") & " A"
                        sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS       B"
                        sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER C"
                        sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "OFFICE_MS     D"
                        sql = sql & " WHERE A.RANK = B.RANK(+)"
                        sql = sql & "   AND A.CODE_VALUE = B.CODE_VALUE(+)"
                        sql = sql & "   AND B.KAISYACD(+) = :ORA_0"
                        sql = sql & "   AND A.RANK = C.RANK(+)"
                        sql = sql & "   AND A.CODE_VALUE = C.CODE_VALUE(+)"
                        sql = sql & "   AND C.KAISYACD(+) = :ORA_0"
                        sql = sql & "   AND C.AGE_NUMBER(+) = :ORA_3"
                        sql = sql & "   AND A.INTERNAL_CODE = D.INTERNAL_ASSIGN_CODE(+)"
                    Case "101"
                        '*** 異動文書
                        w_fcnt = 8
                        w_head = """" & SessionAsStrArray("SG_P_SYSTEM")(8) & """,""氏名"",""所属名称"",""総表示順位"""
                        w_head = w_head & ",""旧本給"",""新本給"",""旧職級"",""新職級"""
                        p_excelfmt = "01,,04,31"
                        p_excelfmt = p_excelfmt & ",,,,"
                        sql = "SELECT"
                        sql = sql & " D.SYAINCD"
                        sql = sql & ",D.NAME"
                        sql = sql & ",WEB_SP0002040_F('0',E.DEPT_RANK,M3.DISP_FLAG,E.DEPT_NAME1,E.BELONG_NAME)"
                        '*** 7 所属名
                        sql = sql & ",M2.TOTAL_DISP_ORDER"
                        If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 9) = "1" Then
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,201," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,NULL,NULL,H.BASIC_SALARY_GRADE,NULL,H.ISSUE_DATE)"
                            '*** 旧本給
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,201," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,NULL,NULL,J.BASIC_SALARY_GRADE,NULL,J.ISSUE_DATE)"
                            '*** 新本給
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2, 17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,G.GRADE_CODE,NULL,NULL,NULL,G.ISSUE_DATE) || '(' || "
                            sql = sql & " WEB_SP0002415_F(:ORA_0,2,200," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,G.GRADE_CODE,NULL,G.ABILITY_SALARY_GRADE,NULL,G.ISSUE_DATE) || ')'"
                            '*** 旧職級
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2, 17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,I.GRADE_CODE,NULL,NULL,NULL,I.ISSUE_DATE) || '(' || "
                            sql = sql & " WEB_SP0002415_F(:ORA_0,2,200," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,I.GRADE_CODE,NULL,I.ABILITY_SALARY_GRADE,NULL,I.ISSUE_DATE) || ')'"
                            '*** 新職級
                        Else
                            sql = sql & ",M8.NAME"
                            '*** 旧本給
                            sql = sql & ",M9.NAME"
                            '*** 新本給
                            sql = sql & ",M4.TEXT1 || '(' || M5.NAME || ')'"
                            '*** 旧職級
                            sql = sql & ",M6.TEXT1 || '(' || M7.NAME || ')'"
                            '*** 新職級
                        End If
                        sql = sql & " FROM "
                        If w_flg(3) = "1" Then '* (3):検索結果表示（1:する、2:しない）
                            sql = sql & " " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " A"
                        Else
                            sql = sql & " (SELECT DISTINCT EMP_CODE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & ") A"
                        End If
                        sql = sql & ",(SELECT EMP_CODE"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASE_PAY_HIS_INFO"
                        sql = sql & "   WHERE ISSUE_DATE=:ORA_4"
                        sql = sql & "  UNION SELECT EMP_CODE"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO"
                        sql = sql & "   WHERE ISSUE_DATE=:ORA_4) B"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO D"
                        sql = sql & ",(SELECT EMP_CODE,DEPT_RANK,DEPT_CODE,DEPT_CODE1,DEPT_NAME1,BELONG_NAME,KAISYACD"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO"
                        sql = sql & "   WHERE ANOTHER_POST_DIV='0'"
                        sql = sql & "     AND ISSUE_DATE<=:ORA_4"
                        sql = sql & "     AND END_DAY>=:ORA_4) E"
                        sql = sql & ",(SELECT EMP_CODE,GRADE_CODE,ABILITY_SALARY_GRADE,ISSUE_DATE,KAISYACD"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO"
                        sql = sql & "   WHERE ISSUE_DATE<=:ORA_4-1"
                        sql = sql & "     AND END_DAY>=:ORA_4-1) G"
                        sql = sql & ",(SELECT EMP_CODE,BASIC_SALARY_GRADE,ISSUE_DATE,KAISYACD"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASE_PAY_HIS_INFO"
                        sql = sql & "   WHERE ISSUE_DATE<=:ORA_4-1"
                        sql = sql & "     AND END_DAY>=:ORA_4-1) H"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO I"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASE_PAY_HIS_INFO J"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS M1"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER M2"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_CORP_COLLABO_MS M3"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_JOB_GRADE M4"
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_JOB_GRADE M6"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "JOB_GRADE_NAME M5"
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "JOB_GRADE_NAME M7"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("201") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "BASE_PAY_GRADE_NAME M8"
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "BASE_PAY_GRADE_NAME M9"
                        End If
                        sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                        sql = sql & "   AND A.EMP_CODE=D.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=E.EMP_CODE(+)"
                        sql = sql & "   AND E.KAISYACD=M1.KAISYACD(+)"
                        sql = sql & "   AND E.DEPT_RANK=M1.RANK(+)"
                        sql = sql & "   AND E.DEPT_CODE=M1.CODE_VALUE(+)"
                        sql = sql & "   AND M2.AGE_NUMBER(+)=:ORA_3"
                        sql = sql & "   AND E.KAISYACD=M2.KAISYACD(+)"
                        sql = sql & "   AND E.DEPT_RANK=M2.RANK(+)"
                        sql = sql & "   AND E.DEPT_CODE=M2.CODE_VALUE(+)"
                        sql = sql & "   AND E.KAISYACD=M3.KAISYACD(+)"
                        sql = sql & "   AND E.DEPT_CODE1=M3.DEPT_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=G.EMP_CODE(+)"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "   AND G.KAISYACD=M4.KAISYACD(+)"
                            sql = sql & "   AND G.GRADE_CODE=M4.CODE_VALUE(+)"
                            sql = sql & "   AND I.KAISYACD=M6.KAISYACD(+)"
                            sql = sql & "   AND I.GRADE_CODE=M6.CODE_VALUE(+)"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
                            sql = sql & "   AND G.KAISYACD=M5.KAISYACD(+)"
                            sql = sql & "   AND G.GRADE_CODE=M5.GRADE_CODE(+)"
                            sql = sql & "   AND G.ABILITY_SALARY_GRADE=M5.GRADE(+)"
                            sql = sql & "   AND I.KAISYACD=M7.KAISYACD(+)"
                            sql = sql & "   AND I.GRADE_CODE=M7.GRADE_CODE(+)"
                            sql = sql & "   AND I.ABILITY_SALARY_GRADE=M7.GRADE(+)"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("201") <> "1" Then
                            sql = sql & "   AND H.KAISYACD=M8.KAISYACD(+)"
                            sql = sql & "   AND H.BASIC_SALARY_GRADE=M8.GRADE(+)"
                            sql = sql & "   AND J.KAISYACD=M9.KAISYACD(+)"
                            sql = sql & "   AND J.BASIC_SALARY_GRADE=M9.GRADE(+)"
                        End If
                        sql = sql & "   AND A.EMP_CODE=H.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=I.EMP_CODE(+)"
                        sql = sql & "   AND I.ISSUE_DATE(+)=:ORA_4"
                        sql = sql & "   AND A.EMP_CODE=J.EMP_CODE(+)"
                        sql = sql & "   AND J.ISSUE_DATE(+)=:ORA_4"
                    Case "102"
                        '*** 更改通知表
                        w_fcnt = 9
                        w_head = """" & SessionAsStrArray("SG_P_SYSTEM")(8) & """,""氏名"",""所属名称"",""総表示順位"""
                        w_head = w_head & ",""新本給"",""新職級"",""新職能給号級"",""発令日"",""職級表示順"""
                        p_excelfmt = "01,,04,31"
                        p_excelfmt = p_excelfmt & ",,,,02,31"
                        sql = "SELECT"
                        sql = sql & " D.SYAINCD"
                        sql = sql & ",D.NAME"
                        sql = sql & ",WEB_SP0002040_F('0',E.DEPT_RANK,M3.DISP_FLAG,E.DEPT_NAME1,E.BELONG_NAME)"
                        '*** 7 所属名
                        sql = sql & ",M2.TOTAL_DISP_ORDER"
                        If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 9) = "1" Then
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,201," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,NULL,NULL,J.BASIC_SALARY_GRADE,NULL,J.ISSUE_DATE)"
                            '*** 新本給
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2, 17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,I.GRADE_CODE,NULL,NULL,NULL,I.ISSUE_DATE)"
                            '*** 新職級
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,200," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,I.GRADE_CODE,NULL,I.ABILITY_SALARY_GRADE,NULL,I.ISSUE_DATE)"
                            '*** 新職能給号級
                        Else
                            sql = sql & ",M9.NAME"
                            '*** 新本給
                            sql = sql & ",M6.TEXT1"
                            '*** 新職級
                            sql = sql & ",M7.NAME"
                            '*** 新職能給号級
                        End If
                        sql = sql & ",TO_CHAR(:ORA_4,'YYYY/MM/DD')"
                        sql = sql & ",TO_NUMBER(WEB_SP0002415_F(:ORA_0,3,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,I.GRADE_CODE,NULL,NULL,NULL,I.ISSUE_DATE))"
                        '*** 職級表示順
                        sql = sql & " FROM "
                        If w_flg(3) = "1" Then '* (3):検索結果表示（1:する、2:しない）
                            sql = sql & " " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " A"
                        Else
                            sql = sql & " (SELECT DISTINCT EMP_CODE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0030050_W_" & SessionAsStr("SG_P_RID") & ") A"
                        End If
                        sql = sql & ",(SELECT EMP_CODE"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASE_PAY_HIS_INFO"
                        sql = sql & "   WHERE ISSUE_DATE=:ORA_4"
                        sql = sql & "  UNION SELECT EMP_CODE"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO"
                        sql = sql & "   WHERE ISSUE_DATE=:ORA_4) B"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO D"
                        sql = sql & ",(SELECT EMP_CODE,DEPT_RANK,DEPT_CODE,DEPT_CODE1,DEPT_NAME1,BELONG_NAME,KAISYACD"
                        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "EMP_BELONG_HISTORY_INFO"
                        sql = sql & "   WHERE ANOTHER_POST_DIV='0'"
                        sql = sql & "     AND ISSUE_DATE<=:ORA_4"
                        sql = sql & "     AND END_DAY>=:ORA_4) E"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO I"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "EMP_BASE_PAY_HIS_INFO J"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS M1"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER M2"
                        sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "DEPT_CORP_COLLABO_MS M3"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "V_M_JOB_GRADE M6"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "JOB_GRADE_NAME M7"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("201") <> "1" Then
                            sql = sql & "," & SessionAsStr("SG_C_DBUSER1") & "BASE_PAY_GRADE_NAME M9"
                        End If
                        sql = sql & " WHERE A.EMP_CODE=B.EMP_CODE"
                        sql = sql & "   AND A.EMP_CODE=D.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=E.EMP_CODE(+)"
                        sql = sql & "   AND E.KAISYACD=M1.KAISYACD(+)"
                        sql = sql & "   AND E.DEPT_RANK=M1.RANK(+)"
                        sql = sql & "   AND E.DEPT_CODE=M1.CODE_VALUE(+)"
                        sql = sql & "   AND E.KAISYACD=M2.KAISYACD(+)"
                        sql = sql & "   AND M2.AGE_NUMBER(+)=:ORA_3"
                        sql = sql & "   AND E.DEPT_RANK=M2.RANK(+)"
                        sql = sql & "   AND E.DEPT_CODE=M2.CODE_VALUE(+)"
                        sql = sql & "   AND E.KAISYACD=M3.KAISYACD(+)"
                        sql = sql & "   AND E.DEPT_CODE1=M3.DEPT_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE=I.EMP_CODE(+)"
                        sql = sql & "   AND I.ISSUE_DATE(+)=:ORA_4"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "   AND I.KAISYACD=M6.KAISYACD(+)"
                            sql = sql & "   AND I.GRADE_CODE=M6.CODE_VALUE(+)"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
                            sql = sql & "   AND I.KAISYACD=M7.KAISYACD(+)"
                            sql = sql & "   AND I.GRADE_CODE=M7.GRADE_CODE(+)"
                            sql = sql & "   AND I.ABILITY_SALARY_GRADE=M7.GRADE(+)"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("201") <> "1" Then
                            sql = sql & "   AND J.KAISYACD=M9.KAISYACD(+)"
                            sql = sql & "   AND J.BASIC_SALARY_GRADE=M9.GRADE(+)"
                        End If
                        sql = sql & "   AND A.EMP_CODE=J.EMP_CODE(+)"
                        sql = sql & "   AND J.ISSUE_DATE(+)=:ORA_4"
                    Case "103"
                        '*** 辞令書
                End Select
                ReDim w_orapara(2, 4)
                w_orapara(0, 0) = w_kcode
                w_orapara(1, 0) = "101"
                w_orapara(0, 1) = w_flg(1)
                w_orapara(1, 1) = "1"
                w_orapara(0, 2) = w_flg(2)
                w_orapara(1, 2) = "1"
                w_orapara(0, 3) = CStr(P000S026.FNCG_P_SEDAI_GET(1, p_printinf(2), 0))
                w_orapara(1, 3) = "2"
                w_orapara(0, 4) = p_printinf(2)
                w_orapara(1, 4) = "12"
            Case "300"
                Select Case p_printinf(1)
                    Case "2"
                        w_fcnt = 12
                        w_head = """総表示順位"",""見出所属"",""区分"",""区分名称"",""社員コード"""
                        w_head = w_head & ",""氏名"",""現所属"",""新所属"",""現役職"",""現職級"",""新役職"",""新職級"""
                        p_excelfmt = "31,,31,,01"
                        p_excelfmt = p_excelfmt & ",,,,,,,"
                        sql = "SELECT"
                        sql = sql & " A.TOTAL_DISP_ORDER"
                        sql = sql & ",A.TITLE_BELONG"
                        sql = sql & ",A.DIV"
                        sql = sql & ",DECODE(A.DIV,1,:ORA_1,2,:ORA_2,3,:ORA_3,:ORA_4)"
                        sql = sql & ",A.EMP_CODE"
                        sql = sql & ",B.NAME"
                        sql = sql & ",A.CURRENT_BELONG"
                        sql = sql & ",A.NEW_BELONG"
                        If SessionAsStrArray2D("SG_P_ENVIR_000")(0, 9) = "1" Then
                            sql = sql & ",DECODE(A.DIV,5,:ORA_5 || WEB_SP0002415_F(:ORA_0,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A.POST_DIV_CODE,NULL,NULL,NULL,TO_DATE('" & P000S031.FNCG_P_DATEADD(3, p_printinf(2), CStr(-1)) & "','YYYY/MM/DD'))"
                            sql = sql & ",DECODE(A.ANOTHER_POST_DIV,'0',WEB_SP0002415_F(:ORA_0,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,C.POST_DIV_CODE,NULL,NULL,NULL,C.ISSUE_DATE)))"
                            sql = sql & " || DECODE(A.DIV,5,'',DECODE(A.ANOTHER_POST_DIV,'0','',:ORA_6))"
                            '*** 現役職
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,D.GRADE_CODE,NULL,NULL,NULL,D.ISSUE_DATE)"
                            '*** 現職級
                            sql = sql & ",DECODE(A.DIV,5,'',DECODE(A.ANOTHER_POST_DIV,'0',NVL(WEB_SP0002415_F(:ORA_0,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A.POST_DIV_CODE,NULL,NULL,NULL,TO_DATE('" & p_printinf(2) & "','YYYY/MM/DD'))"
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,C.POST_DIV_CODE,NULL,NULL,NULL,C.ISSUE_DATE))"
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A.POST_DIV_CODE,NULL,NULL,NULL,TO_DATE('" & p_printinf(2) & "','YYYY/MM/DD'))))"
                            '*** 新役職
                            sql = sql & ",WEB_SP0002415_F(:ORA_0,2,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,D.GRADE_CODE,NULL,NULL,NULL,D.ISSUE_DATE)"
                            '*** 新職級
                        Else
                            sql = sql & ",DECODE(A.DIV,5,:ORA_5 || M1.TEXT1,DECODE(A.ANOTHER_POST_DIV,'0',M2.TEXT1)) || DECODE(A.DIV,5,'',DECODE(A.ANOTHER_POST_DIV,'0','',:ORA_6))"
                            '*** 現役職（兼務解除：兼務の役職・兼務：非表示・本務：本務の役職）
                            sql = sql & ",M4.TEXT1"
                            '*** 現職級
                            sql = sql & ",DECODE(A.DIV,5,'',DECODE(A.ANOTHER_POST_DIV,'0',NVL(M1.TEXT1,M2.TEXT1),M1.TEXT1))"
                            '*** 新役職
                            sql = sql & ",DECODE(A.DIV,5,'',NVL(M5.TEXT1,M4.TEXT1))"
                            '*** 新職級
                        End If
                        sql = sql & " FROM " & SessionAsStr("SG_P_DBUSER1") & "WEB_TP3001520_W A"
                        sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID") & " T"
                        sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "EMP_BASIC_INFO B"
                        sql = sql & "     ,(SELECT EMP_CODE,POST_DIV_CODE,ISSUE_DATE,KAISYACD FROM " & SessionAsStr("SG_P_DBUSER1") & "EMP_POST_HISTORY_INFO"
                        sql = sql & "        WHERE ISSUE_DATE<=TO_DATE('" & p_printinf(2) & "','YYYY/MM/DD')"
                        sql = sql & "          AND END_DAY>=TO_DATE('" & p_printinf(2) & "','YYYY/MM/DD')) C"
                        sql = sql & "     ,(SELECT EMP_CODE,GRADE_CODE,ISSUE_DATE,KAISYACD FROM " & SessionAsStr("SG_P_DBUSER1") & "EMP_JOB_GRADE_HISTORY_INFO"
                        sql = sql & "        WHERE ISSUE_DATE<=TO_DATE('" & p_printinf(2) & "','YYYY/MM/DD')"
                        sql = sql & "          AND END_DAY>=TO_DATE('" & p_printinf(2) & "','YYYY/MM/DD')) D"
                        sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "WEB_TP3000230_T E"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("15") <> "1" Then
                            sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "V_M_POST M1"
                            sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "V_M_POST M2"
                            sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "V_M_POST M3"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "V_M_JOB_GRADE M4"
                            sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "V_M_JOB_GRADE M5"
                        End If
                        sql = sql & " WHERE A.CUSTOMER_ID = " & SessionAsStr("SG_P_RID")
                        sql = sql & "   AND A.EMP_CODE = T.EMP_CODE"
                        '***sql = sql & "   AND A.兼務区分 = T.兼務区分"
                        sql = sql & "   AND T.SELECTED=1"
                        sql = sql & "   AND A.JOINKEY = T.JOINKEY"
                        sql = sql & "   AND A.EMP_CODE = B.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE = C.EMP_CODE(+)"
                        sql = sql & "   AND A.EMP_CODE = D.EMP_CODE(+)"
                        sql = sql & "   AND E.PROCESS_ID(+) = " & w_ido(0)
                        sql = sql & "   AND E.OPEN_ID(+) = " & w_ido(1)
                        sql = sql & "   AND E.PLAN_ID(+) = " & w_ido(2)
                        sql = sql & "   AND A.EMP_CODE = E.EMP_CODE(+)"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("15") <> "1" Then
                            sql = sql & "   AND M1.KAISYACD(+) = :ORA_0"
                            sql = sql & "   AND A.POST_DIV_CODE = M1.CODE_VALUE(+)"
                            sql = sql & "   AND C.KAISYACD = M2.KAISYACD(+)"
                            sql = sql & "   AND C.POST_DIV_CODE = M2.CODE_VALUE(+)"
                            sql = sql & "   AND E.KAISYACD = M3.KAISYACD(+)"
                            sql = sql & "   AND E.POST_DIV_CODE = M3.CODE_VALUE(+)"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") <> "1" Then
                            sql = sql & "   AND D.KAISYACD = M4.KAISYACD(+)"
                            sql = sql & "   AND D.GRADE_CODE = M4.CODE_VALUE(+)"
                            sql = sql & "   AND E.KAISYACD = M5.KAISYACD(+)"
                            sql = sql & "   AND E.GRADE_CODE = M5.CODE_VALUE(+)"
                        End If
                        sql = sql & " ORDER BY A.TOTAL_DISP_ORDER,A.DIV"
                        If P000S015.FNCG_P_MSTLIST_HANDAN("15") = "1" Then
                            sql = sql & ",TO_CHAR(NVL(WEB_SP0002415_F(:ORA_0,3,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,C.POST_DIV_CODE,NULL,NULL,NULL,C.ISSUE_DATE),99999),'FM00000') ||"
                            sql = sql & " WEB_SP0002415_F(:ORA_0,1,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,C.POST_DIV_CODE,NULL,NULL,NULL,C.ISSUE_DATE)"
                        Else
                            sql = sql & " ,TO_CHAR(NVL(M2.NUMBER1,99999),'FM00000') || M2.CODE_VALUE"
                        End If
                        If P000S015.FNCG_P_MSTLIST_HANDAN("17") = "1" Then
                            sql = sql & ",TO_CHAR(NVL(WEB_SP0002415_F(:ORA_0,3,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,D.GRADE_CODE,NULL,NULL,NULL,D.ISSUE_DATE),99999),'FM00000') ||"
                            sql = sql & " TO_NUMBER(WEB_SP0002415_F(:ORA_0,3,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,D.GRADE_CODE,NULL,NULL,NULL,D.ISSUE_DATE))"
                        Else
                            sql = sql & " ,TO_CHAR(NVL(M4.NUMBER1,99999),'FM00000') || M4.CODE_VALUE"
                        End If
                        sql = sql & " ,NVL(B.HIRE_YMD,TO_DATE('39991231','YYYYMMDD'))"
                    Case "3"
                        w_fcnt = 7
                        w_head = """新表示順"",""新世代"",""新ランク｜新コード"",""現表示順"",""現世代"",""現ランク｜現コード"""
                        w_head = w_head & ",""発令種類"""
                        p_excelfmt = "31,31,,31,31,,"
                        sql = "SELECT"
                        sql = sql & " A.NEW_EMP_DISP_ORDER"
                        sql = sql & ",B.BEGIN_AGE"
                        sql = sql & ",A.NEW_DEPT_RANK |｜ '|' || A.NEW_DEPT_CODE"
                        sql = sql & ",A.CURRENT_EMP_DISP_ORDER"
                        sql = sql & ",C.BEGIN_AGE"
                        sql = sql & ",A.CURRENT_DEPT_RANK |｜ '|' || A.CURRENT_DEPT_CODE"
                        sql = sql & ",A.TRANSFER_FLAG"
                        sql = sql & " FROM " & w_table & " A"
                        sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "DEPT_MS B"
                        sql = sql & "     ," & SessionAsStr("SG_P_DBUSER1") & "DEPT_MS C"
                        sql = sql & " WHERE A.CUSTOMER_ID = " & SessionAsStr("SG_P_RID")
                        sql = sql & "   AND A.NEW_DEPT_RANK = B.RANK"
                        sql = sql & "   AND A.NEW_DEPT_CODE = B.CODE_VALUE"
                        sql = sql & "   AND B.KAISYACD = :ORA_0"
                        sql = sql & "   AND A.CURRENT_DEPT_RANK = C.RANK"
                        sql = sql & "   AND A.CURRENT_DEPT_CODE = C.CODE_VALUE"
                        sql = sql & "   AND C.KAISYACD(+) = :ORA_0"
                End Select
                If p_printinf(1) = "2" Then
                    ReDim w_orapara(2, 6)
                    w_orapara(0, 0) = w_kcode
                    w_orapara(1, 0) = "101"
                    '*** ﾗﾍﾞﾙ(40)：'転出'
                    w_orapara(0, 1) = w_langmsg_out(0, 40)
                    w_orapara(1, 1) = "1"
                    '*** ﾗﾍﾞﾙ(41)：'転入'
                    w_orapara(0, 2) = w_langmsg_out(0, 41)
                    w_orapara(1, 2) = "1"
                    '*** ﾗﾍﾞﾙ(42)：'昇給 昇格'
                    w_orapara(0, 3) = w_langmsg_out(0, 42)
                    w_orapara(1, 3) = "1"
                    '*** ﾗﾍﾞﾙ(43)：'異動'
                    w_orapara(0, 4) = w_langmsg_out(0, 43)
                    w_orapara(1, 4) = "1"
                    '*** ﾗﾍﾞﾙ(44)：'(兼務解除)'
                    w_orapara(0, 5) = w_langmsg_out(0, 44)
                    w_orapara(1, 5) = "1"
                    '*** ﾗﾍﾞﾙ(45)：'(兼務)'
                    w_orapara(0, 6) = w_langmsg_out(0, 45)
                    w_orapara(1, 6) = "1"
                Else
                    ReDim w_orapara(2, 0)
                    w_orapara(0, 0) = w_kcode
                    w_orapara(1, 0) = "101"
                End If
        End Select
        '**********************************************************************
        '*    ファイルオープン
        '**********************************************************************
        fileobject = New FileSystemObject()
        filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & ".CSV"
        w_fio_out = POCOM001.POCOM_CreateTextFile(filename, System.Text.Encoding.Unicode, True)
        '**********************************************************************
        '*    ファイル出力
        '**********************************************************************
        w_fio_out.WriteLine(w_head)
        If P000S011.FNCG_P_RECORDSET5(w_fcnt, sql, w_orapara, w_dbdata) = True Then
            w_fmt = VBSplit(p_excelfmt, ",", -1, 0)
            For w_i = 0 To UBound(w_dbdata, 2)
                w_dbuff = ""
                For w_j = 0 To w_fcnt - 1
                    Select Case w_fmt(w_j)
                        Case "04"
                            w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(P000S024.FNCG_P_KAISYAKBN(w_dbdata(w_j, w_i))) & """"
                        Case Else
                            w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_dbdata(w_j, w_i)) & """"
                    End Select
                Next
                w_fio_out.WriteLine(Mid(w_dbuff, 2))
            Next
        Else
            FNCL_P_IREICSVMAKE = 1
            p_err = "データが存在しません。<BR>"
        End If
        '**********************************************************************
        '*    ファイルクローズ
        '**********************************************************************
        w_fio_out.Close()
        w_fio_out = Nothing
        fileobject = Nothing
    End Function

    '**********************************************************************
    '*  起点情報出力処理(異動線)
    '**********************************************************************
    Function FNCL_P_KITENCSVMAKE(ByRef p_idou() As String, ByRef p_err As String) As Integer
        Dim sql As String
        Dim w_i As Integer
        Dim w_j As Integer
        Dim w_dbdata(,) As String = Nothing
        Dim filename As String                          '/* 物理ファイル名
        Dim fileobject As FileSystemObject              '/* Server CreateObject
        Dim w_fio_out As TextStream                     '/* テキスト変数(書込用)
        Dim w_dbuff As String                           '/* 書込内容
        FNCL_P_KITENCSVMAKE = 0
        '*** p_idou
        '*** (0) 処理ＩＤ
        '*** (1) 案ＩＤ
        '*** (2) 分類ＩＤ
        '**********************************************************************
        '*    出力データ取得
        '**********************************************************************
        sql = "SELECT"
        sql = sql & " A.STATING_POINT_ID||A.CONTINUATION_ID"
        '***  0:起点ＩＤ||継続ＩＤ
        If P000S015.FNCG_P_MSTLIST_HANDAN("6") = "1" Then
            sql = sql & ",WEB_SP0002415_F(:ORA_2,2,6," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A.EMP_DIV,NULL,NULL,NULL,M.ISSUE_DATE)"
        Else
            sql = sql & ",B.TEXT1"
            '***  1:社員区分
        End If
        sql = sql & ",C.NAME"
        '***  2:人事事業所
        sql = sql & ",D.NAME"
        '***  3:給与事業所
        sql = sql & ",WEB_SP3010010_F(:ORA_2,:ORA_0,A.PERSONNEL_BELONG_RANK,A.PERSONNEL_BELONG_CODE)"
        '***  4:人事所属
        sql = sql & ",WEB_SP3010010_F(:ORA_2,:ORA_0,A.SALARY_BELONG_RANK,A.SALARY_BELONG_CODE)"
        '***  5:給与所属
        If P000S015.FNCG_P_MSTLIST_HANDAN("15") = "1" Then
            sql = sql & ",WEB_SP0002415_F(:ORA_2,2,15," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A.POST,NULL,NULL,NULL,M.ISSUE_DATE)"
            '***  6:役職
            sql = sql & ",WEB_SP0002415_F(:ORA_2,2,51," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A.INTERNAL_QUALIFY,NULL,NULL,NULL,M.ISSUE_DATE)"
            '***  7:社内資格
            sql = sql & ",WEB_SP0002415_F(:ORA_2,2,64," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A.ROLE_CODE,NULL,NULL,NULL,M.ISSUE_DATE)"
            '***  8:職掌
            sql = sql & ",WEB_SP0002415_F(:ORA_2,2,18," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A.CATEGORY,NULL,NULL,NULL,M.ISSUE_DATE)"
            '***  9:職種
            sql = sql & ",WEB_SP0002415_F(:ORA_2,2,17," & SessionAsStrArray("SG_P_SYSTEM")(12) & ",1,A.GRADE,NULL,NULL,NULL,M.ISSUE_DATE)"
            '*** 10:職級
        Else
            sql = sql & ",E.TEXT1"
            '***  6:役職
            sql = sql & ",F.TEXT1"
            '***  7:社内資格
            sql = sql & ",G.TEXT1"
            '***  8:職掌
            sql = sql & ",H.TEXT1"
            '***  9:職種
            sql = sql & ",I.TEXT1"
            '*** 10:職級
        End If
        If P000S015.FNCG_P_MSTLIST_HANDAN("200") = "1" Then
            '*** 11:職級号級名
            sql = sql & ",WEB_SP0002415_F(:ORA_2,2,200," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,A.GRADE,NULL,ABILITY_SALARY_GRADE,NULL,M.ISSUE_DATE)"
            '*** 11:職級号級名
        Else
            sql = sql & ",J.NAME"
        End If
        If P000S015.FNCG_P_MSTLIST_HANDAN("201") = "1" Then
            '*** 12:本給号級
            sql = sql & ",WEB_SP0002415_F(:ORA_2,2,201," & SessionAsStrArray("SG_P_SYSTEM")(13) & ",1,A.BASIC_SALARY_GRADE,NULL,NULL,NULL,M.ISSUE_DATE)"
            '*** 12:本給号級
        Else
            sql = sql & ",K.NAME"
        End If
        sql = sql & ",L.NAME"
        '*** 13:退職者氏名
        sql = sql & ",A.REMARKS"
        '*** 14:備考
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3011030_M A"
        sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "OFFICE_MS    C"
        sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "OFFICE_MS    D"
        If P000S015.FNCG_P_MSTLIST_HANDAN("6") <> "1" Then
            sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "V_M_EMP_DIV    B"
            sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "V_M_POST        E"
            sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "V_M_INTERNAL_QUALIFY    F"
            sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "V_M_ROLE        G"
            sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "V_M_JOB_CATEGORY        H"
            sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "V_M_JOB_GRADE        I"
        End If
        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
            sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "JOB_GRADE_NAME      J"
        End If
        If P000S015.FNCG_P_MSTLIST_HANDAN("201") <> "1" Then
            sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "BASE_PAY_GRADE_NAME      K"
        End If
        sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "EMP_BASIC_INFO    L"
        sql = sql & " ,    " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3011010_M M"
        sql = sql & " WHERE A.KAISYACD = :ORA_2"
        sql = sql & "   AND A.PROCESS_ID = :ORA_0"
        sql = sql & "   AND A.PLAN_ID IN (0,:ORA_1)"
        sql = sql & "   AND A.KAISYACD = M.KAISYACD"
        sql = sql & "   AND A.PROCESS_ID = M.PROCESS_ID"
        If Not IsNull(p_idou(2)) Then
            Select Case p_idou(2)
                Case "-1"
                    sql = sql & "   AND A.CLS_ID IS NULL"
                Case "0"
                Case Else
                    sql = sql & "   AND A.CLS_ID = :ORA_3"
            End Select
        End If
        sql = sql & "   AND A.PERSONNEL_OFFICE = C.INTERNAL_ASSIGN_CODE(+)"
        sql = sql & "   AND A.SALARY_OFFICE = D.INTERNAL_ASSIGN_CODE(+)"
        If P000S015.FNCG_P_MSTLIST_HANDAN("6") <> "1" Then
            sql = sql & "   AND A.EMP_DIV = B.CODE_VALUE(+)"
            sql = sql & "   AND B.KAISYACD(+) = :ORA_2"
            sql = sql & "   AND A.POST = E.CODE_VALUE(+)"
            sql = sql & "   AND E.KAISYACD(+) = :ORA_2"
            sql = sql & "   AND A.INTERNAL_QUALIFY = F.CODE_VALUE(+)"
            sql = sql & "   AND F.KAISYACD(+) = :ORA_2"
            sql = sql & "   AND A.ROLE_CODE = G.CODE_VALUE(+)"
            sql = sql & "   AND G.KAISYACD(+) = :ORA_2"
            sql = sql & "   AND A.CATEGORY = H.CODE_VALUE(+)"
            sql = sql & "   AND H.KAISYACD(+) = :ORA_2"
            sql = sql & "   AND A.GRADE = I.CODE_VALUE(+)"
            sql = sql & "   AND I.KAISYACD(+) = :ORA_2"
        End If
        If P000S015.FNCG_P_MSTLIST_HANDAN("200") <> "1" Then
            sql = sql & "   AND A.GRADE = J.GRADE_CODE(+)"
            sql = sql & "   AND A.ABILITY_SALARY_GRADE = J.GRADE(+)"
            sql = sql & "   AND J.KAISYACD(+) = :ORA_2"
        End If
        If P000S015.FNCG_P_MSTLIST_HANDAN("201") <> "1" Then
            sql = sql & "   AND A.BASIC_SALARY_GRADE = K.GRADE(+)"
            sql = sql & "   AND K.KAISYACD(+) = :ORA_2"
        End If
        sql = sql & "   AND A.RETIRE_EMP_CODE = L.EMP_CODE(+)"
        sql = sql & " ORDER BY A.DISP_ORDER,A.STATING_POINT_ID,A.CONTINUATION_ID"
        If Not IsNull(p_idou(2)) Then
            Select Case p_idou(2)
                Case "-1", "0"
                    ReDim w_orapara(2, 2)
                Case Else
                    ReDim w_orapara(2, 3)
                    w_orapara(0, 3) = p_idou(2)
                    w_orapara(1, 3) = "2"
            End Select
        Else
            ReDim w_orapara(2, 2)
        End If
        w_orapara(0, 0) = p_idou(0)
        w_orapara(1, 0) = "2"
        w_orapara(0, 1) = p_idou(1)
        w_orapara(1, 1) = "2"
        w_orapara(0, 2) = w_kcode
        w_orapara(1, 2) = "101"
        If P000S011.FNCG_P_RECORDSET5(0, sql, w_orapara, w_dbdata) = False Then
            FNCL_P_KITENCSVMAKE = 1
            p_err = "データが存在しません。<BR>"
            Exit Function
        End If
        '**********************************************************************
        '*    ファイルオープン
        '**********************************************************************
        fileobject = New FileSystemObject()
        filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & "_KITEN.CSV"
        w_fio_out = POCOM001.POCOM_CreateTextFile(filename, System.Text.Encoding.Unicode, True)
        w_fnmdt(1, 7) = "1"
        Session.Add("SL_P001M404_FNM", w_fnmdt)
        '**********************************************************************
        '*    ファイル出力
        '**********************************************************************
        w_dbuff = """起点ＩＤ"",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_fname(0)) & """,""人事事業所"",""給与事業所"",""人事所属"",""給与所属"","""
        w_dbuff = w_dbuff & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_fname(1)) & """,""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_fname(3)) & """,""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_fname(4)) & """,""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_fname(5))
        w_dbuff = w_dbuff & """,""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_fname(2)) & """,""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_fname(7)) & """,""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_fname(6)) & """,""退職者氏名"",""備考"""
        w_fio_out.WriteLine(w_dbuff)
        For w_i = 0 To UBound(w_dbdata, 2)
            w_dbuff = ""
            For w_j = 0 To UBound(w_dbdata, 1)
                w_dbuff = w_dbuff & ",""" & P000S014.FNCG_P_DOUBLEQUOTE_ESCAPE(w_dbdata(w_j, w_i)) & """"
            Next
            w_fio_out.WriteLine(Mid(w_dbuff, 2))
        Next
        '**********************************************************************
        '*    ファイルクローズ
        '**********************************************************************
        w_fio_out.Close()
        w_fio_out = Nothing
        fileobject = Nothing
    End Function

    '**********************************************************************
    '*  出入表専用出力処理
    '**********************************************************************
    Function FNCL_P_TOKU5_CSVMAKE(ByRef p_idou As String, ByRef p_hrday As String, ByRef p_printinf() As String, ByRef p_err As String) As Integer
        Dim sql As String
        Dim sql2 As String
        Dim w_i As Integer
        Dim w_j As Integer
        Dim w_dbdata(,) As String = Nothing
        Dim w_dbdata2(,) As String = Nothing
        Dim filename As String                           '*** 物理ファイル名
        Dim fileobject As FileSystemObject               '*** Server CreateObject
        Dim w_fio_out As TextStream                      '*** テキスト変数(書込用)
        Dim w_dbuff As String                            '*** 書込内容
        Dim w_dbuff1 As String
        Dim w_sonota As String                           '*** その他フラグ  1:異動者のみ,2:全て
        Dim w_id As Integer
        Dim w_delimiter As String
        Dim w_sedai(1) As String                         '*** 世代番号(0:新,1:旧)
        Dim p_txtfmnt(1) As String                       '*** 書式
        FNCL_P_TOKU5_CSVMAKE = 0
        w_delimiter = ","
        '**********************************************************************
        '*    世代情報取得
        '**********************************************************************
        sql = "SELECT "
        sql = sql & " MAX(AGE_NUMBER) A"
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "DEPT_AGE_CONTROL_TBL"
        sql = sql & " WHERE KAISYACD=:ORA_1"
        sql = sql & "   AND VALID_DATE <= :ORA_0"
        sql = sql & "   AND FIX_FLAG=1"
        sql = sql & " UNION ALL SELECT"
        sql = sql & " MAX(AGE_NUMBER) A"
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "DEPT_AGE_CONTROL_TBL"
        sql = sql & " WHERE KAISYACD=:ORA_1"
        sql = sql & "   AND VALID_DATE <= (:ORA_0 - 1)"
        sql = sql & "   AND FIX_FLAG=1"
        sql = sql & " ORDER BY A DESC"
        ReDim w_orapara(2, 1)
        w_orapara(0, 0) = p_hrday
        w_orapara(1, 0) = "12"
        w_orapara(0, 1) = w_kcode
        w_orapara(1, 1) = "101"
        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
            FNCL_P_TOKU5_CSVMAKE = 1
            p_err = "有効世代が存在しません。<BR>"
            Exit Function
        Else
            w_sedai(0) = w_dbdata(0, 0)
            w_sedai(1) = w_dbdata(0, 1)
        End If
        '**********************************************************************
        '*    その他設定取得
        '**********************************************************************
        sql = "SELECT"
        sql = sql & " A.OTHER_CONF"
        '*** (0) その他設定 1:異動者の範囲,2:全て
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062022_M A"
        sql = sql & " WHERE A.KAISYACD=:ORA_2"
        sql = sql & " AND   A.FUNCTION_DIV = :ORA_0"
        sql = sql & " AND   A.REPORT_DIV = :ORA_1"
        sql = sql & " AND   A.IDENTIFIER     = 1"
        sql = sql & " ORDER BY A.SORT_ORDER,A.PREFERENTIAL_ORDER,A.IDENTIFIER"
        ReDim w_orapara(2, 2)
        w_orapara(0, 0) = p_printinf(0)
        w_orapara(1, 0) = "2"
        w_orapara(0, 1) = p_printinf(1)
        w_orapara(1, 1) = "2"
        w_orapara(0, 2) = w_kcode
        w_orapara(1, 2) = "101"
        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = False Then
            FNCL_P_TOKU5_CSVMAKE = 1
            p_err = "出力組織項目が未設定です。<BR>"
            Exit Function
        Else
            w_sonota = w_dbdata(0, 0)
        End If
        sql = "SELECT"
        sql = sql & " IDENTIFIER"
        '*** (0) ＩＤ
        sql = sql & ",NVL(SCREEN_NAME,DECODE(IDENTIFIER"
        '*** (1) 画面名称(予備)
        sql = sql & ",101,'所属名称1'"
        sql = sql & ",102,'所属名称2'"
        sql = sql & ",103,'所属名称3'"
        sql = sql & ",104,'所属名称4'"
        sql = sql & ",105,'所属名称5'"
        sql = sql & ",106,'所属名称6'"
        sql = sql & ",107,'所属名称7'"
        sql = sql & ",108,'所属名称8'"
        sql = sql & ",109,'所属名称9'"
        sql = sql & ",110,'所属名称10'"
        sql = sql & ",111,'所属名称11'"
        sql = sql & ",112,'所属名称12'"
        sql = sql & ",113,'所属名称13'"
        sql = sql & ",114,'所属名称14'"
        sql = sql & ",115,'所属名称15'"
        sql = sql & ",116,'所属名称16'"
        sql = sql & ",117,'所属名称17'"
        sql = sql & ",118,'所属名称18'"
        sql = sql & ",119,'所属名称19'"
        sql = sql & ",120,'所属名称20'"
        sql = sql & ",201,'略称'"
        sql = sql & ",202,'備考'"
        sql = sql & ",203,'給与所属コード'"
        sql = sql & ",204,'総表示順'))"
        sql = sql & ",DECODE(PREFERENTIAL_ORDER,0,99999,PREFERENTIAL_ORDER) PREFERENTIAL_ORDER"
        '*** (2) 優先順
        'sql = sql & ",優先順"                        '*** (2) 優先順
        sql = sql & ",SORT_ORDER"
        '*** (3) 並び順
        sql = sql & ",ROW_INFO"
        '*** (4) 行
        sql = sql & ",COLUMN_INFO"
        '*** (5) 列
        sql = sql & ",APPEND_CHAR"
        '*** (6) 付加文字
        sql = sql & " FROM (SELECT"
        sql = sql & "      A.IDENTIFIER"
        sql = sql & "    ,B.SCREEN_NAME"
        sql = sql & "    ,A.PREFERENTIAL_ORDER"
        sql = sql & "    ,A.SORT_ORDER"
        sql = sql & "    ,A.ROW_INFO"
        sql = sql & "    ,A.COLUMN_INFO"
        sql = sql & "    ,A.APPEND_CHAR"
        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062022_M A"
        sql = sql & "        ,(SELECT IDENTIFIER+301 IDENTIFIER,SCREEN_NAME FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TC0000040_M WHERE USAGE_DIV = 1 AND ORGANIZATION_ID = 0) B"
        sql = sql & "   WHERE A.KAISYACD=:ORA_2"
        sql = sql & "   AND   A.FUNCTION_DIV = :ORA_0"
        sql = sql & "    AND   A.REPORT_DIV = :ORA_1"
        sql = sql & "    AND   A.IDENTIFIER <> 1"
        sql = sql & "    AND   A.SORT_ORDER   <> 0"
        sql = sql & "    AND   A.IDENTIFIER     = B.IDENTIFIER(+)"
        sql = sql & " UNION "
        sql = sql & " SELECT "
        sql = sql & "     A.IDENTIFIER"
        sql = sql & "    ,B.SCREEN_NAME"
        sql = sql & "    ,A.PREFERENTIAL_ORDER"
        sql = sql & "    ,9999"
        sql = sql & "    ,A.ROW_INFO"
        sql = sql & "    ,A.COLUMN_INFO"
        sql = sql & "    ,A.APPEND_CHAR"
        sql = sql & "    FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062022_M A"
        sql = sql & "        ,(SELECT IDENTIFIER+301 IDENTIFIER,SCREEN_NAME FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TC0000040_M WHERE USAGE_DIV = 1 AND ORGANIZATION_ID = 0) B"
        sql = sql & "   WHERE A.KAISYACD=:ORA_2"
        sql = sql & "   AND   A.FUNCTION_DIV = :ORA_0"
        sql = sql & "    AND   A.REPORT_DIV = :ORA_1"
        sql = sql & "    AND   A.IDENTIFIER <> 1"
        sql = sql & "    AND   A.SORT_ORDER   = 0"
        sql = sql & "    AND   A.IDENTIFIER   = B.IDENTIFIER(+)) A"
        sql = sql & " ORDER BY SORT_ORDER,PREFERENTIAL_ORDER,IDENTIFIER"
        ReDim w_orapara(2, 2)
        w_orapara(0, 0) = p_printinf(0)
        w_orapara(1, 0) = "2"
        w_orapara(0, 1) = p_printinf(1)
        w_orapara(1, 1) = "2"
        w_orapara(0, 2) = w_kcode
        w_orapara(1, 2) = "101"
        If P000S011.FNCG_P_RECORDSET5(7, sql, w_orapara, w_dbdata) = False Then
            FNCL_P_TOKU5_CSVMAKE = 1
            p_err = "出力組織項目が未設定です。<BR>"
            Exit Function
        End If
        '**********************************************************************
        '*    出力データ取得
        '**********************************************************************
        w_dbuff1 = ""
        p_txtfmnt(0) = "1,1,2"
        sql = "SELECT"
        sql = sql & " B.TOTAL_DISP_ORDER"
        sql = sql & ",B.AGE_NUMBER"
        sql = sql & ",B.RANK || '||' || B.CODE_VALUE"
        For w_i = 0 To UBound(w_dbdata, 2)
            If Not IsNull(w_dbdata(4, w_i)) Then
                w_id = CInt(w_dbdata(0, w_i))
                Select Case w_id
                    Case 101, 102, 103, 104, 105, 106, 107, 108, 109
                        sql = sql & "," & FNCL_P_RTNSPLIT(("C.NAME" & P000S001.FNCG_P_ZEROCD(CStr(w_id - 100), 1)), w_dbdata(6, w_i), w_delimiter)
                        w_dbuff1 = w_dbuff1 & ",""所属名称" & P000S001.FNCG_P_ZEROCD(CStr(w_id - 100), 1) & """"
                        p_txtfmnt(0) = p_txtfmnt(0) & ",2"
                    Case 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120
                        sql = sql & "," & FNCL_P_RTNSPLIT(("C.NAME" & P000S001.FNCG_P_ZEROCD(CStr(w_id - 100), 2)), w_dbdata(6, w_i), w_delimiter)
                        w_dbuff1 = w_dbuff1 & ",""所属名称" & P000S001.FNCG_P_ZEROCD(CStr(w_id - 100), 2) & """"
                        p_txtfmnt(0) = p_txtfmnt(0) & ",2"
                    Case 201
                        sql = sql & "," & FNCL_P_RTNSPLIT("C.ABBREVIATION", w_dbdata(6, w_i), w_delimiter)
                        w_dbuff1 = w_dbuff1 & ",""略称"""
                        p_txtfmnt(0) = p_txtfmnt(0) & ",2"
                    Case 202
                        sql = sql & "," & FNCL_P_RTNSPLIT("C.REMARKS", w_dbdata(6, w_i), w_delimiter)
                        w_dbuff1 = w_dbuff1 & ",""備考"""
                        p_txtfmnt(0) = p_txtfmnt(0) & ",2"
                    Case 203
                        sql = sql & "," & FNCL_P_RTNSPLIT("B.SALARY_BELONG_CODE", w_dbdata(6, w_i), w_delimiter)
                        w_dbuff1 = w_dbuff1 & ",""給与所属コード"""
                        p_txtfmnt(0) = p_txtfmnt(0) & ",2"
                    Case 204
                        sql = sql & "," & FNCL_P_RTNSPLIT("B.TOTAL_DISP_ORDER", w_dbdata(6, w_i), w_delimiter)
                        w_dbuff1 = w_dbuff1 & ",""総表示順位"""
                        p_txtfmnt(0) = p_txtfmnt(0) & ",1"
                    Case Else
                        sql = sql & "," & FNCL_P_RTNSPLIT(("B.AUX_CHAR" & P000S001.FNCG_P_ZEROCD(CStr(w_id - 301), 2)), w_dbdata(6, w_i), w_delimiter)
                        w_dbuff1 = w_dbuff1 & ",""" & P000S001.FNCG_P_NZ(w_dbdata(1, w_i)) & """"
                        p_txtfmnt(0) = p_txtfmnt(0) & ",2"
                End Select
            End If
        Next
        p_txtfmnt(1) = "2,1,1,1,2,2,1"
        Session.Add("SL_P_IDOUHYOU_FMT", p_txtfmnt)
        sql2 = sql
        If w_sonota = "1" Then
            '*** 異動者の範囲
            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER B"
            sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS C"
            sql = sql & ",(     select NEW_DEPT_RANK RANK,NEW_DEPT_CODE CODE_VALUE from " & w_table & " where CUSTOMER_ID=:ORA_0"
            sql = sql & " union select CURRENT_DEPT_RANK RANK,CURRENT_DEPT_CODE CODE_VALUE from " & w_table & " where CUSTOMER_ID=:ORA_0) A"
            sql = sql & " WHERE B.KAISYACD = :ORA_3"
            sql = sql & "   AND B.KAISYACD=C.KAISYACD(+)"
            sql = sql & "   AND B.CODE_VALUE=C.CODE_VALUE(+)"
            sql = sql & "   AND B.RANK=C.RANK(+)"
            sql = sql & "   AND B.AGE_NUMBER = :ORA_1"
            sql = sql & "   AND A.RANK=B.RANK"
            sql = sql & "   AND A.CODE_VALUE=B.CODE_VALUE"
            If w_delbsyo = 0 AndAlso w_sedai(0) <> w_sedai(1) Then
                '*** 削除部署
                sql = sql & "  UNION "
                sql = sql & sql2
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER B"
                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS C"
                sql = sql & ",(select CURRENT_DEPT_RANK RANK,CURRENT_DEPT_CODE CODE_VALUE from " & w_table & " where CUSTOMER_ID=:ORA_0) A"
                sql = sql & " WHERE B.KAISYACD = :ORA_3"
                sql = sql & "   AND B.KAISYACD=C.KAISYACD(+)"
                sql = sql & "   AND B.CODE_VALUE=C.CODE_VALUE(+)"
                sql = sql & "   AND B.RANK=C.RANK(+)"
                sql = sql & "   AND C.END_AGE = :ORA_1"
                sql = sql & "   AND B.AGE_NUMBER = :ORA_2"
                sql = sql & "   AND A.RANK=B.RANK"
                sql = sql & "   AND A.CODE_VALUE=B.CODE_VALUE"
            End If
        Else
            '*** 全て-現存部署
            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER B"
            sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS C"
            sql = sql & " WHERE B.KAISYACD = :ORA_3"
            sql = sql & "   AND B.KAISYACD=C.KAISYACD(+)"
            sql = sql & "   AND B.CODE_VALUE=C.CODE_VALUE(+)"
            sql = sql & "   AND B.RANK=C.RANK(+)"
            sql = sql & "   AND B.AGE_NUMBER = :ORA_1"
            If w_delbsyo = 0 AndAlso w_sedai(0) <> w_sedai(1) Then
                '*** 削除部署 ランク/コード
                sql = sql & "  UNION "
                sql = sql & sql2
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS_DISP_ORDER B"
                sql = sql & "     ," & SessionAsStr("SG_C_DBUSER1") & "DEPT_MS C"
                sql = sql & " WHERE B.KAISYACD = :ORA_3"
                sql = sql & "   AND B.KAISYACD=C.KAISYACD(+)"
                sql = sql & "   AND B.CODE_VALUE=C.CODE_VALUE(+)"
                sql = sql & "   AND B.RANK=C.RANK(+)"
                sql = sql & "   AND C.END_AGE = :ORA_1"
                sql = sql & "   AND B.AGE_NUMBER = :ORA_2"
            End If
        End If
        sql = sql & " ORDER BY 2 DESC, 1"
        ReDim w_orapara(2, 3)
        w_orapara(0, 0) = SessionAsStr("SG_P_RID")
        w_orapara(1, 0) = "2"
        w_orapara(0, 1) = w_sedai(0)
        w_orapara(1, 1) = "2"
        w_orapara(0, 2) = w_sedai(1)
        w_orapara(1, 2) = "2"
        w_orapara(0, 3) = w_kcode
        w_orapara(1, 3) = "101"
        If P000S011.FNCG_P_RECORDSET5(0, sql, w_orapara, w_dbdata) = False Then
            FNCL_P_TOKU5_CSVMAKE = 1
            p_err = "データが存在しません。<BR>"
            Exit Function
        End If
        If w_delbsyo = 1 AndAlso w_sedai(0) <> w_sedai(1) Then
            sql = "SELECT "
            sql = sql & " COUNT(*)"
            sql = sql & " FROM " & w_table
            sql = sql & " WHERE CURRENT_DEPT_RANK = 98"
            sql = sql & "   AND CURRENT_DEPT_CODE = 99998"
            sql = sql & "   AND CURRENT_DEPT_DISP_ORDER = 99998"
            sql = sql & "   AND CURRENT_EMP_DISP_ORDER = 9999999998"
            If P000S011.FNCG_P_RECORDSET1(1, sql, w_dbdata2) = False Then
                ReDim w_dbdata(0, 0)
                w_dbdata(0, 0) = "0"
            End If
            If CInt(w_dbdata2(0, 0)) > 0 Then
                '*** 消滅部署  ダミーレコード追加(対象者のみの場合は、削除部署があるかカウント取得の必要あり)
                ReDim Preserve w_dbdata(UBound(w_dbdata, 1), UBound(w_dbdata, 2) + 1)
                w_dbdata(0, UBound(w_dbdata, 2)) = "99998"
                w_dbdata(1, UBound(w_dbdata, 2)) = "0"
                w_dbdata(2, UBound(w_dbdata, 2)) = "98||99998"
                For w_i = 3 To UBound(w_dbdata, 1)
                    w_dbdata(w_i, UBound(w_dbdata, 2)) = "***"
                Next
            End If
        End If
        '**********************************************************************
        '*    ファイルオープン
        '**********************************************************************
        fileobject = New FileSystemObject()
        filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & "_301.txt"
        w_fio_out = POCOM001.POCOM_CreateTextFile(filename, System.Text.Encoding.Unicode, True)
        w_fnmdt(1, 5) = "1"
        Session.Add("SL_P001M404_FNM", w_fnmdt)
        '**********************************************************************
        '*    ファイル出力
        '**********************************************************************
        w_dbuff = """表示順"",""世代"",""ランク||コード"""
        w_dbuff = w_dbuff & w_dbuff1
        w_fio_out.WriteLine(w_dbuff)
        For w_i = 0 To UBound(w_dbdata, 2)
            w_dbuff = ""
            For w_j = 0 To UBound(w_dbdata, 1)
                w_dbuff = w_dbuff & ",""" & w_dbdata(w_j, w_i) & """"
            Next
            w_fio_out.WriteLine(Mid(w_dbuff, 2))
        Next
        '**********************************************************************
        '*    ファイルクローズ
        '**********************************************************************
        w_fio_out.Close()
        w_fio_out = Nothing
        fileobject = Nothing
    End Function

    '**********************************************************************
    '*  出入表専用出力処理
    '**********************************************************************
    Function FNCL_P_TOKU6_CSVMAKE(ByRef p_printinf() As String, ByRef p_err As String) As Integer
        Dim sql As String
        Dim w_split() As String
        Dim w_i As Integer
        Dim w_j As Integer
        Dim w_dbdata(,) As String = Nothing
        Dim filename As String                     '/* 物理ファイル名
        Dim fileobject As FileSystemObject         '/* Server CreateObject
        Dim w_fio_out As TextStream                '/* テキスト変数(書込用)
        Dim w_dbuff As String                      '/* 書込内容

        FNCL_P_TOKU6_CSVMAKE = 0
        
        '*** p_printinf
        '*** (0) 機能区分
        '*** (1) 帳票区分
        '**********************************************************************
        '*    出力組織項目の取得
        '**********************************************************************
        sql = "SELECT "
        sql = sql & " A.IDENTIFIER"
        '*** 0:ＩＤ
        sql = sql & ",DECODE(A.PREFERENTIAL_ORDER,0,99999,A.PREFERENTIAL_ORDER) PREFERENTIAL_ORDER"
        '*** 1:優先順
        sql = sql & ",NVL(B.SCREEN_NAME,DECODE(A.IDENTIFIER"
        '*** 2:画面名称(予備)
        sql = sql & ",101,'所属名称1'"
        sql = sql & ",102,'所属名称2'"
        sql = sql & ",103,'所属名称3'"
        sql = sql & ",104,'所属名称4'"
        sql = sql & ",105,'所属名称5'"
        sql = sql & ",106,'所属名称6'"
        sql = sql & ",107,'所属名称7'"
        sql = sql & ",108,'所属名称8'"
        sql = sql & ",109,'所属名称9'"
        sql = sql & ",110,'所属名称10'"
        sql = sql & ",111,'所属名称11'"
        sql = sql & ",112,'所属名称12'"
        sql = sql & ",113,'所属名称13'"
        sql = sql & ",114,'所属名称14'"
        sql = sql & ",115,'所属名称15'"
        sql = sql & ",116,'所属名称16'"
        sql = sql & ",117,'所属名称17'"
        sql = sql & ",118,'所属名称18'"
        sql = sql & ",119,'所属名称19'"
        sql = sql & ",120,'所属名称20'"
        sql = sql & ",201,'略称'"
        sql = sql & ",202,'備考'"
        sql = sql & ",203,'給与所属コード'"
        sql = sql & ",204,'総表示順'))"
        sql = sql & ",DECODE(A.SORT_ORDER,0,999,A.SORT_ORDER) SORT_ORDER"
        '*** 3:並び順
        sql = sql & ",A.ROW_INFO"
        '*** 4:行
        sql = sql & ",A.COLUMN_INFO"
        '*** 5:列
        sql = sql & ",A.APPEND_CHAR"
        '*** 6:付加文字
        sql = sql & ",A.NEW_LINE_DIV"
        '*** 7:改行区分
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062022_M A"
        sql = sql & "     ,(SELECT IDENTIFIER+301 IDENTIFIER,SCREEN_NAME FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TC0000040_M WHERE USAGE_DIV = 1 AND ORGANIZATION_ID = 0) B"
        sql = sql & " WHERE A.KAISYACD=:ORA_2"
        sql = sql & " AND   A.FUNCTION_DIV = :ORA_0"
        sql = sql & " AND   A.REPORT_DIV = :ORA_1"
        sql = sql & " AND   A.IDENTIFIER <> 1"
        sql = sql & " AND   A.IDENTIFIER = B.IDENTIFIER(+)"
        sql = sql & " AND   A.SORT_ORDER <> 0"
        sql = sql & " UNION "
        sql = sql & " SELECT "
        sql = sql & " A.IDENTIFIER"
        '*** 0:ＩＤ
        sql = sql & ",DECODE(A.PREFERENTIAL_ORDER,0,99999,A.PREFERENTIAL_ORDER) PREFERENTIAL_ORDER"
        '*** 1:優先順
        sql = sql & ",NVL(B.SCREEN_NAME,DECODE(A.IDENTIFIER"
        '*** 2:画面名称(予備)
        sql = sql & ",101,'所属名称1'"
        sql = sql & ",102,'所属名称2'"
        sql = sql & ",103,'所属名称3'"
        sql = sql & ",104,'所属名称4'"
        sql = sql & ",105,'所属名称5'"
        sql = sql & ",106,'所属名称6'"
        sql = sql & ",107,'所属名称7'"
        sql = sql & ",108,'所属名称8'"
        sql = sql & ",109,'所属名称9'"
        sql = sql & ",110,'所属名称10'"
        sql = sql & ",111,'所属名称11'"
        sql = sql & ",112,'所属名称12'"
        sql = sql & ",113,'所属名称13'"
        sql = sql & ",114,'所属名称14'"
        sql = sql & ",115,'所属名称15'"
        sql = sql & ",116,'所属名称16'"
        sql = sql & ",117,'所属名称17'"
        sql = sql & ",118,'所属名称18'"
        sql = sql & ",119,'所属名称19'"
        sql = sql & ",120,'所属名称20'"
        sql = sql & ",201,'略称'"
        sql = sql & ",202,'備考'"
        sql = sql & ",203,'給与所属コード'"
        sql = sql & ",204,'総表示順'))"
        sql = sql & ",999 SORT_ORDER"
        '*** 3:並び順
        sql = sql & ",A.ROW_INFO"
        '*** 4:行
        sql = sql & ",A.COLUMN_INFO"
        '*** 5:列
        sql = sql & ",A.APPEND_CHAR"
        '*** 6:付加文字
        sql = sql & ",A.NEW_LINE_DIV"
        '*** 7:改行区分
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062022_M A"
        sql = sql & "     ,(SELECT IDENTIFIER+301 IDENTIFIER,SCREEN_NAME FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TC0000040_M WHERE USAGE_DIV = 1 AND ORGANIZATION_ID = 0) B"
        sql = sql & " WHERE A.KAISYACD=:ORA_2"
        sql = sql & " AND   A.FUNCTION_DIV = :ORA_0"
        sql = sql & " AND   A.REPORT_DIV = :ORA_1"
        sql = sql & " AND   A.IDENTIFIER <> 1"
        sql = sql & " AND   A.IDENTIFIER = B.IDENTIFIER(+)"
        sql = sql & " AND   A.SORT_ORDER = 0"
        sql = sql & " ORDER BY SORT_ORDER,PREFERENTIAL_ORDER,IDENTIFIER"
        ReDim w_orapara(2, 2)
        w_orapara(0, 0) = p_printinf(0)
        w_orapara(1, 0) = "2"
        w_orapara(0, 1) = p_printinf(1)
        w_orapara(1, 1) = "2"
        w_orapara(0, 2) = w_kcode
        w_orapara(1, 2) = "101"
        If P000S011.FNCG_P_RECORDSET5(8, sql, w_orapara, w_dbdata) = False Then
            FNCL_P_TOKU6_CSVMAKE = 1
            p_err = "出力組織項目が未設定です。<BR>"
            Exit Function
        End If
        '**********************************************************************
        '*    ファイルオープン
        '**********************************************************************
        fileobject = New FileSystemObject()
        filename = SessionAsStr("SG_C_OUTPUTPATH03_B") & SessionAsStr("SG_P_RID") & "_302.txt"
        w_fio_out = POCOM001.POCOM_CreateTextFile(filename, System.Text.Encoding.Unicode, True)
        w_fnmdt(1, 6) = "1"
        Session.Add("SL_P001M404_FNM", w_fnmdt)
        '**********************************************************************
        '*    ファイル出力（固定）
        '**********************************************************************
        w_dbuff = """項目名称(未使用)"",""表示順(未使用)"",""表示行"",""表示列"",""前付加(未使用)"",""後付加(未使用)"",""改行区分""" & vbCrLf
        '*** ヘッダー
        w_dbuff = w_dbuff & """表示順"","""",""0"",""0"","""",""""" & vbCrLf
        '*** 固定1行目
        w_dbuff = w_dbuff & """世代"","""",""0"",""0"","""",""""" & vbCrLf
        '*** 固定2行目
        w_dbuff = w_dbuff & """ランク||コード"","""",""0"",""0"","""","""""
        '*** 固定3行目
        w_fio_out.WriteLine(w_dbuff)
        For w_i = 0 To UBound(w_dbdata, 2)
            '*** 以下、任意選択分
            w_dbuff = ""
            For w_j = 2 To UBound(w_dbdata, 1)
                Select Case w_j
                    Case 2
                        w_dbuff = """""" & w_dbdata(w_j, w_i) & """"
                    Case 6
                        '*** 前付加,後付加
                        If Not IsNull(P000S001.FNCG_P_NZ(w_dbdata(w_j, w_i))) Then
                            w_split = VBSplit(w_dbdata(w_j, w_i), ",", -1, 0)
                            w_dbuff = w_dbuff & ",""" & w_split(0) & """"
                            If UBound(w_split) = 1 Then
                                w_dbuff = w_dbuff & ",""" & w_split(1) & """"
                            Else
                                w_dbuff = w_dbuff & ","""""
                            End If
                        Else
                            w_dbuff = w_dbuff & ","""","""""
                        End If
                    Case Else
                        w_dbuff = w_dbuff & ",""" & w_dbdata(w_j, w_i) & """"
                End Select
            Next
            w_fio_out.WriteLine(Mid(w_dbuff, 2))
        Next
        '**********************************************************************
        '*    ファイルクローズ
        '**********************************************************************
        w_fio_out.Close()
        w_fio_out = Nothing
        fileobject = Nothing
    End Function

    '**********************************************************************
    '*    文字に付加文字を連結して返します。
    '*    p_moji ：文字列
    '*    p_fmoji：付加文字(デリミタ:p_delimiter)によって前、後に分割
    '**********************************************************************
    Function FNCL_P_RTNSPLIT(ByRef p_moji As String, ByRef p_fmoji As String, ByRef p_delimiter As String) As String
        Dim w_split() As String
        Dim w_moji As String
        w_moji = p_moji
        If Not IsNull(P000S001.FNCG_P_NZ(p_fmoji)) Then
            w_split = VBSplit(p_fmoji, p_delimiter, -1, 0)
            If Not IsNull(w_split(0)) Then
                w_moji = "'" & w_split(0) & "' || " & p_moji
            Else
                w_moji = p_moji
            End If
            If UBound(w_split) = 1 Then
                If Not IsNull(w_split(1)) Then
                    w_moji = w_moji & " || '" & w_split(1) & "'"
                End If
            End If
        End If
        w_moji = "DECODE(" & p_moji & ",NULL,NULL," & w_moji & ")"
        FNCL_P_RTNSPLIT = w_moji
    End Function

    '**********************************************************************
    '*  外部で出力される項目数を取得する
    '**********************************************************************
    Function FNCL_P_GETFLDCNT(ByRef p_kinou As Integer, ByRef p_rptkbn As String) As Integer
        Dim sql As String                     '/* SQL文
        Dim w_rs1(,) As String = Nothing      '/* レコードセット
                
        FNCL_P_GETFLDCNT = 0
        '**********************************************************************
        '*    外部項目数取得SQL作成
        '**********************************************************************
        sql = "SELECT COUNT(*)"
        '*** 0
        sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0062030_M A"
        sql = sql & " WHERE A.KAISYACD=:ORA_2"
        sql = sql & "   AND A.FUNCTION_DIV = :ORA_0"
        sql = sql & "   AND A.REPORT_DIV = :ORA_1"
        sql = sql & "   AND A.IDENTIFIER < 0"
        ReDim w_orapara(2, 2)
        w_orapara(0, 0) = CStr(p_kinou)
        w_orapara(1, 0) = "2"
        w_orapara(0, 1) = p_rptkbn
        w_orapara(1, 1) = "2"
        w_orapara(0, 2) = w_kcode
        w_orapara(1, 2) = "101"
        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_rs1) = True Then
            FNCL_P_GETFLDCNT = CInt(w_rs1(0, 0))
        End If
    End Function

    '**********************************************************************
    '*  基準日を取得する
    '**********************************************************************
    Function FNCL_P_GETKJDAY(ByRef p_gsmode As String, ByRef p_kinou As Integer, ByRef p_rptkbn As String, ByRef p_kjday(,) As String) As Integer
        Dim sql As String
        '/* SQL文
        '/* レコードセット
        FNCL_P_GETKJDAY = 0
        '**********************************************************************
        '*    基準日取得SQL作成
        '**********************************************************************
        Select Case p_gsmode
            Case "1"
                '// 通常
                '/////////////////////////////////////////////
                sql = "SELECT ISSUE_DATE - 1"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                sql = sql & " GROUP BY ISSUE_DATE"
                ReDim w_orapara(2, 0)
                w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                w_orapara(1, 0) = "2"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, p_kjday) = False Then
                    FNCL_P_GETKJDAY = 1
                End If
            Case "6"
                '// 発令処理
                '/////////////////////////////////////////////
                sql = "SELECT ISSUE_DATE - 1"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3024220_W"
                sql = sql & " WHERE CUSTOMER_ID = :ORA_0"
                sql = sql & " GROUP BY ISSUE_DATE"
                ReDim w_orapara(2, 0)
                w_orapara(0, 0) = SessionAsStr("SG_P_RID")
                w_orapara(1, 0) = "2"
                If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, p_kjday) = False Then
                    FNCL_P_GETKJDAY = 1
                End If
        End Select
    End Function

    '**********************************************************************
    '*  基準日を条件とした社員の取得
    '**********************************************************************
    Function FNCL_P_GETKJDAYSCD(ByRef p_gsmode As String, ByRef p_kinou As Integer, ByRef p_rptkbn As String, ByRef p_kjday As String, ByRef p_scd(,) As String) As Integer
        Dim sql As String           '/* SQL文
        FNCL_P_GETKJDAYSCD = 0
        '**********************************************************************
        '*    基準日取得SQL作成
        '**********************************************************************
        Select Case p_gsmode
            Case "6"
                '// 発令処理
                '/////////////////////////////////////////////
                sql = "DELETE FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                DBOBJ.DbExecuteSQL(sql)
                sql = ""
                sql = sql & " INSERT INTO " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                sql = sql & " ("
                sql = sql & "     EMP_CODE,ANOTHER_POST_DIV"
                sql = sql & " )"
                sql = sql & " SELECT EMP_CODE,'0'"
                sql = sql & " FROM     " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP3024220_W A"
                sql = sql & " WHERE CUSTOMER_ID = " & SessionAsStr("SG_P_RID")
                sql = sql & "   AND ISSUE_DATE = TO_DATE('" & p_kjday & "','YYYY/MM/DD') + 1"
                sql = sql & " GROUP BY EMP_CODE"
                sql = sql & " ORDER BY EMP_CODE"
                DBOBJ.DbExecuteSQL(sql)
                sql = "SELECT EMP_CODE,0,ANOTHER_POST_DIV"
                sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0011020_W_" & SessionAsStr("SG_P_RID")
                sql = sql & " ORDER BY EMP_CODE"
                If P000S011.FNCG_P_RECORDSET1(3, sql, p_scd) = False Then
                    FNCL_P_GETKJDAYSCD = 1
                End If
        End Select
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_SYAINFORMAT3
    '*  処理：各個人情報照会
    '*  内容：各データの表示書式設定（付加文字なし、単位なし）
    '*  備考：FNCG_P_SYAINFORMAT2を修正時は同じ修正を行う
    '*      ：「P001S001.aspx」の「FNCG_P_SYAINFORMAT3()」が元
    '*  引数：[I] p_data -- 対象データ
    '*      ：[I] p_fmtkbn -- 01：社員番号,02：日付,03:計算項目,04～05:所属名称,06:xx年xxヶ月,11～19:0詰
    '*
    '*      ：[R] 処理結果文字列
    '*
    '*  作成：000-VerP1.3  2004/01/22 Y.Y
    '*  履歴：001-VerP2.1  2004/07/07 Y.Y カンマ編集処理
    '*  履歴：002-VerP2.1  2004/07/08 Y.Y 異動の滞留年・月・年月不具合対応
    '*  履歴：003-VerP3.02 2005/12/16 M.I E100136 滞留年数１年未満表示不具合対応
    '*  履歴：004-VerP3.0f 2006/10/24 M.I E100429 年月項目１年未満表示不具合対応（単位なし版）
    '*  履歴：005-VerP4.0e 2009/12/09 M.I【修正504】E101360 テーブル情報関連の不具合対応
    '*  履歴：006-VerP4.2  2011/11/16 M.N【改善P-11-004】英語対応
    '*　履歴：007-VerP4.3  2012/01/12 H.N【改善W-11-008】就業投資改善対応
    '**********************************************************************
    Function FNCL_P_SYAINFORMAT3(ByRef p_data As String, ByRef p_fmtkbn As String) As String
        Dim w_value As String
        Dim w_iti As Integer
        Dim w_nen As String
        Dim w_nen2 As String
        Dim w_tuki As String
        w_value = ""
        If Not IsNull(P000S001.FNCG_P_NZ(p_data)) Then
            Select Case p_fmtkbn
                Case "01"
                    '** [社員番号](0詰め)
                    w_value = P000S001.FNCG_P_SCDFMT(p_data)
                Case "02"
                    '** 日付編集
                    If p_data = "未登録" OrElse p_data = "Unregistered" Then
                        '*** 言語を追加した場合は、各言語分の判断条件を追加すること
                        w_value = p_data
                    Else
                        w_value = P000S001.FNCG_P_FORMATDATE(p_data, SessionAsStrArray("SG_P_001INF")(2))
                    End If
                Case "04", "05"
                    '** 所属名称
                    w_value = P000S024.FNCG_P_KAISYAKBN(p_data)
                Case "06"
                    '** xx年xxヶ月
                    w_iti = InStr(1, p_data, ".", 0)
                    Select Case w_iti
                        Case 0
                            w_value = p_data
                        Case 1
                            w_value = "0." & Left(Mid(p_data, w_iti + 1) & "0", 2)
                        Case Else
                            w_value = Mid(p_data, 1, w_iti) & Left(Mid(p_data, w_iti + 1) & "0", 2)
                    End Select
                Case "07"
                    '** xx/xx
                    Select Case GetLength(p_data)
                        Case 3
                            w_value = "0" & Mid(p_data, 1, 1) & "/" & Mid(p_data, 2)
                        Case 4
                            w_value = Mid(p_data, 1, 2) & "/" & Mid(p_data, 3)
                    End Select
                Case "08"
                    '** [受付番号](0詰め)
                    w_value = P000S001.FNCG_P_UCDFMT(p_data)
                Case "32"
                    '** 通貨
                    w_value = P000S001.FNCG_P_TUUKAFORMAT(p_data)
                Case "33", "L3"
                    '** 小数
                    Select Case Mid(p_data, 1, 1)
                        Case "."
                            w_value = "0" & p_data
                        Case "-"
                            If Mid(p_data, 2, 1) = "." Then
                                w_value = "-0." & Mid(p_data, 3)
                            Else
                                w_value = w_value & p_data
                            End If
                        Case Else
                            w_value = w_value & p_data
                    End Select
                Case "34"
                    '** 時刻
                    w_value = P000S001.FNCG_P_NUM2TIME_MINUS(p_data)
                Case "13", "14"
                    '** 0詰め項目(２バイト目が0詰め数)
                    w_value = P000S001.FNCG_P_ZEROCD(p_data, CInt(Mid(p_fmtkbn, 2)))
                Case "51", "52", "53", "56", "57", "58", "81", "82", "83"
                    '** xx年xxヶ月
                    w_iti = InStr(1, p_data, ".", 0)
                    w_nen = ""
                    w_tuki = ""
                    Select Case w_iti
                        Case 0
                            w_nen = p_data
                            w_tuki = "0"
                        Case 1
                            w_nen = "0"
                            w_tuki = Left(Mid(p_data, w_iti + 1) & "0", 2)
                        Case Else
                            w_nen = Mid(p_data, 1, w_iti - 1)
                            w_tuki = Left(Mid(p_data, w_iti + 1) & "0", 2)
                    End Select
                    Select Case p_fmtkbn
                        Case "51", "56", "81"
                            If w_nen = "0" Then
                                '***w_value = w_tuki
                                If w_tuki = "0" Then
                                    w_value = "0"
                                Else
                                    w_value = "0." & w_tuki
                                End If
                            Else
                                w_value = w_nen & "." & w_tuki
                            End If
                        Case "52", "57"
                            w_value = w_nen
                        Case "53", "58"
                            w_value = w_tuki
                    End Select
                Case "61", "66"
                    '** xx歳xxヶ月
                    w_iti = InStr(1, p_data, ".", 0)
                    w_nen = ""
                    w_nen2 = ""
                    w_tuki = ""
                    Select Case w_iti
                        Case 0
                            w_nen = p_data
                            w_nen2 = p_data
                        Case 1
                            w_tuki = Left(Mid(p_data, w_iti + 1) & "0", 2)
                        Case Else
                            w_nen = Mid(p_data, 1, w_iti - 1)
                            w_tuki = Left(Mid(p_data, w_iti + 1) & "0", 2)
                            w_nen2 = p_data
                    End Select
                    If IsNull(P000S001.FNCG_P_NZ(w_nen)) Then
                        w_value = "0." & w_tuki
                    ElseIf IsNull(P000S001.FNCG_P_NZ(w_tuki)) Then
                        w_value = w_nen
                    Else
                        w_value = w_nen & "." & w_tuki
                    End If
                Case "62", "63", "64", "67", "68", "69"
                    '** xx歳xxヶ月
                    Select Case p_fmtkbn
                        Case "62", "67"
                            w_value = p_data
                        Case "63", "68"
                            w_value = p_data
                        Case "64", "69"
                            w_value = p_data
                    End Select
                Case Else
                    w_value = p_data
            End Select
        Else
            w_value = p_data
        End If
        FNCL_P_SYAINFORMAT3 = w_value
    End Function

    '**********************************************************************
    '*  名称：FNCL_P_MST_NAVALUEGET
    '*  処理：マスタ
    '*  内容：マスタ名称値取得関数
    '*  備考：「P011S001.aspx」の「FNCG_P_MST_NAVALUEGET」が元
    '*    引数：[I] p_skbn -- 処理区分（1=名称取得）
    '*        ：[I] p_id   -- マスタID(WEB_TP0110210_M[ID])
    '*        ：[I] p_para1 -- パラメータ１
    '*        ：[I] p_para2 -- パラメータ２
    '*        ：[I] p_para3 -- パラメータ３
    '*        ：[I] p_para4 -- パラメータ４
    '*        ：[I] p_para5 -- パラメータ５
    '*
    '*        ：[R] 結果内容
    '*
    '*  作成：000-VerP2.12 2004/08/05 T.M
    '*  履歴：
    '**********************************************************************
    Function FNCL_P_MST_NAVALUEGET(ByRef p_skbn As Integer, ByRef p_id As String, ByRef p_field As String, ByRef p_date As String, ByRef p_psu As Integer, ByRef p_para1 As String, ByRef p_para2 As Integer, ByRef p_para3 As Integer, ByRef p_para4 As Integer, ByRef p_para5 As Integer) As String
        Dim sql As String
        Dim w_dbdata(,) As String = Nothing
        sql = "SELECT "
        Select Case p_skbn
            Case 1
                Select Case p_id
                    Case "251"
                        '*** 賞与名
                        sql = sql & " SYOYOME"
                        sql = sql & " FROM SYOYOME_MS"
                        sql = sql & " WHERE KAISYACD(+)=:ORA_0"
                        sql = sql & "   AND SYOYOCD=:ORA_1"
                    Case "252"
                        '*** 給与計算グループ
                        sql = sql & " KYKSNGME"
                        sql = sql & " FROM KYKSGRP_MS"
                        sql = sql & " WHERE KAISYACD(+)=:ORA_0"
                        sql = sql & "   AND KYKSNGRP=:ORA_1"
                End Select
            Case 2
            Case 3
                sql = p_id
        End Select
        ReDim w_orapara(2, p_psu - 1)
        w_orapara(0, 0) = p_para1
        w_orapara(1, 0) = "1"
        If p_psu > 1 Then
            w_orapara(0, 1) = CStr(p_para2)
            w_orapara(1, 1) = "1"
        End If
        If P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, w_dbdata) = True Then
            FNCL_P_MST_NAVALUEGET = w_dbdata(0, 0)
        Else
            FNCL_P_MST_NAVALUEGET = ""
        End If
    End Function

    '**********************************************************************
    '*  名称    ：FNCL_P_STR_CUT
    '*  処理    ：文字列を配列分割する処理
    '*  内容    ：
    '*  備考    ：P000S001.aspx FNCG_P_STR_CUT
    '*  引数    ：[I] pStr -- 文字列
    '*        ：[I] pLen -- 分割バイト数
    '*
    '*        ：[R] 処理済データ
    '*
    '*  作成    ：000-Ver7.0  2002/10/01 Y.Y
    '*  履歴    ：
    '**********************************************************************
    Function FNCL_P_STR_CUT(ByRef pStr As String, ByRef pLen As Double) As String()
        Dim p_i As Integer
        Dim p_k As Integer
        Dim p_cnt As Integer
        Dim p_data As String() = Nothing
        Dim p_len As Double
        p_i = 1
        p_k = 0
        p_cnt = 0
        p_len = pLen / 2
        If IsNull(pStr) OrElse IsNull(pStr) = True Then
            ReDim p_data(-1)
        Else
            Do
                If IsNull(Mid(pStr, p_i, CInt(FNCL_P_DIVISION_TEXT(pStr, p_len, p_i)))) Then
                    Exit Do
                End If
                If p_k = 0 Then
                    ReDim p_data(0)
                Else
                    ReDim Preserve p_data(p_k)
                End If
                p_data(p_k) = Mid(pStr, p_i, CInt(FNCL_P_DIVISION_TEXT(pStr, p_len, p_i)))
                p_k = p_k + 1
                p_i = p_i + CInt(FNCL_P_DIVISION_TEXT(pStr, p_len, p_i))
            Loop
        End If
        FNCL_P_STR_CUT = p_data
    End Function

    '**********************************************************************
    '*  名称    ：FNCL_P_DIVISION_TEXT
    '*  処理    ：文字列の取得最大文字数の取得処理
    '*  内容    ：区切る文字が全角か半角か判断する
    '*  備考    ：P000S001.aspx FNCG_P_DIVISION_TEXT
    '*  引数    ：[I] p_text  -- 対象文字列（対象項目の値）
    '*        ：[I] p_max   -- 最大文字数（全角文字での画面表示幅の最大値）
    '*        ：[I] p_start -- 開始文字位置（対象文字列の処理開始位置）
    '*
    '*        ：[R] 取得文字数
    '*
    '*  作成    ：000-Ver7.0  2002/10/01 Y.Y
    '*  履歴    ：
    '**********************************************************************
    Function FNCL_P_DIVISION_TEXT(ByRef p_text As String, ByRef p_max As Double, ByRef p_start As Integer) As Double
        Dim p_keta As Double
        Dim i_count As Integer
        Dim w_len As Integer
        p_keta = p_max
        If IsNull(p_text) OrElse IsNull(p_text) = True Then
            '対象文字列がNULLの場合
            p_keta = 0
        Else
            i_count = P000S001.FNCG_P_LENB(Mid(p_text, p_start, CInt(p_keta)))
            Do
                p_keta = p_keta + 1
                w_len = P000S001.FNCG_P_LENB(Mid(p_text, p_start, CInt(p_keta)))
                If (p_max * 2) < w_len Then
                    p_keta = p_keta - 1
                    Exit Do
                Else
                    If i_count = w_len Then
                        Exit Do
                    End If
                    i_count = w_len
                End If
            Loop
        End If
        FNCL_P_DIVISION_TEXT = p_keta
    End Function
    '**********************************************************************
    '//**    ミドルネーム使用区分取得
    '**********************************************************************
    Sub SUBL_P_GETMIDNAME_FLG(ByRef w_midname_flg As String)
        Dim w_orapara(,) As String '*** SQL
        Dim p_wdata(,) As String = Nothing
        w_ENVIR_001_chg = False
        If SessionAsStrArray("SG_P_ALLKENGEN")(2) = "2" Then
            '*** 全社参照
            sql = "SELECT"
            sql = sql & " NVL(NVL(BL.CONF_VALUE,AL.CONF_VALUE),NVL(B.CONF_VALUE,A.CONF_VALUE)) CONF_VALUE"
            sql = sql & " FROM " & SessionAsStr("SG_C_DBUSER1") & " WEB_TP0001020_M A,"
            sql = sql & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0001021_M B,"
            sql = sql & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0001022_M AL,"
            sql = sql & SessionAsStr("SG_C_DBUSER1") & "WEB_TP0001023_M BL"
            sql = sql & " WHERE A.DIV1 = 0"
            sql = sql & "   AND A.DIV2 = 0"
            sql = sql & "   AND A.DIV3 = 0"
            sql = sql & "   AND A.IDENTIFIER = :ORA_2"
            sql = sql & "   AND B.KAISYACD(+) = :ORA_1"
            sql = sql & "   AND A.DIV1 = B.DIV1(+)"
            sql = sql & "   AND A.DIV2 = B.DIV2(+)"
            sql = sql & "   AND A.DIV3 = B.DIV3(+)"
            sql = sql & "   AND A.IDENTIFIER = B.IDENTIFIER(+)"
            sql = sql & "   AND A.DIV1 = AL.DIV1(+)"
            sql = sql & "   AND A.DIV2 = AL.DIV2(+)"
            sql = sql & "   AND A.DIV3 = AL.DIV3(+)"
            sql = sql & "   AND A.IDENTIFIER = AL.IDENTIFIER(+)"
            sql = sql & "   AND AL.LANG_ID(+) = TO_NUMBER(NVL(WEB_SP0002003_F(2,5,:ORA_0),0))"
            sql = sql & "   AND A.DIV1 = BL.DIV1(+)"
            sql = sql & "   AND A.DIV2 = BL.DIV2(+)"
            sql = sql & "   AND A.DIV3 = BL.DIV3(+)"
            sql = sql & "   AND A.IDENTIFIER = BL.IDENTIFIER(+)"
            sql = sql & "   AND BL.KAISYACD(+) = :ORA_1"
            sql = sql & "   AND BL.LANG_ID(+) = TO_NUMBER(NVL(WEB_SP0002003_F(2,5,:ORA_0),0))"
            sql = sql & " ORDER BY A.IDENTIFIER"
            ReDim w_orapara(2, 2)
            w_orapara(0, 0) = SessionAsStr("SG_P_RID")
            w_orapara(1, 0) = "2"
            w_orapara(0, 1) = "0"
            w_orapara(1, 1) = "101"
            w_orapara(0, 2) = "108"
            w_orapara(1, 2) = "2"
            If Not P000S011.FNCG_P_RECORDSET5(1, sql, w_orapara, p_wdata) Then
            End If
            w_midname_flg = p_wdata(0, 0)
            w_fdata7 = SessionAsStrArray("SG_P_ENVIR_001")
            w_midname_flg_old = w_fdata7(108)
            w_fdata7(108) = w_midname_flg
            Session.Add("SG_P_ENVIR_001", w_fdata7)
            w_ENVIR_001_chg = True
        Else
            '*** 自社参照
            w_midname_flg = P000S001.FNCG_P_NULL2ZERO(SessionAsStrArray("SG_P_ENVIR_001")(108)) '*** ミドルネーム使用区分取得
        End If
    End Sub
</script>
