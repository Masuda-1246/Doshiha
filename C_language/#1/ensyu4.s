.arm
.text

  mov r1, #0x04000000
  ldr r2, =0x0F03
  strh r2,  [r1]

  mov r3, #0x06000000
  ldr r4, =0x7FFF
  strh r4,  [r3]
  strh r4, [r3 , #4]
  strh r4, [r3 , #8]
  strh r4, [r3 , #12]

hogehoge3:
  ldr r8, = 0x04000130
  ldrh r9,  [r8]
  ldr r10, =0x04000130

  and r11, r10, r9
  cmp r11, r10
  bne hogehoge4
  ldr r4, =0x7FFF
  strh r4,  [r3]
  strh r4, [r3 , #4]
  strh r4, [r3 , #8]
  strh r4, [r3 , #12]
  b hogehoge3

hogehoge4:
  ldr r4, =0x7FE0
  strh r4,  [r3]
  strh r4, [r3 , #4]
  strh r4, [r3 , #8]
  strh r4, [r3 , #12]
  b hogehoge4