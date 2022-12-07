# Create the needed folders if they do not already exist
$path = "<enter path you want to create>"
If(!(test-path $path))
{New-Item -ItemType Directory -Force -Path <path as above> | out-null}
$path2 = "<unzip path>"
If(!(test-path $path2))
{New-Item -ItemType Directory -Force -Path <driver unzip path> | out-null}

# Download the zip
$URI = "<enter URL of Printer Driver download>"
$out = "<Enter Output Path.zip>"

Invoke-WebRequest -uri $uri -OutFile $out


# Extract the zip
Expand-Archive -LiteralPath $out -destinationpath $path2 -force


# Add the driver to the store
C:\Windows\System32\pnputil.exe -i -a "<path of.inf>"


# Install the driver from the store
add-printerdriver -name "<printer Name>"


# Install the printer
$portName = "<Printer IP>"
$checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
if (-not $checkPortExists) {
Add-PrinterPort -name $portName -PrinterHostAddress "<printer IP>" 

}
Add-Printer -Name "<printer name>" -DriverName "<driver Names>" -PortName <printer IP>

# Download the zip
$URI = "<enter URL of Printer Driver download>"
$out = "<Enter Output Path.zip>"

Invoke-WebRequest -uri $uri -OutFile $out

# Extract the zip
Expand-Archive -LiteralPath $out -destinationpath $path2 -force

# Add the driver to the store
C:\Windows\System32\pnputil.exe -i -a "<path of the.inf>"

# Install the driver from the store
add-printerdriver -name "<Printer Name>"

# Install the printer
$portName = "<Printer IP>"
$checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
if (-not $checkPortExists) {
Add-PrinterPort -name $portName -PrinterHostAddress "<Printer IP>"
}

Add-Printer -Name "<Printer Name>" -DriverName "<Driver Name>" -PortName <Printer IP>