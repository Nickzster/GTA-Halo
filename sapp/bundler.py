# imports
import sys
import os
import shutil

# configuration
sappApiVersion = "1.10.1.0"
entryFile = "main.lua"
OUT_FILE = "gta_halo_v2.lua"
CWD = os.getcwd() + "/src"
# DO NOT MODIFY ANYTHING UNDER THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING
# Data Structs


class ListStructure:
    def __init__(self, startingElem=None):
        self.list = []
        self.length = 0
        if startingElem != None:
            self.list.append(startingElem)
            self.length += 1

    def push(self):
        pass

    def pop(self):
        pass

    def peek(self):
        pass

    def getLength(self):
        return self.length


class Queue(ListStructure):
    def __init__(self, startingElem=None):
        super().__init__(startingElem)

    def push(self, newElem):
        self.list.append(newElem)
        self.length += 1

    def pop(self):
        if self.length > 0:
            self.length -= 1
            return self.list.pop(0)
        else:
            return None

    def enqueue(self, newElem):
        self.push(newElem)

    def dequeue(self):
        return self.pop()

    def peek(self):
        if self.length <= 0:
            return None
        return self.list[0]

    def search(self, elemToFind):
        for elem in self.list:
            if elemToFind == elem:
                return True
        return False


class Task:
    def __init__(self, task, priority):
        self.task = task
        self.priority = priority


class PQueue:
    def __init__(self):
        self.pqueue = []

    def getRightChildIndex(self, parent):
        return 2 * parent + 2

    def getLeftChildIndex(self, parent):
        return 2 * parent + 1

    def getParent(self, child):
        if child % 2 == 0:
            return int((child-2) / 2)
        else:
            return int((child-1) / 2)

    def swap(self, a, b):
        temp = self.pqueue[a]
        self.pqueue[a] = self.pqueue[b]
        self.pqueue[b] = temp

    def isNull(self, index):
        return index < 0 or index > len(self.pqueue)-1

    def heapify(self, root):
        rightChild = self.getRightChildIndex(root)
        leftChild = self.getLeftChildIndex(root)
        while not self.isNull(rightChild) and self.pqueue[rightChild].priority > self.pqueue[root].priority or not self.isNull(leftChild) and self.pqueue[leftChild].priority > self.pqueue[root].priority:
            newChild = -1
            if self.isNull(rightChild) and not self.isNull(leftChild) or self.pqueue[rightChild].priority < self.pqueue[leftChild].priority:
                newChild = leftChild
            else:
                newChild = rightChild
            self.swap(root, newChild)
            root = newChild
            rightChild = self.getRightChildIndex(root)
            leftChild = self.getLeftChildIndex(root)

    def trickleUp(self):
        currIndex = len(self.pqueue)-1
        parentIndex = self.getParent(currIndex)
        while not self.isNull(parentIndex) and self.pqueue[currIndex].priority >= self.pqueue[parentIndex].priority:
            self.swap(currIndex, parentIndex)
            currIndex = parentIndex
            parentIndex = self.getParent(parentIndex)

    def getLength(self):
        return len(self.pqueue)

    def insert(self, task, priority):
        self.pqueue.append(Task(task, priority))
        self.trickleUp()

    def getHighestPriority(self):
        return self.pqueue[0]

    def completeTask(self):
        removed = self.pqueue[0]
        self.pqueue[0] = self.pqueue[len(self.pqueue)-1]
        self.pqueue.pop(len(self.pqueue)-1)
        self.heapify(0)
        self.trickleUp()
        return removed

    def completeAllTasks(self):
        tasks = []
        while(self.getLength() > 0):
            tasks.append(self.completeTask().task)
        return tasks

    def printHeap(self):
        return self.pqueue


# Utility

def lineIsBeginImports(line):
    if line == "-- BEGIN_IMPORT\n" or line == "--BEGIN_IMPORT\n" or line == "--BEGIN\n" or line == "-- BEGIN\n":
        return True
    return False
def lineIsEndImports(line):
    if line == "-- END_IMPORT\n" or line == "--END_IMPORT\n" or line == "--END\n" or line == "-- END\n":
        return True
    return False
def lineIsNoImports(line):
    if line == "-- NO_IMPORTS\n" or line == "--NO_IMPORTS\n" or line == "--NONE\n" or line == "-- NONE\n":
        return True
    return False

def constructFileHeap(fileMap):
    pqueue = PQueue()
    for file in fileMap:
        pqueue.insert(file, fileMap[file])
    return pqueue.completeAllTasks()


def writeFile(files):
    output = ""
    output += "api_version="+"\"" + sappApiVersion + "\"" + "\n\n"
    for file in files:
        file = open(file, "r")
        ignoring = False
        line = file.readline()
        while True:
            if lineIsNoImports(line):
                line = file.readline()
                continue
            if lineIsBeginImports(line) or line == "-- BEGIN_IGNORE\n":
                ignoring = True
            elif lineIsEndImports(line) or line == "-- END_IGNORE\n":
                ignoring = False
                line = file.readline()
                continue
            elif line == "":
                break
            if ignoring == False:
                output += line
            line = file.readline()
        output += "\n"
    outputFile = open(OUT_FILE, "w")
    outputFile.write(output)
    outputFile.close()
    return True




def parseTopOfFile(file):
    try:
        file = open(file, "r")
        files = []
        while True:
            nextLine = file.readline()
            if lineIsBeginImports(nextLine):
                continue
            elif lineIsEndImports(nextLine):
                break
            elif lineIsNoImports(nextLine):
                break
            else:
                importStatement = nextLine.split(" ")
                if importStatement[1] != 'import':
                    raise Exception("Invalid Import Statement in file " + file + " ! Check your spacing!")
                else:
                    directories = importStatement[2].split(".")
                    fileDir = CWD
                    for directory in directories:
                        fileDir = os.path.join(fileDir, directory)
                    fileDir += ".lua"
                    files.append(fileDir)
        return files
    except Exception as err:
        print("ERROR: Operation Failed. (Check the most recent file that was processed).\n")
        print("Full Error is below \n" + "============================\n")
        print(err)
        exit(1)


# return a dictionary, with the keys being the file names, and the values representing an index.


def indexFiles(mainFile):
    fileMap = {}
    bfs = Queue()
    bfs.push(mainFile)
    while(bfs.getLength() > 0):
        currentFile = bfs.pop()
        print("Processing file: " + currentFile)
        if currentFile in fileMap:
            fileMap[currentFile] += 1
        else:
            if currentFile == mainFile:
                fileMap[currentFile] = 0
            else:
                fileMap[currentFile] = 1
        imports = parseTopOfFile(currentFile)
        for importedFile in imports:
            bfs.push(importedFile)
    return fileMap


    # Program
if __name__ == "__main__":
    fileMap = indexFiles(os.path.join(CWD, entryFile))
    sortedFileMap = constructFileHeap(fileMap)
    writeFile(sortedFileMap)
