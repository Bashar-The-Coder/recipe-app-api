from django.test import SimpleTestCase
from app import calc


class CalsTest(SimpleTestCase):
    def test_add_number(self):
        res = calc.add(5, 6)

        self.assertEqual(res, 11)

    def test_substract(self):
        res = calc.substract(15, 6)

        self.assertEqual(res, 9)

    def test_remove_duplicates(self):
        res = calc.remove_duplicates([1, 1, 1, 2, 3, 4, 5, 5])

        self.assertEqual(res, [1, 2, 3, 4, 5])
