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
  
mas SWORD 0,0,0,0,0,0  
  
ROW SWORD 3
COL SWORD 6
I SWORD 1
J SWORD 1
MAX SWORD 0
count      sword    4

new_str    DB 13,10,0
place  DB ' '             
ResStr DB 16 DUP (' '),0                   
ResStrOut DB 6 DUP (' '),0  
RequestA DB "Input matrix 5x6: ",0AH,0DH,0 
matrixout DB "see the matrix",13,10,0
enter_row DB "enter number of row<5",13,10,0
              
         .DATA?
inbuf    DB    100 DUP (?)
r1      SWORD    ?
pos      sword   ?
tmp      SWORD   ?
K      SWORD   ?
M      SWORD   ?
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
       
     
     
     ;enter number
     Invoke StdOut, ADDR enter_row
     Invoke StdIn,ADDR inbuf,LengthOf inbuf
     Invoke StripLF,ADDR inbuf 
     Invoke atol,ADDR inbuf
     mov DWORD PTR r1,EAX
     
     cmp r1,5
     jg end1
     
     sub r1,1
     
     
     
     cmp r1,1
     jl less
     ;sorting
     mov EBX,0
     mov ECX,DWORD PTR r1
     cycle1:
            push ECX
            mov ECX,6
            cycle2:
                    push ECX
                    pop ECX
                    inc EBX
            loop cycle2
            pop ECX
            push ECX
            pop ECX
     loop cycle1     
     jmp continue
     less: mov EBX,0
     
     continue:
     
     
     ;filling
     mov ECX,6
     mov EDX,0
     f:
        push ECX
        mov AX,A[EBX*2]
        mov mas[EDX*2],AX
        inc EDX
        inc EBX
        pop ECX
     loop f
     
     
     mov ECX,6
     mov EBX,0
     m:
        push ECX
        Invoke dwtoa,mas[EBX*2], ADDR ResStrOut    
                        Invoke StdOut, ADDR ResStrOut           
                        Invoke StdOut, ADDR place 
        inc EBX
        pop ECX
     loop m
     
     
     ;SORTING EBANIY MASSIV
     mov BX,1
     cycle4:cmp BX,6
            jg continue1_1
            
            mov EDX,0
            mov CX,0
            ;;;;;;;;;
            mov AX,mas[EDX*2]
            mov dword ptr pos,EDX
            ;;;;;
            cycle5:cmp CX,count
                   jg continue2
                   cmp AX,mas[EDX*2+2]
                   jge next2
                     mov AX,mas[EDX*2+2]
                     mov dword ptr pos,EDX
                     add pos,1
                   next2:
                   inc EDX
                   inc CX
                   jmp cycle5 
            
            continue2:
            
            mov MAX,AX
            mov ECX,dword ptr pos
            mov AX,mas[EDX*2]
            mov mas[ECX*2],AX
            mov AX,MAX
            mov mas[EDX*2],AX
            
            
            inc BX
            sub count,1
            jmp cycle4
            
     continue1_1:
     
     
     
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
     
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     cmp r1,1
     jl less1
     ;sorting
     mov EBX,0
     mov ECX,DWORD PTR r1
     cycle12:
            push ECX
            mov ECX,6
            cycle22:
                    push ECX
                    pop ECX
                    inc EBX
            loop cycle22
            pop ECX
            push ECX
            pop ECX
     loop cycle12     
     jmp continue22
     less1: mov EBX,0
     
     continue22:
     
     ;filling
     mov ECX,6
     mov EDX,0
     f11:
        push ECX
        mov AX,mas[EDX*2]
        mov A[EBX*2],AX
        inc EDX
        inc EBX
        pop ECX
     loop f11
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
     
     
     
     
       
     Invoke StdOut, ADDR matrixout  
     ;output  
     mov EBX,0
     mov ECX,3
     cycleOutput1: 

                        push ECX
                        mov ECX,6

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
                    invoke StdOut, ADDR new_str     
                    pop ECX

        loop cycleOutput1 
       
         end1:

         XOR    EAX,EAX
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start

