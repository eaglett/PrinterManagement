Start-Process powershell -Verb runAs
$Printers = Get-Printer
for($i = 0; $i -lt $Printers.length; $i++){
    if(($Printers[$i] | Select-Object -ExpandProperty 'PortName' ) -eq 'IP_192.168.1.109') {
        $Name = $Printers[$i] | Select-Object -ExpandProperty "Name"
        Rename-Printer -Name $Name -NewName "Develop ineo+ 458 PCL - 2 Sal"
    } else {
        if (($Printers[$i] | Select-Object -ExpandProperty 'PortName' ) -eq 'IP_192.168.1.110') {
        $Name = $Printers[$i] | Select-Object -ExpandProperty "Name"
        Rename-Printer -Name $Name -NewName "Develop ineo+ 458 PCL - Stuen"
        }
    }
}

stop-process -Id $PID