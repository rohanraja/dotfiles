import unittest
import HelloPy as sut


#@unittest.skip("Don't forget to test!")
class HellopyTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.HelloPy_example()
        self.assertEqual("Happy Hacking", result)
