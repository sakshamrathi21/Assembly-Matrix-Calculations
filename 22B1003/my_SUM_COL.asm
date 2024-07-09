        section .text
        global  alt_sum

alt_sum:
        push rdi                       ; pointer to mat
        push rdx                       ; number of rows/ columns of the matrix (n)
        push r11

; ; 0-indexing on all matrices
; ; mat1[j][i] = rdi+(r9*j+i)*8
; ; GOAL - Perform matrix alternate summation of elements in matrix and return the sum

; ; TODO - Fill your code here performing the matrix alternate summation in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){sum += (-1)^(i+j)*mat[j][i];}}
        push r10
        push r12
        push r13
        push r14
        push r15
        mov rax, 0      ;sum
        mov r12, 0      ;i
        mov r13, 0      ;j
        outer_for:
                cmp r12, rdx
                je end_outer_for
                mov r13, 0
                inner_for:
                        cmp r13, rdx    
                        je end_inner_for
                        mov r10, r13
                        imul r10, rdx
                        add r10, r12
                        imul r10, 8
                        mov r14, r13
                        add r14, r12
                        and r14, 1
                        cmp r14, 0
                        je even
                        mov r15, [rdi+r10]
                        imul r15, -1
                        jmp now_add
                        even:
                        mov r15, [rdi+r10]
                        now_add:
                        add rax, r15
                        add r13, 1
                        jmp inner_for
                end_inner_for:
                        add r12, 1
                        jmp outer_for
        end_outer_for:
        pop r15
        pop r14
        pop r13
        pop r12
        pop r10


; ; End of code to be filled
        pop r11
        pop rdx
        pop rdi
        ret
