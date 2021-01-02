'Test word
'Read a text file and count the number of words of length 1, 2,
'3, and so on.  This program contains intentional bugs.  Use it
'in conjunction with the PowerBasic User's Guide to learn
'the PowerBasic integrated debugger.
'
MaxWordLen = 16    'count words up to a length of 16 characters
			    'longer words will go into Overlong
DIM WordLength(MaxWordLen)  'the array used to hold the counts
Blank$ = CHR$(32)           'a space marks the end of a word.

PRINT "Warning: This is a program intended for use in a practice"
PRINT "session of the PowerBasic debugger.  If you are not"
PRINT "running this program in the integrated debugging
PRINT "environment, press Ctrl-Break now.  See the debugging"
PRINT "chapter in the PowerBasic User's Guide for details."
PRINT

WHILE InFile$ = ""
  LINE INPUT "Enter the name of the input file: ";InFile$
  IF InFile$ <= STRING$(LEN(InFile$),32) THEN InFile$=""
  IF InFile$ = "" THEN BEEP:PRINT "You must enter a file name!"
WEND

OPEN "I",1,InFile$
'If the file can't be opened, the user will get an error message.

WHILE NOT(EOF(1))            'read the file until nothing is left
  LINE INPUT #1,FirstString$ 'get a line
  PRINT FirstString$         'display it
  WHILE FirstString$<>""
    GOSUB GetAWord           'pull a word for FirstString$ and
			     'put it in SecondString$
    Test = LEN(b$)
    IF Test <= 16 THEN
      WordLength(Test) = WordLength(Test) + 1
    ELSE
      Overlong = Overlong + 1
    END IF
  WEND
WEND

CLOSE 1

PRINT "Length Count"
FOR Count% = 1 TO 16
  PRINT Count%,WordLength(Count%)
NEXT Count%
PRINT "Greater";OverLong
END

GetAWord:
  position = INSTR(FirstString$,Blank$) 'a word is a sequence of
					'characters ended by a
					'blank or the end of the line
  IF position = 0 THEN
    'the word is the remainder of the line
    SecondString$ = FirstString$:FirstString$ = ""
  ELSE
    'pull the word from the line
    SecondString$ = LEFT$(FirstString$,position-1)
  END IF
RETURN