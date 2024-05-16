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
def solver(m):
    #create the matrix in string format
    mat = f"[[{m[0][0]}, {m[0][1]}, {m[0][2]}], [{m[1][0]}, {m[1][1]}, {m[1][2]}], [{m[2][0]}, {m[2][1]}, {m[2][2]}]]"

    #display the initial matrix
    for i in range (0, len(m)):
        for j in range(0, len(m[0])):
            print(f"{(i*3)+j}: {reverse_states[m[i][j]]}\t", end="")
        print()
    print()

    #get the solution for the matrix
    sol = get_solution(mat)

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
    #get the layout of the matrix
    layout = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]

    #display the layout
    for i in layout:
        for j in i:
            print(f"{j}\t", end="")
        print()

    #get input for all matrix indicies
    num1 = get_input(1)
    num2 = get_input(2)
    num3 = get_input(3)
    num4 = get_input(4)
    num5 = get_input(5)
    num6 = get_input(6)
    num7 = get_input(7)
    num8 = get_input(8)
    num9 = get_input(9)

    #create the matrix in list format
    mat = [[num1, num2, num3], [num4, num5, num6], [num7, num8, num9]]

    #get the solution and display it
    result = solver(mat)
    print(result)

#call the main function
main()