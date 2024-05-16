#the libraries used in the program
import random
import math
import ast

#function to flip a switch
def flick_switch(switch, switches):
    if switch == 1:
        switches = switches + Matrix(Integers(3), [[1, 1, 0],[1, 1, 0],[0, 0, 0]])
    elif switch == 2:
        switches = switches + Matrix(Integers(3), [[1, 1, 1],[0, 0, 0],[0, 0, 0]])
    elif switch == 3:
        switches = switches + Matrix(Integers(3), [[0, 1, 1],[0, 1, 1],[0, 0, 0]])
    elif switch == 4:
        switches = switches + Matrix(Integers(3), [[1, 0, 0],[1, 0, 0],[1, 0, 0]])
    elif switch == 5:
        switches = switches + Matrix(Integers(3), [[0, 1, 0],[1, 1, 1],[0, 1, 0]])
    elif switch == 6:
        switches = switches + Matrix(Integers(3), [[0, 0, 1],[0, 0, 1],[0, 0, 1]])
    elif switch == 7:
        switches = switches + Matrix(Integers(3), [[0, 0, 0],[1, 1, 0],[1, 1, 0]])
    elif switch == 8:
        switches = switches + Matrix(Integers(3), [[0, 0, 0],[0, 0, 0],[1, 1, 1]])
    elif switch == 9:
        switches = switches + Matrix(Integers(3), [[0, 0, 0],[0, 1, 1],[0, 1, 1]])
    return switches

#function used to create a file containing all the possible matricies
def create_file():
    #list that contains possible items
    items = [0,1,2]

    #list keeping track of all the matricies
    all_matricies = []

    #the amount of matricies to generate
    goal = 3**9

    #open a file with write mode to write the results
    f = open("all_matrix.txt", "w")

    while (len(all_matricies) != goal):
        #generate a random matrix
        num = len(all_matricies)
        num1 = random.choice(items)
        num2 = random.choice(items)
        num3 = random.choice(items)
        num4 = random.choice(items)
        num5 = random.choice(items)
        num6 = random.choice(items)
        num7 = random.choice(items)
        num8 = random.choice(items)
        num9 = random.choice(items)

        #create a 2D list representing the matrix
        matrix = [[num1, num2, num3],
               [num4, num5, num6],
               [num7, num8, num9]]

        #if the matrix in not in the all_matricies list
        if not (matrix in all_matricies):
            #display to the screen the progress
            if(num % 1000 == 0 or (num>19000 and num % 5 == 0)):
                print(f"Number: {num}, Goal: {goal}\n")

            #add the matrix to the all_matricies list
            all_matricies.append(matrix)

            #write the matrix to the all_matrix.txt file
            f.write(f"{matrix}\n")

    #display a message saying the program finished
    print("finished creating matrix file")

    #close the file
    f.close()

def create_graph_file():
    #open the all_matrix file with read mode
    f1 = open("all_matrix.txt", "r")

    #open the all_matrix_nodes with write mode
    f2 = open("all_matrix_nodes.txt", "w")

    #the amount of matricies to loop through
    goal = (3**9)*9

    #num is used to keep up with when to display the progress
    num = 0

    #loop through the all_matrix file which contains all the possible vectors
    for i in f1:
        #evaluate the string as a 2D list
        mat = ast.literal_eval(i)

        #get every transformation of the matrix
        for i in range(1,10):
            new_mat = list(flick_switch(i, matrix(mat)))
            new_mat = [list(x) for x in new_mat]

            #write the matrix, its transformation, and the box pressed to get the transformation
            f2.write(f"{mat},{new_mat},{i}\n")

            #display the progress
            num += 1
            if(num % 1000 == 0):
                print(f"finished {num}/{goal}")

    #display a message saying the program finished
    print("finish creating graph file")

    #close the file
    f2.close()

#create_file() - file is in folder, no need ro run again
#create_graph_file() - file is in folder, no need ro run again