def merge_sort(the_list):
    if len(the_list) < 2:
        return the_list
    left_side, right_side = split_list(the_list)
    left_side = merge_sort(left_side)
    right_side = merge_sort(right_side)
    return merge(left_side, right_side)

def merge(left, right):
    left_index = right_index = 0
    sorted_list = []
    while left_index < len(left) and right_index < len(right):
        if left[left_index] < right[right_index]:
            sorted_list.append(left[left_index])
            left_index += 1
        else:
            sorted_list.append(right[right_index])
            right_index += 1
    while left_index < len(left):
        sorted_list.append(left[left_index])
        left_index += 1
    while right_index < len(right):
        sorted_list.append(right[right_index])
        right_index += 1
    return sorted_list

def split_list(the_list):
    middle = len(the_list) // 2
    return the_list[:middle], the_list[middle:]


a_list = [5, 2, 4, 3, 8]
print(a_list)
sorted_list = merge_sort(a_list)
print(sorted_list)
