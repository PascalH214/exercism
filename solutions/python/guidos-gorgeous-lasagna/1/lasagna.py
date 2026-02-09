EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time: int):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time

def preparation_time_in_minutes(number_of_layers: int):
    """Calculate the bake time remaining.

    :param number_of_layers: int - number of lasagna layers
    :return: int - returns preparation time in minutes.

    Function that returns how long the preparation of the lasagne takes
    in minutes.
    """
    return PREPARATION_TIME * number_of_layers


def elapsed_time_in_minutes(number_of_layers: int, elapsed_bake_time: int):
    """Calculates the total making time

    :param number_of_layers: int - number of lasagna layers
    :param elapsed_bake_time: int - baking time the lasagne was in oven.
    :return: int - total time the lasagne took in minutes.

    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time