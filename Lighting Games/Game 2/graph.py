import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

def show_graph(graph):
    pos = nx.spring_layout(graph, k=0.3*1/np.sqrt(len(graph.nodes())), iterations=20)
    plt.figure(3, figsize=(30, 30))
    nx.draw(graph, pos=pos)
    nx.draw_networkx_labels(graph, pos=pos)
    plt.savefig("graph.png")

def generate_graph_visual():
    f = open("all_vector_nodes.txt", "r")
    graph = nx.DiGraph()

    for i in f:
        vector_1 = i[:9]
        vector_2 = i[10:19]
        path = i[20]
        graph.add_edge(vector_1, vector_2, weight=int(path))

    show_graph(graph)
    return

def check_all_configurations_with_all():
    flag = True
    order = ""
    f = open("all_vector_nodes.txt", "r")
    results = open("results1.txt", "w")
    graph_dict = {}
    graph = nx.DiGraph()
    for i in f:
        vector_1 = i[:9]
        vector_2 = i[10:19]
        path = i[20]
        graph.add_edge(vector_1, vector_2)
        if vector_1 in graph_dict.keys():
            graph_dict[vector_1][0].append(vector_2)
            graph_dict[vector_1][1].append(path)
        else:
            graph_dict[vector_1] = [[vector_2], [path]]

    #test if every configuration can lead to every configuration
    j = 0
    for i in open("all_vector.txt", "r"):
        j += 1
        i = i[0:len(i)-1]
        for n in open("all_vector.txt", "r"):
            n = n[0:len(i)]
            try:
                print(f"#{j}: {i} to {n}")
                path = nx.dijkstra_path(graph, i, n)
                if n == i:
                    results.write(f"#{j}: {i} to {n} = no moves\n")
                    continue
                for k in range(0, len(path)-1):
                    order += graph_dict[path[k]][1][graph_dict[path[k]][0].index(path[k+1])] + " "
                results.write(f"#{j}: {i} to {n} = {order}\n")
                order = ""
            except:
                print(f"#{j}: {i} to {n} is not a possible solution")
                results.write(f"#{j}: {i} to {n} is not a possible solution\n")
                flag = False

    if flag:
        print("All configurations can be won")
        results.write("All configurations can be won")
    else:
        print("All configurations can not be won")
        results.write("All configurations can not be won")

    results.close()
    f.close()

def check_all_configurations():
    flag = True
    order = ""
    f = open("all_vector_nodes.txt", "r")
    results = open("results2.txt", "w")
    graph_dict = {}
    graph = nx.DiGraph()
    for i in f:
        vector_1 = i[:9]
        vector_2 = i[10:19]
        path = i[20]
        graph.add_edge(vector_1, vector_2)
        if vector_1 in graph_dict.keys():
            graph_dict[vector_1][0].append(vector_2)
            graph_dict[vector_1][1].append(path)
        else:
            graph_dict[vector_1] = [[vector_2], [path]]

    #test if every configuration can lead to every configuration
    j = 0
    for i in open("all_vector.txt", "r"):
        j += 1
        i = i[0:len(i)-1]
        try:
            print(f"#{j}: {i}")
            path = nx.dijkstra_path(graph, i, "[0, 0, 0]")
            for k in range(0, len(path)-1):
                order += graph_dict[path[k]][1][graph_dict[path[k]][0].index(path[k+1])] + " "
            results.write(f"#{j}: {i} = {order}\n")
            order = ""
        except:
            print(f"#{j}: {i} is not a possible solution")
            results.write(f"#{j}: {i} is not a possible solution\n")
            flag = False

    if flag:
        print("All configurations can be won")
        results.write("All configurations can be won")
    else:
        print("All configurations can not be won")
        results.write("All configurations can not be won")

    results.close()
    f.close()

def get_solution(configA):
    order = ""
    f = open("all_vector_nodes.txt", "r")
    results = open("results.txt", "w")
    graph_dict = {}
    graph = nx.DiGraph()
    for i in f:
        vector_1 = i[:9]
        vector_2 = i[10:19]
        path = i[20]
        graph.add_edge(vector_1, vector_2)
        if vector_1 in graph_dict.keys():
            graph_dict[vector_1][0].append(vector_2)
            graph_dict[vector_1][1].append(path)
        else:
            graph_dict[vector_1] = [[vector_2], [path]]

    path = nx.dijkstra_path(graph, configA, "[0, 0, 0]")
    for k in range(0, len(path)-1):
        order += graph_dict[path[k]][1][graph_dict[path[k]][0].index(path[k+1])] + " "

    f.close()
    return order

#check_all_configurations() #file exists in folder, no need to run again
#check_all_configurations_with_all() #file exists in folder, no need to run again

#test
#print(get_solution("[1, 0, 2]"))
generate_graph_visual()
