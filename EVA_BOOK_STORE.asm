.MODEL SMALL
.STACK 100
.DATA
        ; DISPLAY WELCOME
        FORMAT1   DB 0DH,0AH,"              ",201,28 DUP (205),187,"$"
		STR_TITLE DB 0DH,0AH,"              ",186,"  WELCOME TO EVA BOOK SHOP  ",186,"$"
		FORMAT2   DB 0DH,0AH,"              ",200,28 DUP (205),188,"$"
		; DISPLAY MENU
        FORMAT3   DB 0DH,0AH,"    ",218,50 DUP (196),191,"$"
		STR_SELECTMENU DB 0DH,0AH,"    ",179,"                  SELECT A TASK                   ",179,"$"
		FORMAT4    DB 0DH,0AH,"    ",195,9 DUP (196),194,40 DUP (196),180,"$"
		STR_MENU1  DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","SEARCH A BOOK","                      ",179,"$"
		STR_MENU2  DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","PURCHASE BOOK","                      ",179,"$"
		STR_MENU3  DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","SHOW CART CONTENT","                  ",179,"$"
		STR_MENU4  DB 0DH,0AH,"    ",179,"    ","4","    ",179,"     ","MODIFY CART","                        ",179,"$"
		STR_MENU5  DB 0DH,0AH,"    ",179,"    ","5","    ",179,"     ","MAKE PAYMENT","                       ",179,"$"
        STR_MENU6  DB 0DH,0AH,"    ",179,"    ","0","    ",179,"     ","EXIT PROGRAM","                       ",179,"$"
		FORMAT5    DB 0DH,0AH,"    ",192,9 DUP (196),193,40 DUP (196),217,"$"
        ; INPUT TASK
        STR_INPUT  DB 0DH,0AH,"    INPUT: ","$"
        VAR_INPUT  DB ?
        STR_ERROR_RANGE DB 0DH,0AH,"      > > PLEASE SELECT THE VALID INDEX","$"
        ; DISPLAY CATEGORY
        STR_SELECTCATEGORY DB 0DH,0AH,"    ",179,"                  SELECT A CATEGORY               ",179,"$"
        STR_CATEGORY1 DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","         MANGA","                     ",179,"$"
        STR_CATEGORY2 DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","      SUPERHEROES","                  ",179,"$"
        STR_CATEGORY3 DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","        FANTASY","                    ",179,"$"
        STR_CATEGORY_EXIT DB 0DH,0AH,"    ",179,"    ","0","    ",179,"     ","      EXIT TO MENU","                 ",179,"$"
        ; DISPLAY MANGA
        FORMAT6     DB 0DH,0AH,"    ",218,9 DUP (196),194,27 DUP (196),194,12 DUP (196),191,"$"
		STR_MANGA   DB 0DH,0AH,"    ",179,"         ",179,"         BOOK NAME         ",179," PRICE (RM) ",179,"$"
		FORMAT7     DB 0DH,0AH,"    ",195,9 DUP (196),197,27 DUP (196),197,12 DUP (196),180,"$"
		STR_MANGA1  DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","NARUTO                ",179,"   500.00   ",179,"$"
		STR_MANGA2  DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","ONE PIECE             ",179,"   400.00   ",179,"$"
		STR_MANGA3  DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","ATTACK ON TITAN       ",179,"   300.50   ",179,"$"
		STR_MANGA4  DB 0DH,0AH,"    ",179,"    ","4","    ",179,"     ","MY HERO ACADEMIA      ",179,"   599.90   ",179,"$"
		STR_MANGA5  DB 0DH,0AH,"    ",179,"    ","5","    ",179,"     ","DEATH NOTE            ",179,"   299.50   ",179,"$"
		FORMAT8     DB 0DH,0AH,"    ",192,9 DUP (196),193,27 DUP (196),193,12 DUP (196),217,"$"
        ; DISPLAY SUPERHERO        
		STR_SUPER1  DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","SPIDER-MAN            ",179,"   500.00   ",179,"$"
		STR_SUPER2  DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","BATMAN                ",179,"   400.00   ",179,"$"
		STR_SUPER3  DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","SUPERMAN              ",179,"   300.50   ",179,"$"
		STR_SUPER4  DB 0DH,0AH,"    ",179,"    ","4","    ",179,"     ","WONDER WOMAN          ",179,"   599.90   ",179,"$"
		STR_SUPER5  DB 0DH,0AH,"    ",179,"    ","5","    ",179,"     ","X-MEN                 ",179,"   299.50   ",179,"$" 
        ; DISPLAY FANTASY
        STR_FANTASY1  DB 0DH,0AH,"    ",179,"    ","1","    ",179,"   ","THE LORD OF THE RINGS   ",179,"   500.00   ",179,"$"
		STR_FANTASY2  DB 0DH,0AH,"    ",179,"    ","2","    ",179,"   ","HARRY POTTER            ",179,"   400.00   ",179,"$"
		STR_FANTASY3  DB 0DH,0AH,"    ",179,"    ","3","    ",179,"   ","CHRONICLES OF NARNIA    ",179,"   300.50   ",179,"$"
		STR_FANTASY4  DB 0DH,0AH,"    ",179,"    ","4","    ",179,"   ","GAME OF THRONES         ",179,"   599.90   ",179,"$"
		STR_FANTASY5  DB 0DH,0AH,"    ",179,"    ","5","    ",179,"   ","WHEEL OF TIME           ",179,"   299.50   ",179,"$"        

    COMIC_CATEGORIES DB "MANGA", "$"
                     DB "SUPERHEROES", "$"
                     DB "FANTASY", "$"

    MANGA_BOOKS DB "NARUTO", "$"
                DB "ONE PIECE", "$"
                DB "ATTACK ON TITAN", "$"
                DB "MY HERO ACADEMIA", "$"
                DB "DEATH NOTE","$"

    SUPERHEROES_BOOKS DB "SPIDER-MAN", "$"
                      DB "BATMAN", "$"
                      DB "SUPERMAN", "$"
                      DB "WONDER WOMAN", "$"
                      DB "X-MEN", "$"

    FANTASY_BOOKS DB "THE LORD OF THE RINGS", "$"
                  DB "HARRY POTTER", "$"
                  DB "CHRONICLES OF NARNIA", "$"
                  DB "GAME OF THRONES", "$"
                  DB "WHEEL OF TIME", "$"

    PRICES DW 100, 400, 900, 200, 300, 250, 350, 450, 550, 650, 300, 500, 800, 150, 250

    CART DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    
    INPUT_ERROR_CONTINUE_STR    DB 13,10,,15 DUP (' '),"> PRESS ANY KEY TO CONTINUE...$"
    STR_BYEBYE DB 0DH,0AH,"              SHUAN Q TO BREAKING YOUR BANK :)", "$"
.CODE
NEWLINE PROC
        MOV AH,02H
        MOV dl,0AH
        MOV DL,0AH
        INT 21H
        MOV DL,13
        INT 21H
        RET
NEWLINE ENDP

PRESS_TO_CONTINUE PROC
    MOV AH,09H
    LEA DX,INPUT_ERROR_CONTINUE_STR ;PRINT PRESS ANY KEY TO CONTINUE
    INT 21H
    MOV AH,07H ;NO ECHO INPUT CHARACTER
    INT 21H
    RET
PRESS_TO_CONTINUE ENDP

CLEAR_SCREEN PROC
    MOV AX,03H
	INT 10H	
    RET
CLEAR_SCREEN ENDP

MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        CALL CLEAR_SCREEN

        SELECTMENU:
            CALL DISPLAY_MENU
            ; GET USER INPUT
            MOV AH,01H
            INT 21H
            SUB AL,30H
            MOV [VAR_INPUT],AL

            CMP AL,1
                JE MENU1            ;   << CALL >>
            CMP AL,2                ;       |
                JE MENU2            ;       |
            CMP AL,3                ;       |
                JE MENU3            ;       |
            CMP AL,4                ;       |
                JE MENU4            ;       |
            CMP AL,5                ;       |
                JE MENU5            ; << FUNCTION >>
                JG MORETHAN_FIVE    ; CHECK > 5
            CMP AL,0
                JL LESSTHAN_ZERO
                JE MENU0

        MENU1:
            CALL DISPLAY_BOOK
        MENU2:
            CALL ADD_CART
        MENU3:
            CALL SHOW_CART
        MENU4:
            CALL MODIFY_CART
        MENU5:
            CALL MAKE_PAYMENT
        MENU0:
            CALL EXIT_PROGRAM

        LESSTHAN_ZERO:
                MOV AH,09H
                LEA DX,STR_ERROR_RANGE
                INT 21H
                CALL PRESS_TO_CONTINUE
                CALL CLEAR_SCREEN
                JMP SELECTMENU

        MORETHAN_FIVE:
                MOV AH,09H
                LEA DX,STR_ERROR_RANGE
                INT 21H
                CALL PRESS_TO_CONTINUE
                CALL CLEAR_SCREEN
                JMP SELECTMENU
MAIN ENDP

DISPLAY_MENU PROC
        MOV AH,09H
        LEA DX,FORMAT1		; ==================    
        INT 21H
		MOV AH,09H
        LEA DX,STR_TITLE	; WELCOME
        INT 21H
		MOV AH,09H
        LEA DX,FORMAT2		; ==================
        INT 21H
		MOV AH,09H
        LEA DX,FORMAT3		
        INT 21H
		MOV AH,09H
        LEA DX,STR_SELECTMENU
        INT 21H
		MOV AH,09H
        LEA DX,FORMAT4
        INT 21H
        MOV AH,09H
        LEA DX,STR_MENU1
        INT 21H
        MOV AH,09H
        LEA DX,STR_MENU2
        INT 21H
        MOV AH,09H
        LEA DX,STR_MENU3
        INT 21H
        MOV AH,09H
        LEA DX,STR_MENU4
        INT 21H
        MOV AH,09H
        LEA DX,STR_MENU5
        INT 21H
        MOV AH,09H
        LEA DX,STR_MENU6
        INT 21H
        MOV AH,09H
        LEA DX,FORMAT5
        INT 21H
        MOV AH,09H
        LEA DX,STR_INPUT
        INT 21H
        RET
DISPLAY_MENU ENDP

DISPLAY_BOOK PROC
        CALL CLEAR_SCREEN
        MOV AH,09H
        LEA DX,FORMAT3
        INT 21H
        MOV AH,09H
        LEA DX,STR_SELECTCATEGORY
        INT 21H
        MOV AH,09H
        LEA DX,FORMAT4
        INT 21H
        MOV AH,09H
        LEA DX,STR_CATEGORY1
        INT 21H
        MOV AH,09H
        LEA DX,STR_CATEGORY2
        INT 21H
        MOV AH,09H
        LEA DX,STR_CATEGORY3
        INT 21H
        MOV AH,09H
        LEA DX,STR_CATEGORY_EXIT
        INT 21H
        MOV AH,09H
        LEA DX,FORMAT5
        INT 21H
        MOV AH,09H
        LEA DX,STR_INPUT
        INT 21H
        ; GET USER INPUT
        MOV AH,01H
        INT 21H
        SUB AL,30H

        CMP AL,1
        JE CATEGORY1
        CMP AL,2
        JE CATEGORY2
        CMP AL,3
        JE CATEGORY3
        JG MORETHAN_THREE_CATEGORY
        CMP AL,0
        JL LESSTHAN_ZERO_CATEGORY
        JE BACK_MENU

        BACK_MENU:
            CALL MAIN
        CATEGORY1:
            CALL DISPLAY_MANGA_BOOKS
            CALL PRESS_TO_CONTINUE
            CALL CLEAR_SCREEN
            JMP DISPLAY_BOOK
        CATEGORY2:
            CALL DISPLAY_SUPERHERO_BOOKS
            CALL PRESS_TO_CONTINUE
            CALL CLEAR_SCREEN
            JMP DISPLAY_BOOK
        CATEGORY3:
            CALL DISPLAY_FANTASY_BOOKS
            CALL PRESS_TO_CONTINUE
            CALL CLEAR_SCREEN
            JMP DISPLAY_BOOK
        LESSTHAN_ZERO_CATEGORY:
            MOV AH,09H
            LEA DX,STR_ERROR_RANGE
            INT 21H
            CALL PRESS_TO_CONTINUE
            JMP DISPLAY_BOOK
        MORETHAN_THREE_CATEGORY:
            MOV AH,09H
            LEA DX,STR_ERROR_RANGE
            INT 21H
            CALL PRESS_TO_CONTINUE
            JMP DISPLAY_BOOK

DISPLAY_BOOK ENDP

DISPLAY_MANGA_BOOKS PROC
        MOV AH,09H
        LEA DX,FORMAT6		; ==================    
        INT 21H
		MOV AH,09H
        LEA DX,STR_MANGA
        INT 21H
		MOV AH,09H
        LEA DX,FORMAT7		; ==================
        INT 21H
        MOV AH,09H
        LEA DX,STR_MANGA1
        INT 21H
        MOV AH,09H
        LEA DX,STR_MANGA2
        INT 21H
        MOV AH,09H
        LEA DX,STR_MANGA3
        INT 21H
        MOV AH,09H
        LEA DX,STR_MANGA4
        INT 21H
        MOV AH,09H
        LEA DX,STR_MANGA5
        INT 21H
        MOV AH,09H
        LEA DX,FORMAT8
        INT 21H
        RET
DISPLAY_MANGA_BOOKS ENDP

DISPLAY_SUPERHERO_BOOKS PROC
        MOV AH,09H
        LEA DX,FORMAT6		; ==================    
        INT 21H
		MOV AH,09H
        LEA DX,STR_MANGA
        INT 21H
		MOV AH,09H
        LEA DX,FORMAT7		; ==================
        INT 21H
        MOV AH,09H
        LEA DX,STR_SUPER1
        INT 21H
        MOV AH,09H
        LEA DX,STR_SUPER2
        INT 21H
        MOV AH,09H
        LEA DX,STR_SUPER3
        INT 21H
        MOV AH,09H
        LEA DX,STR_SUPER4
        INT 21H
        MOV AH,09H
        LEA DX,STR_SUPER5
        INT 21H
        MOV AH,09H
        LEA DX,FORMAT8
        INT 21H
        RET
DISPLAY_SUPERHERO_BOOKS ENDP

DISPLAY_FANTASY_BOOKS PROC
        MOV AH,09H
        LEA DX,FORMAT6		; ==================    
        INT 21H
		MOV AH,09H
        LEA DX,STR_MANGA
        INT 21H
		MOV AH,09H
        LEA DX,FORMAT7		; ==================
        INT 21H
        MOV AH,09H
        LEA DX,STR_FANTASY1
        INT 21H
        MOV AH,09H
        LEA DX,STR_FANTASY2
        INT 21H
        MOV AH,09H
        LEA DX,STR_FANTASY3
        INT 21H
        MOV AH,09H
        LEA DX,STR_FANTASY4
        INT 21H
        MOV AH,09H
        LEA DX,STR_FANTASY5
        INT 21H
        MOV AH,09H
        LEA DX,FORMAT8
        INT 21H
        RET
DISPLAY_FANTASY_BOOKS ENDP



ADD_CART PROC
ADD_CART ENDP
SHOW_CART PROC
SHOW_CART ENDP
MODIFY_CART PROC
MODIFY_CART ENDP
MAKE_PAYMENT PROC
MAKE_PAYMENT ENDP

EXIT_PROGRAM PROC
    CALL NEWLINE
    MOV AH,09H
    LEA DX,STR_BYEBYE
    INT 21H
EXIT_PROGRAM ENDP


        MOV AH,4CH
        INT 21H

        END MAIN
