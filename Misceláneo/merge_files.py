import os;

# Script que sirve para combinar varios archivos de texto (o con representación de texto) en uno solo

def get_dir_files(dir):
    all_files = os.listdir(dir)
    txt_files = []
    for file in all_files:
        full_path = os.path.join(dir, file)
        txt_files.append(full_path)
    return txt_files

def get_united_file(all_files):
    with open(os.getcwd() + r'\combinado.txt', 'w') as outfile:
        for file in all_files:
            with open(file) as infile:
                outfile.write(os.path.basename(infile.name).upper() + ' ///\n');
                outfile.write(infile.read() + '\n')
                
def main():
    dir_path = os.getcwd();
    all_files = get_dir_files(dir_path)
    get_united_file(all_files)
if __name__ == '__main__':
    main()
