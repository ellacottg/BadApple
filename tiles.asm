SECTION "Tile address", ROM0, ALIGN[4]
bankAddress:
tileAddress:
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame1
    dw Tiles.frame19
    dw Tiles.frame20
    dw Tiles.frame21
    dw Tiles.frame22
    dw Tiles.frame23
    dw Tiles.frame24
    dw Tiles.frame25
    dw Tiles.frame26
    dw Tiles.frame27
    dw Tiles.frame28
    dw Tiles.frame29
    dw Tiles.frame30
    dw Tiles.frame31
    dw Tiles.frame32
    dw Tiles.frame33
    dw Tiles.frame34
    dw Tiles.frame35
    dw Tiles.frame36
    dw Tiles.frame37
    dw Tiles.frame38
    dw Tiles.frame39
    ;dw Tiles.frame40
mapAddress:
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame1
    dw Tilemap.frame19
    dw Tilemap.frame20
    dw Tilemap.frame21
    dw Tilemap.frame22
    dw Tilemap.frame23
    dw Tilemap.frame24
    dw Tilemap.frame25
    dw Tilemap.frame26
    dw Tilemap.frame27
    dw Tilemap.frame28
    dw Tilemap.frame29
    dw Tilemap.frame30
    dw Tilemap.frame31
    dw Tilemap.frame32
    dw Tilemap.frame33
    dw Tilemap.frame34
    dw Tilemap.frame35
    dw Tilemap.frame36
    dw Tilemap.frame37
    dw Tilemap.frame38
    dw Tilemap.frame39
    dw Tilemap.frame40


SECTION "Tile data", ROMX, ALIGN[4]
Tiles:
.frame1 incbin "tiles/out1.2bpp"   ; Include binary tile data inline using incbin
.frame19 incbin "tiles/out19.2bpp"   ; Include binary tile data inline using incbin
.frame20 incbin "tiles/out20.2bpp"   ; Include binary tile data inline using incbin
.frame21 incbin "tiles/out21.2bpp"   ; Include binary tile data inline using incbin
.frame22 incbin "tiles/out22.2bpp"   ; Include binary tile data inline using incbin
.frame23 incbin "tiles/out23.2bpp"   ; Include binary tile data inline using incbin
.frame24 incbin "tiles/out24.2bpp"   ; Include binary tile data inline using incbin
.frame25 incbin "tiles/out25.2bpp"   ; Include binary tile data inline using incbin
.frame26 incbin "tiles/out26.2bpp"   ; Include binary tile data inline using incbin
.frame27 incbin "tiles/out27.2bpp"   ; Include binary tile data inline using incbin
.frame28 incbin "tiles/out28.2bpp"   ; Include binary tile data inline using incbin
.frame29 incbin "tiles/out29.2bpp"   ; Include binary tile data inline using incbin
.frame30 incbin "tiles/out30.2bpp"   ; Include binary tile data inline using incbin
.frame31 incbin "tiles/out31.2bpp"   ; Include binary tile data inline using incbin
.frame32 incbin "tiles/out32.2bpp"   ; Include binary tile data inline using incbin
.frame33 incbin "tiles/out33.2bpp"   ; Include binary tile data inline using incbin
.frame34 incbin "tiles/out34.2bpp"   ; Include binary tile data inline using incbin
.frame35 incbin "tiles/out35.2bpp"   ; Include binary tile data inline using incbin
.frame36 incbin "tiles/out36.2bpp"   ; Include binary tile data inline using incbin
.frame37 incbin "tiles/out37.2bpp"   ; Include binary tile data inline using incbin
.frame38 incbin "tiles/out38.2bpp"   ; Include binary tile data inline using incbin
.frame39 incbin "tiles/out39.2bpp"   ; Include binary tile data inline using incbin
;.frame40 incbin "tiles/out40.2bpp"   ; Include binary tile data inline using incbin

SECTION "Tilemap data", ROM0, ALIGN[4]
Tilemap:
.frame1 incbin "tiles/out1.tilemap"   ; Include binary tile data inline using incbin
.frame19 incbin "tiles/out19.tilemap"   ; Include binary tile data inline using incbin
.frame20 incbin "tiles/out20.tilemap"   ; Include binary tile data inline using incbin
.frame21 incbin "tiles/out21.tilemap"   ; Include binary tile data inline using incbin
.frame22 incbin "tiles/out22.tilemap"   ; Include binary tile data inline using incbin
.frame23 incbin "tiles/out23.tilemap"   ; Include binary tile data inline using incbin
.frame24 incbin "tiles/out24.tilemap"   ; Include binary tile data inline using incbin
.frame25 incbin "tiles/out25.tilemap"   ; Include binary tile data inline using incbin
.frame26 incbin "tiles/out26.tilemap"   ; Include binary tile data inline using incbin
.frame27 incbin "tiles/out27.tilemap"   ; Include binary tile data inline using incbin
.frame28 incbin "tiles/out28.tilemap"   ; Include binary tile data inline using incbin
.frame29 incbin "tiles/out29.tilemap"   ; Include binary tile data inline using incbin
.frame30 incbin "tiles/out30.tilemap"   ; Include binary tile data inline using incbin
.frame31 incbin "tiles/out31.tilemap"   ; Include binary tile data inline using incbin
.frame32 incbin "tiles/out32.tilemap"   ; Include binary tile data inline using incbin
.frame33 incbin "tiles/out33.tilemap"   ; Include binary tile data inline using incbin
.frame34 incbin "tiles/out34.tilemap"   ; Include binary tile data inline using incbin
.frame35 incbin "tiles/out35.tilemap"   ; Include binary tile data inline using incbin
.frame36 incbin "tiles/out36.tilemap"   ; Include binary tile data inline using incbin
.frame37 incbin "tiles/out37.tilemap"   ; Include binary tile data inline using incbin
.frame38 incbin "tiles/out38.tilemap"   ; Include binary tile data inline using incbin
.frame39 incbin "tiles/out39.tilemap"   ; Include binary tile data inline using incbin
.frame40 incbin "tiles/out40.tilemap"   ; Include binary tile data inline using incbin