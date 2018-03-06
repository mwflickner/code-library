def insertion_sort(the_list):
    if len(the_list) < 2:
        return the_list
    for i in range(len(the_list)):
        j = i
        while j > 0 and the_list[j] < the_list[j-1]:
            j_value = the_list[j]
            the_list[j] = the_list[j-1]
            the_list[j- 1] = j_value
            j -= 1
    return the_list

a_list = [4, 6, 2, 3, 8, 5]
print(a_list)
insertion_sort(a_list)
print(a_list)
