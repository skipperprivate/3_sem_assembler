; Template for console application
         .586
         .MODEL  flat, stdcall
         OPTION CASEMAP:NONE

Include kernel32.inc
Include masm32.inc

IncludeLib kernel32.lib
IncludeLib masm32.lib

         .CONST
MsgExit   DB     13,10,"Press Enter to Exit",0AH,0DH,0

Enter_Msg DB    "Your string",0AH,0DH,0                 

mystr     DB    "sdsdsdsd ghjfklmn xcvbnmzx rtyuiopq",0  ; ?????? ?????? ?? ???????

res       DB     0AH,0DH,'Chislo razlichnix slov ',0AH,0DH,0  
         .DATA

         .DATA?
inbuf    DB    100 DUP (?)
result   db    60 DUP ('')

         .CODE
Start:
         cld
         lea edi,str
         mov al,' '
         ;mov ebx,

         XOR    EAX,EAX
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start

