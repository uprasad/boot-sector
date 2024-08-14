; Function that waits for a keyboard button to be pressed before printing each
; character of a 0-terminated string stored at the memory location stored in the register
; bx.
print_string:
  ; Save the state in all the registers
  pusha

print_next_char:
  mov al, [bx]
  ; Check if we've reached the end of the null-terminated string
  cmp al, 0
  je null_term

  ; If not, print the character, increment the address and loop again
  mov ah, 0x0e
  int 0x10
  add bx, 1
  jmp print_next_char

null_term:
  ; Restore state from all registers
  popa

  ret
