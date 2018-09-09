@echo off
REM Append Username, date and time to results.txt
ECHO %USERNAME%, %DATE% %TIME%  >> results.txt
REM Begin simulated loop
:start
cls
echo Hi, %USERNAME%
echo This program implements mod by 0
echo Please enter two postive integers from 1 - 998. 
echo.
echo Enter 999 to EXIT
GOTO get1stNum
REM Ask for first number
:get1stNum
SET /P firstNumber=Please Enter an integer: 
ECHO.
ECHO Entered: = %firstNumber%
ECHO.
REM Set /A converts a string to a numerical value. Set /A does not support floating point
REM values so it will only assign integers.
SET /A testInput=firstNumber
REM if the assigned value equals the input from the user then the value entered was an integer.
if %testInput% EQU %firstNumber% (
    REM ECHO *Debug* Valid input received.
	REM If the user enters the value 999 for the first or the second number, exit the while loop immediately.
	IF %firstNumber% EQU 999 ( Exit ) 
	REM Error trapping for invalid entries of less than 0 or greater than 999
	IF %firstNumber% LSS 0 ( GOTO 1Invalid1 )
	IF %firstNumber% EQU 0 ( GOTO get2ndNumber )
	IF %firstNumber% GTR 999 ( GOTO 1Invalid2 )
	REM Only Valid Inegers should fall into this IF statement.
    IF %firstNumber% GTR 0 ( 
			IF %firstNumber% LSS 999 ( GOTO get2ndNumber ))
) ELSE (
    REM - User entered a decimal or a non integer character.
    ECHO !!!User entered a Non-Integer value!!!
	GOTO 1Invalid3
)			
REM User entered valid first number, ask for second number.
:get2ndNumber
SET /P secondNumber=Please enter the second integer: 
ECHO.
ECHO Second number entered: = %secondNumber%
ECHO.
SET /A test2Input=secondNumber
REM Set /A converts a string to a numerical value. Set /A does not support floating point
REM values so it will only assign integers.
if %test2Input% EQU %secondNumber% (
    REM ECHO *Debug* Valid input received.
	REM If the user enters the value 999 for the first or the second number, exit the while loop immediately.
	IF %secondNumber% EQU 999 ( Exit )
	REM Error trapping for invalid entries of less than 0 or greater than 999
	IF %secondNumber% LSS 0 ( GOTO 2Invalid1 )
	IF %secondNumber% EQU 0 ( GOTO 2Invalid1 )
	IF %secondNumber% GTR 999 ( GOTO 2Invalid2 )
	REM Only Valid Inegers should fall into this IF statement.
    IF %secondNumber% GTR 0 ( 
			IF %secondNumber% LSS 999 ( GOTO doMath ))
) ELSE (
    REM - User entered a decimal or a non integer character.
    ECHO !!!User entered a Non-Integer value!!!
	GOTO 2Invalid3
)

REM User entered a negative integer. Display error and ask for another first number
:1Invalid1
echo.
echo.
echo !!!!Invalid entry: %firstNumber% !!!!
echo.
echo Please enter a number that is 0 or greater.
echo.
echo.
pause
GOTO start

REM User entered an integer greater than 999. Display error and ask for another first number
:1Invalid2
echo.
echo.
echo !!!!Invalid entry: %firstNumber% !!!!
echo.
echo Please enter a number less than 999.
echo.
echo.
pause
GOTO start

REM User entered a non integer value. Display error and ask for another first number
:1Invalid3
echo.
echo.
echo !!!!Invalid entry: %firstNumber% !!!!
echo.
echo Please enter a number.
echo.
echo.
pause
GOTO start

REM User entered a negative or 0 valued integer. Display error and ask for another Second number
:2Invalid1
echo.
echo.
echo !!!!Invalid entry: %secondNumber% !!!!
echo.
echo Please enter a number greater than 0.
echo.
echo.
pause
GOTO get2ndNumber

REM User entered an integer greater than 999. Display error and ask for another Second number
:2Invalid2
echo.
echo.
echo !!!!Invalid entry: %secondNumber% !!!!
echo.
echo Please enter a number less than 999
echo.
echo.
pause
GOTO get2ndNumber

REM User entered a non integer value. Display error and ask for another Secobd number
:2Invalid3
echo.
echo.
echo !!!!Invalid entry: %secondNumber% !!!!
echo.
echo Please enter a number.
echo.
echo.
pause
GOTO get2ndNumber

REM User entered valid inputs. Do the operation.
:doMath
set /a result = %firstNumber% %% %secondNumber% 
REM display all numbers in this computation using labels and add them to the results.txt
ECHO First Number = %firstNumber% >> results.txt
ECHO Second Number = %secondNumber% >> results.txt
ECHO Operation = %firstNumber% %% %secondNumber%  >> results.txt
echo result = %result% >> results.txt
echo result = %result% 
pause
exit

