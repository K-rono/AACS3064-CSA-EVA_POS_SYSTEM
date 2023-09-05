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
		STR_MENU1  DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","PURCHASE BOOK","                      ",179,"$"
		STR_MENU2  DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","SHOW CART CONTENT","                  ",179,"$"
		STR_MENU3  DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","MODIFY CART","                        ",179,"$"
		STR_MENU4  DB 0DH,0AH,"    ",179,"    ","4","    ",179,"     ","MAKE PAYMENT","                       ",179,"$"
        STR_MENU5  DB 0DH,0AH,"    ",179,"    ","0","    ",179,"     ","EXIT PROGRAM","                       ",179,"$"
		FORMAT5    DB 0DH,0AH,"    ",192,9 DUP (196),193,40 DUP (196),217,"$"
        ; INPUT TASK
        STR_INPUT  DB 0DH,0AH,"    INPUT: ","$"
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
		STR_MANGA1  DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","NARUTO                ",179,"    52.30   ",179,"$"
		STR_MANGA2  DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","ONE PIECE             ",179,"    56.70   ",179,"$"
		STR_MANGA3  DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","ATTACK ON TITAN       ",179,"    58.70   ",179,"$"
		STR_MANGA4  DB 0DH,0AH,"    ",179,"    ","4","    ",179,"     ","MY HERO ACADEMIA      ",179,"    63.20   ",179,"$"
		STR_MANGA5  DB 0DH,0AH,"    ",179,"    ","5","    ",179,"     ","DEATH NOTE            ",179,"    57.60   ",179,"$"
		FORMAT8     DB 0DH,0AH,"    ",192,9 DUP (196),193,27 DUP (196),193,12 DUP (196),217,"$"
        ; DISPLAY SUPERHERO        
		STR_SUPER1  DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","SPIDER-MAN            ",179,"    63.50   ",179,"$"
		STR_SUPER2  DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","BATMAN                ",179,"    56.40   ",179,"$"
		STR_SUPER3  DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","SUPERMAN              ",179,"    54.60   ",179,"$"
		STR_SUPER4  DB 0DH,0AH,"    ",179,"    ","4","    ",179,"     ","WONDER WOMAN          ",179,"    55.30   ",179,"$"
		STR_SUPER5  DB 0DH,0AH,"    ",179,"    ","5","    ",179,"     ","X-MEN                 ",179,"    61.90   ",179,"$" 
        ; DISPLAY FANTASY
        STR_FANTASY1  DB 0DH,0AH,"    ",179,"    ","1","    ",179,"   ","THE LORD OF THE RINGS   ",179,"    51.40   ",179,"$"
		STR_FANTASY2  DB 0DH,0AH,"    ",179,"    ","2","    ",179,"   ","HARRY POTTER            ",179,"    59.40   ",179,"$"
		STR_FANTASY3  DB 0DH,0AH,"    ",179,"    ","3","    ",179,"   ","CHRONICLES OF NARNIA    ",179,"    55.80   ",179,"$"
		STR_FANTASY4  DB 0DH,0AH,"    ",179,"    ","4","    ",179,"   ","GAME OF THRONES         ",179,"    54.60   ",179,"$"
		STR_FANTASY5  DB 0DH,0AH,"    ",179,"    ","5","    ",179,"   ","WHEEL OF TIME           ",179,"    50.60   ",179,"$"        
        ; CHOOSE BOOK
        STR_CHOOSE_BOOK DB 0DH,0DH,"    ","CHOOSE A BOOK: ","$"
        STR_BOOKNAME    DB ,"   ","BOOK NAME : ","$"
        STR_BOOKPRICE   DB ,"   ","BOOK PRICE: RM ","$"
        STR_BOOKQTY     DB ,"   ","BOOK QUANTITY: ","$"
        STR_NEWBOOK     DB ,"   ","WANT TO ADD MORE BOOK ? (Y/N): ", "$"
        STR_LIMIT_BOOK  DB 0DH,0DH, "    ","> > ONLY CAN PURCHASE A MAXIMUM OF 10", "$"
        ; CART
        VAR_LOOPNUM DB ?
        STR_CART_TITLE1 DB 0DH,0AH,"    ",218,62 DUP (196),191,"$"
        STR_CART_TITLE2 DB 0DH,0AH,"    ",179,"                             CART                             ",179,"$"
        STR_CART_TITLE3 DB 0DH,0AH,"    ",195,7 DUP (196),194,30 DUP (196),194,12 DUP (196),194,10 DUP (196),180,"$"
        STR_CART_TITLE4 DB 0DH,0AH,"    ",179,7 DUP (),179,"           BOOK NAME          ",179," PRICE (RM) ",179," QUANTITY ",179,"$"
        STR_CART_TITLE5 DB 0DH,0AH,"    ",195,7 DUP (196),197,30 DUP (196),197,12 DUP (196),197,10 DUP (196),180,"$"
        STR_CART_FORMAT1 DB 0DH,0AH,"    ",179,"   ","$" ; 1 
        STR_CART_FORMAT2 DB ,"  ",179,"    ","$"    ; 2 NUMBER AND BOOK
        STR_CART_FORMAT3 DB ,"    ",179,"   ","$" ; 3 BOOK AND PRICE
        STR_CART_FORMAT4 DB ,"   ",179,"    ","$"; 4 PRICE AND QTY
        STR_CART_FORMAT5 DB ,"    ",179,"$"
        STR_CART_FORMAT6 DB," ",179,"    ","$"
        STR_CART_FORMAT_END DB 0DH,0AH,"    ",192,7 DUP (196),193,30 DUP (196),193,12 DUP (196),193,10 DUP (196),217,"$"
        STR_CART_EMPTY DB 0DH,0AH,"               >>  NO BOOK ADDED :)","$"
        STR_CART_PREVOIUSPAGE DB 0DH,0AH,"    ","1 = SHOW PREVIOUS PAGE","$"
        STR_CART_EXIT DB 0DH,0AH,"    ","0 = EXIT TO MAIN MENU","$"

    COMIC_CATEGORIES DB "MANGA", "$"
                     DB "SUPERHEROES", "$"
                     DB "FANTASY", "$"

    BOOK_NAME   DB "$"
                DB "NARUTO               ", "$"
                DB "ONE PIECE            ", "$"
                DB "ATTACK ON TITAN      ", "$"
                DB "MY HERO ACADEMIA     ", "$"
                DB "DEATH NOTE           ", "$"
                DB "SPIDER-MAN           ", "$"
                DB "BATMAN               ", "$"
                DB "SUPERMAN             ", "$"
                DB "WONDER WOMAN         ", "$"
                DB "X-MEN                ", "$"
                DB "THE LORD OF THE RINGS", "$"
                DB "HARRY POTTER         ", "$"
                DB "CHRONICLES OF NARNIA ", "$"
                DB "GAME OF THRONES      ", "$"
                DB "WHEEL OF TIME        ", "$"    

    BOOKS_PRICE DW 5230
                DW 5670
                DW 5870
                DW 6320
                DW 5760
                DW 6350
                DW 5640
                DW 5460
                DW 5530
                DW 6190
                DW 5140
                DW 5940
                DW 5580
                DW 5460
                DW 5060

    VAR_ADJUST_BOOK_INDEX DB ?
    NUMBER_CART DW 0
    FREE_TEMP DB 0
    NUMBER_CHOOSE DW 0

    NAME_TEMP   DW ?    ; DW 2 BYTE , 0000
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?        ; DW 2 BYTE , 0000

    PRICE_TEMP  DW ?    
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?    ; DB 1 BYTE, 00

    QTY_TEMP    Dw ?    ; DW 2 BYTE , 0000
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
                DW ?
    
    INPUT_ERROR_CONTINUE_STR    DB 0DH,0AH,15 DUP (' '), "> PRESS ANY KEY TO CONTINUE...$"
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
    XOR AX,AX
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
            SUB AL,"0"

            CMP AL,1
                JE MENU1            ;   << CALL >>
            CMP AL,2                ;       |
                JE MENU2            ;       |
            CMP AL,3                ;       |
                JE MENU3            ;       |
            CMP AL,4                ;       |
                JE MENU4            ; << FUNCTION >>                
            CMP AL,0
                JE MENU0
            JMP RANGE_ERROR         ; OUT OF FOUR

        MENU1:
            CALL PURCHASE_BOOK
        MENU2:
            CALL SHOW_CART
        MENU3:
            CALL MODIFY_CART
        MENU4:
            CALL MAKE_PAYMENT
        MENU0:
            CALL EXIT_PROGRAM

        RANGE_ERROR:
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
        LEA DX,FORMAT5
        INT 21H
        MOV AH,09H
        LEA DX,STR_INPUT
        INT 21H
        RET
DISPLAY_MENU ENDP

PURCHASE_BOOK PROC
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
        SUB AL,"0"

        CMP AL,1
        JE CATEGORY1
        CMP AL,2
        JE CATEGORY2
        CMP AL,3
        JE CATEGORY3
        JG MORETHAN_THREE_CATEGORY
        CMP AL,0
        JL LESSTHAN_ZERO_CATEGORY
        JE BACK_MENU_P

        BACK_MENU_P:
            CALL MAIN
        CATEGORY1:
            CALL DISPLAY_MANGA_BOOKS
            MOV VAR_ADJUST_BOOK_INDEX, 0
            CALL CHOOSE_BOOK
            CALL NEWLINE
            CALL PRESS_TO_CONTINUE
            CALL CLEAR_SCREEN
            JMP PURCHASE_BOOK
        CATEGORY2:
            CALL DISPLAY_SUPERHERO_BOOKS
            MOV VAR_ADJUST_BOOK_INDEX, 5
            CALL CHOOSE_BOOK
            CALL NEWLINE
            CALL PRESS_TO_CONTINUE
            CALL CLEAR_SCREEN
            JMP PURCHASE_BOOK
        CATEGORY3:
            CALL DISPLAY_FANTASY_BOOKS
            MOV VAR_ADJUST_BOOK_INDEX, 10
            CALL CHOOSE_BOOK
            CALL NEWLINE
            CALL PRESS_TO_CONTINUE
            CALL CLEAR_SCREEN
            JMP PURCHASE_BOOK
        LESSTHAN_ZERO_CATEGORY:
            MOV AH,09H
            LEA DX,STR_ERROR_RANGE
            INT 21H
            CALL PRESS_TO_CONTINUE
            JMP PURCHASE_BOOK
        MORETHAN_THREE_CATEGORY:
            MOV AH,09H
            LEA DX,STR_ERROR_RANGE
            INT 21H
            CALL PRESS_TO_CONTINUE
            JMP PURCHASE_BOOK
PURCHASE_BOOK ENDP

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

CHOOSE_BOOK PROC
        XOR BX,BX
        MOV AX,NUMBER_CART
        MOV FREE_TEMP,4
        MUL FREE_TEMP
        MOV BX,AX
    NEW_BOOK:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_CHOOSE_BOOK
        INT 21H                     ; PROMPT USER CHOOSE BOOK (ADD CART)
        MOV AH,01H
        INT 21H
        SUB AL,"0"

        CMP AL,1
        JL ERROR_RANGE_CHOOSEBOOK
        CMP AL,5
        JG ERROR_RANGE_CHOOSEBOOK
        JMP SKIP_CHOOSE

        ERROR_RANGE_CHOOSEBOOK:
            MOV AH,09H
            LEA DX,STR_ERROR_RANGE
            INT 21H
            CALL PRESS_TO_CONTINUE
            JMP CHOOSE_BOOK

    SKIP_CHOOSE:
        ADD AL,VAR_ADJUST_BOOK_INDEX
        MOV NUMBER_CHOOSE,AX
        XOR CX,CX
        MOV CL,AL                   ; CUZ NUMBER2 IS 2 BYTE SO IT ONLY CAN USE THE SAME SIZE REGISTER
        LEA SI,BOOK_NAME
    LOOP1:

    FIND_BOOKNAME:
        MOV AL,[SI]
        CMP AL,'$'  
        JE BOOKNAME_FOUND
        INC SI
        JMP FIND_BOOKNAME

    BOOKNAME_FOUND:
        INC SI
        LOOP LOOP1
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_BOOKNAME
        INT 21H
        XOR DX,DX
        MOV DX,SI
        INC NUMBER_CART
        MOV NAME_TEMP[BX],DX
        MOV AH,09H              ; PRINT BOOK NAME
	    INT 21H
        CALL NEWLINE
        
        MOV AX,NUMBER_CHOOSE
        SUB AX,001H
        MOV FREE_TEMP,2
        MUL FREE_TEMP
        MOV SI,AX

        MOV AX,BOOKS_PRICE[SI]
        MOV PRICE_TEMP[BX],AX   ; PRINT BOOK PRICE
        MOV AH,09H
        LEA DX,STR_BOOKPRICE
        INT 21H

        XOR AX,AX
        MOV AX,PRICE_TEMP[BX]
        PUSH BX                 ; STORE THE ARRAY LOCATION
        CALL PRINT_PRICE
        POP BX

    QTY_POINT:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_BOOKQTY
        INT 21H
        MOV AH,01H
        INT 21H
        SUB AX,"0"

        CMP AL,10
        JG LIMIT_BOOK_MESSAGE
        JMP SKIP_QTY

    LIMIT_BOOK_MESSAGE:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_LIMIT_BOOK
        INT 21H
        CALL NEWLINE
        CALL PRESS_TO_CONTINUE
        CALL NEWLINE
        JMP QTY_POINT

    SKIP_QTY:
        MOV QTY_TEMP[BX],AX
        CALL NEWLINE
        ADD BX,4

        MOV AH,09H
        LEA DX,STR_NEWBOOK
        INT 21H
        MOV AH,01H
        INT 21H
        SUB AL,110
        CMP AL,0
        JE RETURN
        CALL NEWLINE
        JMP NEW_BOOK
    RETURN:
        RET
CHOOSE_BOOK ENDP

PRINT_PRICE PROC
                    ; IF DATA IS 5045 = 50.45
    XOR BX,BX
    MOV BX,100
    XOR DX,DX
    DIV BX          ; AX HAVE 50 AND DX HAVE 45 (REMAINDER)

    PUSH DX         ; THIS CONTAIN 小数点 (REMAINDER)

    XOR BX,BX
    MOV BX,10
    XOR DX,DX
    DIV BX          ; AX HAVE 5 DX HAVE 0 (REMAINDER)

    PUSH DX         ; THIS HAVE CONTAIN 个位数 (REMAINDER)

    MOV AH,02H      ; PRINT 十位数 (AL)
    MOV DX,AX
    ADD DL,"0"
    INT 21H

    XOR DX,DX
    POP DX          ; 拿回个位数
    XOR AX,AX
    MOV AH,02H      ; PRINT 个位数 (DL)
    ADD DL,"0"
    INT 21H
    
    MOV AH,02H            ; Print DL (the first digit) to the screen
    MOV DL, '.'           ; Print a decimal point
    INT 21h

    POP DX          ; 拿回小数点
    MOV AX,DX

    XOR BX,BX
    MOV BX,10
    XOR DX,DX
    DIV BX

    PUSH DX         ; THIS HAVE CONTAIN 小数点的个位数 (REMAINDER)

    MOV AH,02H      ; PRINT 小数点的十位数 (AL)
    MOV DX,AX
    ADD DL,"0"
    INT 21H

    POP DX          ; 拿回小数点的个位数
    MOV AH,02H      ; PRINT 小数点的个位数 (DL)
    ADD DL,"0"
    INT 21H

    RET
PRINT_PRICE ENDP

SHOW_CART PROC

        MOV AX,NUMBER_CART
        CMP AX,0
        JNE SHOW

    BACK_MENU_S:
        MOV AH,09H
        LEA DX,STR_CART_EMPTY
        INT 21H
        CALL NEWLINE
        CALL PRESS_TO_CONTINUE
        CALL MAIN

    SHOW:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_CART_TITLE1
        INT 21H
        MOV AH,09H
        LEA DX,STR_CART_TITLE2
        INT 21H
        MOV AH,09H
        LEA DX,STR_CART_TITLE3
        INT 21H
        MOV AH,09H
        LEA DX,STR_CART_TITLE4
        INT 21H
        MOV AH,09H
        LEA DX,STR_CART_TITLE5
        INT 21H

        MOV VAR_LOOPNUM,1
        MOV CX,NUMBER_CART
        XOR BX,BX
    SHOW_CONTENT:

        PUSH BX

        MOV AL,VAR_LOOPNUM
        CMP AL,9
        JG MORE_THAN_NINE_FORMAT

        MOV AH,09H
        LEA DX,STR_CART_FORMAT1
        INT 21H

        MOV AH,02H
        MOV DL,VAR_LOOPNUM
        ADD DL,"0"
        INT 21H
        
        MOV AH,09H
        LEA DX,STR_CART_FORMAT2
        INT 21H

    PRINT_BOOKNAME:
        POP BX
        MOV AH,09H
        MOV DX,NAME_TEMP[BX]    ; PRINT BOOK NAME
        INT 21h

        MOV AH,09H
        LEA DX,STR_CART_FORMAT3
        INT 21H

        MOV AH,02H
        MOV AX,PRICE_TEMP[BX]   ; PRINT PRICE
        PUSH BX
        CALL PRINT_PRICE
        POP BX

        MOV AH,09H
        LEA DX,STR_CART_FORMAT4
        INT 21H

        MOV AH,02H
        MOV DX,QTY_TEMP[BX]     ; PRINT QTY
        ADD DX,30H
        INT 21H
        
        MOV AH,09H
        LEA DX,STR_CART_FORMAT5
        INT 21H

        INC VAR_LOOPNUM

        MOV AH,09H
        LEA DX,STR_CART_TITLE5
        INT 21H

        ADD BX,4
        LOOP SHOW_CONTENT
        JMP END_FORMAT

    MORE_THAN_NINE_FORMAT:

        CMP AL,10
        JE NEXT_PAGE
        JMP SKIP_FORMAT

    NEXT_PAGE:
        CALL NEWLINE
        CALL PRESS_TO_CONTINUE
        CALL CLEAR_SCREEN

    SKIP_FORMAT:
        MOV AH,09H
        LEA DX,STR_CART_FORMAT1
        INT 21H
        
        XOR AX,AX
        MOV AL,VAR_LOOPNUM  ; AL = A
        MOV BL,10           ; BL = A
        DIV BL              ; AL HAVE 1 AND AH HAVE 0
        XOR BX,BX
        MOV FREE_TEMP,AH    ; BH = 0 (REMAINDER) 个位数
        MOV BL,AL           ; BL = 1 十位数

        XOR DX,DX
        MOV AH,02H
        MOV DL,BL
        ADD DL,"0"
        INT 21H
        XOR DX,DX
        MOV AH,02H
        MOV DL,FREE_TEMP
        ADD DL,"0"
        INT 21H

        MOV AH,09H
        LEA DX,STR_CART_FORMAT6
        INT 21H
        
        JMP PRINT_BOOKNAME

    END_FORMAT:    
        MOV AH,09H
        LEA DX,STR_CART_FORMAT_END
        INT 21H
        
        CALL NEWLINE
        MOV AL,VAR_LOOPNUM
        CMP AL,10
        JG ASK_SHOW_PREVIOUS
        JMP EXIT_CART

        ASK_SHOW_PREVIOUS:
            MOV AH,09H
            LEA DX,STR_CART_PREVOIUSPAGE
            INT 21H
            MOV AH,09H
            LEA DX,STR_CART_EXIT
            INT 21H
            CALL NEWLINE
            MOV AH,09H
            LEA DX,STR_INPUT
            INT 21H
            MOV AH,01H
            INT 21H
            SUB AL,"0"

            CMP AL,1
            JNE EXIT_CART
            JMP SHOW

        EXIT_CART:
            CALL PRESS_TO_CONTINUE
            CALL MAIN

SHOW_CART ENDP

MODIFY_CART PROC
    CALL SHOW_CART
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
