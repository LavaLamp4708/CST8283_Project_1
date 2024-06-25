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
           SELECT EMPLOYEE-RECORD-FILE
           ASSIGN TO "EmployeeRecord.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD EMPLOYEE-RECORD-FILE.
       01 FS-EMPLOYEE-RECORD.
           05 FS-EMPLOYEE-ID PIC 9(6).
           05 FS-DEPARTMENT-CODE PIC 9(3).
           05 FS-LAST-NAME PIC X(20).
           05 FS-FIRST-NAME PIC X(20).
           05 FS-YEARS-OF-SERVICE PIC 9(2).

       WORKING-STORAGE SECTION.
       01 WS-EOF PIC 9(1) VALUE 0.                *> Indicator for End-Of-File.
       01 WS-CONT PIC A(3) VALUE SPACES.          *> To store the user's choice to continue or not.
       01 WS-DOUBLEQUOTE PIC X(1) VALUE '"'.      *> To store a double quote character.

       01 WS-EMPLOYEE-RECORD.
           05 WS-EMPLOYEE-ID PIC 9(6).
           05 WS-DEPARTMENT-CODE PIC 9(3).
           05 WS-LAST-NAME PIC X(20).
           05 WS-FIRST-NAME PIC X(20).
           05 WS-YEARS-OF-SERVICE PIC 9(2).

       PROCEDURE DIVISION.
       100-PROJECT-1.
           PERFORM 201-INITIATE-WRITE.
           PERFORM 202-ACCEPT-USER-INPUT-TO-FILE UNTIL WS-CONT="no ".   *> Loop to accept user input until the user types "no ".
           PERFORM 204-CLOSE-FILE.
           PERFORM 203-READ-FILE.
           PERFORM 204-CLOSE-FILE.
           STOP RUN.

       201-INITIATE-WRITE.
           PERFORM 301-OPEN-EMPLOYEE-RECORD.      *> Open the file for writing.

      *> Accept user input for all fields
       202-ACCEPT-USER-INPUT-TO-FILE.
           PERFORM 302-CLEAR-WS-RECORD.           *> Clear the working storage record.
           PERFORM 303-PROMPT-EMPLOYEE-ID.        *> Prompt for Employee ID.
           PERFORM 304-ACCEPT-EMPLOYEE-ID.        *> Accept Employee ID.
           PERFORM 305-PROMPT-DPT-CODE.           *> Prompt for Department Code.
           PERFORM 306-ACCEPT-DPT-CODE.           *> Accept Department Code.
           PERFORM 307-PROMPT-FIRST-NAME.         *> Prompt for First Name.
           PERFORM 308-ACCEPT-FIRST-NAME.         *> Accept First Name.
           PERFORM 309-PROMPT-LAST-NAME.          *> Prompt for Last Name.
           PERFORM 310-ACCEPT-LAST-NAME.          *> Accept Last Name.
           PERFORM 311-PROMPT-YOS.                *> Prompt for Years of Service.
           PERFORM 312-ACCEPT-YOS.                *> Accept Years of Service.
           PERFORM 313-WRITE-TO-FILE.             *> Write the record to the file.
           PERFORM 314-ASK-USER-TO-CONTINUE.      *> Ask user if they want to enter another record.
           PERFORM 315-ACCEPT-CONTINUE-MESSAGE.   *> Accept user's choice.

       203-READ-FILE.
           PERFORM 316-OPEN-READ-MODE.            *> Open the file for reading.
           PERFORM 317-READ-RECORD UNTIL WS-EOF=1.*> Read records until End-Of-File.

       204-CLOSE-FILE.
           PERFORM 319-CLOSE-FILE.                *> Close the file.

       301-OPEN-EMPLOYEE-RECORD.
           DISPLAY "Opening file...".
           OPEN OUTPUT EMPLOYEE-RECORD-FILE.      *> Open file in output mode.

       302-CLEAR-WS-RECORD.
           MOVE SPACES TO WS-EMPLOYEE-RECORD.     *> Clear the working storage record.

       303-PROMPT-EMPLOYEE-ID.
           DISPLAY "Enter employee ID: ".         *> Display prompt for Employee ID.

       304-ACCEPT-EMPLOYEE-ID.
           ACCEPT WS-EMPLOYEE-ID.                 *> Accept Employee ID.

       305-PROMPT-DPT-CODE.
           DISPLAY "Enter department code: ".     *> Display prompt for Department Code.

       306-ACCEPT-DPT-CODE.
           ACCEPT WS-DEPARTMENT-CODE.             *> Accept Department Code.

       307-PROMPT-FIRST-NAME.
           DISPLAY "Enter employee first name: ". *> Display prompt for First Name.

       308-ACCEPT-FIRST-NAME.
           ACCEPT WS-FIRST-NAME.                  *> Accept First Name.

       309-PROMPT-LAST-NAME.
           DISPLAY "Enter employee surname: ".    *> Display prompt for Last Name.

       310-ACCEPT-LAST-NAME.
           ACCEPT WS-LAST-NAME.                   *> Accept Last Name.

       311-PROMPT-YOS.
           DISPLAY "Enter years of service: ".    *> Display prompt for Years of Service.

       312-ACCEPT-YOS.
           ACCEPT WS-YEARS-OF-SERVICE.            *> Accept Years of Service.

       313-WRITE-TO-FILE.
           MOVE WS-EMPLOYEE-RECORD TO FS-EMPLOYEE-RECORD. *> Move working storage record to file record.
           WRITE FS-EMPLOYEE-RECORD.              *> Write record to file.

       314-ASK-USER-TO-CONTINUE.
           DISPLAY "Enter a new record? Type "
               WS-DOUBLEQUOTE "no" WS-DOUBLEQUOTE " to exit. ". *> Prompt user to continue or exit.

       315-ACCEPT-CONTINUE-MESSAGE.
           ACCEPT WS-CONT.                        *> Accept user's choice to continue or not.

       316-OPEN-READ-MODE.
           OPEN INPUT EMPLOYEE-RECORD-FILE.       *> Open file in input mode.
           MOVE SPACES TO FS-EMPLOYEE-RECORD.     *> Clear the file record.

       317-READ-RECORD.
           READ EMPLOYEE-RECORD-FILE
               AT END MOVE 1 TO WS-EOF            *> Set EOF flag if at end of file.
               NOT AT END
                   DISPLAY "Employee ID:       " FS-EMPLOYEE-ID
                   DISPLAY "Department code:   " FS-DEPARTMENT-CODE
                   DISPLAY "Last name:         " FS-LAST-NAME
                   DISPLAY "First name:        " FS-FIRST-NAME
                   DISPLAY "Years of service:  " FS-YEARS-OF-SERVICE
                   DISPLAY SPACES               *> Display the record fields.
           END-READ.

       319-CLOSE-FILE.
           CLOSE EMPLOYEE-RECORD-FILE.            *> Close the file.

       END PROGRAM PROJECT-1.
