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

    try:
        for file in file_list:
            with zipfile.ZipFile(file, 'r') as zip_file:
                for file in zip_file.infolist():
                    if file.filename.endswith('.xlsx') | file.filename.endswith('.txt'):
                        file.filename = file.filename.encode('cp437').decode('cp932')

                    zip_file.extract(file, path=expansions_target, pwd=_password)
    except Exception as error:
        return error

# read text
def read_text(file_path):
    dict_data = {'title':'',
    'type':'',
    'version':'',
    'product':'',
    'description:':'',
    'bugfix':''
    }

    with open(file_path, encoding='shift-jis') as opend_file:
        _title_range_flg = False

        for row in opend_file.readlines():
            row_striped = row.strip()

            # title
            if row_striped.startswith('■' + '-' * 20) & row_striped.endswith('-' * 20 + '■'):
                if _title_range_flg is False:
                    _title_range_flg = True
                    continue
                else:
                    _title_range_flg = False

            if _title_range_flg:
                dict_data['title'] = dict_data['title']  + row_striped

                # type
                if '【不具合情報】' in row_striped or '【共通情報】' in row_striped:
                    _word_top = row_striped.find('【不具合情報】') + 7


                continue



            # version
            # product
            # description
            # bugfix
        print(dict_data['title'])
        return dict_data

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

    _expansions_target = 'decompress'
    _password = 'password'

    try:
        unzip(zip_paths, _password, _expansions_target)
    except Exception as error:
        print(error)
        sys.exit()
    
    # get path list of folder made by decompress function
    expansions_dir_path = os.path.join(_current_dir, _expansions_target)
    exp_dir = pathlib.Path(expansions_dir_path)
    unzip_folders = [p for p in exp_dir.iterdir() if p.is_dir()]
    
    for folder in unzip_folders:
        files = get_file_path_list(str(folder),_txt_extension,_xl_extension)
        
        for file in files:
            if file.endswith('.txt'):
                x = read_text(file)
