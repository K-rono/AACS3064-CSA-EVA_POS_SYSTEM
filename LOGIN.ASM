.MODEL SMALL
.STACK 100
.DATA
    ;NOTE - 13 STANDS FOR CARRIAGE RETURN / 10 STANDS FOR LINE FEED
    LOGO                        DB 0DH,0AH,14 DUP (" ")," =====                "
                                DB 0DH,0AH,14 DUP (" ")," ||                   "
                                DB 0DH,0AH,14 DUP (" ")," ===\\=    //         "
                                DB 0DH,0AH,14 DUP (" ")," ||  \\   //\\        "
                                DB 0DH,0AH,14 DUP (" ")," =====\\ //  \\       "
                                DB 0DH,0AH,14 DUP (" "),"       \//====\\      "
                                DB 0DH,0AH,14 DUP (" "),"       //      \\ .INC",'$'


    LOGIN_MENU_STR              DB 0DH,0AH,14 DUP (" "),201,20 DUP (205),187
		                        DB 0DH,0AH,14 DUP (" "),186,"  CHOOSE AN ACTION  ",186
		                        DB 0DH,0AH,14 DUP (" "),200,20 DUP (205),188
                                DB 0DH,0AH,14 DUP (" "),186," 1 ",186," LOGIN          ",186
                                DB 0DH,0AH,14 DUP (" "),186," 2 ",186," QUIT           ",186
                                DB 0DH,0AH,14 DUP (" "),200,20 DUP (205),188
                                DB 0DH,0AH,14 DUP (" "),"ENTER CHOICE > $"

                                

    MENU_ERROR_WARNING_STR      DB 0DH,0AH,"  INVALID INPUT > ENTER ONLY THE INDEX SHOWN ON THE MENU (2 TO EXIT)$"
    INPUT_ERROR_CONTINUE_STR    DB 0DH,0AH,,15 DUP (' '),"> PRESS ANY KEY TO CONTINUE...$"

    PASSWORD                    DB "admin$"
    PASSWORD_IN                 DB 10 dup('$')
    DELETE                      DB 8,' ',8,'$'
    LOGIN_STR                   DB 0DH,0AH,"Enter password:$"
    PASSWORD_INCORRECT_STR      DB 0DH,0AH,"PASSWORD INCORRECT$"

    DEBUG_STR                   DB 0DH,0AH,"DEBUG$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    RESTART_IF_INVALID_INPUT:
        CALL LOGIN_MENU
        ;LOGIN MENU USER INPUT CHOICE
        MOV AH,01H  ;INPUT SINGLE CHARACTER
        INT 21H

        CMP AL,'1'
        JE LOGIN
        CMP AL,'2'
        JE EXIT
    
        ;ANY OTHER INPUT
        MOV AH,09H
        LEA DX,MENU_ERROR_WARNING_STR
        INT 21H
        CALL INPUT_ERROR_CONTINUE
        JMP RESTART_IF_INVALID_INPUT

    MAIN_MENU_SECTION:
        CALL MAIN_MENU

        MOV AH,01H  ;INPUT SINGLE CHARACTER
        INT 21H

    EXIT:
        MOV AX,4C00H
        INT 21H
MAIN ENDP

;DISPLAY MAIN MENU
LOGIN_MENU PROC

    CALL CLEAR_SCREEN

    ;PRINT LOGO
    MOV AH,09H
    LEA DX, LOGO
    INT 21H


    MOV AH,09H
    LEA DX,LOGIN_MENU_STR
    INT 21H

    RET
LOGIN_MENU ENDP

;LOGIN PROCEDURE
LOGIN PROC
    RELOGIN:
    CALL CLEAR_SCREEN
    MOV AH,09H
    LEA DX,LOGIN_STR    ;PRINT LOGIN STRING
    INT 21H

    MOV SI,0 ;INITIAL INDEX FOR 'PASSWORD_IN'

    ENTER_PASSWORD:
        MOV AH,07H  ;READ CHAR
        INT 21H

        CMP AL,0DH ;CARRIAGE RETURN KEY
        JE ENTER_PASSWORD_FINISH

        CMP AL,08H ;BACKSPACE 
        JE ENTER_PASSWORD_BACKSPACE

        CMP SI,5    ;  EXCEED MAX INPUT
        JE ENTER_PASSWORD ;IGNORE INPUT

        MOV PASSWORD_IN[SI],AL ;STORE INPUT

        MOV AH, 02H	;PRINT * TO HIDE PASSWORD 
		MOV DL, "*" 
		INT 21H

        INC SI

        JMP ENTER_PASSWORD ;LOOP BACK
    
    ENTER_PASSWORD_BACKSPACE:
        CMP SI, 0			;IF NEVER INPUT BEFORE
		JE  ENTER_PASSWORD	;IGNORE BACKSPACE INPUT
	
		MOV AH,09H	
		LEA DX,DELETE
		INT 21H
		
		DEC SI
		MOV PASSWORD_IN[SI], "$"
        JMP ENTER_PASSWORD

    ;PRINT INCORRECT PASSWORD STRING
    PASSWORD_INCORRECT:
            CALL NEWLINE

            MOV AH,09H
            LEA DX,PASSWORD_INCORRECT_STR   ;PRINT INCORRECT PASSWORD MSG
            INT 21H

            CALL NEWLINE

            CALL INPUT_ERROR_CONTINUE

            JMP RELOGIN ;ENTER PASSWORD AGAIN

    ENTER_PASSWORD_FINISH:
        LEA SI,PASSWORD
        LEA DI,PASSWORD_IN

        COMPARE_PASSWORD:
            MOV AL,[SI]
            MOV BL,[DI]
            CMP AL,BL
            JNE PASSWORD_INCORRECT

            CMP BL,'$'
            JNE NOT_END_OF_STRING ;EITHER THIS APPROACH OR USE FIXED LOOPS
            JMP MAIN_MENU_SECTION

        NOT_END_OF_STRING:
            INC SI
            INC DI

            JMP COMPARE_PASSWORD
LOGIN ENDP

;description
MAIN_MENU PROC
    CALL INPUT_ERROR_CONTINUE
    CALL CLEAR_SCREEN
    MOV AH,02H
    MOV DL,"#"
    INT 21H
    RET
MAIN_MENU ENDP

INPUT_ERROR_CONTINUE PROC
    MOV AH,09H
    LEA DX,INPUT_ERROR_CONTINUE_STR ;PRINT PRESS ANY KEY TO CONTINUE
    INT 21H
    MOV AH,07H ;NO ECHO INPUT CHARACTER
    INT 21H
    RET
INPUT_ERROR_CONTINUE ENDP

NEWLINE PROC
        MOV AH,02H
        MOV DL,0AH
        INT 21H
        MOV DL,13
        INT 21H
        RET
NEWLINE ENDP



;CLEAR COMMAND LINE SCREEN
CLEAR_SCREEN PROC
    MOV AX,03H
	INT 10H	
    RET
CLEAR_SCREEN ENDP

;description
DEBUG PROC
    MOV AH,09H
    LEA DX,DEBUG_STR
    INT 21H
    RET
DEBUG ENDP
    END MAIN
