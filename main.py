import glob
import os
import sys
import zipfile
import pathlib

# get zip file path list
def get_file_path_list(dir, *args):
    _path_list = []
    for extension in args:
        [_path_list.append(p) for p in glob.glob(dir + f'\\**\\*.{extension}', recursive=True)]

    return _path_list

# unzip compressed files
def unzip(file_list, password, expansions_target):
    _password = bytes(password,encoding='utf-8')

    for file in file_list:
        with zipfile.ZipFile(file, 'r') as zip_file:
            for file in zip_file.infolist():
                try:
                    file.filename = file.orig_filename.encode('cp437').decode('cp932')
                except UnicodeDecodeError as unideco_err:
                    print(unideco_err)
                    return

                zip_file.extract(file, path=expansions_target, pwd=_password)
            return

# read text
def read_text(file_path):
    dict_data = {'title':'',
    'category':'',
    'version':'',
    'product':'',
    'description:':'',
    'bugfix':''
    }

    LIST_INFO_CATEGORY = ['不具合情報','共通情報']
    AFTER_WORD_INFO_KEY = '(Ver'

    with open(file_path, encoding='shift-jis', errors='strict') as opend_file:
        _title_range_flg = False
        _version_flg = False

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
                    dict_data['title'] = dict_data['title']  + row_striped

                    # product
                    # category
                    for category in LIST_INFO_CATEGORY:

                        _category_name = '【' + category + '】'
                        if _category_name in row_striped:

                            if category == '不具合情報':
                                _word_top = row_striped.find(_category_name) + 7
                            else:
                                _word_top = row_striped.find(_category_name) + 6 

                            _word_last = row_striped.find(AFTER_WORD_INFO_KEY)

                            dict_data['category'] = category
                            dict_data['product'] = row_striped[_word_top:_word_last]

                            continue

                # version
                if row_striped.startswith('＜対象バージョン＞'):
                    _version_flg = True
                    continue

                if _version_flg:
                    dict_data['version'] = row_striped.replace('Ver','')
                    _version_flg = False
                
                

                # description
                # bugfix
            
            return dict_data
        except Exception as error:
            print(error)

# red Excel

# create Excel file(output)

# init
if __name__ == '__main__':
    _comp_extension = 'zip'
    _txt_extension = 'txt'
    _xl_extension = 'xlsx'
    _dl_zip_dirname = 'sample'
    _current_dir = os.getcwd()

    zip_dir = os.path.join(_current_dir, _dl_zip_dirname)

    zip_paths = get_file_path_list(zip_dir, _comp_extension)
    if not zip_paths:
        print('No zip file.')
        sys.exit()

    _expansions_target = 'extract'
    _password = 'password'

    try:
        unzip(zip_paths, _password, _expansions_target)
    except Exception as error:
        print(error)
        sys.exit()
    
    # get path list of folder made by extract function
    expansions_dir_path = os.path.join(_current_dir, _expansions_target)
    exp_dir = pathlib.Path(expansions_dir_path)
    unzip_folders = [p for p in exp_dir.iterdir() if p.is_dir()]
    
    for folder in unzip_folders:
        files = get_file_path_list(str(folder),_txt_extension,_xl_extension)
        
        for file in files:
            if file.endswith('.txt'):
                x = read_text(file)
