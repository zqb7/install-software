#!/usr/bin/env bash

fileUrl="https://vscode.download.prss.microsoft.com/dbazure/download/stable/b58957e67ee1e712cebf466b995adf4c5307b2bd/code-stable-x64-1714529314.tar.gz"
fileName=`echo $fileUrl|awk -F "/" '{print $NF}'`

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $fileUrl -O $fileName \
    && chmod 666 ${fileName} \
    && ${SUDO} tar --no-same-owner -zxvf $fileName -C /opt/

    if [ $? -ne 0 ];then
        echo "install faild"
        exit 1
    fi

    # 桌面图标
cat <<EOF > vscode.svg
<svg width="256" height="256" viewBox="0 0 256 256" fill="none" xmlns="http://www.w3.org/2000/svg">
<mask id="mask0" mask-type="alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="256" height="256">
<path fill-rule="evenodd" clip-rule="evenodd" d="M181.534 254.252C185.566 255.823 190.164 255.722 194.234 253.764L246.94 228.403C252.478 225.738 256 220.132 256 213.983V42.0181C256 35.8689 252.478 30.2638 246.94 27.5988L194.234 2.23681C188.893 -0.333132 182.642 0.296344 177.955 3.70418C177.285 4.191 176.647 4.73454 176.049 5.33354L75.149 97.3862L31.1992 64.0247C27.1079 60.9191 21.3853 61.1735 17.5855 64.63L3.48936 77.4525C-1.15853 81.6805 -1.16386 88.9926 3.47785 93.2274L41.5926 128L3.47785 162.773C-1.16386 167.008 -1.15853 174.32 3.48936 178.548L17.5855 191.37C21.3853 194.827 27.1079 195.081 31.1992 191.976L75.149 158.614L176.049 250.667C177.645 252.264 179.519 253.467 181.534 254.252ZM192.039 69.8853L115.479 128L192.039 186.115V69.8853Z" fill="white"/>
</mask>
<g mask="url(#mask0)">
<path d="M246.94 27.6383L194.193 2.24138C188.088 -0.698302 180.791 0.541721 175.999 5.33332L3.32371 162.773C-1.32082 167.008 -1.31548 174.32 3.33523 178.548L17.4399 191.37C21.2421 194.827 26.9682 195.081 31.0619 191.976L239.003 34.2269C245.979 28.9347 255.999 33.9103 255.999 42.6667V42.0543C255.999 35.9078 252.478 30.3047 246.94 27.6383Z" fill="#0065A9"/>
<g filter="url(#filter0_d)">
<path d="M246.94 228.362L194.193 253.759C188.088 256.698 180.791 255.458 175.999 250.667L3.32371 93.2272C-1.32082 88.9925 -1.31548 81.6802 3.33523 77.4523L17.4399 64.6298C21.2421 61.1733 26.9682 60.9188 31.0619 64.0245L239.003 221.773C245.979 227.065 255.999 222.09 255.999 213.333V213.946C255.999 220.092 252.478 225.695 246.94 228.362Z" fill="#007ACC"/>
</g>
<g filter="url(#filter1_d)">
<path d="M194.196 253.763C188.089 256.7 180.792 255.459 176 250.667C181.904 256.571 192 252.389 192 244.039V11.9606C192 3.61057 181.904 -0.571175 176 5.33321C180.792 0.541166 188.089 -0.700607 194.196 2.23648L246.934 27.5985C252.476 30.2635 256 35.8686 256 42.0178V213.983C256 220.132 252.476 225.737 246.934 228.402L194.196 253.763Z" fill="#1F9CF0"/>
</g>
<g style="mix-blend-mode:overlay" opacity="0.25">
<path fill-rule="evenodd" clip-rule="evenodd" d="M181.378 254.252C185.41 255.822 190.008 255.722 194.077 253.764L246.783 228.402C252.322 225.737 255.844 220.132 255.844 213.983V42.0179C255.844 35.8687 252.322 30.2636 246.784 27.5986L194.077 2.23665C188.737 -0.333299 182.486 0.296177 177.798 3.70401C177.129 4.19083 176.491 4.73437 175.892 5.33337L74.9927 97.386L31.0429 64.0245C26.9517 60.9189 21.229 61.1734 17.4292 64.6298L3.33311 77.4523C-1.31478 81.6803 -1.32011 88.9925 3.3216 93.2273L41.4364 128L3.3216 162.773C-1.32011 167.008 -1.31478 174.32 3.33311 178.548L17.4292 191.37C21.229 194.827 26.9517 195.081 31.0429 191.976L74.9927 158.614L175.892 250.667C177.488 252.264 179.363 253.467 181.378 254.252ZM191.883 69.8851L115.323 128L191.883 186.115V69.8851Z" fill="url(#paint0_linear)"/>
</g>
</g>
<defs>
<filter id="filter0_d" x="-21.4896" y="40.5225" width="298.822" height="236.149" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
<feOffset/>
<feGaussianBlur stdDeviation="10.6667"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
<feBlend mode="overlay" in2="BackgroundImageFix" result="effect1_dropShadow"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
</filter>
<filter id="filter1_d" x="154.667" y="-20.6735" width="122.667" height="297.347" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
<feOffset/>
<feGaussianBlur stdDeviation="10.6667"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
<feBlend mode="overlay" in2="BackgroundImageFix" result="effect1_dropShadow"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
</filter>
<linearGradient id="paint0_linear" x1="127.844" y1="0.659988" x2="127.844" y2="255.34" gradientUnits="userSpaceOnUse">
<stop stop-color="white"/>
<stop offset="1" stop-color="white" stop-opacity="0"/>
</linearGradient>
</defs>
</svg>
EOF
    cat vscode.svg | ${SUDO} tee /opt/VSCode-linux-x64/vscode.svg >/dev/null \
    && echo """[Desktop Entry]
Name=Visual Studio Code
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=/opt/VSCode-linux-x64/code --no-sandbox --unity-launch %F
Icon=/opt/VSCode-linux-x64/vscode.svg
Type=Application
StartupNotify=false
StartupWMClass=Code
Categories=Utility;TextEditor;Development;IDE;
MimeType=text/plain;inode/directory;
Actions=new-empty-window;
Keywords=vscode;

X-Desktop-File-Install-Version=0.24

[Desktop Action new-empty-window]
Name=New Empty Window
Exec=/opt/VSCode-linux-x64/code --no-sandbox --new-window %F
Icon=/opt/VSCode-linux-x64/vscode.svg
""" | ${SUDO} tee /opt/VSCode-linux-x64/vscode.desktop >/dev/null \
    && ${SUDO} ln -fs  /opt/VSCode-linux-x64/vscode.desktop /usr/share/applications/code.desktop \
    && ${SUDO} ln -fs /opt/VSCode-linux-x64/code /usr/local/bin/code \
    && ${SUDO} ln -fs /opt/VSCode-linux-x64/code-tunnel /usr/local/bin/code-tunnel \
    && echo "install vscode latest success"
}


_main
