# Neural_net_arm
Course assignment. Implemented 3 input logic gates using neural net on ARM cortex M4
Go through the following Videos about Machine Learning ( I had already shared this through Whatsapp)

1. https://youtu.be/h2j7J08eSv8
2.https://youtu.be/ZLIQuopOjz4
3.https://youtu.be/p-06Z6zO4Po

Based on the discussion in Video you are expected to implement the following LOGIC OPERATIONS using Neural Network in Cortex M4 process using Floating point processor. Please NOTE: YOU NEED TO USE FPU (not the regular processor).


logic_and
logic_or
logic_not
logic_xor
logic_xnor
logic_nand
logic_nor

All the gate implementation take THREE INPUT.

Hint: we had already completed the Infinite series for log.
Take the same code Implement exponetial series, and ten sigmoid fucntion which can used for implementing the Neural Network

Complete code in python is given in following URL. Study this code and implement the same using CORTEXM$ Assembly instructions for FPU

https://github.com/fjcamillo/Neural-Representation-of-Logic-Functions/blob/master/Logic.py

Once you compute the output value of NN it will be in FPU register in IEEE FP format.

This has to be converted to TRUE value and printed.


I am attaching a ZIP file ITM_TEST.zip. This contains the project .s and .c
files for you. THis can be used a sample/template for implementing your own
printf() function. This has the same exercise we discussed in class.

So implement the feed forward function. We use using ST Microelectronics STM32F407VGTx board. board here (I mean the simulation model of this board) for the assignment. I had done all the configuration for you the project. So no need to worry about those details. Just take this project and start writing your code in ARM Cortex M4 assembly Language. Do not use C for any thing except the routine I had provided.

When you open the project in ITM_TEST.zip using KEIL, it will automatically open
the packed installer will prompt to install the STM32F407VGTx simulation model
and it will automatically install. Just accept all the prompts.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Follow the steps given below:
1. Implement e to power of x Exactly like we did, log series
2. Implement Sigmoid function as another routine and test it completely.
3. To test your implementation of sigmoid funcion, generate the output for input values ranging from -5 to +5 and make sure you are getting the curve as expected (refer to video) Use the print function I had provided and copy paste the output to a spread sheet and plot it.
4. By now the basic component to build the neural network is ready

5. Go through the python code and implement the neural network step by step (consider python code as pseudo code of what you need to do) - Use python
only to understand the algorithm. You do not have to learn python for this.


6. During this process of implementation you will get to learn how to implement switch-case equivalent in cortex M4. Floating point instructions. Convertion of TRUE Value of a number to IEEE FP standards and back to TRUE value.

7. You will learn how to call a C routine from assembly

8. How to pass parameter between a C routine and assembly. (APCS what we discussed in class)
