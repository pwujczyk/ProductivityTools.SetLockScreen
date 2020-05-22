<!--Category:Powershell--> 
 <p align="right">
    <a href="https://www.powershellgallery.com/packages/ProductivityTools.PSSetLockScreen/"><img src="Images/Header/Powershell_border_40px.png" /></a>
    <a href="http://www.productivitytools.tech/sql-commands/"><img src="Images/Header/ProductivityTools_green_40px_2.png" /><a> 
    <a href="https://www.github.com/pwujczyk/ProductivityTools.PSSetLockScreen"><img src="Images/Header/Github_border_40px.png" /></a>
</p>
<p align="center">
    <a href="http://productivitytools.tech/">
        <img src="Images/Header/LogoTitle_green_500px.png" />
    </a>
</p>

# Set-LockScreen

Module sets lock screen to chosen image. It also allows to change Lock screen if setting is managed by your company.

<!--more-->
<!--og-image-->
![Lock screen](Images/LockScreen.png)

```powershell
Set-LockScreen -ImagePath D:\OneDrive\InitPC\JustDoThings.png -Verbose
```
![Lock screen](Images/Powershell.png)

To install module use 

```powershell
Install-Module -Name ProductivityTools.PSSetLockScreen
```

Script adds new node to regedit **PersonalizationCSP** which contains information where to found image displayed on lock screen.

![Lock screen](Images/Regedit.png)

Script copy chosen image to **C:\Windows\System32** path.

Both actions required administrator permissions so you need to run PowerShell as administrator. 

### Dependencies:

Module depends on **ProductivityTools.PSTestIfAdmin**, which is installed automatically after invoking above command. 