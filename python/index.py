import csv

with open('/Users/masudaharukasuke/Doshisha/python/262112021020517232560.csv') as f:
    reader = csv.reader(f)
    l = [row for row in reader]

x = 135.7684078
y = 34.8011542
l = l[1:]
answer = []
for i in range(len(l)):
  answer.append((float(l[i][9])-x)**2 + (float(l[i][8])-y)**2)
  print("NO.{} {} = {}".format(i,l[i][4],(float(l[i][9])-x)**2 + (float(l[i][8])-y)**2))

print("min")
print((min(answer)))
print(answer.index(min(answer)))
