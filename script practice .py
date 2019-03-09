import os

fName1 = '1.txt'

fName2 = '2.txt'

listPath = '//Users//FFF//Desktop//10files'

fAbsolutePath = '//Users//FFF//Desktop//10files//1.txt'


lDir = os.listdir(listPath)


joinPath1 = os.path.join(listPath, fName1)
joinPath2 = os.path.join(listPath, fName2)

timesPath = os.path.getmtime(joinPath1)
timesPath = os.path.getmtime(joinPath2)

for file in os.listdir(listPath):
    if file.endswith(".txt"):
        print (os.path.join(listPath, file))
