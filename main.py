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
def unzip(file_list, password, extract_target):
    _password = bytes(password,encoding='utf-8')

    for file in file_list:
        with zipfile.ZipFile(file, 'r') as zip_file:
            for file in zip_file.infolist():
                try:
                    '''
                    windowsでは"/"が"\"に置換されるため、「.filename」ではなく置換される前のデータが格納されている
                    「.orig_filename」を使用。
                    '''
                    file.filename = file.orig_filename.encode('cp437').decode('cp932')
                except UnicodeDecodeError as unideco_err:
                    print(unideco_err)

                zip_file.extract(file, path=extract_target, pwd=_password)


# read text
def read_text(file_path):
    dict_data = {'title':'',
    'category':'',
    'version':'',
    'product':'',
    'description:':''
    }

    LIST_INFO_CATEGORY = ['不具合情報','共通情報']
    AFTER_WORD_INFO_KEY = '(Ver'

    with open(file_path, encoding='shift-jis', errors='strict', newline='\n') as opend_file:
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
                    dict_data['title'] = dict_data['title']  + row_striped

                    # product
                    # category
                    for category in LIST_INFO_CATEGORY:

                        _category_name = '【' + category + '】'
                        if _category_name in row_striped:

                            if category == '不具合情報':
                                _word_top = row_striped.find(_category_name) + 7
                                _is_bugfix = True
                            else:
                                _word_top = row_striped.find(_category_name) + 6
                                _is_bugfix = False

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
                    continue

                # description
                if _is_bugfix:
                    if  row_striped.startswith('＜現象内容＞'):
                        _description_flg = True
                        continue

                    if row_striped.startswith('＜適用方法＞'):
                        dict_data['description'] = _w_rows
                        _description_flg = False
                        break

                    if _description_flg:
                        _w_rows += row_striped + '\n'
                



                # bugfix
            
            # print('category:', dict_data['category'])
            # print('title:', dict_data['title'])
            # print('product:', dict_data['product'])
            # print('version:', dict_data['version'])
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
    _extract_target = 'extract'
    _password = 'password'
    _current_dir = os.getcwd()

    # zipファイル格納先パスを作成
    zip_dir = os.path.join(_current_dir, _dl_zip_dirname)
    
    # 格納されているzipファイルのパスリストを作成
    zip_paths = get_file_path_list(zip_dir, _comp_extension)

    if not zip_paths:
        print('No zip file.')
        sys.exit()

    # zipファイル展開
    try:
        unzip(zip_paths, _password, _extract_target)
    except Exception as error:
        print(error)
        sys.exit()
    
    # zipファイル展開先パスを作成
    extract_dir_path = os.path.join(_current_dir, _extract_target)
    
    # zipから展開されたフォルダのパスリストを作成
    ext_dir = pathlib.Path(extract_dir_path)
    unzip_folders = [p for p in ext_dir.iterdir() if p.is_dir()]
    
    for folder in unzip_folders:
        files = get_file_path_list(str(folder),_txt_extension,_xl_extension)
        
        for file in files:
            if file.endswith('.txt'):
                x = read_text(file)

            from pprint import pprint
            print('-' * 50)
            print(x['description'])
