; Function that seeds the game of life with an initial population. This updates
; the frame buffer at the memory location in register bx
seed_game_of_life:
  mov byte [bx+240], 0xfe  ; (7, 16)
  mov byte [bx+271], 0xfe  ; (8, 15)
  mov byte [bx+272], 0xfe  ; (8, 16)
  mov byte [bx+304], 0xfe  ; (9, 16)
  mov byte [bx+305], 0xfe  ; (9, 17)

  ret
