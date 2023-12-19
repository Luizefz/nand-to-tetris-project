// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(START)
    @SCREEN //16384 Caractere dedicado a tela em assembly
    D=A
    @i
    M=D          //i = SCREEN

(LOOP)           //while(i < screen - 1)
    @i
    D=M
    @24575       //Ultima posicao da memoria refenrente a tela do computador
    D=A-D
    @START
    D;JLT       // i<screen -1(negative check)
    @KBD
    D=M
    @BLACKEN    // se uma das teclas do teclado for pressionada, vai para BLACKEN
    D;JNE

    @i
    D=M
    A=D
    M=0 //se não, ele continua pintando a tela de branco
    @CONTINUE
    0;JMP

(BLACKEN)
    @i
    D=M
    A=D
    M=-1 //Aqui ele muda a cor do pincel para preto == -1 (1111111111111111)

(CONTINUE)
    @i
    M=M+1 //i++
    @LOOP
    0;JMP