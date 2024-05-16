#the libraries used in the program
import random
import ast

#function to flip a switch
def flick_switch(switch, switches):
    if switch == 1:
        switches = switches + vector(Integers(2), [1, 1, 0, 0, 0])
    elif switch == 5:
        switches = switches + vector(Integers(2), [0, 0, 0, 1, 1])
    else:
        vect = vector(Integers(2), [0, 0, 0, 0, 0])
        vect[switch-2] = 1
        vect[switch-1] = 1
        vect[switch] = 1
        switches = switches + vect
    return switches

#function used to create a file containing all the possible vectors
def create_file():
    #list that contains possible items
    items = [0,1]

    #list keeping track of all the vectors
    all_vectors = []

    #the amount of vectors to generate
    goal = 2**5

    #open a file with write mode to write the results
    f = open("all_vector.txt", "w")

    while (len(all_vectors) != goal):
        #generate a random vector
        num = len(all_vectors)
        num1 = random.choice(items)
        num2 = random.choice(items)
        num3 = random.choice(items)
        num4 = random.choice(items)
        num5 = random.choice(items)

        #create a list representing the vector
        vector = [num1, num2, num3, num4, num5]

        #if the vector in not in the all_vectors list
        if not (vector in all_vectors):
            #display to the screen the progress
            print(f"Number: {num}, Goal: {goal}")

            #add the vector to the all_vectors list
            all_vectors.append(vector)

            #write the vector to the all_vector.txt file
            f.write(f"{vector}\n")

    #display a message saying the program finished
    print(f"Number: {goal}, Goal: {goal}")

    #close the file
    f.close()

def create_graph_file():
    #open the all_vector file with read mode
    f1 = open("all_vector.txt", "r")

    #open the all_vector_nodes with write mode
    f2 = open("all_vector_nodes.txt", "w")

    #the amount of vectors to loop through
    goal = (2**5)*5

    #num is used to keep up with when to display the progress
    num = 0

    #loop through the all_vector file which contains all the possible vectors
    for i in f1:
        #evaluate the string as a list
        vec = ast.literal_eval(i)

        #get every transformation of the vector
        for i in range(1,6):
            new_vec = list(flick_switch(i, vector(vec)))

            #write the vector, its transformation, and the switch pressed to get the transformation
            f2.write(f"{vec},{new_vec},{i}\n")

            #display the progress
            num += 1
            print(f"finished {num}/{goal}")

    #display a message saying the program finished
    print("finish creating graph file")

    #close the file
    f2.close()

#create_file() #- file is in folder, no need ro run again
#create_graph_file() #- file is in folder, no need ro run again