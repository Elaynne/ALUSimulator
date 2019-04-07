# ULASimulator
 This work describes the implementation of a mini ULA that receives as input two 8-bit vectors as operands (called "A" and "B"), a selector vector of 5 bits (called "Selector") that allows the realization of up to 32 operations, and has an output of a 16-bit vector (called "O"). The language used was the description in VHDL using the software Quartus II and FPGA board D2-E, and Altera Up to carry out the simulations. We performed 17 operations that are described in the Control Unit bellow.
 
 
| Selector | Operation | Description |
|----------| :------------------------:| ------------------------------------------------------------------------------:|
|00000|F = Sum (A,  B)|Soma entre dois operandos|
|00001|F = Sub(A,  B)|Subtração entre dois operandos|
|00010|F = Mul (A,  B)|Multiplicação entre dois operandos|
|00011|F = Inc(A)|Incremento do primeiro operando A, ou seja, soma 1.|
|00100|F = Dec (A)|Decremento do primeiro operando A, ou seja, subtrai 1.|
|00101|F = ShiftLeft (A)|Move o operando A em um índice para a esquerda|
|00110|F = ShiftRight(A)|Move o operando A em um índice para a direita|
|00111|F =  Equal(A, B)|Compara se os dois operando são iguais e retorna “0” caso falso, e “1” caso verdadeiro|
|01000|F =  Less(A, B)|Compara se “A” é menor que “B” e retorna “0” caso falso, e “1” caso verdadeiro|
|01001|F =  Greater(A, B)|Compara se “A” é maior que “B” e retorna “0” caso falso, e “1” caso verdadeiro\
|01010|F =  OpAND(A, B)|Operação lógica bit a bit AND entre “A” e “B”|
|01011|F =  OpOR(A, B)|Operação lógica bit a bit OR entre “A” e “B”|
|01100|F =  OpXOR(A, B)|Operação lógica bit a bit XNOR entre “A” e “B”|
|01101|F =  OpNAND(A, B)|Operação lógica bit a bit NAND entre “A” e “B”|
|01110|F =  OpNOR(A, B)|Operação lógica bit a bit NOR entre “A” e “B”|
|01111|F =  OpXNOR(A, B)|Operação lógica bit a bit XNOR entre “A” e “B”|
|10000|F =  OpNOT_A(A)|Operação lógica NOT do operando “A”.|

