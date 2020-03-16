@echo off
cls
set s_error=
set d_error=
set k_input=
set hex_number=
set /A flagishe=0
IF -%1==- (set /P hex_number="Please, enter the hex number: " & set k_input=1)
if -%k_input%==-1 (call hex_to_quarter %hex_number% & goto end)

:BegLoop
IF -%1==- GOTO ExitLoop
set flag=0
for %%i in (0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,.) do (if %1==%%i set flag=1 & if %1==. set /A flagishe=%flagishe%+1)
if %flag%==1 set hex_number=%hex_number%%1 
if %flag%==0 (set s_error=1 & goto symbol_error)
SHIFT
GOTO BegLoop
:ExitLoop
if %flagishe% GTR 1 (set d_error=1 & goto dot_error)


echo %hex_number%

set hex_number=%hex_number:0=00 00%
set hex_number=%hex_number:1=00 01%
set hex_number=%hex_number:2=00 10%
set hex_number=%hex_number:3=00 11%
set hex_number=%hex_number:4=01 00%
set hex_number=%hex_number:5=01 01%
set hex_number=%hex_number:6=01 10%
set hex_number=%hex_number:7=01 11%
set hex_number=%hex_number:8=10 00%
set hex_number=%hex_number:9=10 01%
set hex_number=%hex_number:A=10 10%
set hex_number=%hex_number:B=10 11%
set hex_number=%hex_number:C=11 00%
set hex_number=%hex_number:D=11 01%
set hex_number=%hex_number:E=11 10%
set bin_number=%hex_number:F=11 11%
set bin_number=%bin_number:.=.%
echo %bin_number%

set bin_number=%bin_number:11=3%
set bin_number=%bin_number:10=2%
set bin_number=%bin_number:01=1%
set quarter_number=%bin_number:00=0%
echo %quarter_number%

:symbol_error
if -%s_error%==-1 echo You entered not acceptable symbols

:dot_error
if -%d_error%==-1 echo You entered too much dots

:end

