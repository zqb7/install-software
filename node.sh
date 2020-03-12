#!/usr/bin/env bash

# auto install nodejs

if [ `whoami` != "root" ]; then
    echo "please use root run it"
    exit 1
fi

pushd /tmp >/dev/null
file_url="https://nodejs.org/dist/v12.16.1/node-v12.16.1-linux-x64.tar.xz"
file_name=`echo $file_url | awk -F '/' '{print $NF}'`

wget -c $file_url

tar --no-same-owner -xvf $file_name -C /opt/

rm -rf /opt/node
mv /opt/${file_name/.tar.xz} /opt/node

ln -s /opt/node/bin/node /usr/local/bin/node
ln -s /opt/node/bin/npm /usr/local/bin/npm
ln -s /opt/node/bin/npx /usr/bin/npx

popd >/dev/null

echo "install go success!"
