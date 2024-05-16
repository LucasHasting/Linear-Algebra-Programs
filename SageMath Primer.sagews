︠cee76fed-49b6-4249-9e07-12486ad35ddfi︠
%md
1. Declare a new variable **u**:

        u = vector(RR,[1,2,3])

2. Print(view) **u**:

        print(u)


3. Draw **u**:

        plot(arrow((0,0,0), u)

4. Add text to the graph of **u**:

    (a)

        a=arrow((0,0,0), u)

    (b)

        t=text3d("u",(1,1,1,))

    (c)

        plot(a+t)

5. Give a description of **u**:

        u.parent()

Uses the following function, which is mainly used for Question 6:

        def steps_1_5(SPACE):
            #Question 1
            if (SPACE == None):
                u = vector([1,2,3])
            else:
                u = vector(SPACE,[1,2,3])

            #Question 2
            print(u)

            #Question 5
            print(u.parent())

            #Question 3/4
            a = arrow((0,0,0), u)
            t = text3d("u",(1,1,1))
            return plot(a + t)

    Function Test:

        steps_1_5(RR)
︡c621655b-fb54-4d3f-8025-9d07bcc8e00b︡{"done":true,"md":"1. Declare a new variable **u**:\n\n        u = vector(RR,[1,2,3])\n\n2. Print(view) **u**:\n\n        print(u)\n\n\n3. Draw **u**:\n\n        plot(arrow((0,0,0), u)\n\n4. Add text to the graph of **u**:\n\n    (a)\n\n        a=arrow((0,0,0), u)\n\n    (b)\n\n        t=text3d(\"u\",(1,1,1,))\n\n    (c)\n\n        plot(a+t)\n\n5. Give a description of **u**:\n\n        u.parent()\n\nUses the following function, which is mainly used for Question 6:\n\n        def steps_1_5(SPACE):\n            #Question 1\n            if (SPACE == None):\n                u = vector([1,2,3])\n            else:\n                u = vector(SPACE,[1,2,3])\n\n            #Question 2\n            print(u)\n\n            #Question 5\n            print(u.parent())\n\n            #Question 3/4\n            a = arrow((0,0,0), u)\n            t = text3d(\"u\",(1,1,1))\n            return plot(a + t)\n\n    Function Test:\n\n        steps_1_5(RR)"}
︠89e3a5a1-09e7-41f1-bd92-fbe51ff4a72ei︠
#Question 1-5:
def steps_1_5(SPACE):
    #Question 1
    if (SPACE == None):
        u = vector([1,2,3])
    else:
        u = vector(SPACE,[1,2,3])

    #Question 2
    print(u)

    #Question 5
    print(u.parent())

    #Question 3/4
    a = arrow((0,0,0), u)
    t = text3d("u",(1,1,1))
    return plot(a + t)

steps_1_5(RR)

︡59825867-c056-4d27-85a2-7a7b1516d96a︡{"stdout":"(1.00000000000000, 2.00000000000000, 3.00000000000000)\nVector space of dimension 3 over Real Field with 53 bits of precision\n"}︡{"file":{"filename":"44a2145d-2bed-4809-9fe4-9ec9e09fdd99.sage3d","uuid":"44a2145d-2bed-4809-9fe4-9ec9e09fdd99"}}︡{"done":true}
︠c581b979-c819-4b82-aefe-404127538d37i︠
%md
6. Repeat the above steps for the same vector but replace *RR* with *ZZ*, then *QQ*, \*blank\*, and *Integers(3)*:

        steps_1_5(ZZ)
        steps_1_5(QQ)
        steps_1_5(None)
        steps_1_5(Integers(3))
︡b6bfe1b1-6392-4b5e-bb4b-a05be0243f2e︡{"done":true,"md":"6. Repeat the above steps for the same vector but replace *RR* with *ZZ*, then *QQ*, \\*blank\\*, and *Integers(3)*:\n\n        steps_1_5(ZZ)\n        steps_1_5(QQ)\n        steps_1_5(None)\n        steps_1_5(Integers(3))"}
︠0be6fbe5-43a6-43f5-a700-9d66d5cb2039si︠
#Question 6
steps_1_5(ZZ)
︡176b3700-f067-42af-9b1e-abec64fa74bf︡{"stdout":"(1, 2, 3)\nAmbient free module of rank 3 over the principal ideal domain Integer Ring\n"}︡{"file":{"filename":"e69a4c4e-e78f-4d07-8ac6-79148fa2feef.sage3d","uuid":"e69a4c4e-e78f-4d07-8ac6-79148fa2feef"}}︡{"done":true}
︠6dbce2f8-be13-405e-a6e6-0e468d7d2b13si︠
steps_1_5(QQ)
︡e6c8ca7f-7e52-43c8-a735-1de2a9ee7556︡{"stdout":"(1, 2, 3)\nVector space of dimension 3 over Rational Field\n"}︡{"file":{"filename":"6b3f32d9-6a26-4fcc-94bc-0ace68f64c93.sage3d","uuid":"6b3f32d9-6a26-4fcc-94bc-0ace68f64c93"}}︡{"done":true}
︠89e24984-163a-41d3-acd3-715f1035e2aesi︠
steps_1_5(None)
︡6d406956-735a-4fbd-8c03-f53f25511492︡{"stdout":"(1, 2, 3)\nAmbient free module of rank 3 over the principal ideal domain Integer Ring\n"}︡{"file":{"filename":"838120a6-8626-4cd8-934f-b373cb50c5c6.sage3d","uuid":"838120a6-8626-4cd8-934f-b373cb50c5c6"}}︡{"done":true}
︠d3b7bc29-e7c2-41d4-ba30-9a323584848csi︠
steps_1_5(Integers(3))
︡752506a0-80dc-4c83-b2e2-77398b2b7c88︡{"stdout":"(1, 2, 0)\nVector space of dimension 3 over Ring of integers modulo 3\n"}︡{"file":{"filename":"76a83833-6634-4394-a107-fcd52169b116.sage3d","uuid":"76a83833-6634-4394-a107-fcd52169b116"}}︡{"done":true}
︠31ad0fe9-e25d-4a02-ba8c-7b519ec8a122i︠
%md
7. Give a short description after you have created and graphed all 4 new vectors about the differences:

    By default it creates a vector in the 3rd deminision.

    The integers show a rank of 3.

    The integers modulo of 3 change the value in the vector to match modulo 3.

8. Create a new vector v= [3, 4, −7]. Compute the dot product with u over the different vector spaces:

        dot_product_space(RR, u, v)
        dot_product_space(ZZ, u, v)
        dot_product_space(QQ, u, v)
        dot_product_space(None, u, v)
        dot_product_space(Integers(3), u, v)

    Function used:

        def dot_product_space(SPACE, vec1, vec2):
            if (SPACE == None):
                u = vector(vec1)
                v = vector(vec2)
            else:
                u = vector(SPACE, vec1)
                v = vector(SPACE, vec2)
            print(u.dot_product(v))

︡d938ba2c-f4af-49ba-bf78-ddf5a0328f92︡{"done":true,"md":"7. Give a short description after you have created and graphed all 4 new vectors about the differences:\n\n    By default it creates a vector in the 3rd deminision.\n\n    The integers show a rank of 3.\n\n    The integers modulo of 3 change the value in the vector to match modulo 3.\n\n8. Create a new vector v= [3, 4, −7]. Compute the dot product with u over the different vector spaces:\n\n        dot_product_space(RR, u, v)\n        dot_product_space(ZZ, u, v)\n        dot_product_space(QQ, u, v)\n        dot_product_space(None, u, v)\n        dot_product_space(Integers(3), u, v)\n\n    Function used:\n\n        def dot_product_space(SPACE, vec1, vec2):\n            if (SPACE == None):\n                u = vector(vec1)\n                v = vector(vec2)\n            else:\n                u = vector(SPACE, vec1)\n                v = vector(SPACE, vec2)\n            print(u.dot_product(v))"}
︠9acb2e1a-ad17-409b-873d-507b94db0913i︠

#Question 8
u = vector(RR, [1,2,3])
v = vector(RR, [3,4,-7])

def dot_product_space(SPACE, vec1, vec2):
    if (SPACE == None):
        u = vector(vec1)
        v = vector(vec2)
    else:
        u = vector(SPACE, vec1)
        v = vector(SPACE, vec2)
    print(u.dot_product(v))

dot_product_space(RR, u, v)
dot_product_space(ZZ, u, v)
dot_product_space(QQ, u, v)
dot_product_space(None, u, v)
dot_product_space(Integers(3), u, v)
︡5b984473-f87f-497d-aedf-36ae5159fca5︡{"stdout":"-10.0000000000000\n"}︡{"stdout":"-10\n"}︡{"stdout":"-10\n"}︡{"stdout":"-10.0000000000000\n"}︡{"stdout":"2\n"}︡{"done":true}
︠a6d3f8f2-dffe-43cb-9514-4a1c527f6a51i︠
%md
9. Using RR as your vector space, graph u+v. Include the vectors u, and v. Ensure the ”head and tails” line up:

        arrowu_v = arrow((0,0,0),(u+v))
        arrowu = arrow((0,0,0), u)
        arrowv = arrow(u, (u+v))
        plot(arrowu_v + arrowu + arrowv)
︡71cc3fb0-dd15-4c14-b002-eaf63f736001︡{"done":true,"md":"9. Using RR as your vector space, graph u+v. Include the vectors u, and v. Ensure the ”head and tails” line up:\n\n        arrowu_v = arrow((0,0,0),(u+v))\n        arrowu = arrow((0,0,0), u)\n        arrowv = arrow(u, (u+v))\n        plot(arrowu_v + arrowu + arrowv)"}
︠483ad42c-566c-43fa-9a37-19457ae38400i︠
#Question 9
arrowu_v = arrow((0,0,0),(u+v))
arrowu = arrow((0,0,0), u)
arrowv = arrow(u, (u+v))
plot(arrowu_v + arrowu + arrowv)
︡6f7fdc37-1a21-45d3-a2cd-436bb49b1a4a︡{"file":{"filename":"cded3c6f-b911-421a-9863-cab914db65cd.sage3d","uuid":"cded3c6f-b911-421a-9863-cab914db65cd"}}︡{"done":true}
︠91da650c-479d-4fbc-962b-d52117011f0ai︠
%md
10. Build a simple function:

        def x_sum_y(x,y):
            a = (x+y)
            print(a)

11. Test your function x_sum_y(u,v):

        x_sum_y(u, v)
︡4ac44a17-9a36-4841-9a72-69b7792473b2︡{"done":true,"md":"10. Build a simple function:\n\n        def x_sum_y(x,y):\n            a = (x+y)\n            print(a)\n\n11. Test your function x_sum_y(u,v):\n\n        x_sum_y(u, v)"}
︠c3408dd6-0630-4080-8326-275996d16621i︠
#Question 10
def x_sum_y(x,y):
    a = (x+y)
    print(a)

#Question 11
x_sum_y(u, v)
︡0949705d-7fa9-4a3c-bf2f-3a5c3754e3b7︡{"stdout":"(4.00000000000000, 6.00000000000000, -4.00000000000000)\n"}︡{"done":true}
︠6d564737-b9bc-41c9-a848-ff8b2a462a03i︠
%md
12. Using the above idea, create and test the following functions:

    (a) x_project_y(x,y) for projecting vector x onto vector y:

        def x_proj_y(x, y):
            proj_val = x.dot_product(y) / x.dot_product(x)
            print(list(x * proj_val))

    (b) x_intproject_y(x,y,I) for projecting vector x onto vector y over Integer(I) vector space:

        def x_intproject_y(x,y,I):
            x = vector(Integers(I), x)
            x = vector(Integers(I), y)
            x_proj_y(x, y)

    (c) x_angle_y(x,y) for finding the angle between vector x and vector y. What happens if you switch the vector space?:

        def x_angle_y(x,y):
            radian = (arccos(x.dot_product(y) / (magnitude(x) * magnitude(y))))
            print(numerical_approx(radian * (180 / pi)))

         def magnitude(x):
            return sqrt(x.dot_product(x))

    Testing:

            x = vector([1, -2])
            y = vector([-2, 1])

            x_proj_y(x, y)
            x_intproject_y(x,y,2)
            x_angle_y(x, y)

            x = vector(ZZ, tuple(x))
            y = vector(ZZ, tuple(y))
            x_angle_y(x, y)

            x = vector(Integers(3), x)
            y = vector(Integers(3), y)
            #x_angle_y(x, y) gives an error

    Result:
        When I test the angle function with different vector spaces it gives the same result, however, when the space is changed using modulo, it provides an error. Sagemath handels sqrt with a modulo space differently than real numbers and does not apply that to the arccos function.
︡387e2011-3060-46fa-9c85-bc945b47561d︡{"done":true,"md":"12. Using the above idea, create and test the following functions:\n\n    (a) x_project_y(x,y) for projecting vector x onto vector y:\n\n        def x_proj_y(x, y):\n            proj_val = x.dot_product(y) / x.dot_product(x)\n            print(list(x * proj_val))\n\n    (b) x_intproject_y(x,y,I) for projecting vector x onto vector y over Integer(I) vector space:\n\n        def x_intproject_y(x,y,I):\n            x = vector(Integers(I), x)\n            x = vector(Integers(I), y)\n            x_proj_y(x, y)\n\n    (c) x_angle_y(x,y) for finding the angle between vector x and vector y. What happens if you switch the vector space?:\n\n        def x_angle_y(x,y):\n            radian = (arccos(x.dot_product(y) / (magnitude(x) * magnitude(y))))\n            print(numerical_approx(radian * (180 / pi)))\n\n         def magnitude(x):\n            return sqrt(x.dot_product(x))\n\n    Testing:\n\n            x = vector([1, -2])\n            y = vector([-2, 1])\n\n            x_proj_y(x, y)\n            x_intproject_y(x,y,2)\n            x_angle_y(x, y)\n\n            x = vector(ZZ, tuple(x))\n            y = vector(ZZ, tuple(y))\n            x_angle_y(x, y)\n\n            x = vector(Integers(3), x)\n            y = vector(Integers(3), y)\n            #x_angle_y(x, y) gives an error\n\n    Result:\n        When I test the angle function with different vector spaces it gives the same result, however, when the space is changed using modulo, it provides an error. Sagemath handels sqrt with a modulo space differently than real numbers and does not apply that to the arccos function."}
︠035bec98-8914-46fb-aafa-5f429a8bdf85si︠
#Question 12
def x_proj_y(x, y):
    proj_val = x.dot_product(y) / x.dot_product(x)
    print(list(x * proj_val))

def x_intproject_y(x,y,I):
    x = vector(Integers(I), x)
    x = vector(Integers(I), y)
    x_proj_y(x, y)

def x_angle_y(x,y):
    radian = (arccos(x.dot_product(y) / (magnitude(x) * magnitude(y))))
    print(numerical_approx(radian * (180 / pi)))

def magnitude(x):
    return sqrt(x.dot_product(x))


x = vector([1, -2])
y = vector([-2, 1])

x_proj_y(x, y)
x_intproject_y(x,y,2)
x_angle_y(x, y)

x = vector(ZZ, x)
y = vector(ZZ, y)
x_angle_y(x, y)

x = vector(Integers(3), x)
y = vector(Integers(3), y)
#x_angle_y(x, y) - gives an error
︡403806f4-f68b-461a-8cab-94b98bb8824b︡{"stdout":"[-4/5, 8/5]\n"}︡{"stdout":"[0, 1]\n"}︡{"stdout":"143.130102354156"}︡{"stdout":"\n"}︡{"stdout":"143.130102354156\n"}︡{"done":true}









