# auto-install-software
One-click installation of common software



### 本脚本已绑定在域名: sh.sadeye.cn。nginx配置如下:
> This script is bound to the domain name: sh.sadeye.cn. The nginx configuration is as follows:
```
server {
    listen       80;
    server_name  sh.sadeye.cn;

    #charset koi8-r;
    access_log  /var/log/nginx/sh.sadeye.cn/access.log  main;

    location / {
        #root   /usr/share/nginx/html;
        #index  index.html index.htm;
        proxy_pass https://raw.githubusercontent.com/bzyy/auto-install-software/master/; 
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

}
```

### Usage

1. `curl -sSL sh.sadeye.cn/go.sh|sudo bash`
2. `curl -sSL sh.sadeye.cn/vscode.sh|sudo bash`