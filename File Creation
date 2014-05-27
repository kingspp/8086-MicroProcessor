;####################################
;# 8086 Program to Create a FILE    #
;#       Author: kingspp            #
;####################################

; For creation of file AX=3C00H
; CX=0000H
; INT 21H Interrupt is used
; Note: File Wont be created in Windows 7,8, when C drive is used. Permission and Stuff.
; Note: Fill will only be created if the path given contains the folder. Since Folder is not created.

; Declaration Part
.MODEL SMALL
.DATA
FILE DB 'C:\SPP.DOC',0      ; File Path (Note: Folders are not created, so always create a file inside existing folderor drive). 0 is used to append the file
MSG DB 'File created','$'  ; To display successful message when File is created
.CODE
START: MOV AX,@DATA
MOV DS,AX

;File Creation Part
MOV AL,00H                 ; For file creation, AX=3C00H and CX=0000H
MOV AH,3CH
LEA DX,FILE                ; Load the file path to DX
MOV CX,0000H               ; Create the File, AX=3C00H
INT 21H

;Display Part              
JC EXIT                    ; If carry Flag is Set, It means File is not Created
LEA DX,MSG                 ; Load the Success Message
MOV AH,09H
INT 21H

;Termination Part
EXIT:MOV AH,4CH            ; Terminate the Program
INT 21H
END START
