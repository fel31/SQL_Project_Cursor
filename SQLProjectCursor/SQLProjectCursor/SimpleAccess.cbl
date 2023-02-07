       WORKING-STORAGE SECTION. 
       
       EXEC SQL INCLUDE SQLCA END-EXEC. 
       
       01 MFSQLMESSAGETEXT  PIC X(250).  
       
       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
         EXEC SQL INCLUDE Book END-EXEC.
         EXEC SQL INCLUDE Patron END-EXEC.        
       EXEC SQL END DECLARE SECTION END-EXEC.
       
       EXEC SQL 
             DECLARE CSR3 CURSOR FOR SELECT 
                   A.BookTitle
                  ,A.BookAuthor
                  ,A.PatronNumber
                  ,B.FirstName
                  ,B.LastName
             FROM  Book A
                  ,Patron B
             WHERE (A.PatronNumber = B.PatronNumber)
             ORDER BY A.BookAuthor
       END-EXEC. 
         
       PROCEDURE DIVISION.
       RUN-START.
           EXEC SQL 
               WHENEVER SQLERROR perform OpenESQL-Error 
           END-EXEC
           PERFORM CONNECT-TO-DATABASE
           PERFORM OPEN-CURSOR
           PERFORM FETCH-DATA
           PERFORM SHUT-DOWN
           .           
       CONNECT-TO-DATABASE.    
           EXEC SQL 
               CONNECT TO 'Library' 
           END-EXEC
           .
       OPEN-CURSOR.
           EXEC SQL 
               OPEN CSR3
           END-EXEC 
           .
       FETCH-DATA.    
           PERFORM UNTIL SQLSTATE >= "02000" 
               EXEC SQL 
                   FETCH CSR3  INTO 
                       :Book-BookTitle:Book-BookTitle-NULL
                      ,:Book-BookAuthor:Book-BookAuthor-NULL
                      ,:Book-PatronNumber:Book-PatronNumber-NULL
                      ,:Patron-FirstName:Patron-FirstName-NULL
                      ,:Patron-LastName:Patron-LastName-NULL
               END-EXEC 
               IF SQLSTATE < "02000" 
                   display Book-BookTitle ' ' 
                           Book-BookAuthor ' ' 
                           Book-PatronNumber ' '
                           Patron-FirstName ' '
                           Patron-LastName
               END-IF 
           END-PERFORM 
           .
       SHUT-DOWN.    
           EXEC SQL 
               CLOSE CSR3
           END-EXEC      
           EXEC SQL DISCONNECT CURRENT END-EXEC 
           Display ' '
           Stop 'Press <CR> to terminate'
           STOP RUN
           .
       OpenESQL-Error Section.
       
           display "SQL Error = " sqlstate " " sqlcode 
           display MFSQLMESSAGETEXT 
           stop run
           .
       
       
