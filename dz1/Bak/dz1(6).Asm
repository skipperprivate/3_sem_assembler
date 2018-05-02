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
Str      db    'a c b ds re ew asf hg fr yu iii q',0   ;данная строка
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

