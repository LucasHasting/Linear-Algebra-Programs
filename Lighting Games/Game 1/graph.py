#use the networkx library which has easy creation of graphs 
#and an implementation of dijkstra's shortest path algorithm
import networkx as nx

#libraries used to visualize the graph
import matplotlib.pyplot as plt
import numpy as np

def show_graph(graph):
    #spread out the nodes
    pos = nx.spring_layout(graph, k=0.3*1/np.sqrt(len(graph.nodes())), iterations=20)
    
    #create the plot
    plt.figure(3, figsize=(30, 30))
    
    #draw the graph
    nx.draw(graph, pos=pos)
    nx.draw_networkx_labels(graph, pos=pos)
    
    #save the graph
    plt.savefig("graph.png")
    
    return

def generate_graph_visual():
    #initialize variables and files
    f = open("all_vector_nodes.txt", "r")
    graph = nx.DiGraph()
    
    #loop for every item i in the vector nodes file
    for i in f:
        #parse the vectors and store them in variables
        vector_1 = i[:15]
        vector_2 = i[16:31]

        #store the path chosen
        path = i[32]
     
        #add an edge connecting the two vectors from the file
        #if the node does not exist it will be created
        graph.add_edge(vector_1, vector_2, weight=int(path))
        
    #save the graph as an image
    show_graph(graph)
    return 

def check_all_configurations_with_all():
    #initialize variables and files
    flag = True
    order = ""
    f = open("all_vector_nodes.txt", "r")
    results = open("results1.txt", "w")
    graph_dict = {}
    graph = nx.DiGraph()
    
    #loop for every item i in the vector nodes file
    for i in f:
        #parse the vectors and store them in variables
        vector_1 = i[:15]
        vector_2 = i[16:31]
        
        #store the path chosen
        path = i[32]
        
        #add an edge connecting the two vectors from the file
        #if the node does not exist it will be created
        graph.add_edge(vector_1, vector_2)
        
        #if the vector exists append the second vector to the first in the dict
        #add the path to the dict at the same index as the second vector
        #used to retrieve path later
        if vector_1 in graph_dict.keys():
            graph_dict[vector_1][0].append(vector_2)
            graph_dict[vector_1][1].append(path)
        
        #if the vector does not exists, create it in the dict
        else:
            graph_dict[vector_1] = [[vector_2], [path]]

    #j is used as a counter for the vector #
    j = 0
    
    #for every item i in the vector list file
    for i in open("all_vector.txt", "r"):
        #go to the next vector
        j += 1
        
        #i is the current vector
        i = i[0:len(i)-1]
        
        #for every item n in the vector list file
        for n in open("all_vector.txt", "r"):
            
            #n is the vector to check if a path exists from i
            n = n[0:len(i)]
            
            #try the path
            try:
                #display the current path that us being checked
                print(f"#{j}: {i} to {n}")
                
                #see if the path exists, if so find the shortest path
                path = nx.dijkstra_path(graph, i, n)
                
                #if n and i are the same vector, do nothing and write there are no moves
                if n == i:
                    results.write(f"#{j}: {i} to {n} = no moves\n")
                    
                    #go to the next itteration of the loop
                    continue
                
                #get the path (switch choice) from i to n using the path dijkstras algorithm generated
                for k in range(0, len(path)-1):
                    order += graph_dict[path[k]][1][graph_dict[path[k]][0].index(path[k+1])] + " "
                
                #write the solution
                results.write(f"#{j}: {i} to {n} = {order}\n")
                
                #reset the solution for the next itteration
                order = ""
            
            #if the path does not exist, write and display it, set the flag to false
            except:
                print(f"#{j}: {i} to {n} is not a possible solution")
                results.write(f"#{j}: {i} to {n} is not a possible solution\n")
                flag = False

    #display and write if all configuration can be won
    if flag:
        print("All configurations can be won")
        results.write("All configurations can be won")
    else:
        print("All configurations can not be won")
        results.write("All configurations can not be won")

    #close files
    results.close()
    f.close()

def check_all_configurations():
    #initialize variables and files
    flag = True
    order = ""
    f = open("all_vector_nodes.txt", "r")
    results = open("results2.txt", "w")
    graph_dict = {}
    graph = nx.DiGraph()
    
    #loop for every item i in the vector nodes file
    for i in f:
        #parse the vectors and store them in variables
        vector_1 = i[:15]
        vector_2 = i[16:31]
        
        #store the path chosen
        path = i[32]
        
        #add the node and edge from vector 1 to 2
        graph.add_edge(vector_1, vector_2)
        
        #if the vector exists append the second vector to the first in the dict
        #add the path to the dict at the same index as the second vector
        #used to retrieve path later
        if vector_1 in graph_dict.keys():
            graph_dict[vector_1][0].append(vector_2)
            graph_dict[vector_1][1].append(path)
        else:
            #if the vector does not exists, create it in the dict
            graph_dict[vector_1] = [[vector_2], [path]]

    #j is used as a counter for the vector #
    j = 0
    
    #for every item i in the vector list file
    for i in open("all_vector.txt", "r"):
        #go to the next vector
        j += 1
        
        #i is the current vector
        i = i[0:len(i)-1]
        
        #try finding the path from one node to the all off state
        try:
            print(f"#{j}: {i}")
            path = nx.dijkstra_path(graph, i, "[0, 0, 0, 0, 0]")
            for k in range(0, len(path)-1):
                #get the path (switch choice) from i to n using the path dijkstras algorithm generated
                order += graph_dict[path[k]][1][graph_dict[path[k]][0].index(path[k+1])] + " "
            
            #write the solution
            results.write(f"#{j}: {i} = {order}\n")
            
            #clear order
            order = ""
            
        #if the path does not exist, write and display it, set the flag to false
        except:
            print(f"#{j}: {i} is not a possible solution")
            results.write(f"#{j}: {i} is not a possible solution\n")
            flag = False

    #display and write if all configuration can be won
    if flag:
        print("All configurations can be won")
        results.write("All configurations can be won")
    else:
        print("All configurations can not be won")
        results.write("All configurations can not be won")

    #close the files
    results.close()
    f.close()

def get_solution(configA):
    #order is used to store the switches to press
    order = ""
    
    #open the all_vector_nodes.txt in read mode
    f = open("all_vector_nodes.txt", "r")
    
    #open the resutls.txt in write mode
    results = open("results.txt", "w")
    
    #graph dict is used to connect a path to a transformation
    graph_dict = {}
    
    #geaph object containing the networkx graph
    graph = nx.DiGraph()
    
    #loop for every item i in the vector nodes file
    for i in f:
        
        vector_1 = i[:15]
        vector_2 = i[16:31]
        path = i[32]
        
        graph.add_edge(vector_1, vector_2)
        
        
        if vector_1 in graph_dict.keys():
            graph_dict[vector_1][0].append(vector_2)
            graph_dict[vector_1][1].append(path)
        else:
            
            graph_dict[vector_1] = [[vector_2], [path]]
    
    #try and get the path 
    try:
        path = nx.dijkstra_path(graph, configA, "[0, 0, 0, 0, 0]")
    except:
        return "Can not be solved"

    #get the switches to be flipped
    for k in range(0, len(path)-1):
        order += graph_dict[path[k]][1][graph_dict[path[k]][0].index(path[k+1])] + " "

    #close the file
    f.close()
    
    #return the switches to be flipped
    return order

#check_all_configurations() #file exists in folder, no need to run again
#check_all_configurations_with_all() #file exists in folder, no need to run again

#tests
#print(get_solution("[1, 1, 0, 0, 0]"))
#print(get_solution("[1, 1, 1, 1, 0]"))

generate_graph_visual()
