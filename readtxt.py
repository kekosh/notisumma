# -*- coding: utf-8 -*-

import sys
import sabmethods

'''
テキストファイルないのデータを読み込む
memo:作成中
'''
def read_text(file_path):
    dict_data = {'title':'',
    'category':'',
    'version':'',
    'product':'',
    'description':''
    }

    LIST_INFO_CATEGORY = ['不具合情報','共通情報','制度変更対応パッチ']
    VERSION_WORD = '(Ver'

    # データ読み込み前にバイトタイプで開いて文字コードを判定
    enctype = sabmethods.check_file_encode(file_path)
    
    with open(file_path, encoding=enctype, errors='strict', newline='\n') as opend_file:
        _title_range_flg = False
        _version_flg = False
        _description_flg = False
        _is_bugfix = False
        _w_rows = ""

        try:
            for row in opend_file.readlines():
                row_striped = row.strip()

                # title
                if row_striped.startswith('■' + '-' * 20) & row_striped.endswith('-' * 20 + '■'):
                    if _title_range_flg is False:
                        _title_range_flg = True
                        continue
                    else:
                        _title_range_flg = False
                        continue

                if _title_range_flg:
                    # [memo]タイトル複数行の場合
                    dict_data['title'] = dict_data['title']  + row_striped

                    # product
                    # category
                    # version
                    for category in LIST_INFO_CATEGORY:
                        _category_name = '【' + category + '】'
                        if _category_name in row_striped:
                            if category == '不具合情報':
                                dict_data['category'] = category[0:3]
                                _word_top = row_striped.find(_category_name) + 7
                                _word_last = row_striped.find(VERSION_WORD)
                                _is_bugfix = True

                                dict_data['product'] = row_striped[_word_top:_word_last]
                                
                                _version_top = row_striped.find(VERSION_WORD)
                                _version_last = row_striped.find(')：')
                                dict_data['version'] = row_striped[_version_top:_version_last].replace(VERSION_WORD,'')
                            else:
                                dict_data['category'] = '共通情報'
                                dict_data['product'] = '共通'
                                dict_data['version'] = row_striped[row_striped.find('-')+1:row_striped.find('>')]
                                _is_bugfix = False
                    continue

                # description
                if _is_bugfix:
                    if  row_striped.startswith('＜現象内容＞'):
                        _w_rows += row_striped + '\n'
                        _description_flg = True
                        continue

                    if row_striped.startswith('＜適用方法＞'):
                        _description_flg = False
                        break

                    if _description_flg:
                        _w_rows += row_striped + '\n'
                else:
                    if _title_range_flg == False:
                        _w_rows += row_striped + '\n'

            dict_data['description'] = _w_rows.strip()
            return dict_data

        except Exception as error:
            print(error)
            sys.exit()