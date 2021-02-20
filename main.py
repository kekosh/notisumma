import glob
import os
import zipfile

# get zip file path list
def get_path_list(dir, extension):
    _path_list = glob.glob(dir + f'\\**.{extension}', recursive=True)
    return _path_list

# unzip compressed files
def unzip(file_list, password, expansions):
    _password = bytes(password,encoding='utf-8')

    try:
        for file in file_list:
            with zipfile.ZipFile(file, 'r') as zip_file:
                for file in zip_file.infolist():
                    if file.filename.endswith('.xlsx') | file.filename.endswith('.txt'):
                        file.filename = file.filename.encode('cp437').decode('cp932')

                    zip_file.extract(file, path=expansions, pwd=_password)
    except Exception as error:
        return error

# read text

# red Excel

# create Excel file(output)

# init
if __name__ == '__main__':
    _comp_extension = 'zip'
    _msg_extension = 'txt'
    _xl_extension = 'xlsx'
    _dl_zip_dirname = 'sample' 
    
    _current_dir = os.getcwd()
    _zip_dir = os.path.join(_current_dir, _dl_zip_dirname)

    zip_path_list = get_path_list(_zip_dir, _comp_extension)

    _expansions = 'decompress'
    _password = 'password'

    print(unzip(zip_path_list, _password, _expansions))