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
         
;A   SWORD  3
W   SWORD  2

Zapros   DB    'Enter number',13,10,0 
Zapros2   DB    'Enter number not equal 0',13,10,0
;buffer   DB    10 dup ('0')
;buffer2   DB    10 dup ('0')
Result   DB    13,10,'Result='
ResStr   DB    16 DUP (' '),0

         .DATA?
   
K   SWORD   ?   
L   SWORD   ?
T   SWORD   ?   
A   SWORD   ?
C1   SWORD   ?   
Buffer   DB    10 DUP (?) 
inbuf    DB    100 DUP (?)

         .CODE
Start:  
        ;INITIALISATION K
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer 

         Invoke atol,ADDR Buffer 
         mov    DWORD PTR K,EAX
         
         ;mov DX,K
         ;INITIALISATION L
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer
         Invoke atol,ADDR Buffer 
         mov    DWORD PTR L,EAX
         
         
         ;INITIALISATION A
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer
         Invoke atol,ADDR Buffer 
         mov    DWORD PTR A,EAX
         
          ;INITIALISATION C1
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer
         Invoke atol,ADDR Buffer 
         mov    DWORD PTR C1,EAX
         
    
         mov AX,C1
         
         cwd
         
         idiv W    ;C1 / 2
         
         mov BX,AX  
         
  
         
         mov DX,L
         
         sub DX,A   ;L - A
         
         mov AX,DX
         
         imul AX    ;(L - A) * (L - A)
         
         idiv C1    ;(L - A) * (L - A)/C1
         
         mov DX,K
         
         add AX,DX  ;(L - A) * (L - A)/C1 + K
         
         mov DX,L
         
         sub AX,DX  ;(L - A) * (L - A)/C1 + K - L
         
         ADD AX,BX  ;(L - A) * (L - A)/C1 + K - L + C1 / 2
         
         mov T,AX 
         
         
         


         
         Invoke dwtoa,T,ADDR ResStr 
         Invoke StdOut,ADDR Result
         
         XOR    EAX,EAX
         
         Invoke StdOut,ADDR MsgExit
         
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start


