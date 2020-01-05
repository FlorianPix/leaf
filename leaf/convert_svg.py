txt = open("path.txt", "r")
txt = txt.read().replace(' ', '\n')
txt = txt.replace('c', '\n')

file = open("path2.txt", "w")
file.write(txt)
