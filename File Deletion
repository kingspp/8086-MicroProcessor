;####################################
;# 8086 Program to Delete a FILE    #
;#       Author: kingspp            #
;####################################

; For deletion of file AH=41H
; INT 21H Interrupt is used
; Note: File Wont be deleted in Windows 7,8, when C drive is used. Permission and Stuff.
; Note: Fill will only be deleted if the path given contains the folder. Since Folder is not created.

; Declaration Part
.MODEL SMALL
.DATA
FILE DB 'C:\SPP.DOC',0     ; File Path (Note: Folders are not created, so always create a file inside existing folderor drive). 0 is used to append the file
MSG DB 'File Deleted','$'  ; To display successful message when File is deleted
.CODE
START: MOV AX,@DATA
MOV DS,AX

;File Deletion Part
LEA DX,FILE                ; Load the file path to DX
MOV AH,41H                 ; Delete the File, AH=41H
INT 21H

;Display Part              
JC EXIT                    ; If carry Flag is Set, It means File is not Deleted
LEA DX,MSG                 ; Load the Success Message
MOV AH,09H
INT 21H

;Termination Part
EXIT:MOV AH,4CH            ; Terminate the Program
INT 21H
END START
