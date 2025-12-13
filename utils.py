"""Utility functions for the application."""

import random
from string import ascii_uppercase
from models import rooms


def generate_unique_code(length):
    """
    Docstring for generate_unique_code

    :param length: Description
    """
    while True:
        code = ""
        for _ in range(length):
            code += random.choice(ascii_uppercase)

        if code not in rooms:
            break

    return code
