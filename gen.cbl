       IDENTIFICATION DIVISION.
       PROGRAM-ID. GEN-DATA.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PRINT-LINE ASSIGN TO "output.dat".


       DATA DIVISION.
       FILE SECTION.
       FD PRINT-LINE RECORDING MODE F.
       01 PRINT-REC.
             05 ACCT-NAME PIC X(8).
             05 ACCT-HOURS PIC 9(8)V99.
             05 ACCT-RATE PIC 9(8)V99.
             05 ACCT-DEDUCT PIC 9(8)V99.
      
       WORKING-STORAGE SECTION.
       01 NAME PIC X(8).
       01 HOURS PIC 9(8) VALUE 0.
       01 RATE PIC 9(8) VALUE 0.
       01 DEDUCT PIC 9(8) VALUE 0.
       01 FLAGS.
             05 REC-AGAIN PIC X VALUE SPACE.


       PROCEDURE DIVISION.
       OPEN-FILES.
           OPEN OUTPUT PRINT-LINE.

       LOOP.
           PERFORM DO-WORK UNTIL REC-AGAIN IS EQUAL TO "n".

       CLOSE-STOP.
           CLOSE PRINT-LINE.
           STOP RUN.

       DO-WORK.
           DISPLAY "Name? " 
           ACCEPT ACCT-NAME
           DISPLAY "Hours? " 
           ACCEPT ACCT-HOURS
           DISPLAY "Rate? " 
           ACCEPT ACCT-RATE
           DISPLAY "Deduct? " 
           ACCEPT ACCT-DEDUCT
           WRITE PRINT-REC.
           DISPLAY "again?" 
           ACCEPT REC-AGAIN.
