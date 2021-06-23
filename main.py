# -*- coding: utf-8 -*-
import os
import sys
import pathlib

import setting
import unzip
import sabmethods
import readtxt
import manageXL

# init
if __name__ == '__main__':
    _comp_extension = setting.COMP_EXTENSION
    _txt_extension = setting.TXT_EXTENSION
    _xl_extension = setting.XL_EXTENSION
    _dl_zip_dirname = setting.DL_ZIP_DIRNAME
    _extract_target = setting.EXTRACT_TARGET_DIRNAME
    _password = setting.PASSWORD
    _current_dir = os.getcwd()
    _base_xlfile = os.path.join(os.getcwd(), _dl_zip_dirname, setting.UPDATE_TARGET_XLFILE)

    # zipファイル格納先パスを作成
    zip_dir = os.path.join(_current_dir, _dl_zip_dirname)

    # --------------------------------------------------------------------
    # 格納されているzipファイルのパスリストを作成
    zip_paths = sabmethods.get_filepath_list(zip_dir,_comp_extension)
    if not zip_paths:
        print('No zip file.')
        sys.exit()

    # zipファイル展開
    try:
        unzip.unzip(zip_paths, _password, _extract_target)
    except Exception as error:
        print(error)
        sys.exit()
    
    # zipファイル展開先パスを作成
    extract_dir_path = os.path.join(_current_dir, _extract_target)
    
    # zipから展開されたフォルダのパスリストを作成
    ext_dir = pathlib.Path(extract_dir_path)
    unzip_folders = [p for p in ext_dir.iterdir() if p.is_dir()]
    
    list_read_data = []
    for folder in unzip_folders:

        # まとめExcelファイルの有無により取得元を分岐(ない場合はテキストファイル)
        if sabmethods.has_conclusion_file(folder):
            pass


        else:
            # 処理対象拡張子のファイルパスを取得
            files = sabmethods.get_filepath_list(str(folder), _txt_extension)
            for file in files:
                if file.endswith('.txt'):
                    list_read_data.append(readtxt.read_text(file))
            
    try:
        manageXL.create_xlbook(list_read_data,_base_xlfile)
    except Exception as exc:
        print(exc)
        sys.exit()