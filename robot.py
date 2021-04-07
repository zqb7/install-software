import requests
from typing import TextIO


class Robot(object):

    def __init__(self):
        self.req = requests.Session()

    def start(self):
        for key in self.__class__.__dict__.keys():
            if key.startswith('_') or key in ['start']:
                continue
            getattr(self,key, None)()

    def code_server(self):
        with open("code-server.sh","r+") as f:
            self._change_version_tag_github(f,"cdr/code-server")

    def docker_compose(self):
        with open("docker-compose.sh","r+") as f:
            self._change_version_tag_github(f,"docker/compose")

    def firefox(self):
        pass

    def go(self):
        pass

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
                    break
    
    def _check_for_github_release(self,name:str) ->str:
        url = 'https://api.github.com/repos/{name}/releases/latest'.format(name=name)
        ack = self.req.get(url=url)
        if ack.status_code == 200:
            return ack.json()['name']

if __name__ == "__main__":
    robot = Robot()
    robot.start()