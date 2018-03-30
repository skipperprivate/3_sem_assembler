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
Result   DB    13,10,'Result='
ResStr   DB    16 DUP (' '),0

         .DATA?
A    SWORD   ?
B    SWORD   ?
Y    SWORD   ?
M    SWORD   ?  
Buffer   DB    10 DUP (?)        
inbuf    DB    100 DUP (?)

         .CODE
Start:
; 
;    Add you statements
;
         ;INITIALIZATION A
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer 
         Invoke atol,ADDR Buffer 
         mov    DWORD PTR A,EAX

         ;INITIALIZATION B
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer 
         Invoke atol,ADDR Buffer 
         mov    DWORD PTR B,EAX
         
         ;INITIALIZATION C
         Invoke StdOut,ADDR Zapros
         Invoke StdIn,ADDR Buffer,LengthOf Buffer 
         Invoke StripLF,ADDR Buffer 
         Invoke atol,ADDR Buffer 
         mov    DWORD PTR Y,EAX


         mov AX,A
         ;mov BX,B
         
         cmp AX,B
         ;A > B
         jl less
         
         mov AX,A
         
         imul Y     ;A / C
         
         imul Y
         
         sub AX,B     ;A / B
         
         jmp continue
         
         ;A < B
         less:
         
         mov AX,A
         cwd

         idiv Y         ;A / C

         mov BX,AX

         mov AX,A

         cwd

         idiv B         ;A / B

         add AX,BX
                  
                  
                  
         continue:
                 
         mov M,AX
                  
         
         Invoke dwtoa,M,ADDR ResStr 
         
         Invoke StdOut,ADDR Result 
         
         XOR    EAX,EAX
         
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start
