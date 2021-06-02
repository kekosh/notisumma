# -*- coding: utf-8 -*-
import chardet
import glob
import os

'''
フォルダ内のファイルから指定した拡張子に該当するファイルのパスを取得する
memo:
'''
def get_filepath_list(dir, *args):
    pathlist = []
    try:
        for extension in args:
            [pathlist.append(path) for path in glob.glob(dir + f'\\**\\*.{extension}', recursive=True)]
    except Exception as ex:
        print(ex)
        raise
    
    return pathlist

'''
ファイルの文字エンコーディングを取得
memo: byteタイプで開く
'''
def check_file_encode(filepath):
    enctype = 'shift-jis'

    with open(filepath, "rb") as file:
        char = file.read()
        _encoding = chardet.detect(char)

        if enctype != _encoding['encoding']:
            enctype = _encoding['encoding']
        
        return enctype


def have_xl_file(file_list):
    for file in file_list:
        _file_name = os.path.basename(file)
        
        if "不具合情報一覧.xlsx" == _file_name:
            return file
        
    return ""


# for test
if __name__ == '__main__':
    files = ['D:\\MyFile\\arc\\venv\\notisumma\\extract\\KB24A020\\不具合.txt', 'D:\\MyFile\\arc\\venv\\notisumma\\extract\\KB24A020\\不具合情報一.xlsx']
    result = have_xl_file(files)
    print(result)
    # filepath = input("target file path:")
    # check_file_encode(filepath)

    # dir = r""
    # result = get_filepath_list(dir,"xlsx","txt")
    # print(result)
    pass
