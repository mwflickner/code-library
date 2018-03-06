def bubble_sort(the_list):
    if len(the_list) < 2:
        return the_list
    for i in range(len(the_list)):
        swapOccured = False
        for j in range(1, len(the_list) - i):
            if the_list[j] < the_list[j - 1]:
                temp = the_list[j]
                the_list[j] = the_list[j - 1]
                the_list[j - 1] = temp
                swapOccured = True
        if not swapOccured:
            break
    return the_list

a_list = [4, 6, 2, 3, 8, 5]
print(a_list)
bubble_sort(a_list)
print(a_list)
