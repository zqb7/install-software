from unittest import TestCase
from robot import Robot


class TestRobot(TestCase):
    robot = Robot()

    def test_code_server(self):
        self.robot.code_server()

    def test_docker_compose(self):
        self.robot.docker_compose()

    def test_drawio(self):
        self.robot.drawio()

    def test_firefox(self):
        self.robot.firefox()
    
    def test_go(self):
        self.robot.go()

    def test_tigervnc(self):
        self.robot.tigervnc()

    def test_hugo(self):
        self.robot.hugo()
    
    def test_java(self):
        pass
    
    def test_node(self):
        self.robot.node()
    
    def test_ohmyzsh(self):
        self.robot.ohmyzsh()

    def test_postman(self):
        pass

    def test_protoc(self):
        self.robot.protoc()

    def test_rclone(self):
        self.robot.rclone()

    def test_sublime_test(self):
        self.robot.sublime_text()

    def test_syncthing(self):
        self.robot.syncthing()

    def test_vscode(self):
        self.robot.vscode()

    def test_tigervnc(self):
        self.robot.tigervnc()

    def test_etcd(self):
        self.robot.etcd()

    def test_upx(self):
        self.robot.upx()
