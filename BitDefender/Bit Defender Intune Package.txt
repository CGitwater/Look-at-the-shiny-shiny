Creating an Intune.win package for BitDefender

Requisites:

Orca
BitDefender.MSI
Intune Win AppUtill tool
GZ_Package_ID

Create a folder called Bitdefender.
Copy across the Bitdefender.msi

Open Orca.

Open the location of the Bitdefender\BitDefender.MSI  in Orca.
In the left hand, panel look for "Property"

Scroll down to GZ_Package_ID and place in the "TheLongAsFuckPackageID="
Click Save

Next Run the IntunewinappUtill.exe

It will prompt you for the source folder
Enter the file path for BitDefendernder folder you created 
Next enter Bitdefender.msi as set-up up file
Next it will ask you to specify the output folder (just use the same location as your BitDefender folder)
Next it will ask you catalogue the folder just click no

Congratulations you have just made a intune.win file

Now upload the file as a win32 app in endpoint manager

Set Install command as msiexec /i "BitDefender.msi" /qn
Set Uninstall Command as msiexec /x "{B08D6524-8772-4C0D-BE2D-94BFA5F3C6EA}" /qn

With Detection Rules:

Rule type: File

Path: C:\Program Files\Bitdefnder\Endpoint Security\
File or Folder: EPConsole.exe
Detection Method: String
Operator Equals or greater
Value: 7.7.1.216

Set assignments to all users and devices or any groups you may have set up 