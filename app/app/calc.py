"""
calculatior functions
"""


def add(x, y):

    return x+y


def substract(x, y):

    return x-y


def remove_duplicates(given_list):
    given_list = list(dict.fromkeys(given_list).keys())
    return given_list
