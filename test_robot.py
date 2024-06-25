import unittest
from robot import Robot


class TestRobot(unittest.TestCase):
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

    def test_etcd(self):
        self.robot.etcd()

    def test_upx(self):
        self.robot.upx()

    def test_lua(self):
        self.robot.lua()

    def test_joplin(self):
        self.robot.joplin()

    def test_pycharm(self):
        self.robot.pycharm()

    def test_qq(self):
        self.robot.qq()

    def test_qqmusic(self):
        self.robot.qqmusic()

    def test_compare_verion(self):
        self.assertTrue(self.robot._compare_verion("v1.2.3","v1.3"))
        self.assertTrue(self.robot._compare_verion("v1.3.3","v1.3.4"))
        self.assertTrue(self.robot._compare_verion("v1.3","v1.3.4"))
        self.assertFalse(self.robot._compare_verion("v3.5.4","v3.4.20"))
        self.assertFalse(self.robot._compare_verion("v17.9.1","v16.17.0"))
        self.assertFalse(self.robot._compare_verion("v1.2.3","v1.2.2.1"))
