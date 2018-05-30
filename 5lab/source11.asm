.586          
  .MODEL  flat             
  .DATA         
  i     dword 0          
  D dword 0         
  glasno DB "aeiouy"          
  B dword 0          
  A dword 0          
  
  .CODE   
  RESULT  proto c str2:ptr byte         
  public  _GLASDEL 
  _GLASDEL proc        
  PUSH EBP        
  MOV  EBP,ESP        
  PUSH EBX        
  PUSH EDI        
  PUSH ESI   
  Mov EDI,[EBP+8]  
  MOV ESI,[EBP+12]   
  MOV EAX,[EBP+16]    
  MOV EDX,0  
  MOV D,0    
  CLD  
  jmp cycl0 
  cycl001: MOV ESI,[EBP+12]        
  add ESI,A 
  cycl01: add i,1
  cycl0:  add i,edx  
  Mov EDI,[EBP+8]     
  add EDI,i     
  mov edx,0 
 
cycl1:  cmp B,1      
je  con    
dec EAX      
mov AL,[EDI+edx] 
 cmp AL,' '      
 JE  cycl02    
 INC EDX     
 CMP EAX,0       
 JE  consl2    
 JMP cycl1
 consl2: DEC EDX   
 mov B,1
 cycl02: add D,1       
 mov ecx,D      
 cmp [esi],ecx    
 jne cycl01    
 add A,4 
 cycl2:  lea  esi,glasno 
 mov  ebx,6 
 cycl:   cmp  ebx,0    
 je   cycl001     
 mov  ecx,edx    
 MOV  edi,[EBP+8]  
 add EDI,i  
 lodsb      
 repne scasb       
 je   equal  
 dec  ebx    
 jmp  cycl 
 equal:  mov ecx,1       
 mov al, '_' 
 dec edi     
 rep stosb    
 jmp cycl2
 con:    Invoke RESULT,[EBP+8]  
 POP ESI    
 POP EDI   
 POP EBX      
 POP EBP  
 ret
 _GLASDEL endp 
 End 
 
 
