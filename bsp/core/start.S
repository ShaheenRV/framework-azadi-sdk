.section .init, "ax"
.global _start

_start:
    la t0, trap_entry
    csrw mtvec, t0
    .cfi_startproc
    .cfi_undefined ra
    .option push
    .option norelax
    la gp, __global_pointer$ 
    .option pop
    la sp, __stack_top
    add s0, sp, zero
    jal zero, main
    .cfi_endproc
    .end
