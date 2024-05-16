#use the random library
import random

#map for states
states = {
    0: "off",
    1: "red",
    2: "green"
}

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

#function to get input and validate it
def validation(val):
    while val < 0 or val > 9:
        print("invalid input, please try again")
        val = int(input("Enter a Switch to flick (1-9, 0 to quit): "))
    return val

#function for the third game
def game3():
    #list of states
    mod2 = range(0,3)

    #select random states
    A = random.choice(mod2)
    B = random.choice(mod2)
    C = random.choice(mod2)
    D = random.choice(mod2)
    E = random.choice(mod2)
    F = random.choice(mod2)
    G = random.choice(mod2)
    H = random.choice(mod2)
    I = random.choice(mod2)

    #initial configuration
    switches = Matrix(Integers(3), [[A, B, C],[D, E, F],[G, H, I]])

    #declare val for the while
    val = 1
    while(val != 0):
        #set vector index, used to loop through vector
        index = 1

        #display config
        print("Current Configuration: ")
        for i in switches:
            for j in i:
                print(f"{index}:{states[j]}\t", end="")
                index += 1
            print()

        #get input from user
        val = int(input("Enter a Switch to flick (1-9, 0 to quit): "))
        val = validation(val)
        switches = flick_switch(val, switches)

#call the game3 function
game3()