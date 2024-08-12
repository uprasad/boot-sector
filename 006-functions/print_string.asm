; Function that prints the 0-terminated string at the memory location stored in the register
; bx
print_string:
  ; Save the state in all the registers
  pusha

  ; Print character to screen
  mov ah, 0x0e

next_char:
  mov al, [bx]
  ; Check if we've reached the end of the null-terminated string
  cmp al, 0
  je null_term
  ; If not, print the character, increment the address and loop again
  int 0x10
  add bx, 1
  jmp next_char
  
null_term:
  ; Restore state from all registers
  popa

  ret
