#-*- coding: utf-8 -*- 
import zipfile

'''
パスワードつきzipファイルを所定フォルダに展開する
memo:
'''
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
                    raise unideco_err
                except Exception as allex:
                    raise allex
                
                zip_file.extract(file, path=extract_target, pwd=_password)
