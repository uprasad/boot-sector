; Function to initialize a 16 x 32 buffer at the address pointed to by register bx
init_buffer:
  pusha

  mov cx, 0    ; Keep track of how many bytes have been written so far
  mov al, 0x2d  ; Space character to be printed

init_buffer_loop:
  ; Copy one byte at a time until we've copied 512 bytes
  mov byte [bx], al
  add cx, 1
  add bx, 1
  cmp cx, 512
  je end_init_buffer
  jmp init_buffer_loop

end_init_buffer:
  popa

  ret
