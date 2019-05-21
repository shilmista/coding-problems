# Good morning! Here's your coding interview problem for today.

# This problem was recently asked by Google.

# Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

# For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

# Bonus: Can you do this in one pass?

def any_two_numbers(array, target):
    numbers = set()
    for num in array:
        test_num = target - num
        if test_num in numbers:
            return (test_num, num)
        else:
            numbers.add(num)
    return False


array = [10, 15, 3, 7]
target = 17
print(any_two_numbers(array, target))
