       extern alt_sum, read_64, write_64
       
       section .text
        global lin_comb

lin_comb:
        push rdi                       ; pointer to mat1
        push rsi                       ; scaler 1
        push rdx                       ; pointer to mat2
        push rcx                       ; scaler 2
        push r8                        ; pointer to mat3
        push r9                        ; number of rows/ columns of the matrix (n)
        push r11


; ; 0-indexing on all matrices
; ; mat1[j][i] = rdi+(r9*j+i)*8
; ; GOAL - Perform matrix linear combination of mat1, mat2 and save result in mat3
; ; Note : mat1, mat2 and mat3 here are not the same as one given in problem statement.
; ; They are just placeholders for any three matrices using this functionality.

; ; TODO - Fill your code here performing the matrix linear combination in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){mat3[j][i] = s1*mat1[j][i] + s2*mat2[j][i];}}

        push r10
        push r12
        push r13
        push r14
        push r15
        mov rax, 0      ; sum
        mov r12, 0      ; i
        mov r13, 0      ; j

        outer_for:
                cmp r12, r9
                je end_outer_for
                mov r13, 0
                inner_for:
                        cmp r13, r9    
                        je end_inner_for
                        mov r10, r13
                        imul r10, r9
                        add r10, r12
                        imul r10, 8
                        mov r14, [rdi+r10]
                        mov r15, [rdx+r10]
                        imul r14, rsi
                        imul r15, rcx
                        add r15, r14
                        mov [r8+r10], r15
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
        pop r9
        pop r8
        pop rcx
        pop rdx
        pop rsi
        pop rdi
        ret
