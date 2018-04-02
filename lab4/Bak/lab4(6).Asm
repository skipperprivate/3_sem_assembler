; Template for console application
         .586
         .MODEL  flat, stdcall
         OPTION CASEMAP:NONE

Include kernel32.inc
Include masm32.inc

IncludeLib kernel32.lib
IncludeLib masm32.lib

         .CONST
MsgExit  DB    "Press Enter to Exit",0AH,0DH,0

         .DATA
B SWORD 0

A SWORD 1
         .DATA?
inbuf    DB    100 DUP (?)

         .CODE
Start:
; 
;    Add you statements
;
         cmp B,0
         cmp AL,AH
         jl less
         Invoke StdOut,ADDR MsgExit
         Invoke StdOut,ADDR MsgExit
         Invoke StdOut,ADDR MsgExit
         jmp cont
         less:Invoke StdOut,ADDR MsgExit        
  
  
  cont:
         XOR    EAX,EAX
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start

