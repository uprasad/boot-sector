; Function that checks of the cell at memory address in bx is live. If so, the
; register al is incremented.
; The lower bound of the buffer is in register di.
count_neighbor:
  push bx
  push di

  cmp bx, di  ; lower bound check
  jl end_count_neighbor
  add di, 512
  cmp bx, di  ; upper bound check
  jge end_count_neighbor
  cmp byte [bx], 0xfe  ; check if it's live
  jne end_count_neighbor
  add al, 1

end_count_neighbor:
  pop di
  pop bx

  ret


; Function to update the current cell in the next frame.
; cx contains the address of the cell in the next frame.
; bx contains the address of the cell in the current frame.
; al contains the number of live neighbors of the current cell.
update_cell:
  pusha

  ; Read the current cell value into dl.
  mov dl, byte [bx]
  ; After reading the cell in the current frame, use bx to address the cell in
  ; the next frame.
  mov bx, cx
  ; Copy the current cell to the next frame, it may be modified later.
  mov byte [bx], dl

   cmp dl, 0xfe
   jne dead_cell
   ; The current cell is live
   cmp al, 2
   jl kill_cell
   cmp al, 3
   jg kill_cell
   jmp end_of_update_cell

 kill_cell:
   mov byte [bx], 0x2d
   jmp end_of_update_cell

 dead_cell:
   ; The current cell is dead
   cmp al, 3
   jne end_of_update_cell
   ; If it has exactly 3 live neighbors, it becomes live
   mov byte [bx], 0xfe

end_of_update_cell:
  popa

  ret


; Function to update the next frame of game of life.
; The memory address of the current frame is in register bx.
; The memory address of the next frame is in register cx.
update_next_frame:
  pusha

  mov di, bx  ; di tracks the starting memory address for bounds checks
  mov dx, 0   ; dx tracks the number of cells updated so far

next_cell:
  mov al, 0   ; al tracks the number of neighbors of the current cell

  ; Save the original cell address
  push bx

  ; Top-left neighbor
  sub bx, 33
  call count_neighbor
  ; Top neighbor
  add bx, 1
  call count_neighbor
  ; Top-right neighbor
  add bx, 1
  call count_neighbor
  ; Left neighbor
  add bx, 30
  call count_neighbor
  ; Right neighbor
  add bx, 2
  call count_neighbor
  ; Bottom-left neighbor
  add bx, 30
  call count_neighbor
  ; Bottom neighbor
  add bx, 1
  call count_neighbor
  ; Bottom-right neighbor
  add bx, 1
  call count_neighbor

  ; Retrieve the original cell address
  pop bx

  ; al now has the count of neighbors
  call update_cell

  add bx, 1
  add cx, 1

  ; Stop once we've updated 512 cells
  add dx, 1
  cmp dx, 512
  jl next_cell

  popa

  ret
