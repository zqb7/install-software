# install-software
Install software with one line of command



### 本脚本已绑定在域名: install.sadeye.cn
> This script is bound to the domain name: install.sadeye.cn

### Usage
> example: `sh -c "$(curl -fsSL install.sadeye.cn/example.sh)"` or `sh -c "$(curl -fsSL install.sadeye.cn/example.sh)" -s arg1 arg2`
- `sh -c "$(curl -fsSL install.sadeye.cn/go.sh)" -s 1.15.6`
- `sh -c "$(curl -fsSL install.sadeye.cn/vscode.sh)"`

### 分类(Category)
+ 桌面应用(Desktop Application)
    - dbeaver.sh
    - drawio.sh
    - filezilla.sh
    - firefox.sh
    - postman.sh
    - sublime_text.sh
    - vscode.sh
    - pycharm.sh
    - another_redis_desktop_manager.sh
    - joplin.sh
    - qq.sh
    - qqmusic.sh
    - redisInsight.sh
    - hoppscotch.sh
+ 终端应用(Terminal Application)
    - docker-compose.sh
    - etcd.sh
    - gh.sh
    - go.sh
    - hugo.sh
    - java.sh
    - mysql.sh
    - node.sh
    - protoc.sh
    - redis.sh
    - syncthing.sh
    - tigervnc.sh
    - upx.sh

### install
##### 1. Clone to local
`git clone https://github.com/zqb7/install-software.git ~/.install-software`
##### 2. Create link
`ln -sf yourpath/.install-software/install-software  /usr/local/bin/install-software`
##### 3. Use
`install-software vscode`

### HELP
你可以使用以下命令查看有哪些脚本  
You can use the following command to see which scripts are there  
`curl -sSL install.sadeye.cn/index`
