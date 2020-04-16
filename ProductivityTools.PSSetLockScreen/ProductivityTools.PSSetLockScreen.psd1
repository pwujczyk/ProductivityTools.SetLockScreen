#
# Module manifest for module 'module'
#
# Generated by: pwujczyk
#
# Generated on: 4/15/2020 12:17:16 AM
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'ProductivityTools.PSSetLockScreen.psm1'

# Version number of this module.
ModuleVersion = '0.0.1'

# ID used to uniquely identify this module
GUID = 'f5ee4edf-d7a1-4d00-aad5-59e852a3a4cb'

# Author of this module
Author = 'Pawel Wujczyk'

# Description of the functionality provided by this module
Description = 'Module allows to set lock screen from powershell to your custom image'

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @('ProductivityTools.PSTestIfAdmin')

# Functions to export from this module
FunctionsToExport = 'Set-LockScreen'

# Private data to pass to the module specified in RootModule/ModuleToProcess
PrivateData = @{
    
    PSData = @{
        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('lockscreen','lock', "screen", "loginscreen", "login")
    
        # A URL to the main website for this project.
        ProjectUri = ''
    
            } # End of PSData hashtable
    } # End of PrivateData hashtable   

# HelpInfo URI of this module
# HelpInfoURI = ''
}

