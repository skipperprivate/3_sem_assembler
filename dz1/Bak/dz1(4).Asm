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

mystr     DB    "ab fd gsa re as ds vf ggg s sxs re ui",0  ; строка изначальная

res       DB     0AH,0DH,'Chislo razlichnix slov ',0AH,0DH,0  
         .DATA
Perenos     DB    13,10
         .DATA?
inbuf    DB    100 DUP (?)
rezstr   db      0AH,0DH,22 DUP (' '),0AH,0DH,0

         .CODE
Start:
         Invoke StdOut,ADDR Enter_Msg
         Invoke StdOut,ADDR mystr
         Invoke StdOut,ADDR Perenos
         
         lea EDI,[mystr-1]
         les ESI,[mystr-1]
         
         mov EBX,12
         cld

         XOR    EAX,EAX
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start

