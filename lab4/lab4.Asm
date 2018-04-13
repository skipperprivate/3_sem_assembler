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
         
A SWORD 0,0,0,0,0,0
  SWORD 0,0,0,0,0,0
  SWORD 0,0,0,0,0,0
  SWORD 0,0,0,0,0,0
  SWORD 0,0,0,0,0,0
  
             
         .DATA?
inbuf    DB    100 DUP (?)

         .CODE
Start:
; 
;    Add you statements
;
         XOR    EAX,EAX
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start

