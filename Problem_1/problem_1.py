l = range(1, 1000)
sum([x if x%3==0 or x%5==0 for x in l])