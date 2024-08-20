; A boot sector program plays the Game of Life

[org 0x7c00]  ; Tell the assembler where this code will be loaded

call game_of_life

mov bx, BYE_STRING
call print_string

jmp $

%include "print_string.asm"
%include "init_buffer.asm"
%include "print_buffer.asm"
%include "seed_game_of_life.asm"
%include "update_next_frame.asm"
%include "game_of_life.asm"

HI_STRING:
  db 'Press any key to start the game', 0
PROMPT_STRING:
  db 'Press any key to advance to the next generation', 0
BYE_STRING:
  db 'Game over!', 0

; $ is the address of the current instruction.
; $$ is the address of the first instruction in this section.
; db or 'direct byte' places a byte at this location
times 510-($-$$) db 0

; dw is 'direct word'
; Last two words are the magic number to let the BIOS know that this is a boot
; sector.
dw 0xaa55
