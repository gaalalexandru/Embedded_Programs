SET PATH=C:\Keil_v5\ARM\ARMCC\Bin;C:\Python27\;C:\Python27\Scripts;C:\ProgramData\Oracle\Java\javapath;C:\Tool\Common\Perl32\site\bin;C:\Tool\Common\Perl32\bin;C:\Tool\Common\Perl64\site\bin;C:\Tool\Common\Perl64\bin;C:\Program Files (x86)\Intel\iCLS Client\;C:\Program Files\Intel\iCLS Client\;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\IPT;c:\Tool\Common\CMake_2.8\bin;C:\Program Files\OpenVPN\bin;C:\Program Files (x86)\Skype\Phone\;C:\Program Files (x86)\Java\jre1.8.0_71\bin;C:\Program Files (x86)\Integrity\IntegrityClient10.5\bin;C:\Tool\Common\TDM-GCC-32\bin;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit\;C:\Program Files\Microsoft SQL Server\110\Tools\Binn\;C:\Program Files (x86)\Microsoft SDKs\TypeScript\1.0\;C:\Program Files\Microsoft SQL Server\120\Tools\Binn\;C:\Tool\Common\Git\cmd;C:\Program Files (x86)\Gource\cmd
SET CPU_TYPE=LM4F120H5QR
SET CPU_VENDOR=Texas Instruments
SET UV2_TARGET=WS2812B
SET CPU_CLOCK=0x007A1200
"C:\Keil_v5\ARM\ARMCC\Bin\ArmAsm" --Via ".\generated\startup._ia"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "GENERA~1\pll._ip"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\pll.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "GENERA~1\SSI_HA~1._IP"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\ssi_handler.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "GENERA~1\WS2812~1._IP"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\ws2812b_testmain.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "GENERA~1\UART_H~1._IP"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\uart_handler.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmLink" --Via ".\Generated\WS2812B_Test.lnp"
"C:\Keil_v5\ARM\ARMCC\Bin\fromelf.exe" ".\Generated\WS2812B_Test.axf" --i32combined --output ".\Generated\WS2812B_Test.hex"
