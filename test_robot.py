from unittest import TestCase
from robot import Robot


class TestRobot(TestCase):
    robot = Robot()

    def test_tigervnc(self):
        self.robot.tigervnc()

    def test_etcd(self):
        self.robot.etcd()

    def test_upx(self):
        self.robot.upx()
