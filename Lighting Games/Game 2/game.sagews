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
        switches = switches + vector(Integers(3), [1, 1, 0])
    elif switch == 2:
        switches = switches + vector(Integers(3), [1, 1, 1])
    elif switch == 3:
        switches = switches + vector(Integers(3), [0, 1, 1])

    return switches

#function to get input and validate it
def validation(val):
    while val < 0 or val > 3:
        print("invalid input, please try again")
        val = int(input("Enter a Switch to flick (1-3, 0 to quit): "))
    return val

#function for the second game
def game2():
    #list of states
    mod3 = range(0,3)

    #select random states
    A = random.choice(mod3)
    B = random.choice(mod3)
    C = random.choice(mod3)

    #initial configuration
    switches = vector(Integers(3), [A, B, C])

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
        val = int(input("Enter a Switch to flick (1-3, 0 to quit): "))
        val = validation(val)
        switches = flick_switch(val, switches)

#call the game2 function
game2()