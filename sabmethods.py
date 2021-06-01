# -*- coding: utf-8 -*-
import chardet
import glob


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
    
if __name__ == '__main__':
    
    # filepath = input("target file path:")
    # check_file_encode(filepath)

    # dir = r""
    # result = get_filepath_list(dir,"xlsx","txt")
    # print(result)
    pass