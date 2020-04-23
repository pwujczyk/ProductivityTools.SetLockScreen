<#
	My Function
#>
function Set-LockScreen{

	[cmdletbinding()]
	param(
		[string]$ImagePath
	)
	Write-Verbose "Hello from SetLockScreen"
	Write-Verbose "Image path provided by user: $ImagePath"
	
	if((Get-Item $ImagePath) -is [System.IO.DirectoryInfo])
	{
		throw "Only files"
	}

	if ($(Test-IfAdmin) -eq $false) {
		throw "You are not admin, but you would like to make change to regedit and System32. Please run Powershell as Administrator"
	}

	#https://docs.microsoft.com/en-us/windows/client-management/mdm/personalization-csp
	$PersonalizationCSPRegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"
	$LockScreenImagePath= "C:\Windows\System32\LockScreen.jpg"

	Write-Verbose "Personalization key: $PersonalizationCSPRegKeyPath"
	Write-Verbose "Windows LockScreen source image path: $LockScreenImagePath"
	
	Write-Verbose "Copy provided image to the Windows LockScreen source image path"
	Write-Verbose "$ImagePath=>$LockScreenImagePath"

    Copy-Item $ImagePath $LockScreenImagePath -Force

	if(Test-Path $PersonalizationCSPRegKeyPath) 
	{
		Write-Verbose "$PersonalizationCSPRegKeyPath already exists"
	}
	else
	{
        Write-Verbose "$PersonalizationCSPRegKeyPath doesn't exist - creating"
        New-Item -Path $PersonalizationCSPRegKeyPath -Force | Out-Null
	}

	Write-Verbose "Creating LockScreenImageStatus property in $PersonalizationCSPRegKeyPath registry key"
    New-ItemProperty -Path $PersonalizationCSPRegKeyPath -Name "LockScreenImageStatus" -Value 1 -PropertyType DWORD -Force | Out-Null
	Write-Verbose "Creating LockScreenImagePath property in  $PersonalizationCSPRegKeyPath registry key"
    New-ItemProperty -Path $PersonalizationCSPRegKeyPath -Name "LockScreenImagePath" -Value $LockScreenImagePath -PropertyType STRING -Force | Out-Null
	Write-Verbose "Creating LockScreenImageUrl property in  $PersonalizationCSPRegKeyPath registry key"
    New-ItemProperty -Path $PersonalizationCSPRegKeyPath -Name "LockScreenImageUrl" -Value $LockScreenImagePath -PropertyType STRING -Force | Out-Null

	Write-Verbose "Set-LockScreen bye bye!"
}