n = 1025
with open('input.txt', 'w') as file:
    file.write(f"{n}\n")
    file.write("1\n")
    file.write("1\n")
    file.write("1\n")
    file.write("1\n")
    i = 0
    while (i < 4*n*n):
         file.write("1\n")
         i+=1
