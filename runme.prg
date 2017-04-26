Local lcPath

lcPath = Addbs(Justpath(Sys(16,0)))
SET DEFAULT TO (m.lcPath)
Set Path To (m.lcPath)

SET PATH TO ADDBS((m.lcPath)+"classes") ADDITIVE 
SET PATH TO ADDBS((m.lcPath)+"images") ADDITIVE 
Set Classlib To ADDBS((m.lcPath)+"classes")+'_ssClasses'  

Set Talk Off
Set Echo Off

DECLARE INTEGER ShellExecute IN shell32.dll ; 
  INTEGER hndWin, ; 
  STRING cAction, ; 
  STRING cFileName, ; 
  STRING cParams, ;  
  STRING cDir, ; 
  INTEGER nShowWin
  
MESSAGEBOX('I do not create a main form with shortcut for each class.  '+;
'So after this, go to individual forms and run those!')

***********
Function GetDefaultPrinterAPI()
***********
Declare Integer GetDefaultPrinter In winspool.drv;
	STRING  @ pszBuffer,;
	INTEGER @ pcchBuffer

* returns default printer name (WinNT)
nBufsize = 250
cPrinter = Replicate(Chr(0), nBufsize)

= GetDefaultPrinter(@cPrinter, @nBufsize)
cPrinter = Substr(cPrinter, 1, At(Chr(0),cPrinter)-1)
Return(cPrinter)
Endfunc

********
Function ChangePrinterWinAPI(pszPrinter)
*******
Declare Integer SetDefaultPrinter In winspool.drv As apiSetDefaultPrinter ;
	String  pszPrinter
Return apiSetDefaultPrinter(m.pszPrinter)
ENDFUNC

***********
Function WAITABIT(lndelay)
***********
Declare Sleep In kernel32 Integer
dwmilliseconds = lndelay * 1000
Sleep(dwmilliseconds)
Clear Dlls 'SLEEP'
Return
Endfunc
