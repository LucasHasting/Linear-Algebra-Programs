#use the get_solution function from graph.py
from graph import get_solution

#map for states
states = {
    "off": 0,
    "on": 1
}

#reverse map for the states
reverse_states = {
    0: "off",
    1: "on"
}

#function used to get input from the user and validate it
def get_input(box):
    state = raw_input(f"Enter the value for box #{box}: ")

    if state not in states.keys():
        return get_input(box)
    else:
        return states[state]

#function used to solve an initial configuration
def solver(v):
    #create the vector in list format
    vec = f"[{v[0]}, {v[1]}, {v[2]}, {v[3]}, {v[4]}]"

    #display the initial vector
    print("Lights: ", end = "\t")
    for i in range (0, len(v)):
        print(f"{i+1}: {reverse_states[v[i]]}", end="\t")
    print("", end="\n\n")

    #get the solution for the vector
    sol = get_solution(vec)

    #create a result variable to store the result
    result = "";

    #if the solution can be solved
    if not sol == "Can not be solved":
        #remove a space from the set of the solution if it exists
        st = set(sol)
        st.discard(' ')
        #loop for every unique item in the solution
        for i in list(st):
            #get the number of times a switch must be pressed and display it
            x=[k for k in sol.split(" ") if k==i]
            result += f"press switch #{i} {len(x)} time(s)\n"

    #if the solution cannot be solved, display a message stating it
    else:
        result += sol

    #return the result
    return result

def main():
    #get the layout of the vector
    layout = range(1,6)

    #display the layout
    print("Boxes: ", end = "\t")

    for i in layout:
        print(f"{i}", end="\t")

    #get input for all vector indicies
    num1 = get_input(1)
    num2 = get_input(2)
    num3 = get_input(3)
    num4 = get_input(4)
    num5 = get_input(5)

    #create the vector in list format
    v = [num1, num2, num3, num4, num5]

    #get the solution and display it
    result = solver(v)
    print(result)

#call the main function
main()