import requests
import re
from typing import TextIO
from git import Repo

class Robot(object):

    def __init__(self):
        self.req = requests.Session()
        self.changed = {}
        self.repo = Repo()

    def start(self):
        for key in self.__class__.__dict__.keys():
            if key.startswith('_') or key in ['start']:
                continue
            getattr(self,key, None)()

        self._done()

    def _done(self):
        if bool(self.changed):
            origin = self.repo.remote('origin')
            commmit_message = 'update ' + ''.join(['%s:%s,' %(key, value) for (key, value) in self.changed.items()]).rstrip(',')
            self.repo.index.add([key for key in self.changed])
            self.repo.index.commit(commmit_message)
            origin.push()
        


    def code_server(self):
        with open("code-server.sh","r+") as f:
            self._change_version_tag_github(f,"cdr/code-server")

    def docker_compose(self):
        with open("docker-compose.sh","r+") as f:
            self._change_version_tag_github(f,"docker/compose")

    def firefox(self):
        ack = self.req.get("https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=zh-CN", allow_redirects=False)
        if ack.status_code == 302:
            real_download_url = ack.headers.get('Location')
            match = re.search(r'.*firefox-(.*)\.tar.*',real_download_url)
            if real_download_url and match:
                version = match.group(1)
                with open("firefox.sh", "r+") as f:
                    lines = f.readlines()
                    for index,line in enumerate(lines):
                        if line.startswith("fileUrl") and version != line.split('=')[-1].strip('\n').strip('"'):
                            lines[index] = 'fileUrl="{url}"\n'.format(url=real_download_url)
                            f.seek(0)
                            f.truncate()
                            f.writelines(lines)
                            self.changed.setdefault(f.name, version)
                            break

    def go(self):
        ack = self.req.get('https://golang.org/dl/')
        if ack.status_code == 200:
            match = re.search(r'.*download downloadBox.*go(.*)\.linux-amd64.*gz"',r.text)
            if match:
                version = match.group(1)
                with open("go.sh", "r+") as f:
                    lines = f.readlines()
                    for index,line in enumerate(lines):
                        if line.startswith("VERSION") and line.split('=')[-1].strip('\n').strip('"') != version:
                            lines[index] = 'VERSION="{version}"\n'.format(version=version)
                            f.seek(0)
                            f.truncate()
                            f.writelines(lines)
                            self.changed.setdefault(f.name, version)
                            break

    def hugo(self):
        with open("hugo.sh","r+") as f:
            self._change_version_tag_github(f,"gohugoio/hugo")

    def java(self):
        pass

    def node(self):
        pass

    def ohmyzsh(self):
        pass

    def postman(self):
        pass

    def protoc(self):
        pass

    def rclone(self):
        pass

    def sublime_text(self):
        pass

    def syncthing(self):
        pass

    def vscode(self):
        pass
            
    
    # 只用于修改从github检查版本号的脚本文件
    def _change_version_tag_github(self,f:TextIO,name:str):
        lines = f.readlines()
        for index,line in enumerate(lines):
            if line.startswith("VERSION"):
                latest = self._check_for_github_release(name).lstrip('v')
                if line.split('=')[-1].strip('\n').strip('"') != latest:
                    lines[index] = 'VERSION="{version}"\n'.format(version=latest)
                    f.seek(0)
                    f.truncate()
                    f.writelines(lines)
                    self.changed.setdefault(f.name, latest)
                    break
    
    def _check_for_github_release(self,name:str) ->str:
        url = 'https://api.github.com/repos/{name}/releases/latest'.format(name=name)
        ack = self.req.get(url=url)
        if ack.status_code == 200:
            return ack.json()['name']

if __name__ == "__main__":
    robot = Robot()
    robot.start()