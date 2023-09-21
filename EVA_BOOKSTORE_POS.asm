.MODEL SMALL
.STACK 100
.DATA
        LOGO                            DB 0DH,0AH,21 DUP (" ")," ======               "
                                        DB 0DH,0AH,21 DUP (" ")," ||                   "
                                        DB 0DH,0AH,21 DUP (" ")," ===\\=    //         "
                                        DB 0DH,0AH,21 DUP (" ")," ||  \\   //\\        "
                                        DB 0DH,0AH,21 DUP (" ")," =====\\ //  \\       "
                                        DB 0DH,0AH,21 DUP (" "),"       \//====\\      "
                                        DB 0DH,0AH,21 DUP (" "),"       //      \\ .INC",'$'
        ; OPEN & READ FILE
        FILE_HANDLER                    DW ?
        FILE_PATHNAME                   DB "password.txt",0
        PASSWORD_BUFFER                 DB 10 DUP ('$')
        OPEN_ERROR_MSG                  DB "ERROR OCCURED WHEN OPENING FILE$"
        READ_ERROR_MSG                  DB "ERROR OCCURED WHEN READING FILE$"

        ; LOGIN
        LOGIN_MENU_STR                  DB 0DH,0AH,14 DUP (" "),201,30 DUP (205),187
                                        DB 0DH,0AH,14 DUP (" "),186,7 DUP (" "),"CHOOSE AN ACTION",7 DUP (" "),186
                                        DB 0DH,0AH,14 DUP (" "),200,30 DUP (205),188
                                        DB 0DH,0AH,14 DUP (" "),186," 1 ",186," LOGIN                    ",186
                                        DB 0DH,0AH,14 DUP (" "),186," 2 ",186," CONTINUE AS GUEST        ",186
                                        DB 0DH,0AH,14 DUP (" "),186," 3 ",186," QUIT                     ",186
                                        DB 0DH,0AH,14 DUP (" "),200,30 DUP (205),188
                                        DB 0DH,0AH,14 DUP (" "),"ENTER CHOICE > $"

        MENU_ERROR_WARNING_STR          DB 0DH,0AH,"  INVALID INPUT > ENTER ONLY THE INDEX SHOWN ON THE MENU (2 TO EXIT)$"

        PASSWORD                        DB "admin$"
        PASSWORD_IN                     DB 10 DUP('$')
        DELETE                          DB 8,' ',8,'$'
        LOGIN_STR                       DB 0DH,0AH,"Enter password:$"
        PASSWORD_INCORRECT_STR          DB 0DH,0AH,"PASSWORD INCORRECT$"
        INCORRECT_LOGIN_NUM             DB 0
        FORCE_LOCK_SYSTEM_STR1          DB 0DH,0AH,"    EXCEEDED MAXIMUM NUMBER OF TRIES [3]. ",'$'
        FORCE_LOCK_SYSTEM_STR2          DB "SYSTEM LOCKED.","$"

        ; DISPLAY WELCOME
        FORMAT1                         DB 0DH,0AH,"              ",201,28 DUP (205),187,"$"
		STR_TITLE                       DB 0DH,0AH,"              ",186,"  WELCOME TO EVA BOOK SHOP  ",186,"$"
		FORMAT2                         DB 0DH,0AH,"              ",200,28 DUP (205),188,"$"
		; DISPLAY MENU
        FORMAT3                         DB 0DH,0AH,"    ",218,50 DUP (196),191,"$"
		STR_SELECTMENU                  DB 0DH,0AH,"    ",179,"                  SELECT A TASK                   ",179,"$"
		FORMAT4                         DB 0DH,0AH,"    ",195,9 DUP (196),194,40 DUP (196),180,"$"
		STR_MENU1                       DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","PURCHASE BOOK","                      ",179,"$"
		STR_MENU2                       DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","SHOW CART CONTENT","                  ",179,"$"
		STR_MENU3                       DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","MODIFY CART","                        ",179,"$"
		STR_MENU4                       DB 0DH,0AH,"    ",179,"    ","4","    ",179,"     ","MAKE PAYMENT","                       ",179,"$"
        STR_MENU5                       DB 0DH,0AH,"    ",179,"    ","0","    ",179,"     ","EXIT PROGRAM","                       ",179,"$"
		FORMAT5                         DB 0DH,0AH,"    ",192,9 DUP (196),193,40 DUP (196),217,"$"
        ; INPUT TASK
        STR_INPUT                       DB 0DH,0AH,"    INPUT: ","$"
        STR_ERROR_RANGE                 DB 0DH,0AH,"      > > PLEASE SELECT THE VALID INDEX","$"
        INPUT_ERROR_CONTINUE_STR        DB 0DH,0AH,15 DUP (' '), "> PRESS ANY KEY TO CONTINUE...$"
        ; DISPLAY CATEGORY
        STR_SELECTCATEGORY              DB 0DH,0AH,"    ",179,"                  SELECT A CATEGORY               ",179,"$"
        STR_CATEGORY1                   DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","         MANGA","                     ",179,"$"
        STR_CATEGORY2                   DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","      SUPERHEROES","                  ",179,"$"
        STR_CATEGORY3                   DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","        FANTASY","                    ",179,"$"
        STR_CATEGORY_EXIT               DB 0DH,0AH,"    ",179,"    ","0","    ",179,"     ","      EXIT TO MENU","                 ",179,"$"
        ; DISPLAY MANGA
        FORMAT6                         DB 0DH,0AH,"    ",218,9 DUP (196),194,27 DUP (196),194,12 DUP (196),191,"$"
		STR_MANGA                       DB 0DH,0AH,"    ",179,"         ",179,"         BOOK NAME         ",179," PRICE (RM) ",179,"$"
		FORMAT7                         DB 0DH,0AH,"    ",195,9 DUP (196),197,27 DUP (196),197,12 DUP (196),180,"$"
		STR_MANGA1                      DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","NARUTO                ",179,"    52.30   ",179,"$"
		STR_MANGA2                      DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","ONE PIECE             ",179,"    56.70   ",179,"$"
		STR_MANGA3                      DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","ATTACK ON TITAN       ",179,"    58.70   ",179,"$"
		STR_MANGA4                      DB 0DH,0AH,"    ",179,"    ","4","    ",179,"     ","MY HERO ACADEMIA      ",179,"    63.20   ",179,"$"
		STR_MANGA5                      DB 0DH,0AH,"    ",179,"    ","5","    ",179,"     ","DEATH NOTE            ",179,"    57.60   ",179,"$"
		FORMAT8                         DB 0DH,0AH,"    ",192,9 DUP (196),193,27 DUP (196),193,12 DUP (196),217,"$"
        ; DISPLAY SUPERHERO        
		STR_SUPER1                      DB 0DH,0AH,"    ",179,"    ","1","    ",179,"     ","SPIDER-MAN            ",179,"    63.50   ",179,"$"
		STR_SUPER2                      DB 0DH,0AH,"    ",179,"    ","2","    ",179,"     ","BATMAN                ",179,"    56.40   ",179,"$"
		STR_SUPER3                      DB 0DH,0AH,"    ",179,"    ","3","    ",179,"     ","SUPERMAN              ",179,"    54.60   ",179,"$"
		STR_SUPER4                      DB 0DH,0AH,"    ",179,"    ","4","    ",179,"     ","WONDER WOMAN          ",179,"    55.30   ",179,"$"
		STR_SUPER5                      DB 0DH,0AH,"    ",179,"    ","5","    ",179,"     ","X-MEN                 ",179,"    61.90   ",179,"$" 
        ; DISPLAY FANTASY
        STR_FANTASY1                    DB 0DH,0AH,"    ",179,"    ","1","    ",179,"   ","THE LORD OF THE RINGS   ",179,"    51.40   ",179,"$"
		STR_FANTASY2                    DB 0DH,0AH,"    ",179,"    ","2","    ",179,"   ","HARRY POTTER            ",179,"    59.40   ",179,"$"
		STR_FANTASY3                    DB 0DH,0AH,"    ",179,"    ","3","    ",179,"   ","CHRONICLES OF NARNIA    ",179,"    55.80   ",179,"$"
		STR_FANTASY4                    DB 0DH,0AH,"    ",179,"    ","4","    ",179,"   ","GAME OF THRONES         ",179,"    54.60   ",179,"$"
		STR_FANTASY5                    DB 0DH,0AH,"    ",179,"    ","5","    ",179,"   ","WHEEL OF TIME           ",179,"    50.60   ",179,"$"        
        ; CHOOSE BOOK
        STR_CHOOSE_BOOK                 DB 0DH,0DH,"    ","CHOOSE A BOOK: ","$"
        STR_BOOKNAME                    DB 0,"   ","BOOK NAME : ","$"
        STR_BOOKPRICE                   DB 0,"   ","BOOK PRICE: RM ","$"
        STR_BOOKQTY                     DB 0,"   ","BOOK QUANTITY: ","$"
        STR_NEWBOOK                     DB 0,"   ","WANT TO ADD MORE BOOK ? (Y/N): ", "$"
        STR_LIMIT_BOOK1                 DB 0DH,0DH, "      ","> > ONLY CAN PURCHASE A MAXIMUM OF 9", "$"
        STR_LIMIT_BOOK2                 DB 0DH,0DH, "      ","> > MINIMUM PURCHASE 1 BOOK", "$"
        STR_LIMIT_BOOK3                 DB 0DH,0DH, "      ","> > YOU CART CURRENT HAVE ", "$"
        STR_LIMIT_BOOK4                 DB 0," BOOK", "$"
        STR_NOT_ADD                     DB 0DH,0DH, "      ","> > > THIS BOOK WILL NOT ADDED", "$"
        STR_YES_NO_ERROR                DB 0DH,0DH, "      ","> > PLEASE ENTER 'Y' OR 'N' ", "$"
        ; CART
        VAR_LOOPNUM                     DB ?
        STR_CART_TITLE1                 DB 0DH,0AH,"    ",218,62 DUP (196),191,"$"
        STR_CART_TITLE2                 DB 0DH,0AH,"    ",179,"                             CART                             ",179,"$"
        STR_CART_TITLE3                 DB 0DH,0AH,"    ",195,7 DUP (196),194,30 DUP (196),194,12 DUP (196),194,10 DUP (196),180,"$"
        STR_CART_TITLE4                 DB 0DH,0AH,"    ",179,7 DUP (),179,"           BOOK NAME          ",179," PRICE (RM) ",179," QUANTITY ",179,"$"
        STR_CART_TITLE5                 DB 0DH,0AH,"    ",195,7 DUP (196),197,30 DUP (196),197,12 DUP (196),197,10 DUP (196),180,"$"
        STR_CART_FORMAT1                DB 0DH,0AH,"    ",179,"   ","$" ; 1 
        STR_CART_FORMAT2                DB 0,"  ",179,"    ","$"     ; 2 NUMBER AND BOOK
        STR_CART_FORMAT3                DB 0,"    ",179,"   ","$"    ; 3 BOOK AND PRICE
        STR_CART_FORMAT4                DB 0,"   ",179,"    ","$"    ; 4 PRICE AND QTY
        STR_CART_FORMAT5                DB 0,"    ",179,"$"
        STR_CART_FORMAT6                DB 0," ",179,"    ","$"
        STR_CART_FORMAT_END             DB 0DH,0AH,"    ",192,7 DUP (196),193,30 DUP (196),193,12 DUP (196),193,10 DUP (196),217,"$"
        STR_CART_EMPTY                  DB 0DH,0AH,"               >>  NO BOOK ADDED :)","$"
        STR_CART_PREVOIUSPAGE           DB 0DH,0AH,"    ","1 = SHOW PREVIOUS PAGE","$"
        STR_CART_EXIT                   DB 0DH,0AH,"    ","0 = EXIT","$"
		; MODIFY
        STR_NOTHING                     DB 0,"    ","NOTHING IN CART","$"
        STR_SELECT                      DB 0,"    ","SELECT A BOOK: ","$"
        STR_MODIFY1                     DB 0DH,0AH,"    ","SELECT MODIFY FUNCTION","$"
        STR_MODIFY2                     DB 0DH,0AH,"   ",179,"1",179," CLEAR ALL","$"
        STR_MODIFY3                     DB 0DH,0AH,"   ",179,"2",179," SELECT WITH NUMBER TO MODIFY","$"
        STR_MODIFY4                     DB 0DH,0AH,"   ",179,"1",179," DELETE","$"
        STR_MODIFY5                     DB 0DH,0AH,"   ",179,"2",179," CHANGE QUANTITY","$"
        STR_MODIFY6                     DB 0DH,0AH,"   ",179,"0",179," QUIT FUNTION","$"
        STR_MODIFY7                     DB 0,15 DUP (" "),"(-) LEFT ARROW KEY ",179,179," RIGHT ARROW KEY (+)","$"
        STR_CLEAR_SUCCESS               DB 0,"            > > SUCCESSFULLY CLAERED.","$"
        ; PAYMENT
        STR_PAYMENT_TITLE1              DB 0DH,0AH,"    ",218,70 DUP (196),191,"$"
        STR_PAYMENT_TITLE2              DB 0DH,0AH,"    ",179,"                              PAYMENT                                 ",179,"$"
        STR_PAYMENT_TITLE3              DB 0DH,0AH,"    ",195,7 DUP (196),194,30 DUP (196),194,12 DUP (196),194,10 DUP (196),194,7 DUP (196),180,"$"
        STR_PAYMENT_TITLE4              DB 0DH,0AH,"    ",179,7 DUP (),179,"           BOOK NAME          ",179," PRICE (RM) ",179," QUANTITY ",179," TOTAL ",179,"$"
        STR_PAYMENT_TITLE5              DB 0DH,0AH,"    ",195,7 DUP (196),197,30 DUP (196),197,12 DUP (196),197,10 DUP (196),197,7 DUP (196),180,"$"
        STR_PAYMENT_FORMAT1             DB 0DH,0AH,"    ",179,"   ","$" ; 1 
        STR_PAYMENT_FORMAT2             DB 0,"  ",179,"    ","$"    ; 2 NUMBER AND BOOK
        STR_PAYMENT_FORMAT3             DB 0,"    ",179,"   ","$"   ; 3 BOOK AND PRICE
        STR_PAYMENT_FORMAT4             DB 0,"   ",179,"    ","$"   ; 4 PRICE AND QTY
        STR_PAYMENT_FORMAT5             DB 0,"    ",179,"$"
        STR_PAYMENT_FORMAT7             DB 0,179,"$"
        STR_PAYMENT_FORMAT6             DB 0," ",179,"    ","$"
        STR_PAYMENT_FORMAT_END          DB 0DH,0AH,"    ",192,7 DUP (196),193,30 DUP (196),193,12 DUP (196),193,10 DUP (196),193,7 DUP (196),217,"$"
        STR_PAYMENT_PREVOIUSPAGE        DB 0DH,0AH,"    ","2 = PROCEED PAYMENT"
                                        DB 0DH,0AH,"    ","1 = SHOW PREVIOUS PAGE"
                                        DB 0DH,0AH,"    ","0 = EXIT TO MAIN MENU","$"
        STR_PAYMENT_SPACE               DB ' ','$'
        STR_PAYMENT_ASK_PROCEED         DB 0DH,0AH,"    ","1 = PROCEED PAYMENT"
                                        DB 0DH,0AH,"    ","0 = EXIT PAYMENT",'$'
        STR_PAYMENT_TOTAL               DB 0DH,0AH,57 DUP (" "),"TOTAL(RM) = ",'$'
        
        STR_INVOICE_HEADER              DB 0DH,0AH,7 DUP (" "),201,10 DUP (205),187
                                        DB 0DH,0AH,7 DUP (" "),186," INVOICE  ",186
                                        DB 0DH,0AH,7 DUP (" "),200, 10 DUP (205),188,'$'

        STR_INVOICE_SUBTOTAL            DB 0DH,0AH,7 DUP (" "),"SUBTOTAL              : RM ",'$'
        STR_INVOICE_SST                 DB 0DH,0AH,7 DUP (" "),"5% SST (CHARGE)(+)    : RM ",'$'
        STR_INVOICE_10                  DB 0DH,0AH,7 DUP (" "),"10% DISCOUNT(-)       : RM ",'$'
        STR_INVOICE_5                   DB 0DH,0AH,7 DUP (" "),"6% MEMBER DISCOUNT(-) : RM ",'$'
        STR_INVOICE_TOTAL               DB 0DH,0AH,0DH,0AH,7 DUP (" "),"TOTAL                 : RM ",'$'

        STR_CHECKOUT_CONFIRM            DB 0DH,0AH,"    ","1 = CONFIRM CHECK-OUT"
                                        DB 0DH,0AH,"    ","0 = CANCEL ORDER",'$'

        STR_CHECKOUT_COMPLETE           DB 0,"    ","TRANSACTION COMPLETE.",'$'

        STR_CHECKOUT_CONT               DB 0DH,0AH,"    ","1 = ORDER AGAIN"
                                        DB 0DH,0AH,"    ","0 = EXIT",'$'
        ; EXIT
        STR_EXIT_TITLE1                 DB 0DH,0AH,"    ",213,50 DUP (205),184
                                        DB 0DH,0AH,"    ",179,"         THANK YOU FOR BREAKING YOUR BANK         ",179
                                        DB 0DH,0AH,"    ",212,50 DUP (205),190,"$"
        STR_EXIT_TITLE2                 DB 0DH,0AH,"    ","  TOTAL NUMBER OF TRANSACTION     :","   ","$"
        STR_EXIT_TITLE4                 DB 0DH,0AH,"    ","  TOTAL NUMBER OF BOOK QUANTITY   :","   ","$"
        STR_EXIT_TITLE5                 DB 0DH,0AH,"    ","  TOTAL AMOUNT SPENT              :","   RM ","$"
        STR_EXIT_FORMAT2                DB 0DH,0AH,"    ",52 DUP (205),"$"
    
    COMIC_CATEGORIES            DB "MANGA", "$"
                                DB "SUPERHEROES", "$"
                                DB "FANTASY", "$"
    ; DATA DECLARATION
    BOOK_NAME                   DB "$"
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

    BOOKS_PRICE                 DW 5230
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
    ; VARIABLE USING FOR TEMPORARY
    VAR_ADJUST_BOOK_INDEX    DB 0
    NUMBER_CART              DW 0
    FREE_TEMP                DB 0
    NUMBER_CHOOSE            DW 0
    VAR_EXIST_ARRAY          DW 0
    NEW_ARRAY_VAR            DW 0
    MODIFY_INDEX             DW 0
    TTL_SUM_QTY              DW 0
    SELECT_BUFFER            DB 20,?,100 DUP('$')
    TTL_NUM_ORDER            DW 0

    ; USING IN CALCULATION
    IS_MEMBER                DB 0

    WHOLE_NUM                DW 0

    TOTAL_WHOLE_NUM          DW 0
    TOTAL_FLOATING_POINT     DW 0

    SST_WHOLE                DW 0
    SST_FLOAT                DW 0
    SST_FLOAT2               DW 0

    DISCOUNT_10_WHOLE        DW 0
    DISCOUNT_10_FLOAT        DW 0
    DISCOUNT_10_FLOAT2       DW 0

    DISCOUNT_MEM_WHOLE       DW 0
    DISCOUNT_MEM_FLOAT       DW 0
    DISCOUNT_MEM_FLOAT2      DW 0

    FINAL_BILL_WHOLE_NUM     DW 0
    FINAL_BILL_FLOAT         DW 0

    TOTAL_WHOLE_NUM_SUM      DW 0
    TOTAL_FLOATING_POINT_SUM DW 0
    
    ; ARRAY USING FOR STORE ADD BOOK DETAILS
    INDEX_TEMP          DW ?
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

    NAME_TEMP           DW ?
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

    PRICE_TEMP          DW ?    
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

    QTY_TEMP            DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
                        DW 0
    ; PRICE = PRICE * QTY
    PRICE_AFTER_QTY     DW ?    
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

PRINT_WHOLE_NUM MACRO WHOLE_NUM
    LOCAL PRINT_THOUSANDS_WM,PRINT_HUNDREDS_WM,PRINT_TENS_WM,PRINT_ONES_WM
    XOR DX,DX

    MOV AX,WHOLE_NUM
    MOV BX,1000
    DIV BX

    CMP AX,0
    JNE PRINT_THOUSANDS_WM

    MOV AX,DX
    XOR DX,DX
    MOV BX,100
    DIV BX

    CMP AX,0
    JNE PRINT_HUNDREDS_WM

    MOV AX,DX
    XOR DX,DX
    MOV BX,10
    DIV BX

    CMP AX,0
    JNE PRINT_TENS_WM

    JMP PRINT_ONES_WM

PRINT_THOUSANDS_WM:
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

PRINT_HUNDREDS_WM:
    PUSH DX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP DX

    MOV AX,DX
    XOR DX,DX
    MOV BX,10
    DIV BX

PRINT_TENS_WM:
    PUSH DX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP DX

PRINT_ONES_WM:
    MOV AH,02H
    ADD DL,30H
    INT 21H

ENDM

PRINT_FLOAT MACRO FLOAT
    MOV AH,02H
    MOV DL,'.'
    INT 21H

    XOR DX,DX
    MOV AX,FLOAT
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

ENDM

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    CALL CLEAR_SCREEN
    
    CALL READ_FILE_PASSWORD

    CALL MAIN_MENU

    SELECTMENU:
        CALL CLEAR_SCREEN
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
        CALL SHOW_CART_PROC
    MENU3:
        CALL MODIFY_CART
    MENU4:
        CALL MAKE_PAYMENT
    MENU0:
        CALL CLEAR_ALL_ARRAY
        CALL EXIT_PROGRAM

    RANGE_ERROR:
            MOV AH,09H
            LEA DX,STR_ERROR_RANGE
            INT 21H
            CALL PRESS_TO_CONTINUE
            CALL CLEAR_SCREEN
            JMP SELECTMENU
MAIN ENDP

READ_FILE_PASSWORD PROC
    MOV AH,3DH
    MOV AL,0    ;READ ONLY MODE
    LEA DX,FILE_PATHNAME
    INT 21H

    MOV FILE_HANDLER,AX ;SAVE HANDLER
    JC OPEN_FILE_ERROR

    MOV AH,3FH
    MOV BX,FILE_HANDLER
    MOV CX,5
    LEA DX,PASSWORD_BUFFER
    INT 21H

    JC READ_FILE_ERROR

    MOV BX,FILE_HANDLER
    MOV AH,3EH
    INT 21H

    RET

OPEN_FILE_ERROR:
    MOV AH,09H
    LEA DX,OPEN_ERROR_MSG
    INT 21H
    MOV AH,4CH
    MOV AL,01H
    INT 21H

READ_FILE_ERROR:
    MOV AH,09H
    LEA DX,READ_ERROR_MSG
    INT 21H
    MOV AH,4CH
    MOV AL,2
    INT 21H

READ_FILE_PASSWORD ENDP

MAIN_MENU PROC
    RESTART_IF_INVALID_INPUT:
        CALL LOGIN_MENU
        
        ;LOGIN MENU USER INPUT CHOICE
        MOV AH,01H  ;INPUT SINGLE CHARACTER
        INT 21H

        CMP AL,'1'
        JE LOGIN
        CMP AL,'2'
        JE CONTINUE_GUEST
        CMP AL,'3'
        JE EXIT
    
        ;ANY OTHER INPUT
        MOV AH,09H
        LEA DX,MENU_ERROR_WARNING_STR   
        INT 21H
        CALL PRESS_TO_CONTINUE
        JMP RESTART_IF_INVALID_INPUT

    CONTINUE_GUEST:
        MOV AL,0
        MOV IS_MEMBER,AL
    MAIN_MENU_SECTION:
        CALL CLEAR_SCREEN
        JMP SELECTMENU

        MOV AH,01H  ;INPUT SINGLE CHARACTER
        INT 21H

    EXIT:
        JMP END_PROGRAM
MAIN_MENU ENDP

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

LOGIN PROC
    RELOGIN:
    MOV AL,INCORRECT_LOGIN_NUM
    CMP AL,3
    JE LOCK_SYSTEM

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

    ;PRINT INCORRECT PASSWORD STRING & RECORD NUMBER OF INCORRECT LOGINS
    PASSWORD_INCORRECT:
            MOV AL,INCORRECT_LOGIN_NUM  
            INC AL
            MOV INCORRECT_LOGIN_NUM,AL

            CALL NEWLINE

            MOV AH,09H
            LEA DX,PASSWORD_INCORRECT_STR   ;PRINT INCORRECT PASSWORD MSG
            INT 21H

            CALL PRESS_TO_CONTINUE

            JMP RELOGIN ;ENTER PASSWORD AGAIN

    ENTER_PASSWORD_FINISH:
        LEA SI,PASSWORD_BUFFER
        LEA DI,PASSWORD_IN

        COMPARE_PASSWORD:
            MOV AL,[SI]
            MOV BL,[DI]
            CMP AL,BL
            JNE PASSWORD_INCORRECT

            CMP BL,'$'
            JNE NOT_END_OF_STRING ;EITHER THIS APPROACH OR USE FIXED LOOPS
            MOV AL,1
            MOV IS_MEMBER,AL
            CALL CLEAR_SCREEN
            JMP MAIN_MENU_SECTION

        NOT_END_OF_STRING:
            INC SI
            INC DI

            JMP COMPARE_PASSWORD

        LOCK_SYSTEM:
            CALL FORCE_EXIT
LOGIN ENDP

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

; ADD TO CART
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
    CMP AL,0
    JE BACK_MENU_P
    JMP ERROR_MESSAGE1

    BACK_MENU_P:
        CALL SELECTMENU
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
    ERROR_MESSAGE1:
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

        ; IN THIS WHOLE PROGRAM, WE USING SIZE 4 (IN BX,SI/DI) TO JUMP NEXT ARRAY
        ; BUT THE CORRECT IS ONLY SIZE 2

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
            CALL NEWLINE
            JMP CHOOSE_BOOK

    SKIP_CHOOSE:
        
        ADD AL,VAR_ADJUST_BOOK_INDEX
        PUSH AX
        PUSH BX
        CALL FIND_SAME_BOOK
        POP BX

        CMP VAR_EXIST_ARRAY,1       ; COMPARE THE BOOK IS EXIST OR NOT
        JE CHANGE_ARRAY             ; IF YES CHANGE THE BX VALUE TO THE SAME BOOK ADDRESS
        JMP SKIP_EXIST_ARRAY    
        CHANGE_ARRAY:
            MOV BX,NEW_ARRAY_VAR
            DEC NUMBER_CART

        SKIP_EXIST_ARRAY:
        MOV INDEX_TEMP[BX],AX
        POP AX
        MOV NUMBER_CHOOSE,AX
        XOR CX,CX
        MOV CL,AL                   ; CUZ NUMBER2 IS 2 BYTE SO IT ONLY CAN USE THE SAME SIZE REGISTER
        XOR SI,SI
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
        MOV AH,09H                  ; PRINT BOOK NAME
	    INT 21H
        CALL NEWLINE
        
        PUSH BX
        MOV AX,NUMBER_CHOOSE
        SUB AX,001H
        MOV BL,2
        MUL BL
        MOV SI,AX
        POP BX

        MOV AX,BOOKS_PRICE[SI]
        MOV PRICE_TEMP[BX],AX       ; PRINT BOOK PRICE
        MOV AH,09H
        LEA DX,STR_BOOKPRICE
        INT 21H

        XOR AX,AX
        MOV AX,PRICE_TEMP[BX]
        PUSH BX                     ; STORE THE ARRAY
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

        CMP QTY_TEMP[BX],9          ; IF ADY HAVE 9 BOOK, LET USER KNOW CANT ADD MORE
        JE ZERO_ALLOW
        
        XOR AH,AH
        
        CMP AL,9
        JG LIMIT_BOOK_MESSAGE1
        CMP AL,1
        JL LIMIT_BOOK_MESSAGE2
        JMP SKIP_QTY

    LIMIT_BOOK_MESSAGE1:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_LIMIT_BOOK1
        INT 21H
        CALL PRESS_TO_CONTINUE
        CALL NEWLINE
        JMP QTY_POINT

    LIMIT_BOOK_MESSAGE2:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_LIMIT_BOOK2
        INT 21H
        CALL PRESS_TO_CONTINUE
        CALL NEWLINE
        JMP QTY_POINT

    ZERO_ALLOW:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_LIMIT_BOOK3
        INT 21H

        MOV AH,02H
        MOV DX,QTY_TEMP[BX]
        ADD DX,"0"
        INT 21H

        MOV AH,09H
        LEA DX,STR_LIMIT_BOOK4
        INT 21H
        CALL NEWLINE

        MOV AH,09H
        LEA DX,STR_LIMIT_BOOK1
        INT 21H

        CALL NEWLINE
        MOV AH,09
        LEA DX,STR_NOT_ADD
        INT 21H

        MOV AX,0                ; HERE IF USER IS ADY HAV 9 BOOK IT WILL LET AX = 0, AND PROCESS AFTER WILL ADD 0 BOOK

    SKIP_QTY:
        ADD AX,QTY_TEMP[BX]     ; ADD THE QTY OF SAME BOOK/ IF IT IS NEW BOOK IT ALSO ADD 0 + AX

        CMP AX,9
        JG MORE_THAN_9BOOK
        JMP SKIP_LIMIT

        MORE_THAN_9BOOK:
            CALL NEWLINE
            MOV AH,09H
            LEA DX,STR_LIMIT_BOOK3
            INT 21H

            MOV AH,02H
            MOV DX,QTY_TEMP[BX]
            ADD DX,"0"
            INT 21H

            MOV AH,09H
            LEA DX,STR_LIMIT_BOOK4
            INT 21H
            CALL NEWLINE

            MOV AH,09H
            LEA DX,STR_LIMIT_BOOK1
            INT 21H

            JMP QTY_POINT
    
    SKIP_LIMIT:

        PUSH AX
        CALL NEWLINE
        POP AX

        MOV QTY_TEMP[BX],AX
        CALL NEWLINE
        ADD BX,4

    ASK_CONTINUE_ADD:
        MOV AH,09H
        LEA DX,STR_NEWBOOK
        INT 21H
        MOV AH,01H
        INT 21H
        CMP AL,'n'
        JE EXIT_ADD
        CMP AL,'y'
        JE CONTINUE_ADD
        CMP AL,'N'
        JE EXIT_ADD
        CMP AL,'Y'
        JE CONTINUE_ADD
        JMP YN_VERIFY
    
    CONTINUE_ADD:
        CALL NEWLINE
        JMP NEW_BOOK

    EXIT_ADD:
        RET

    YN_VERIFY:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_YES_NO_ERROR
        INT 21H
        CALL PRESS_TO_CONTINUE
        CALL NEWLINE
        CALL NEWLINE
        JMP ASK_CONTINUE_ADD
        
CHOOSE_BOOK ENDP

; USE FOR FIND THE BOOK EXIST IN CART OR NOT
FIND_SAME_BOOK PROC
    XOR BX,BX
    MOV CX,15
LOOP_FIND_BOOK:
    CMP AX,INDEX_TEMP[BX]
    JE NO_ENTER_NEXTARRAY
    ADD BX,4
    LOOP LOOP_FIND_BOOK

    MOV VAR_EXIST_ARRAY,0
    RET

    NO_ENTER_NEXTARRAY:         ; CANNOT POP BX, DUE TO FIND THE ARRAY AT BX SUCH AS '2TH' NEED ADD QTY IN 2TH ARRAY
        MOV VAR_EXIST_ARRAY,1   ; WHEN THE BOOK IS ALREADY EXIST IN CART THE VARIABLE WILL CONTAIN 1
        MOV NEW_ARRAY_VAR,BX    ; AND LET NEW_ARRAY_VAR CONTAIN CURRENT BX VALUE
        RET

FIND_SAME_BOOK ENDP

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
    
    MOV AH,02H      ; Print DL (the first digit) to the screen
    MOV DL, '.'     ; Print a decimal point
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

; DISPLAY CONTENT IN CART
SHOW_CART_PROC PROC
    CALL SHOW_CART
    CALL PRESS_TO_CONTINUE
    CALL SELECTMENU
SHOW_CART_PROC ENDP

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
        CALL SELECTMENU

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
            JE SHOW1
            CMP AL,0
            JE EXIT_CART
            JMP ERROR_MESSAGE

        SHOW1:
            JMP SHOW
        
        ERROR_MESSAGE:
            MOV AH,09H
            LEA DX,STR_ERROR_RANGE
            INT 21H
            CALL PRESS_TO_CONTINUE
            CALL NEWLINE
            JMP ASK_SHOW_PREVIOUS

        EXIT_CART:
            RET

SHOW_CART ENDP

SHOW_CART_SELEECTED PROC

        PUSH BX                     ; PUSH FOR ORIGINAL USER INPUT
        MOV AX,MODIFY_INDEX
        DEC AX
        MOV BX,4
        MUL BX
        MOV BX,AX
        
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

        MOV AX,MODIFY_INDEX
        CMP AL,9
        JG MORE_THAN_NINE_FORMAT1

        MOV AH,09H
        LEA DX,STR_CART_FORMAT1
        INT 21H

        MOV AH,02H
        MOV DX,MODIFY_INDEX         ; BL HERE CONTAIN USER INPUT INDEX
        ADD DL,"0"
        INT 21H
        
        MOV AH,09H
        LEA DX,STR_CART_FORMAT2
        INT 21H

    PRINT_BOOKNAME1:
        MOV AH,09H
        MOV DX,NAME_TEMP[BX]        ; PRINT BOOK NAME
        INT 21h

        MOV AH,09H
        LEA DX,STR_CART_FORMAT3
        INT 21H

        MOV AH,02H
        MOV AX,PRICE_TEMP[BX]       ; PRINT PRICE
        PUSH BX
        CALL PRINT_PRICE
        POP BX

        MOV AH,09H
        LEA DX,STR_CART_FORMAT4
        INT 21H

        MOV AH,02H
        MOV DX,QTY_TEMP[BX]         ; PRINT QTY
        ADD DX,30H
        INT 21H
        
        MOV AH,09H
        LEA DX,STR_CART_FORMAT5
        INT 21H

        MOV AH,09H
        LEA DX,STR_CART_TITLE5
        INT 21H

        JMP END_FORMAT1

    MORE_THAN_NINE_FORMAT1:
        MOV AH,09H
        LEA DX,STR_CART_FORMAT1
        INT 21H
        
        PUSH BX

        XOR AX,AX
        MOV AX,MODIFY_INDEX  ; AL = A
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
        
        POP BX

        JMP PRINT_BOOKNAME1

    END_FORMAT1:    
        MOV AH,09H
        LEA DX,STR_CART_FORMAT_END
        INT 21H
        POP BX              ; POP FOR ORIGINAL USER INPUT
        
        CALL NEWLINE
        RET

SHOW_CART_SELEECTED ENDP

; MODIFY CART PROCESS
MODIFY_CART PROC

        MOV AX,NUMBER_CART
        CMP AX,0
        JNE SHOW_M
        
        MOV AH,09H
        LEA DX,STR_CART_EMPTY
        INT 21H
        CALL NEWLINE
        CALL PRESS_TO_CONTINUE
        CALL SELECTMENU

    SHOW_M:
    CALL CLEAR_SCREEN
    MOV AH,09H
    LEA DX,STR_MODIFY1
    INT 21H
    CALL NEWLINE
    MOV AH,09H
    LEA DX,STR_MODIFY2
    INT 21H
    MOV AH,09H
    LEA DX,STR_MODIFY3
    INT 21H
    MOV AH,09H
    LEA DX,STR_MODIFY6
    INT 21H
    CALL NEWLINE
    
    ;choose function
    MOV AH,09H
    LEA DX,STR_INPUT
    INT 21H
    MOV AH,01H
    INT 21H
    SUB AL,"0"

    CMP AL,1
    JE CLEAR_CART
    CMP AL,2 
    JE SELECT_TO_MODIFY
    JG INVALID
    CMP AL,0
    JE RETURN_MODIFY

    INVALID:
    MOV AH,09H
    LEA DX,STR_ERROR_RANGE
    INT 21H
    CALL PRESS_TO_CONTINUE
    CALL MODIFY_CART

    CLEAR_CART:
        CALL MODIFY_CLEARING_CART
         
    SELECT_TO_MODIFY:   
        CALL SELECT_TO_MODIFY_PROC

    RETURN_MODIFY:
        CALL SELECTMENU

MODIFY_CART ENDP

MODIFY_CLEARING_CART PROC
    CALL CLEAR_SCREEN
    XOR SI,SI
    MOV CX,AX
    CLEARING_CART:
        MOV AX,0
        MOV INDEX_TEMP[SI],AX
        MOV NAME_TEMP[SI],AX
        MOV PRICE_TEMP[SI],AX
        MOV QTY_TEMP[SI],AX
        ADD SI,4
        LOOP CLEARING_CART
        MOV NUMBER_CART,AX
        CALL NEWLINE

        MOV AH,09H
        MOV BL,000EH
        MOV CX,38
        INT 10H

        MOV AH,09H
        LEA DX,STR_CLEAR_SUCCESS
        INT 21H
        CALL PRESS_TO_CONTINUE
        CALL NEWLINE
        CALL SHOW_CART
MODIFY_CLEARING_CART ENDP

SELECT_TO_MODIFY_PROC PROC  

	START_MODIFY:             
        CALL CLEAR_SCREEN
        CALL SHOW_CART
    START_MODIFY2:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_MODIFY6
        INT 21H
        CALL NEWLINE
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_SELECT
        INT 21H

        MOV AH,0AH
        LEA DX,SELECT_BUFFER
        INT 21H
        XOR AX,AX

        LEA SI,SELECT_BUFFER+2
        MOV AL,[SI]

        CMP AL,0DH
        JE ERROR_ABC

        MOV AL,[SI+1]

        CMP AL,0DH             ; IT'S COMPARE NULL
        JE  ONE_DIGIT_MODIFY
        JNE TWO_DIGITS_MODIFY

    ONE_DIGIT_MODIFY:       
        MOV AL,[SI]
        SUB AL,"0"
        JMP COMPARE_MODIFY
    TWO_DIGITS_MODIFY:      
        MOV AL,[SI]
        SUB AL,"0"
        MOV BL,10
        MUL BL
        MOV BL,[SI+1]
        SUB BL,"0"
        ADD AL,BL
    COMPARE_MODIFY:         
        MOV BX,NUMBER_CART
        CMP AX,BX               ; (MAX)
        JLE CONTINUE_MODIFY
        JMP ERROR_ABC

		ERROR_ABC:
			JMP START_MODIFY

	CONTINUE_MODIFY:
        CMP AL,0
        JNE NEXT_STEP
        CALL MODIFY_CART

        NEXT_STEP:
        MOV AH,0
        MOV BX,AX		        ; BX = CONTAIN USER INPUT WHICH INDEX
        MOV MODIFY_INDEX,AX
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_MODIFY4
        INT 21H
        MOV AH,09H
        LEA DX,STR_MODIFY5
        INT 21H
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_INPUT
        INT 21H	
        MOV AH,01H
        INT 21H
        SUB AL,"0"
        
        CMP AL,1
        JE DELETE_ORDER
        JL INVALID1
        CMP AL,2
        JE MODIFY_QUANTITY
        JMP INVALID1

        INVALID1:
            CALL NEWLINE
            MOV AH,09H
            LEA DX,STR_ERROR_RANGE
            INT 21H
            CALL PRESS_TO_CONTINUE
            JMP NEXT_STEP 
        ;shifting array
        DELETE_ORDER:
            PUSH BX
			SUB BX,1			; 2 - 1 = 1
			MOV AX,BX			; AX = 1
			MOV BX,4			; BX = 0002
			MUL BX				; AX = 0002
            XOR SI,SI
			MOV SI,AX			; SI = 0002 ; SI = CURRENT CART LIST
			MOV DI,AX			; DI = 0002	; DI = MODIFIED CART LIST
            XOR AX,AX
			ADD SI,4            ; SI = NOW SI IS NEXT ARRAY
            POP BX
			MOV CX,NUMBER_CART
            SUB CX,BX
        DELETE_ORDER_LOOP:
            MOV AX,INDEX_TEMP[SI]
            MOV INDEX_TEMP[DI],AX
            MOV AX,NAME_TEMP[SI]
            MOV NAME_TEMP[DI],AX

            MOV AX,QTY_TEMP[SI]
            MOV QTY_TEMP[DI],AX
            MOV AX,PRICE_TEMP[SI]
            MOV PRICE_TEMP[DI],AX

            MOV QTY_TEMP[SI],0
            ADD DI,4
            ADD SI,4
            CMP CX,0
            JE DELETE_LOOP_BREAK
            LOOP DELETE_ORDER_LOOP
    DELETE_LOOP_BREAK:
        DEC NUMBER_CART
        MOV AX,NUMBER_CART
        CMP AX,0
        JE BACK_SELECTMENU
        CALL SHOW_CART
        JMP START_MODIFY2

        BACK_SELECTMENU:
            CALL PRESS_TO_CONTINUE
            CALL SELECTMENU
        ; ADD AND MINUS 
        MODIFY_QUANTITY:
            CALL SHOW_CART_SELEECTED
            SUB BX,1			; 3 - 1 = 2
            MOV AX,BX			; AX = 2
            MOV BX,4			; BX = 4
            MUL BX				; AX = 8
            MOV SI,AX			; SI = 0008
            SKIP_MODIFY_QUANTITY:
            CALL CLEAR_SCREEN
            CALL SHOW_CART_SELEECTED
            CALL NEWLINE
            MOV AH,09H
            LEA DX,STR_MODIFY7
            INT 21H
            CALL NEWLINE
            MOV AH,0
            INT 16H
            CMP AH, 4BH    ; Left arrow scan code
            JE LEFTARROW
            CMP AH, 4DH    ; Right arrow scan code
            JE RIGHTARROW
            CMP AH, 1CH    ; ENTER SCAN CODE
            JE ENTER_KEY
        LEFTARROW:
            CALL CLEAR_SCREEN
            MOV AX,QTY_TEMP[SI]
            CMP AX,1
            JLE SKIP_MODIFY_QUANTITY
            SUB AX,1
            MOV QTY_TEMP[SI],AX
            JMP SKIP_MODIFY_QUANTITY
        RIGHTARROW:
            CALL CLEAR_SCREEN
            MOV AX,QTY_TEMP[SI]
            CMP AX,9
            JGE SKIP_MODIFY_QUANTITY
            ADD AX,1
            MOV QTY_TEMP[SI],AX
            JMP SKIP_MODIFY_QUANTITY
        ENTER_KEY:       
            CALL PRESS_TO_CONTINUE
            JMP START_MODIFY

SELECT_TO_MODIFY_PROC ENDP

; PAYMENT FUNCTION
MAKE_PAYMENT PROC

        MOV AX,NUMBER_CART
        CMP AX,0
        JNE SHOW_P
        
        MOV AH,09H
        LEA DX,STR_CART_EMPTY
        INT 21H
        CALL NEWLINE
        CALL PRESS_TO_CONTINUE
        CALL SELECTMENU

    SHOW_P:

    CALL PROCESS_QTY
    CALL DISPLAY_PAYMENT
CONT_CHECKOUT:
    CALL DISPLAY_INVOICE
    CALL CALC_TOTAL

    CALL NEWLINE
    MOV AH,09H
    LEA DX,STR_CHECKOUT_CONFIRM
    INT 21H

    MOV AH,09H
    LEA DX,STR_INPUT
    INT 21H

    MOV AH,01H
    INT 21H

    CMP AL,'1'
    JE CHECKOUT
    CMP AL,'0'
    JE CANCEL_ORDER

    MOV AH,09H
    LEA DX,STR_ERROR_RANGE
    INT 21H
    CALL PRESS_TO_CONTINUE
    JMP CONT_CHECKOUT

    CANCEL_ORDER:
        CALL PRESS_TO_CONTINUE
        CALL SELECTMENU

    CHECKOUT:
        CALL NEWLINE
        CALL NEWLINE
        MOV AH,09H
        MOV BL,0002H
        MOV CX,25
        INT 10H

        MOV AH,09H
        LEA DX,STR_CHECKOUT_COMPLETE
        INT 21H

    CHECKOUT_CONT:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_CHECKOUT_CONT
        INT 21H

        MOV AH,09H
        LEA DX,STR_INPUT
        INT 21H

        MOV AH,01H
        INT 21H

        CMP AL,'1'
        JE ORDER_AGAIN
        CMP AL,'0'
        JE CLOSE_PROGRAM

        MOV AH,09H
        LEA DX,STR_ERROR_RANGE
        INT 21H
        CALL PRESS_TO_CONTINUE
        JMP CHECKOUT_CONT

        CLOSE_PROGRAM:
            CALL PRESS_TO_CONTINUE
            CALL SUM_TOTAL_OF_ORDER
            CALL SUM_TOTAL_QTY
            CALL CLEAR_ALL_ARRAY

            MOV AX,TTL_NUM_ORDER
            INC AX
            MOV TTL_NUM_ORDER,AX

            CALL EXIT_PROGRAM

        ORDER_AGAIN:
            CALL SUM_TOTAL_OF_ORDER
            CALL SUM_TOTAL_QTY
            CALL CLEAR_ALL_ARRAY
            MOV AX,TTL_NUM_ORDER
            INC AX
            MOV TTL_NUM_ORDER,AX

            CALL SELECTMENU

    RET
MAKE_PAYMENT ENDP

;SUBTRACT ALL DISCOUNTS AND & ADD TAX THEN PRINT
CALC_TOTAL PROC
    ;ROUNDING BEFORE SUM
    MOV AX,SST_FLOAT2
    CMP AX,5
    JL NO_ROUND1

    MOV AX,SST_FLOAT
    INC AX
    MOV SST_FLOAT,AX

    NO_ROUND1:
    MOV AX,DISCOUNT_10_FLOAT2
    CMP AX,5
    JL NO_ROUND2

    MOV AX,DISCOUNT_10_FLOAT
    INC AX
    MOV DISCOUNT_10_FLOAT,AX

    NO_ROUND2:
    MOV AX,DISCOUNT_MEM_FLOAT2
    CMP AX,5
    JL NO_ROUND3

    MOV AX,DISCOUNT_MEM_FLOAT
    INC AX
    MOV DISCOUNT_MEM_FLOAT,AX

NO_ROUND3:
    ;ADDING SST

    MOV AX,TOTAL_WHOLE_NUM
    ADD AX,SST_WHOLE
    
    MOV BX,TOTAL_FLOATING_POINT
    ADD BX,SST_FLOAT

    ;CHECK CARRY
    PUSH BX
    PUSH AX

    XOR DX,DX
    MOV AX,BX
    MOV BX,100
    DIV BX

    CMP AX,0

    POP AX
    POP BX

    JE NOT_CARRY

    INC AX      ;ADD CARRY INTO WHOLE NUMBER CALCULATION
    MOV BX,DX     ;FLOAT WITHOUT CARRY (EXAMPLE: 8+8 = 16, BX = 16 | DX = 6)

NOT_CARRY:
;SUBTRACT 10% DISCOUNT

    SUB AX,DISCOUNT_10_WHOLE

    ;CHECK BORROW
    CMP BX,DISCOUNT_10_FLOAT ;  BX < DISCOUNT_10_FLOAT = BORROW
    JG NO_BORROW1

    DEC AX

    ADD BX,100

    NO_BORROW1:
    SUB BX,DISCOUNT_10_FLOAT

;SUBTRACT 8% MEMBER DISCOUNT
    SUB AX,DISCOUNT_MEM_WHOLE

    ;CHECK BORROW
    CMP BX,DISCOUNT_MEM_FLOAT
    JG NO_BORROW2

    DEC AX
    ADD BX,100

    NO_BORROW2:

    SUB BX,DISCOUNT_MEM_FLOAT

FINISH_SUM:
    MOV FINAL_BILL_WHOLE_NUM,AX
    MOV FINAL_BILL_FLOAT,BX

    PRINT_WHOLE_NUM FINAL_BILL_WHOLE_NUM
    PRINT_FLOAT FINAL_BILL_FLOAT

    RET
CALC_TOTAL ENDP

DISPLAY_INVOICE PROC
    CALL CLEAR_SCREEN
    MOV AH,09H
    LEA DX,STR_INVOICE_HEADER
    INT 21H

    MOV AH,09H
    LEA DX,STR_INVOICE_SUBTOTAL
    INT 21H
    
    ;PRINT TOTAL
    PRINT_WHOLE_NUM TOTAL_WHOLE_NUM
    PRINT_FLOAT TOTAL_FLOATING_POINT

    ;SST
    MOV AH,09H
    LEA DX,STR_INVOICE_SST
    INT 21H

    CALL PRICE_SST

    MOV AX,TOTAL_WHOLE_NUM
    CMP AX,300
    JL SKIP_10_DISCOUNT

    ;10% DISCOUNT
    MOV AH,09H
    LEA DX,STR_INVOICE_10
    INT 21H

    CALL PRICE_10

SKIP_10_DISCOUNT:
    MOV AL,IS_MEMBER
    CMP AL,0
    JE SKIP_MEMBER_DISCOUNT
    ;5% MEMBER DISCOUNT
    MOV AH,09H
    LEA DX,STR_INVOICE_5
    INT 21H

    CALL PRICE_MEMBER_DISCOUNT

SKIP_MEMBER_DISCOUNT:
    MOV AH,09H
    LEA DX,STR_INVOICE_TOTAL
    INT 21H

    RET
DISPLAY_INVOICE ENDP

PROCESS_QTY PROC
    MOV SI,0 
    MOV DI,0

    MOV CX,NUMBER_CART
    QTY_TEMP_LOOP:
        
        MOV AX,PRICE_TEMP[SI]
        MOV BX,QTY_TEMP[SI]
        MUL BX
        MOV PRICE_AFTER_QTY[DI],AX
        ADD SI,4
        ADD DI,2

        ;CMP CX,1	THIS IS NO LONGER NEEDED AS VALIDATION HAS BEEN IMPLEMENTED
        ;JE BREAK_LOOP
        LOOP QTY_TEMP_LOOP

        BREAK_LOOP:
        RET
PROCESS_QTY ENDP

;SUM ALL PRICE IN PRICE_AFTER_QTY[] AND PRINT IT OUT
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
    NO_CARRY:

    RET
PRICE_ADDITION ENDP

DISPLAY_PAYMENT PROC

        MOV AX,NUMBER_CART
        CMP AX,0
        JNE SHOW_PAYMENT

        MOV AH,09H
        LEA DX,STR_CART_EMPTY
        INT 21H
        CALL NEWLINE
        CALL PRESS_TO_CONTINUE
        CALL SELECTMENU

    SHOW_PAYMENT:
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_PAYMENT_TITLE1
        INT 21H
        MOV AH,09H
        LEA DX,STR_PAYMENT_TITLE2
        INT 21H
        MOV AH,09H
        LEA DX,STR_PAYMENT_TITLE3
        INT 21H
        MOV AH,09H
        LEA DX,STR_PAYMENT_TITLE4
        INT 21H
        MOV AH,09H
        LEA DX,STR_PAYMENT_TITLE5
        INT 21H

        MOV VAR_LOOPNUM,1
        MOV CX,NUMBER_CART
        MOV SI,0
        XOR BX,BX
    SHOW_CONTENT_PAYMENT:

        PUSH BX

        MOV AL,VAR_LOOPNUM
        CMP AL,9
        JG MORE_THAN_NINE_FORMAT_PAYMENT

        MOV AH,09H
        LEA DX,STR_PAYMENT_FORMAT1
        INT 21H

        MOV AH,02H
        MOV DL,VAR_LOOPNUM
        ADD DL,"0"
        INT 21H
        
        MOV AH,09H
        LEA DX,STR_PAYMENT_FORMAT2
        INT 21H

    PRINT_BOOKNAME_PAYMENT:
        POP BX
        MOV AH,09H
        MOV DX,NAME_TEMP[BX]    ; PRINT BOOK NAME
        INT 21h

        MOV AH,09H
        LEA DX,STR_PAYMENT_FORMAT3
        INT 21H

        MOV AH,02H
        MOV AX,PRICE_TEMP[BX]   ; PRINT PRICE
        PUSH BX
        CALL PRINT_PRICE
        POP BX

        MOV AH,09H
        LEA DX,STR_PAYMENT_FORMAT4
        INT 21H

        MOV AH,02H
        MOV DX,QTY_TEMP[BX]     ; PRINT QTY
        ADD DX,30H
        INT 21H

        MOV AH,09H
        LEA DX,STR_PAYMENT_FORMAT5
        INT 21H

        CALL PRINT_PRICE_PAYMENT

        MOV AH,09H
        LEA DX,STR_PAYMENT_FORMAT7
        INT 21H

        INC VAR_LOOPNUM

        MOV AH,09H
        LEA DX,STR_PAYMENT_TITLE5
        INT 21H

        ADD SI,2
        ADD BX,4
        LOOP SHOW_CONTENT_PAYMENT
        JMP END_FORMAT_PAYMENT

    MORE_THAN_NINE_FORMAT_PAYMENT:

        CMP AL,10
        JE NEXT_PAGE_PAYMENT
        JMP SKIP_FORMAT_PAYMENT

    NEXT_PAGE_PAYMENT:
        CALL NEWLINE
        CALL PRESS_TO_CONTINUE
        CALL CLEAR_SCREEN

    SKIP_FORMAT_PAYMENT:
        MOV AH,09H
        LEA DX,STR_PAYMENT_FORMAT1
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
        LEA DX,STR_PAYMENT_FORMAT6
        INT 21H
        
        JMP PRINT_BOOKNAME_PAYMENT

    END_FORMAT_PAYMENT:    
        MOV AH,09H
        LEA DX,STR_PAYMENT_FORMAT_END
        INT 21H

        MOV AH,09H
        LEA DX,STR_PAYMENT_TOTAL
        INT 21H

        CALL PRICE_ADDITION
        ;PRINT PRICE
        PRINT_WHOLE_NUM TOTAL_WHOLE_NUM
        PRINT_FLOAT TOTAL_FLOATING_POINT
        
    ASK_PROCEED_PAYMENT:
        CALL NEWLINE

        MOV AL,VAR_LOOPNUM
        CMP AL,10
        JG ASK_SHOW_PREVIOUS_PAYMENT

        MOV AH,09H
        LEA DX,STR_PAYMENT_ASK_PROCEED
        INT 21H

        MOV AH,09H
        LEA DX,STR_INPUT
        INT 21H
        
        MOV AH,01H
        INT 21H
        SUB AL,"0"

        CMP AL,1
        JE PROCEED_PAYMENT
        CMP AL,0
        JE EXIT_CART_PAYMENT
        CALL ERROR_MESSAGE_PAYMENT
        JMP ASK_PROCEED_PAYMENT

        ASK_SHOW_PREVIOUS_PAYMENT:
            MOV AH,09H
            LEA DX,STR_PAYMENT_PREVOIUSPAGE
            INT 21H
            LEA DX,STR_INPUT
            INT 21H
            MOV AH,01H
            INT 21H
            SUB AL,"0"

            CMP AL,2
            JE PROCEED_PAYMENT
            CMP AL,1
            JE SHOW_PAYMENT_PREV
            CMP AL,0
            JE EXIT_CART_PAYMENT
            CALL ERROR_MESSAGE_PAYMENT
            JMP ASK_SHOW_PREVIOUS_PAYMENT

        SHOW_PAYMENT_PREV:
            JMP SHOW_PAYMENT

        EXIT_CART_PAYMENT:
            CALL PRESS_TO_CONTINUE
            CALL SELECTMENU

        PROCEED_PAYMENT:
        RET
DISPLAY_PAYMENT ENDP

;PRINT PRICE STORED IN WWWFF FORMAT (W - WHOLE NUMBER | F - FLOATING POINT) | 12345 = 123.45
PRINT_PRICE_PAYMENT PROC

    PUSH AX
    PUSH BX
    PUSH DX

    XOR DX,DX
    MOV AX,PRICE_AFTER_QTY[SI]
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
        PUSH DX
        JMP SKIP_PRINT_EXTRA_SPACE

    PRINT_FROM_TENS:            ;THIS HAS BEEN CREATED DUE TO INCONSISTENSIES IN DISPLAYING PAYMENT TABLE WHEN PRICE_AFTER_QTY CAN BE OF DIFFERENT LENGTH D:

        CALL PRINT_SPACE
        PUSH DX

    SKIP_PRINT_EXTRA_SPACE:
        
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
    POP BX
    POP DX

    RET
PRINT_PRICE_PAYMENT ENDP

PRICE_SST PROC
    XOR DX,DX

    MOV AX,TOTAL_WHOLE_NUM
    MOV BX,100
    DIV BX

    PUSH DX

    MOV BX,5
    MUL BX

    POP DX
    PUSH AX

    MOV AX,DX
    MOV BX,5
    MUL BX

    XOR DX,DX

    MOV BX,100
    DIV BX

    POP BX
    PUSH DX

    ADD AX,BX
    MOV SST_WHOLE,AX

    ;FLOAT CALCULATION
    XOR DX,DX

    MOV AX,TOTAL_FLOATING_POINT
    MOV BX,5
    MUL BX  

    MOV BX,100
    DIV BX

    XOR BX,BX
    POP BX
    ADD AX,BX

    MOV SST_FLOAT,AX
    MOV SST_FLOAT2,DX

    XOR DX,DX
    MOV AX,SST_WHOLE
    MOV BX,100
    DIV BX

    CMP AX,0
    JNE PRINT_HUNDREDS_SST

    MOV AX,DX
    XOR DX,DX
    MOV BX,10
    DIV BX

    CMP AX,0
    JNE PRINT_TENS_SST

    JMP PRINT_ONES_SST
PRINT_HUNDREDS_SST:
    PUSH DX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP DX

    MOV AX,DX
    XOR DX,DX
    MOV BX,10
    DIV BX

PRINT_TENS_SST:
    PUSH DX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP DX

PRINT_ONES_SST:
    MOV AH,02H
    ADD DL,30H
    INT 21H

;PRINT DECIMAL POINT
    MOV AH,02H
    MOV DL,'.'
    INT 21H

    XOR DX,DX
    MOV AX,SST_FLOAT
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

    XOR DX,DX
    MOV AX,SST_FLOAT2
    MOV BX,10
    DIV BX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    RET
PRICE_SST ENDP

PRICE_10 PROC
    XOR DX,DX

    MOV AX,TOTAL_WHOLE_NUM
    MOV BX,100
    DIV BX

    PUSH DX

    MOV BX,10
    MUL BX

    POP DX
    PUSH AX

    MOV AX,DX
    MOV BX,10
    MUL BX

    XOR DX,DX

    MOV BX,100
    DIV BX

    POP BX
    PUSH DX

    ADD AX,BX
    MOV DISCOUNT_10_WHOLE,AX

    ;FLOAT CALCULATION
    XOR DX,DX

    MOV AX,TOTAL_FLOATING_POINT
    MOV BX,10
    MUL BX  

    MOV BX,100
    DIV BX

    XOR BX,BX
    POP BX
    ADD AX,BX

    MOV DISCOUNT_10_FLOAT,AX
    MOV DISCOUNT_10_FLOAT2,DX

    XOR DX,DX
    MOV AX,DISCOUNT_10_WHOLE
    MOV BX,100
    DIV BX

    CMP AX,0
    JNE PRINT_HUNDREDS_10

    MOV AX,DX
    XOR DX,DX
    MOV BX,10
    DIV BX

    CMP AX,0
    JNE PRINT_TENS_10

    JMP PRINT_ONES_10

PRINT_HUNDREDS_10:
    PUSH DX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP DX

    MOV AX,DX
    XOR DX,DX
    MOV BX,10
    DIV BX

PRINT_TENS_10:
    PUSH DX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP DX

PRINT_ONES_10:
    MOV AH,02H
    ADD DL,30H
    INT 21H

;PRINT DECIMAL POINT
    MOV AH,02H
    MOV DL,'.'
    INT 21H

    XOR DX,DX
    MOV AX,DISCOUNT_10_FLOAT
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

    XOR DX,DX
    MOV AX,DISCOUNT_10_FLOAT2
    MOV BX,10
    DIV BX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    RET
PRICE_10 ENDP

PRICE_MEMBER_DISCOUNT PROC
    XOR DX,DX

    MOV AX,TOTAL_WHOLE_NUM
    MOV BX,100
    DIV BX

    PUSH DX

    MOV BX,6
    MUL BX

    POP DX
    PUSH AX

    MOV AX,DX
    MOV BX,6
    MUL BX

    XOR DX,DX

    MOV BX,100
    DIV BX

    POP BX
    PUSH DX

    ADD AX,BX
    MOV DISCOUNT_MEM_WHOLE,AX

    ;FLOAT CALCULATION
    XOR DX,DX

    MOV AX,TOTAL_FLOATING_POINT
    MOV BX,6
    MUL BX  

    MOV BX,100
    DIV BX

    XOR BX,BX
    POP BX
    ADD AX,BX

    MOV DISCOUNT_MEM_FLOAT,AX
    MOV DISCOUNT_MEM_FLOAT2,DX

    XOR DX,DX
    MOV AX,DISCOUNT_MEM_WHOLE
    MOV BX,100
    DIV BX

    CMP AX,0
    JNE PRINT_HUNDREDS

    MOV AX,DX
    XOR DX,DX
    MOV BX,10
    DIV BX

    CMP AX,0
    JNE PRINT_TENS

    JMP PRINT_ONES
PRINT_HUNDREDS:
    PUSH DX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP DX

    MOV AX,DX
    XOR DX,DX
    MOV BX,10
    DIV BX

PRINT_TENS:
    PUSH DX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    POP DX

PRINT_ONES:
    MOV AH,02H
    ADD DL,30H
    INT 21H

;PRINT DECIMAL POINT
    MOV AH,02H
    MOV DL,'.'
    INT 21H

    XOR DX,DX
    MOV AX,DISCOUNT_MEM_FLOAT
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

    XOR DX,DX
    MOV AX,DISCOUNT_MEM_FLOAT2
    MOV BX,10
    DIV BX

    MOV AH,02H
    MOV DL,AL
    ADD DL,30H
    INT 21H

    RET
PRICE_MEMBER_DISCOUNT ENDP

PRINT_SPACE PROC
    PUSH DX
    PUSH AX

    MOV AH,09H
    LEA DX,STR_PAYMENT_SPACE
    INT 21H

    POP AX ;POP DX LATER
    POP DX
    RET
PRINT_SPACE ENDP

ERROR_MESSAGE_PAYMENT PROC
    MOV AH,09H
    LEA DX,STR_ERROR_RANGE
    INT 21H
    CALL PRESS_TO_CONTINUE

    RET
ERROR_MESSAGE_PAYMENT ENDP

; USING TO CLEAR THE DATA IN ALL ARRAY
CLEAR_ALL_ARRAY PROC
        XOR AX,AX
        XOR BX,BX
        MOV CX,15
    LOOP_CLEAR_ARRAY:
        MOV AX,0
        MOV INDEX_TEMP[BX],AX
        MOV NAME_TEMP[BX],AX
        MOV QTY_TEMP[BX],AX
        MOV PRICE_TEMP[BX],AX
        ADD BX,4
        LOOP LOOP_CLEAR_ARRAY
        MOV NUMBER_CART,0
        RET
CLEAR_ALL_ARRAY ENDP

; SUM ALL QTY OF TRANSACTION
SUM_TOTAL_OF_ORDER PROC
    MOV AX,FINAL_BILL_WHOLE_NUM
    ADD AX,TOTAL_WHOLE_NUM_SUM
    MOV TOTAL_WHOLE_NUM_SUM,AX

    XOR AX,AX
    MOV AX,FINAL_BILL_FLOAT
    ADD AX,TOTAL_FLOATING_POINT_SUM
    MOV TOTAL_FLOATING_POINT_SUM,AX
    
    ; CHECKING THE FLOATING POINT HAVE CARRY OR NOT
    XOR DX,DX
    MOV BX,100  ; AX HERE CONTAIN (TOTAL_FLOATING_POINT_SUM)
    DIV BX

    CMP AX,0
    JE NO_CARRY1

    MOV TOTAL_FLOATING_POINT_SUM,DX

    ADD AX,TOTAL_WHOLE_NUM_SUM
    MOV TOTAL_WHOLE_NUM_SUM,AX

    NO_CARRY1:
        RET
SUM_TOTAL_OF_ORDER ENDP

; SUM THE ALL QTY IN ALL TRANSACTION
SUM_TOTAL_QTY PROC
    XOR BX,BX
    MOV CX,NUMBER_CART
    LOOP_ADD_QTY:
        MOV AX,QTY_TEMP[BX] ; QTY_TEMP = 1
        ADD AX,TTL_SUM_QTY ; TTL_SUM_QTY = 15 ;; AX = 16
        MOV TTL_SUM_QTY,AX ; 16
        ADD BX,4
        LOOP LOOP_ADD_QTY
        RET
SUM_TOTAL_QTY ENDP

EXIT_PROGRAM PROC
    CALL EXIT_PROGRAM_PROCESS
    CALL MAIN_MENU
EXIT_PROGRAM ENDP

EXIT_PROGRAM_PROCESS PROC
    CALL NEWLINE
    MOV AH,09H
    LEA DX,STR_EXIT_TITLE1
    INT 21H
    CALL NEWLINE
    MOV AH,09H
    LEA DX,STR_EXIT_TITLE2      ; PRINT TRANSACTION
    INT 21H

    MOV AH,02H
    MOV DX,TTL_NUM_ORDER
    ADD DX,"0"
    INT 21H

    CALL NEWLINE
    MOV AH,09H
    LEA DX,STR_EXIT_TITLE4      ; PRINT QTY
    INT 21H

    XOR AX,AX
    MOV AX,TTL_SUM_QTY
    XOR DX,DX
    MOV BX,100
    DIV BX

    PUSH DX                     ; STORE TEN

    CMP AX,0
    JE PRINT_TWO_DIGIT
    
    PRINT_THREE_DIGIT:
        MOV AH,02H
        MOV DX,AX
        ADD DL,"0"
        INT 21H

    PRINT_TWO_DIGIT:
        POP DX
        MOV AX,DX
        XOR DX,DX
        MOV BX,10
        DIV BX

        PUSH DX

        CMP AX,0
        JE PRINT_ONE_DIGIT

        MOV AH,02
        MOV DX,AX
        ADD DL,"0"
        INT 21H

    PRINT_ONE_DIGIT:
        POP DX

        MOV AH,02H
        ADD DL,"0"
        INT 21H

        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_EXIT_TITLE5      ; PRINT PRICE
        INT 21H
        PRINT_WHOLE_NUM TOTAL_WHOLE_NUM_SUM
        PRINT_FLOAT TOTAL_FLOATING_POINT_SUM
        CALL NEWLINE
        MOV AH,09H
        LEA DX,STR_EXIT_FORMAT2
        INT 21H
        LEA DX,STR_EXIT_FORMAT2
        INT 21H
        CALL PRESS_TO_CONTINUE
        RET
EXIT_PROGRAM_PROCESS ENDP

; USING FOR LOGIN MORE THAN 3 TIMES
FORCE_EXIT PROC
    CALL NEWLINE
    MOV AH,09H
    LEA DX,FORCE_LOCK_SYSTEM_STR1
    INT 21H

    MOV AH,09H  
    MOV BL,0004H
    MOV CX,13
    INT 10H

    MOV AH,09H
    LEA DX,FORCE_LOCK_SYSTEM_STR2
    INT 21H

    CALL PRESS_TO_CONTINUE
FORCE_EXIT ENDP

END_PROGRAM:
    MOV AX,4C00H
    INT 21H

END MAIN
