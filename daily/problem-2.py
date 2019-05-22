# Good morning! Here's your coding interview problem for today.

# This problem was asked by Uber.

# Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.

# For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].

# Follow-up: what if you can't use division?


def test(array):
    product = 1
    new_array = []
    for num in array:
        product *= num
    for num in array:
        val = product / num
        new_array.append(val)
    print(new_array)


def test_no_division(array):
    new_array = []
    for index in range(len(array)):
        product = 1
        for other_index in range(len(array)):
            if other_index != index:
                product *= array[other_index]
        new_array.append(product)
    print(new_array)


test([1, 2, 3, 4, 5])
test([3, 2, 1])

test_no_division([1, 2, 3, 4, 5])
