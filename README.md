# ULASimulator
 This work describes the implementation of a mini ULA that receives as input two 8-bit vectors as operands (called "A" and "B"), a selector vector of 5 bits (called "Selector") that *allows the realization of up to 32 operations*, and has an output of a 16-bit vector (called "O"). The language used was the description in VHDL using the software Quartus II and FPGA board D2-E, and Altera Up to carry out the simulations. This code implements **17 operations** that are described in the Control Unit bellow.
 
 ### Control Unit
 
| Selector | Operation | Description |
|----------| :--------------------------------:| :------------------------------------------------------------------------------|
|00000|F = Sum (A,  B)|Sum between two operands|
|00001|F = Sub(A,  B)|Subtraction between two operands|
|00010|F = Mul (A,  B)|Multiplication between two operands|
|00011|F = Inc(A)|Increase of the first operand A, that is, sum 1.|
|00100|F = Dec (A)|Decrement of the first operand A, that is, subtract 1.|
|00101|F = ShiftLeft (A)|Move operand A in an index to the left|
|00110|F = ShiftRight(A)|Move operand A in an index to the right|
|00111|F =  Equal(A, B)|Compares if the two operands are equal and returns "0" false case, and "1" true case|
|01000|F =  Less(A, B)|Compares if "A" is less than "B" and returns "0" if false, and "1" is true|
|01001|F =  Greater(A, B)|Compares if "A" is greater than "B" and returns "0" if false, and "1" is true|
|01010|F =  OpAND(A, B)|Logical bitwise operation AND between "A" and "B"|
|01011|F =  OpOR(A, B)|Logical bitwise operation OR between "A" and "B"|
|01100|F =  OpXOR(A, B)|XNOR bitwise logical operation between "A" and "B"|
|01101|F =  OpNAND(A, B)|NAND bitwise logical operation between "A" and "B"|
|01110|F =  OpNOR(A, B)|NOR bitwise logic operation between "A" and "B"|
|01111|F =  OpXNOR(A, B)|XNOR bitwise logical operation between "A" and "B"|
|10000|F =  OpNOT_A(A)|Operand logic NOT of operand "A".|

### Design

The architecture of the project was developed by creating the Control Unit called ULA8bits and two packages: one for the logical unit **(LogicUnitPkg)** and one for the Arithmetic Unit **(ArithmeticUnitPkg)**, which are called by the ULA. The Control Unit describes the inputs and outputs, and processes the call of the packet functions by the selector. Libraries were also used to perform type conversion operations and numeric operations.

For this work, no carry variable was implemented because the size of the 16-bit output already guarantees for the operations performed, that there will be no overflow and the use of the libraries allows to perform operations with the signals of the operands (sum, sub, mul) without having to do the Loop to iterate every bit. All arithmetic operations, **except multiplication**, perform logical OR operation with 16-bit vector with zeros to format its output to 16 bits as expected by the ALU controller.


Shift operations used an unsigned helper variable to convert the input operand of type std_logic_vector. After the conversion, we performed the shift left and shift right operations with the logical operands "sll" and "srl" whose result was converted again to the expected output std_logic_vector. Finally, the result of the AND between the result of the shift with a binary vector of 16 zeros is returned to format the output expected by the ALU.

The Equal, Less, and Greater operations return the binary vector "0000000000000000" if its sentence is false, and "0000000000000001" if the sentence is true. The other logical operations AND, OR, XOR, NAND, NOR, XNOR and NOT_A also go through the 16-bit size output conversion, and the NOT_A operation is unary by inverting the value of input A.


