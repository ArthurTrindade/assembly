.section .rodata

.data

.text

.globl main
main:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16,  %rsp

    movq %r12, -8(%rbp)

    call list_new
    movq %rax, %r12    

    movq %r12, %rdi
    movl $10,  %esi
    call list_insert

    movq %r12, %rdi
    movl $20,  %esi
    call list_insert

    movq %r12, %rdi
    call list_print

    movl $0, %eax

    movq -8(%rbp), %r12

    leave
    ret
    

