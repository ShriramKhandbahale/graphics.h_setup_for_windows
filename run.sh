#! /usr/bin/bash

FILE_NAME=#your_file_name_without_the_extension

g++ $FILE_NAME".cpp" -o $FILE_NAME".exe" -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32 && ./$FILE_NAME".exe"