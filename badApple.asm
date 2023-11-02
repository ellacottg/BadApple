INCLUDE "hardware.inc"

INCLUDE "helperScripts.asm"

SECTION "Header", ROM0[$100]

	jp EntryPoint

	ds $150 - @, 0 ; Make room for the header

EntryPoint:
    ; Init code goes here :)

    WaitVBlank:
	ld a, [rLY]
	cp 144
	jp c, WaitVBlank

    ld a, $00
    ldh [frameCounter], a
    ldh [currentFrame], a

    call UpdateScreen
    
    ; Activate the VBlank flag
    ld a, IEF_VBLANK
	ldh [rIE], a

    xor a
    ldh [rIF], a ; Make sure an interrupt isn't activated

    ei ; enable interrupts

    jp TheEndlessLoopOfSadness

SECTION "Variables", HRAM
frameCounter:
    db
currentFrame:
    db


; Define a new section and hard-code it to be at $0040.
SECTION "VBlank Interrupt", ROM0[$0040]
VBlankInterrupt:
	; This instruction is equivalent to `ret` and `ei`
    di

    ; save all registers to the stack
    push af
	push bc
	push de
	push hl
    
    call IncrementCheck
    ;call UpdateScreen

    ; get all registers back from the
    pop hl
	pop de
	pop bc
	pop af

	reti

SECTION "Draw", ROM0
IncrementCheck:
    ldh a, [frameCounter]
    cp a, 5 ; check if we switch to the next frame
    jp nz, .exit

    ; reset the frame count
    xor a
    ldh [frameCounter], a

    ; increase the current frame pointer
    ldh a, [currentFrame]
    inc a
    ldh [currentFrame], a

    ; update the display
    call UpdateScreen

.exit
    ret


UpdateScreen:

    ; Turn the LCD off
	ld a, $00000000
    ld [rLCDC], a

    ;select the correct bank

    ;select the correct frame
    ldh a, [currentFrame]
    ld de, tileAddress
    call findAddress

    ; Copy the tile data
	ld hl, _VRAM9000
    ld bc, 256 * 16 ; load 256 tiles
.tileCopy
    ld a, [de]   ; Store the current bit to copy in A
    ld [hl+], a  ; Store the value of A (DE) in HL, increment HL since that space is full now
    inc de       ; Increment DE since that byte has been copied over
    ld a, h      ; check what address we're loading to
    cp a, $98    ; see if HL is $9800
    jr nz, .returnPoint
    ld hl, $8800 ; only change the to address if the current one is $9800
.returnPoint
    dec bc       ; Decrement BC since one less byte needs to be copied
    ld a, b 
    or c ; if both B and C are 0, A will be 0
    jr nz, .tileCopy ; If more bytes need to be copied (B or C != 0) Start again

    ; Copy the Tilemap in a 20x18 to the VRAM
    ;select the correct tilemap
    ldh a, [currentFrame]
    ld de, mapAddress
    call findAddress

    ld hl, _SCRN0
    ld b, SCRN_Y_B ; 18 tiles
.mapCopy
    ld c, SCRN_X_B ; 20 tiles
.rowLoop
    ld a, [de] ; move DE to the A register
    ld [hl+], a ; move A (DE) to HL, Increment
    inc de
    dec c
    jr nz, .rowLoop ; keep going until C is 0
    push de ; save the address for later
    ld de, SCRN_VX_B - SCRN_X_B ; Load the remaining rows into VRAM (so the next row starts on the left side)
    add hl, de ; add those tiles to the map
    pop de ; get the address back
    dec b
    jr nz, .mapCopy ; Repeat until B is 0, (all tiles have been added)

    ; Set the correct palette
	ld a, %11100100
	ld [rBGP], a

    ; Turn the LCD on
	ld a, [rLCDC]
    or a, LCDCF_ON
    or a, LCDCF_BGON
    ld [rLCDC], a

    ret



SECTION "Main", ROM0
TheEndlessLoopOfSadness:
    ; increase the counter
    ldh a, [frameCounter]
    inc a
    ldh [frameCounter], a

    halt
    jp TheEndlessLoopOfSadness

INCLUDE "tiles.asm"