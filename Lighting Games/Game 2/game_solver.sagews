#use the get_solution function from graph.py
from graph import get_solution

#map for states
states = {
    "off": 0,
    "red": 1,
    "green": 2
}

#reverse map for the states
reverse_states = {
    0: "off",
    1: "red",
    2: "green"
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
    #create the vector in string format
    vec = f"[{v[0]}, {v[1]}, {v[2]}]"

    #display the initial vector
    print("Lights: ", end = "\t")
    for i in range (0, len(v)):
        print(f"{i+1}: {reverse_states[v[i]]}", end="\t")
    print("", end="\n\n")

    #get the solution for the vector
    sol = get_solution(vec)

    #create a result variable to store the result
    result = "";

    #remove a space from the set of the solution if it exists
    st = set(sol)
    st.discard(' ')

    #loop for every unique item in the solution
    for i in list(st):
        #get the number of times a switch must be pressed and store it
        x=[k for k in sol.split(" ") if k==i]
        result += f"press switch #{i} {len(x)} time(s)\n"

    #return the result
    return result

def main():
    #get the layout of the vector
    layout = range(1,4)

    #display the layout
    print("Boxes: ", end = "\t")

    for i in layout:
        print(f"{i}", end="\t")

    #get input for all vector indicies
    num1 = get_input(1)
    num2 = get_input(2)
    num3 = get_input(3)

    #create the vector in list format
    v = [num1, num2, num3]

    #get the solution and display it
    result = solver(v)
    print(result)

#call the main function
main()