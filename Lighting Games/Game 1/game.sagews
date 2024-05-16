#use the random library
import random

#map for states
states = {
    0: "off",
    1: "on"
}

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

#function to get input and validate it
def validation(val):
    while val < 0 or val > 5:
        print("invalid input, please try again")
        val = int(input("Enter a Switch to flick (1-5, 0 to quit): "))
    return val

#function for the first game
def game1():
    #list of states
    mod2 = range(0,2)

    #select random states
    A = random.choice(mod2)
    B = random.choice(mod2)
    C = random.choice(mod2)
    D = random.choice(mod2)
    E = random.choice(mod2)

    #initial configuration
    switches = vector(Integers(2), [A, B, C, D, E])

    #declare val for the while loop
    val = 1
    while(val != 0):
        #set vector index, used to loop through vector
        index = 1

        #display config
        print("Current Configuration: ")
        for i in switches:
            print(f"{index}:{states[i]}\t", end="")
            index += 1
        print()

        #get input from user
        val = int(input("Enter a Switch to flick (1-5, 0 to quit): "))
        val = validation(val)
        switches = flick_switch(val, switches)

#call the first game function
game1()