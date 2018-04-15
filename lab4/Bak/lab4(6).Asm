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
  
ROW SWORD 3
COL SWORD 6
I SWORD 1
J SWORD 1

new_str    DB 13,10,0
place  DB ' '             
ResStr DB 16 DUP (' '),0                   
ResStrOut DB 6 DUP (' '),0  
RequestA DB "Input matrix 5x6: ",0AH,0DH,0 
matrixout DB "see the matrix",13,10,0
              
         .DATA?
inbuf    DB    100 DUP (?)

         .CODE
Start:  
         INVOKE StdOut, ADDR RequestA
         mov EBX,0
         mov ECX,18
         
     rowcycle:    
            push ECX
            Invoke StdIn,ADDR inbuf,LengthOf inbuf
            Invoke StripLF,ADDR inbuf 
            Invoke atol,ADDR inbuf
            mov A[EBX],AX
            pop ECX
            add EBX,2            
            
            loop rowcycle 
       
       
     Invoke StdOut, ADDR matrixout  
     ;output  
     mov EBX,0
     mov ECX,6 
     cycleOutput1: 

                        push ECX
                        mov ECX,5

          cycleOutput2:                        

                        push ECX                                
                        Invoke dwtoa,A[EBX*2], ADDR ResStrOut    
                        Invoke StdOut, ADDR ResStrOut           
                        Invoke StdOut, ADDR place              
                        pop ECX

                   inc EBX

                    
          loop cycleOutput2 

                   pop ECX

               
                    push ECX                    
                    invoke StdOut, ADDR Per     
                    pop ECX

        loop cycleOutput1 
       
         

         XOR    EAX,EAX
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start

