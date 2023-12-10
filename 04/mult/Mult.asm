// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

    @R0
    @R1 // fator da multilicação
    D = M
    @R2
    M = 0
    @I
    M = D // Pega o fator da multiplicação para saber quantas vezes vai repetir a soma

(LOOPSUM)
    @I
    D = M
    @END // Se for igual a zero, vai para o END
    D;JEQ
    @R0
    D = M
    @R2
    M = M+D // Soma R0 com R2
    @I
    M = M-1
    @LOOPSUM
    0;JMP

(END)
    @END
    0;JMP