       *> -------------------------------------------
       *> DECLARE TABLE for Patron
       *> -------------------------------------------
          EXEC SQL DECLARE Patron TABLE 
          ( PatronNumber          VARCHAR(3)
          , FirstName             VARCHAR(10)
          , LastName              VARCHAR(12)
          , StreetAddress         VARCHAR(20)
          , City                  VARCHAR(14)
          , State                 VARCHAR(2)
          , Zip                   VARCHAR(10)
          ) END-EXEC.
       *> -------------------------------------------
       *> COBOL HOST VARIABLES FOR TABLE Patron
       *> -------------------------------------------
       01  DCLPatron.
           03 Patron-PatronNumber             PIC X(3).
           03 Patron-FirstName                PIC X(10).
           03 Patron-LastName                 PIC X(12).
           03 Patron-StreetAddress            PIC X(20).
           03 Patron-City                     PIC X(14).
           03 Patron-State                    PIC X(2).
           03 Patron-Zip                      PIC X(10).
       *> -------------------------------------------
       *> COBOL INDICATOR VARIABLES FOR TABLE Patron
       *> -------------------------------------------
       01  DCLPatron-NULL.
           03 Patron-PatronNumber-NULL        PIC S9(04)  COMP-5.
           03 Patron-FirstName-NULL           PIC S9(04)  COMP-5.
           03 Patron-LastName-NULL            PIC S9(04)  COMP-5.
           03 Patron-StreetAddress-NULL       PIC S9(04)  COMP-5.
           03 Patron-City-NULL                PIC S9(04)  COMP-5.
           03 Patron-State-NULL               PIC S9(04)  COMP-5.
           03 Patron-Zip-NULL                 PIC S9(04)  COMP-5.
