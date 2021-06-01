# -*- coding: utf-8 -*-
import os
import sys
import pathlib

import unzip
import sabmethods
import readtxt
import manageXL

# init
if __name__ == '__main__':
    _comp_extension = 'zip'
    _txt_extension = 'txt'
    _xl_extension = 'xlsx'
    _dl_zip_dirname = 'sample'
    _extract_target = 'extract'
    _password = 'password'
    _current_dir = os.getcwd()
    _base_xlfile = os.path.join(os.getcwd(),'sample\\POS関連情報.xlsx')

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
        files = sabmethods.get_filepath_list(str(folder),_txt_extension,_xl_extension)

        for file in files:
            if file.endswith('.txt'):
                list_read_data.append(readtxt.read_text(file))
                
            
    # test
    try:
        manageXL.create_xlbook(list_read_data,_base_xlfile)
    except Exception as exc:
        print(exc)
        sys.exit()