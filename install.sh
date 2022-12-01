#! /usr/bin/bash

# downloading and transferring the files to the location
if [[ $(git clone https://github.com/ShriramKhandbahale/graphics.h_setup_for_windows.git) ]]; then
    cd graphics.h_setup_for_windows
    mv -t C:\\MinGW\\include\\ graphics.h winbgim.h
    mv libbgi.a C:\\MinGW\\lib\\
fi

USER_NAME=$(whoami)

# editing the settings.json configuration
# if the script founds  C++ code-runner.executorMap, it will update the map with arguments
if [[ ! $(cat C:/Users/$USER_NAME/AppData/Roaming/Code/User/settings.json | grep '"c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt"') ]]; then

    sed -i 's/"cpp": "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",/"cpp": "cd $dir && g++ $fileName -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32 -o $fileNameWithoutExt && $dir$fileNameWithoutExt",/' C:/Users/$USER_NAME/AppData/Roaming/Code/User/settings.json

# if script was unable to find C++ code-runner.executorMap, it will print a code on console and open the settings.json file for you, then you will have to manually paste the code in settings.json at EOF before the closing brace, with a comma at the end of previous statement
else
    echo -e "\nAdd the following code to the end of settings.json file\nbefore the closing brace, with a quama at the end of previous statement\n\n"
    sleep 1
    echo -e '"code-runner.executorMap": {\n'
    echo '    "cpp": "cd $dir && g++ $fileName -lbgi -lgdi32 -lcomdlg32 -luuid -loleaut32 -lole32 -o $fileNameWithoutExt && $dir$fileNameWithoutExt"'
    echo -e '\n}'
    sleep 3
    start C:/Users/$USER_NAME/AppData/Roaming/Code/User/settings.json
    exit 1

    # rm install.sh
fi
