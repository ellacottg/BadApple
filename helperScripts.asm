SECTION "MemCopy Script", ROM0
; DE: the location to copy from
; HL: the location to copy to
; BC: the amount of bytes to copy
MemCopy:
    ld a, [de]   ; Store the current bit to copy in A
    ld [hl+], a  ; Store the value of A (DE) in HL, increment HL since that space is full now
    inc de       ; Increment DE since that byte has been copied over
    dec bc       ; Decrement BC since one less byte needs to be copied
    ld a, b 
    or c ; if both B and C are 0, A will be 0
    jr nz, MemCopy ; If more bytes need to be copied (B or C != 0) Start again
    ret

; DE + (DE+1): Contains address to unpack into DE
; A and HL are consumed
UnpackAdr:
    ld a, [de] ; load the second half of the address into A
    ld l, a    ; Load A (second half) into L
    inc de     ; increment DE so it points to the first half (for whatever reason it comes afterward)
    ld a, [de] ; load the first half of the address into A 
    ld h, a    ; Load A (first half) into H (HL now holds the address)
    ld d, h  ; Load the unpacked address back into DE
    ld e, l
    ret

findAddress:
    cp a, 0
    jp z, .frameFound
.frameAddressLoop
    dec a
    inc de
    inc de
    jp nz, .frameAddressLoop
.frameFound
    call UnpackAdr
    ret
