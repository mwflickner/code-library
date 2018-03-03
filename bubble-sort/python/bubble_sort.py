def bubbleSort(thelist):
    if len(thelist) < 2:
        return thelist
    for i in range(len(thelist)):
        swapOccured = False
        for j in range(1, len(thelist) - i):
            if thelist[j] < thelist[j - 1]:
                temp = thelist[j]
                thelist[j] = thelist[j - 1]
                thelist[j - 1] = temp
                swapOccured = True
        if swapOccured is False:
            break
    return thelist

alist = [4, 6, 2, 3, 8, 5]
print(alist)
bubbleSort(alist)
print(alist)
