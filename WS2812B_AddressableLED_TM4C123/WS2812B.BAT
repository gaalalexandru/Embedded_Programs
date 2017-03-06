SET PATH=F:\0_Tools\Keil_v5\ARM\ARMCC\Bin;C:\Program Files (x86)\Intel\iCLS Client\;C:\Program Files\Intel\iCLS Client\;C:\Program Files\Broadcom\Broadcom 802.11 Network Adapter\Driver;;;;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files (x86)\Skype\Phone\
SET CPU_TYPE=LM4F120H5QR
SET CPU_VENDOR=Texas Instruments
SET UV2_TARGET=WS2812B
SET CPU_CLOCK=0x007A1200
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmAsm" --Via ".\generated\startup._ia"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\pll._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\pll.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\ssi_handler._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\ssi_handler.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\ws2812b_testmain._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\ws2812b_testmain.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\uart_handler._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\uart_handler.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmLink" --Via ".\Generated\WS2812B_Test.lnp"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\fromelf.exe" ".\Generated\WS2812B_Test.axf" --i32combined --output ".\Generated\WS2812B_Test.hex"
