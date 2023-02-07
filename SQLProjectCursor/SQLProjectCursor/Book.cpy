       *> -------------------------------------------
       *> DECLARE TABLE for Book
       *> -------------------------------------------
          EXEC SQL DECLARE Book TABLE 
          ( BookID                VARCHAR(4)
          , BookTitle             VARCHAR(25)
          , BookAuthor            VARCHAR(13)
          , BookPublisher         VARCHAR(11)
          , PublicationYear       VARCHAR(4)
          , PatronNumber          VARCHAR(3)
          , RemainingDays         VARCHAR(3)
          ) END-EXEC.
       *> -------------------------------------------
       *> COBOL HOST VARIABLES FOR TABLE Book
       *> -------------------------------------------
       01  DCLBook.
           03 Book-BookID                     PIC X(4).
           03 Book-BookTitle                  PIC X(25).
           03 Book-BookAuthor                 PIC X(13).
           03 Book-BookPublisher              PIC X(11).
           03 Book-PublicationYear            PIC X(4).
           03 Book-PatronNumber               PIC X(3).
           03 Book-RemainingDays              PIC X(3).
       *> -------------------------------------------
       *> COBOL INDICATOR VARIABLES FOR TABLE Book
       *> -------------------------------------------
       01  DCLBook-NULL.
           03 Book-BookID-NULL                PIC S9(04)  COMP-5.
           03 Book-BookTitle-NULL             PIC S9(04)  COMP-5.
           03 Book-BookAuthor-NULL            PIC S9(04)  COMP-5.
           03 Book-BookPublisher-NULL         PIC S9(04)  COMP-5.
           03 Book-PublicationYear-NULL       PIC S9(04)  COMP-5.
           03 Book-PatronNumber-NULL          PIC S9(04)  COMP-5.
           03 Book-RemainingDays-NULL         PIC S9(04)  COMP-5.
