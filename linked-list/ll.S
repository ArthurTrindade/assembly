.section .rodata
fmt: .string "%d -> "
.data

.text

.globl node_new
node_new:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16,  %rsp

    movq %rdi, -8(%rbp)

    movq $16, %rdi
    call malloc

    movq -8(%rbp), %rdi

    movl %edi, (%rax)
    movq $0,  8(%rax) 

    leave
    ret

.globl list_new
list_new:
    pushq %rbp
    movq  %rsp, %rbp

    movq $8, %rdi
    call malloc

    movq $0, (%rax)

    leave
    ret

.globl list_insert
list_insert:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16,  %rsp

    movq %rdi, -8(%rbp)
    movq %rsi, -16(%rbp)

    movl %esi, %edi
    call node_new

    movq -8(%rbp),  %rdi
    movq -16(%rbp), %rsi

    cmpq $0, (%rdi)
    jne endif

    movq %rax, (%rdi)
    leave
    ret

endif:

    movq (%rdi), %rcx

loop:

    cmpq $0, 8(%rcx)
    je endloop

    movq 8(%rcx), %rcx
    jmp loop
endloop:

    movq %rax, 8(%rcx)

    leave
    ret

.globl list_print
list_print:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16,  %rsp

    # salvando calle
    movq %r12, -8(%rbp)

    # %r12 <- n = l->head
    movq (%rdi), %r12

loop2:

    cmpq $0, %r12
    je endloop2

    movq %rdi, -16(%rbp)

    movq $fmt, %rdi
    movl (%r12), %esi
    movl $0, %eax
    call printf

    movq -16(%rbp), %rdi

    movq 8(%r12), %r12

    jmp loop2
endloop2:

    movq -8(%rbp), %r12

    leave
    ret