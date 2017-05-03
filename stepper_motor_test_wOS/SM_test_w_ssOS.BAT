SET PATH=F:\0_Tools\Keil_v5\ARM\ARMCC\Bin;C:\Program Files (x86)\Intel\iCLS Client\;C:\Program Files\Intel\iCLS Client\;C:\Program Files\Broadcom\Broadcom 802.11 Network Adapter\Driver;;;;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files (x86)\Skype\Phone\;C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\IPT
SET CPU_TYPE=TM4C123GH6PM
SET CPU_VENDOR=Texas Instruments
SET UV2_TARGET=ssOS
SET CPU_CLOCK=0x00B71B00
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\listings\os_core._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\objects\os_core.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmAsm" --Via ".\generated\objects\osasm._ia"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\listings\os_hw._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\objects\os_hw.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\listings\main._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\objects\main.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\listings\profile._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\objects\profile.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\listings\bsp_tm4c._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\objects\bsp_tm4c.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmAsm" --Via ".\generated\objects\startup_tm4c123._ia"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via "generated\listings\system_tm4c123._ip"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\generated\objects\system_tm4c123.__i"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\ArmLink" --Via ".\generated\Objects\ssOS.lnp"
"F:\0_Tools\Keil_v5\ARM\ARMCC\Bin\fromelf.exe" ".\generated\Objects\ssOS.axf" --i32combined --output ".\generated\Objects\ssOS.hex"
