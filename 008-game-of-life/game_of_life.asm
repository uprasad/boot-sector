; Function that runs 50 generations of game of life in a 16 x 32 grid
;
; The game uses two frame buffers, one for the currently displayed frame and
; the other for the next frame to be displayed.
game_of_life:
  pusha

  ; Initialize buffers at 0x8000 and 0x9000
  mov bx, 0x8000
  call init_buffer
  mov bx, 0x9000
  call init_buffer

  mov dl, 0       ; Keep track of the number of generations
  mov bx, 0x8000  ; Current frame location
  mov cx, 0x9000  ; Next frame location

  ; Seed the game with an initial population
  call seed_game_of_life

next_frame:
  ; Wait for any key to be pressed
  mov ah, 0x0
  int 0x16

  ; Reset cursor to 0, 0. Save the bx and dx register before doing so
  push bx
  push dx
  mov dh, 0  ; Cursor row
  mov dl, 0  ; Cursor column
  mov ah, 0x02
  mov bh, 0
  int 0x10
  pop dx
  pop bx

  call print_buffer
  add dl, 1

  call update_next_frame

  xchg bx, cx  ; Exchange the two frame buffers
  ; Stop if we hit 50 generations
  cmp dl, 50
  jle next_frame

end_game_of_life:
  popa

  ret
