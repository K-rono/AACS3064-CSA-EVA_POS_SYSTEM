.MODEL SMALL
.STACK 100
.DATA
        DEMO                    DW 10000

        QTY_TEMP                DW 1
                                DW 1
                                DW ?
                                DW ?
                                DW ?
                                DW ?
                                DW ?
                                DW ?

        PRICE_AFTER_QTY         DW ?
                                DW ?
                                DW ?
                                DW ?
                                DW ?
                                DW ?
                                DW ?
                                DW ?

        NUMBER_CART             DW 2

        PRICE_TEMP              DW 50550
                                DW 10000
                                
                                
                                
                                

        WHOLE_NUM               DW 0

        TOTAL_FLOATING_POINT    DW 0
        TOTAL_WHOLE_NUM         DW 0

        LGIN1 DB "DEMO$"
.CODE
;TO DO : 


;PRINT PRICE_TEMP STORED IN WWWFF FORMAT (W - WHOLE NUMBER | F - FLOATING POINT)
PRINT_PRICE MACRO PRICES

 PUSH AX
    PUSH DX

    XOR DX,DX
    MOV AX,PRICES
    MOV BX,10000
    DIV BX

    CMP AX,0
    JNE PRINT_FROM_HUNDREDS

    MOV AX,DX
    XOR DX,DX
    MOV BX,1000
    DIV BX

    CMP AX,0
    JNE PRINT_FROM_TENS

    MOV AX,DX
    XOR DX,DX
    MOV BX,100
    DIV BX

    CMP AX,0
    JNE PRINT_FROM_ONES

    PRINT_FROM_HUNDREDS:
        PUSH DX

        MOV AH,02H
        MOV DL,AL
        ADD DL,30H
        INT 21H

        POP DX

        MOV AX,DX
        XOR DX,DX
        MOV BX,1000
        DIV BX

    PRINT_FROM_TENS:
        PUSH DX

        MOV AH,02H
        MOV DL,AL
        ADD DL,30H
        INT 21H

        POP DX

        MOV AX,DX
        XOR DX,DX
        MOV BX,100
        DIV BX
    
    PRINT_FROM_ONES:
        PUSH DX

        MOV AH,02H
        MOV DL,AL
        ADD DL,30H
        INT 21H

        POP DX

    ;FLOATING POINT
    PUSH DX

    MOV AH,02H
    MOV DL,'.'
    INT 21H

    POP DX

    MOV AX,DX
    XOR DX,DX
    MOV BX,10
    DIV BX

    PUSH DX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP DX

    MOV AH,02H
    ADD DL,30H
    INT 21H

    POP AX
    POP DX

ENDM

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    CALL QTY

    ;PRINT_PRICE DEMO

    CALL PRICE_ADDITION

    MOV AX, 4C00H
    INT 21H
MAIN ENDP

;MULTIPLICATION
QTY PROC

    MOV SI,0 
    MOV DI,0

    MOV CX,NUMBER_CART
    QTY_TEMP_LOOP:
        
        MOV AX,PRICE_TEMP[SI]
        MOV BX,QTY_TEMP[DI]
        MUL BX
        MOV PRICE_AFTER_QTY[SI],AX
        ADD SI,2
        ADD DI,2

        CMP CX,1
        JE BREAK_LOOP
        LOOP QTY_TEMP_LOOP

        BREAK_LOOP:
        RET
QTY ENDP

;description
PRICE_ADDITION PROC
    MOV SI,0

    MOV AX,PRICE_AFTER_QTY[SI]  ;LOAD FIRST NUMBER NUMBER

    XOR DX,DX
    MOV BX,100                  ;EXTRACT FLOATING POINT
    DIV BX

    PUSH DX                     ;STORE FLOATING POINT IN STACK
    MOV WHOLE_NUM,AX

    CMP NUMBER_CART,1
    JNE CONT_ADDITION
    POP DX
    MOV TOTAL_FLOATING_POINT,DX
    MOV TOTAL_WHOLE_NUM,AX
    JMP FINISH_ADDITION

CONT_ADDITION:
    MOV CX,NUMBER_CART
    DEC CX                      ;DEC 1 AS FIRST ELEMENT ALREADY LOADED INTO AX 
    LOOP_CALC:
    
        ADD SI,2                ;MOVE TO NEXT NUMBER

        MOV AX,PRICE_AFTER_QTY[SI]

        XOR DX,DX
        MOV BX,100
        DIV BX

        PUSH DX                 ;STORE FLOATING POINT

        ADD AX,WHOLE_NUM
        MOV WHOLE_NUM,AX

        LOOP LOOP_CALC


    MOV TOTAL_WHOLE_NUM,AX      ; STORE FINAL WHOLE NUMBER

    MOV CX,NUMBER_CART
    DEC CX
    
    POP DX
    MOV AX,DX
FLOATING_POINT_CALC:
    ;FLOATING POINT
    POP DX
    ADD AX,DX

    LOOP FLOATING_POINT_CALC
    
    MOV TOTAL_FLOATING_POINT,AX

    ;IF MORE THAN 99
    XOR DX,DX
    MOV BX,100
    DIV BX

    CMP AX,0
    JE NO_CARRY

    ;OTHERWISE, CARRY OCCURED
    MOV TOTAL_FLOATING_POINT,DX     ;DONT NEED TO STORE THE CARRY INFORMATION ANYMORE SO OVERWRITE 

    ADD AX,TOTAL_WHOLE_NUM
    MOV TOTAL_WHOLE_NUM,AX          ;ADDED CARRY INTO FINAL RESULT

FINISH_ADDITION:
NO_CARRY: ;STRAIGHT AWAY PRINT RESULT
    ;CHECK IF WHOLE-NUM HAS 4 DIGIT
    MOV AX,TOTAL_WHOLE_NUM

    XOR DX,DX
    MOV BX,1000
    DIV BX

    CMP AX,0
    JE NO_FOURTH_DIGIT
    ;OTHERWISE, CONTAINS 4DIGIT, PRINT THOUSANDS
    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H
    JMP THREE_DIGIT_PRINT

NO_FOURTH_DIGIT:
    MOV AX,TOTAL_WHOLE_NUM
    XOR DX,DX
    MOV BX,100                      
    DIV BX

    PUSH DX                         ;STORE TENS

    CMP AX,0                        ;CHECK WHETHER OR NOT HAVE 3 DIGIT
    JE TWO_DIGIT_PRINT

    THREE_DIGIT_PRINT:
        MOV AH,02H
        MOV DL,AL
        ADD DL,30H
        INT 21H

    TWO_DIGIT_PRINT:
        POP DX                      ; GET TENS BACK

        MOV AX,DX 
        XOR DX,DX
        MOV BX,10                   
        DIV BX

    PUSH DX                         ;STORE ONES

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H   
    INT 21H

    POP DX                          ;GET ONES BACK

    MOV AH,02H
    ADD DL,30H
    INT 21H

;PRINT DECIMAL POINT '.'
    MOV AH,02H
    MOV DL,'.'
    INT 21H

;FLOATING_POINT PRINTING
    XOR DX,DX
    MOV AX,TOTAL_FLOATING_POINT
    MOV BX,10
    DIV BX

    PUSH AX                         ;STORE REMAINDER

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP BX                          ;BX IS USED AS AX IS BUSY

    MOV AH,02H
    MOV DL,BH
    ADD DL,30H
    INT 21H

    RET
PRICE_ADDITION ENDP
    END MAIN