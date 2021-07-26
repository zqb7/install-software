from unittest import TestCase
from robot import Robot


class TestRobot(TestCase):
    robot = Robot()

    def test_tigervnc(self):
        self.robot.tigervnc()
