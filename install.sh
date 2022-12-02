#! /usr/bin/bash

clear

# downloading and transferring the files to the location
git clone https://github.com/ShriramKhandbahale/graphics.h_setup_for_windows.git
cd graphics.h_setup_for_windows
mv -t C:\\MinGW\\include\\ graphics.h winbgim.h && echo 'moving graphics.h and winbgim.h to C:/MinGW/include/'
mv libbgi.a C:\\MinGW\\lib\\ && echo 'moving libbgi.a to C:/MinGW/lib/'

USER_NAME=$(whoami)

# editing the settings.json configuration
echo -e "\nAdd the following code to the end of settings.json file\nbefore the closing brace, with a quama at the end of previous statement\n\n"
sleep 1
echo -e '"code-runner.executorMap": {\n'
echo '    "cpp": "cd $dir && g++ $fileName -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32 -o $fileNameWithoutExt && $dir$fileNameWithoutExt"'
echo -e '\n}\n'
sleep 3 && echo opening file C:/Users/$USER_NAME/AppData/Roaming/Code/User/settings.json && sleep 2
start C:/Users/$USER_NAME/AppData/Roaming/Code/User/settings.json
