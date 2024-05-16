def o(matA, matB):
    #turn matrices into list of vectors
    matA = list(matA)
    matB = list(matB)

    #get the rows and columns
    rows = len(matA)
    cols = len(matA[0])

    #create a 0 matrix of size row by col
    result = [[0]*cols for i in range(rows)]

    #turn matrices into 2D lists
    matA = [list(x) for x in matA]
    matB = [list(x) for x in matB]

    #for every item in the matrix
    for i in range(0, rows):
        for j in range(0, cols):
            #store the product of index i at matrix A and B into the index at result
            result[i][j] = matA[i][j]*matB[i][j]

    #return the result as a matrix
    return matrix(result)

def cross(matA, matB):
    #turn matrix A into a list of vectors
    matA = list(matA)

    #create an empty result list
    result = []

    #get row and column of matrix A
    row = len(matA)
    col = len(matA[0])

    #for every index in matrix A
    for i in range(0, row):
        for j in range(0, col):
            #store the index of A * matrix B into the result list
            result.append(matA[i][j] * matB)

    #create a result_list list to store the smaller matrices
    result_list = []


    for i in range(0, row):
        #get the first matrix in the col
        mat = result[i*col]

        #loop for every matrix in the col
        for j in range(1, col):

            #merge the matrices horrizontally
            mat = mat.augment(result[(i*len(matA[0]))+j])

        #append the merged matrix to the result_list list
        result_list.append(mat)

    #store the first merged matrix into the final matrix variable
    final_matrix = result_list[0]

    #loop for every item in the result_list list
    for i in range(1,len(result_list)):
        #merge the matrices vertically
        final_matrix = final_matrix.stack(result_list[i])

    #return the result
    return final_matrix

#function used to test the o function
def test_o():
    matA = matrix([[1,2,3],[4,5,6]])
    matB = matrix([[2,1,3],[8,7,5]])
    result = o(matA, matB)
    print(result)

#function used to test the cross function
def test_cross():
    matA = matrix([[1,2,3],[4,5,6]])
    matB = matrix([[2,1,3],[8,7,5]])
    result = cross(matA,matB)
    print(result)

#call the test functions
test_o()
print()
test_cross()
