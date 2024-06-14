      ******************************************************************
      * Author: Peter Stainforth
      * Student ID: 041121409
      * Course: CST8283
      * Section: 301
      * Date: 2024-06-12
      * Purpose: Project 1
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJECT-1.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-RECORD
           ASSIGN TO "EmployeeRecord.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD EMPLOYEE-RECORD.
       01 FS-EMPLOYEE-RECORD.
           05 FS-EMPLOYEE-ID PIC 9(6).
           05 FS-DEPARTMENT-CODE PIC 9(3).
           05 FS-LAST-NAME PIC X(20).
           05 FS-FIRST-NAME PIC X(20).
           05 FS-YEARS-OF-SERVICE PIC 9(2).

       WORKING-STORAGE SECTION.

       01 WS-EOF PIC A(3).
       01 WS-DOUBLEQUOTE PIC X(1) VALUE '"'.

       01 WS-EMPLOYEE-RECORD.
           05 WS-EMPLOYEE-ID PIC 9(6).
           05 WS-DEPARTMENT-CODE PIC 9(3).
           05 WS-LAST-NAME PIC X(20).
           05 WS-FIRST-NAME PIC X(20).
           05 WS-YEARS-OF-SERVICE PIC 9(2).

       PROCEDURE DIVISION.
       100-PROJECT-1.
           PERFORM 201-INITIATE-WRITE.
           PERFORM 202-ACCEPT-USER-INPUT-TO-FILE UNTIL WS-EOF="no ".
           PERFORM 203-TERMINATE-AND-CLOSE-FILE.
           STOP RUN.
       201-INITIATE-WRITE.
           PERFORM 301-OPEN-EMPLOYEE-RECORD.
      * accept user input for all fields
       202-ACCEPT-USER-INPUT-TO-FILE.
           PERFORM 302-CLEAR-WS-RECORD.
           PERFORM 303-PROMPT-EMPLOYEE-ID.
           PERFORM 304-ACCEPT-EMPLOYEE-ID.
           PERFORM 305-PROMPT-DPT-CODE.
           PERFORM 306-ACCEPT-DPT-CODE.
           PERFORM 307-PROMPT-FIRST-NAME.
           PERFORM 308-ACCEPT-FIRST-NAME.
           PERFORM 309-PROMPT-LAST-NAME.
           PERFORM 310-ACCEPT-LAST-NAME.
           PERFORM 311-PROMPT-YOS.
           PERFORM 312-ACCEPT-YOS.
           PERFORM 313-WRITE-TO-FILE.
           PERFORM 314-ASK-USER-TO-CONTINUE.
           PERFORM 315-ACCEPT-CONTINUE-MESSAGE.
       203-TERMINATE-AND-CLOSE-FILE.
           PERFORM 316-CLOSE-FILE.

       301-OPEN-EMPLOYEE-RECORD.
           OPEN OUTPUT EMPLOYEE-RECORD.
       302-CLEAR-WS-RECORD.
           MOVE SPACES TO WS-EMPLOYEE-RECORD.
       303-PROMPT-EMPLOYEE-ID.
           DISPLAY "Enter employee ID: "
               WITH NO ADVANCING.
       304-ACCEPT-EMPLOYEE-ID.
           ACCEPT WS-EMPLOYEE-ID.
       305-PROMPT-DPT-CODE.
           DISPLAY "Enter department code: "
               WITH NO ADVANCING.
       306-ACCEPT-DPT-CODE.
           ACCEPT WS-DEPARTMENT-CODE.
       307-PROMPT-FIRST-NAME.
           DISPLAY "Enter employee first name: "
               WITH NO ADVANCING.
       308-ACCEPT-FIRST-NAME.
           ACCEPT WS-FIRST-NAME.
       309-PROMPT-LAST-NAME.
           DISPLAY "Enter employee surname: "
               WITH NO ADVANCING.
       310-ACCEPT-LAST-NAME.
           ACCEPT WS-LAST-NAME.
       311-PROMPT-YOS.
           DISPLAY "Enter years of service: "
               WITH NO ADVANCING.
       312-ACCEPT-YOS.
           ACCEPT WS-YEARS-OF-SERVICE.
       313-WRITE-TO-FILE.
           MOVE WS-EMPLOYEE-RECORD TO FS-EMPLOYEE-RECORD.
           WRITE FS-EMPLOYEE-RECORD.
       314-ASK-USER-TO-CONTINUE.
           DISPLAY "Enter a new record? Type "
               WS-DOUBLEQUOTE "no" WS-DOUBLEQUOTE " to exit. "
               WITH NO ADVANCING.
       315-ACCEPT-CONTINUE-MESSAGE.
           ACCEPT WS-EOF.

       316-CLOSE-FILE.
           CLOSE EMPLOYEE-RECORD.
       END PROGRAM PROJECT-1.
