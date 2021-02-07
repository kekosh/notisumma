import glob
import os
import zipfile


# ファイル展開処理
def unzip(filepath, extract_path, password):
    with zipfile.ZipFile(filepath, 'r') as zip_file:
        for fileinfo in zip_file.infolist():
            fileinfo.filename = fileinfo.filename.encode('cp437').decode('cp932')
            zip_file.extract(fileinfo ,path=extract_path, pwd=password.encode())


if __name__ == '__main__':
    _base_path = r'D:\work\venv\notisumma\sample'
    _extract_path = r'.\\ext'
    _password = 'password'

    # 拡張子が"zip"であるファイル一覧を取得
    zip_path_list = glob.glob(f'{_base_path}\**\*.zip',recursive=True)

    for f_path in zip_path_list:
        unzip(f_path, _extract_path, _password)
