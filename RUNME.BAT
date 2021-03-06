ECHO OFF
CLS
IF NOT %1.==. GOTO Main
WHAT E
IF ERRORLEVEL 15 GOTO ChkDOS
ECHO  
ECHO You have insufficient environment space to run this batch file.
ECHO See Chapter 12 of the CodeView and Utilities manual for information
ECHO on SETENV and other methods of changing the environment size.
GOTO Quit
:ChkDOS
WHAT D
IF ERRORLEVEL 31 GOTO Continue
IF NOT ERRORLEVEL 30 GOTO Continue
ECHO Because of an incompatibility between DOS 3.0 and the batch file 
ECHO enhancer on this disk, you will not be able to run the setup and 
ECHO demo batch files. You can still use MASM and CodeView. Follow 
ECHO the setup instructions in Chapter 1 of the Programmer's Guide. 
ECHO The batch files work with other version of DOS. 
GOTO Quit
:Continue
WHAT YE
IF %WHAT%==A SET DISK=1
:Main
CLS
IF EXIST README.DOC GOTO DiskOK
WHAT CE "Insert disk 1 (Assembler) in drive A and press any key when ready. "
IF EXIST README.DOC GOTO DiskOK
A:
SET DISK=1
RUNME
:DiskOK
CLS
ECHO Main Menu - MASM 5.0
ECHO  
ECHO 1. Set up assembler files
ECHO 2. Examine README.DOC
ECHO 3. Check PACKING.LST
ECHO 4. View CodeView demonstration
ECHO 5. Quit
ECHO  
WHAT C "Select: " 12345SECVQ
CLS
IF %WHAT%==1 GOTO SetUp
IF %WHAT%==2 GOTO ReadMe
IF %WHAT%==3 GOTO PackLst
IF %WHAT%==4 GOTO Demo
IF %WHAT%==5 GOTO Quit
IF %WHAT%==S GOTO SetUp
IF %WHAT%==E GOTO ReadMe
IF %WHAT%==C GOTO PackLst
IF %WHAT%==V GOTO Demo
IF %WHAT%==Q GOTO Quit
:SetUp
SETUP R
GOTO Main
:ReadMe
SHOW README.DOC
CLS
GOTO Main
:PackLst
SHOW PACKING.LST
CLS
GOTO Main
:Demo
IF %HARD%.==H. GOTO HardDisk
IF %HARD%.==F. GOTO Floppy
WHAT C "Do you have a hard disk? (Y/n) " ~YN
ECHO  
IF %WHAT%==N GOTO Floppy
SET HARD=H
ECHO  
ECHO You may wish to install the assembler files first and run the
ECHO demo from your hard disk. 
ECHO  
ECHO Demo Menu
ECHO  
ECHO 1. Run now demo from removable disk
ECHO 2. View demo now from hard disk (already installed)
ECHO 3. Cancel now and retry after installation
ECHO  
WHAT C "Select: " 123RVC
CLS
IF %WHAT%==1 GOTO Floppy
IF %WHAT%==R GOTO Floppy
IF %WHAT%==3 GOTO Main
IF %WHAT%==C GOTO Main
:HardDisk
IF EXIST DEMO.BAT DEMO R
:GetDisk
ECHO  
ECHO  
WHAT C "Type drive letter where demo files are located: "
SET CDRIVE=%WHAT%
%CDRIVE%:
ECHO  
ECHO  
WHAT S "Enter directory specification (ENTER for current): "
IF %WHAT%.==. GOTO Current
SET ADIR=%WHAT%
:Current
CD %ADIR%
IF NOT EXIST DEMO.BAT GOTO NoDemo
DEMO R
CLS
GOTO Main
:NoDemo
ECHO DEMO.BAT not found. 
WHAT C "Try again? (Y/n) " ~YN
CLS
IF %WHAT%==N GOTO Main
GOTO GetDisk
:Floppy
SET HARD=F
CLS
IF NOT %DISK%==1 DEMO A
WHAT CE "Insert disk 2 (CodeView) in drive A and press any key when ready. "
IF NOT EXIST A:\CV.HLP GOTO Floppy
SET DISK=2
DEMO A
:Quit
SET DOS=
SET YN=
SET FILE=
SET WHAT=
SET DISK=
SET ENV=
SET EDIR=
SET IDIR=
SET LDIR=
SET ADIR=
SET CDIR=
SET SDIR=
SET HARD=
SET CDRIVE=
SET TDRIVE=

