; Template for console application
         .586
         .MODEL  flat, stdcall
         OPTION CASEMAP:NONE

Include kernel32.inc
Include masm32.inc

IncludeLib kernel32.lib
IncludeLib masm32.lib

         .CONST       
MsgExit  DB    13,10,"Press Enter to Exit",0AH,0DH,0

         .DATA
         
Zapros   DB    'Enter number',13,10,0 
Zapros2   DB    'Enter number not equal 0',13,10,0
;buffer   DB    10 dup ('0')
;buffer2   DB    10 dup ('0')
Result   DB    13,10,'Result='
ResStr   DB    16 DUP (' '),0

         .DATA?
     
A   SWORD   ?
B   SWORD   ? 
C1   SWORD   ?   
M   SWORD   ?  
Buffer   DB    10 DUP (?) 
inbuf    DB    100 DUP (?)

         .CODE
Start:  
        ;INITIALISATION A
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer 

         Invoke atol,ADDR Buffer 
         mov    DWORD PTR A,EAX
         
         ;mov DX,K
         ;INITIALISATION B
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer
         Invoke atol,ADDR Buffer 
         mov    DWORD PTR B,EAX
         
          ;INITIALISATION C1
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer
         Invoke atol,ADDR Buffer 
         mov    DWORD PTR C1,EAX
         
    
         mov AX,A
         imul C1
         imul C1    ;A*C^2
         
         mov BX,AX
         
         mov AX,B
         imul A
         cwd
         idiv C1     ;B*A/C
         
         mov CX,AX
         
         mov AX,BX
         sub AX,CX   ;A*C^2 - B*A/C
         
         mov M,AX 
         
         
         
         
         Invoke dwtoa,M,ADDR ResStr 
         Invoke StdOut,ADDR Result
         
         XOR    EAX,EAX
         
         Invoke StdOut,ADDR MsgExit
         
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start

