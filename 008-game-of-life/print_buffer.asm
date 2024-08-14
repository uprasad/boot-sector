; Function to print a 16 x 32 buffer at the address in the register bx
print_buffer:
  pusha

  mov ah, 0x0e  ; Print to screen
  mov cl, 0     ; Current column
  mov ch, 0     ; Current row

next_char:
  mov al, [bx]

  cmp cl, 32   ; Write a newline after 32 columns
  je newline
  int 0x10
  add cl, 1
  add bx, 1
  jmp next_char

newline:
  ; Print a newline and carriage return
  mov al, 0xa
  int 0x10
  mov al, 0xd
  int 0x10
  add ch, 1     ; Increment the row

  cmp ch, 16    ; Stop after writing 16 rows
  je end_print_buffer

  mov cl, 0
  jmp next_char

end_print_buffer:
  popa

  ret
