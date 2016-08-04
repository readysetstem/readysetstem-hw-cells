@echo off
set PROG="c:\Program Files (x86)\Atmel\Atmel Studio 6.2\atbackend\atprogram.exe"
set OPTS=-t avrispmk2 --clock 125khz -i isp -d attiny48
set FASTOPTS=-t avrispmk2 --clock 1000khz -i isp -d attiny48
set REL_ELF=src\LED_Matrix_ATINY48\Release\LED_Matrix_ATINY48.elf
set DBG_ELF=src\LED_Matrix_ATINY48\Debug\LED_Matrix_ATINY48.elf
echo ERASING
%PROG% %OPTS% chiperase
echo WRITING FUSES
%PROG% %OPTS% write -fs --values eedfff 
echo PROGRAMMING
%PROG% %FASTOPTS% program --verify -f %REL_ELF%
