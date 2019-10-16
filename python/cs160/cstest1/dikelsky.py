#!/usr/bin/env python

#Function to calculate frequency of each word in string
#Please do consider complexity for build in methods like split(), sort(), append(),find(),count() etc too
def myWordCount(listOfWords):
    dictionary = dict()
     
    for word in listOfWords:   #This is O(n), and total complexiy is O(n)
        if word not in dictionary: #This section is O(1)
            dictionary[word] = 1
        else:
            dictionary[word] += 1

    return dictionary

    
#Main construct to call function with String values
words="words in a short, short words, lists of words"
nwords=words.replace(",","")
listOfWords=nwords.split()
print(listOfWords)
print(myWordCount(listOfWords)) # This is function call

'''Expected output 
['words', 'in', 'a', 'short', 'short', 'words', 'lists', 'of', 'words']
Words appeared with their frequency are: {'words': 3, 'in': 1, 'a': 1, 'short': 2, 'lists': 1, 'of': 1}

'''

#!/usr/bin/env python

#Queue class
class Queue:
    def __init__(self):
        self.items = []

    def isEmpty(self):
        return self.items == []

    def enqueue(self, item):
        self.items.insert(0,item)

    def dequeue(self):
        return self.items.pop()

    def size(self):
        return len(self.items)
    
#Stack class
class Stack:
     def __init__(self):
         self.items = []

     def isEmpty(self):
         return self.items == []

     def push(self, item):
         self.items.append(item)

     def pop(self):
         return self.items.pop()

     def peek(self):
         return self.items[len(self.items)-1]

     def size(self):
         return len(self.items)
        
#Function to reverse the queue 
def reverseQueue(queue):
    #Implement this function using Queue and Stack functions, you can define as many stack and queue objects as you want
    stack = Stack()
    while not queue.isEmpty():
        stack.push(queue.dequeue())

    while not stack.isEmpty():
        queue.enqueue(stack.pop())

queue= Queue()
queue.enqueue(10) 
queue.enqueue(20)
queue.enqueue(30)
queue.enqueue(40)
queue.enqueue(50)
queue.enqueue(60)
queue.enqueue(70)
queue.enqueue(80)
queue.enqueue(90)
queue.enqueue(100) 
print("Original Queue:",queue.items)  
reverseQueue(queue)
print("Reverse Queue:",queue.items)

#!/usr/bin/env python
# coding: utf-8

###################################################################
#Node class
class Node:
    def __init__(self,initdata):
        self.data = initdata
        self.next = None

    def getData(self):
        return self.data

    def getNext(self):
        return self.next

    def setData(self,newdata):
        self.data = newdata

    def setNext(self,newnext):
        self.next = newnext
###################################################################
#List class
class UnorderedList:

    def __init__(self):
        self.head = None
        
    def isEmpty(self):
        return self.head == None
    
    def add(self,item):
        #This function adds new item into queue so that you Queue follows concept of(FIFO)
        temp = Node(item)
        temp.setNext(self.head)
        self.head = temp
        
    def remove(self):
        self.dequeue()
        #implement this function so that you can follow Queue concept (FIFO)
    
    def size(self):
        current = self.head
        count = 0
        while current != None:
            count = count + 1
            current = current.getNext()

        return count
    
    def search(self,item):
        current = self.head
        found = False
        while current != None and not found:
            if current.getData() == item:
                found = True
            else:
                current = current.getNext()

        return found

    def enqueue(self, item):  #O(1) because it just moves one thing around
        current = self.head
        new = Node(item)
        new.next = current
        self.head = new

    def dequeue(self):  #O(n) because it needs to go thrrough the whole list
        previous = None
        current = self.head
        while current.getNext() is not None:
            previous = current
            current = current.getNext()

        previous.setNext(None)
        return current.getData()
        
    def printl(self):
        current = self.head
        while not current==None:
            print(current.getData(), end=" -> ")
            current = current.getNext()
        print()
###################################################################
#Queue class
class Queue:
    def __init__(self):
        self.items = UnorderedList()

    def isEmpty(self):
        return self.items.isEmpty()

    def enqueue(self, item):
        self.items.enqueue(item) #This is an example how you can call add method on UnorderedList class for enqueue

    def dequeue(self):
        #implement this function for Queue
        self.items.dequeue()

    def size(self):
        return (self.items.size())
    
    def printQ(self):
        self.items.printl()

myQueue=Queue()
myQueue.enqueue(89)
myQueue.enqueue(90)
myQueue.enqueue(22)
myQueue.enqueue(48)
myQueue.enqueue(56)
myQueue.enqueue(1)
print("Before dequeue:",myQueue.printQ(), end="")
myQueue.dequeue() #Should remove 89
myQueue.dequeue() #Should remove 90
print("After dequeue:",myQueue.printQ(), "-> ", end="")
def power(x, y):   #O(n) complexity, where n is y
    if y == 0:
        return 1
    else:
        return power(x, y-1) * x

print(power(3, 2))
print(power(2, 3))
