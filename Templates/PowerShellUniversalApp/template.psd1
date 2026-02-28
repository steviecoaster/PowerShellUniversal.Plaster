@{
    # Script module or binary module file associated with this manifest.
    RootModule        = '<%=$PLASTER_PARAM_ModuleName%>.psm1'

    # Version number of this module.
    ModuleVersion     = '<%=$PLASTER_PARAM_Version%>'

    # ID used to uniquely identify this module
    GUID              = '<%=$PLASTER_GUID1%>'

    # Author of this module
    Author            = '<%=$PLASTER_PARAM_Author%>'

    # Company or vendor of this module
    CompanyName       = 'Unknown'

    # Copyright statement for this module
    Copyright         = '(c) <%=$PLASTER_Year%> <%=$PLASTER_PARAM_Author%>. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = '<%=$PLASTER_PARAM_Description%>'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Functions to export from this module
    FunctionsToExport = @('New-UD<%=$PLASTER_PARAM_AppName%>App')

    # Cmdlets to export from this module
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module
    AliasesToExport   = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess
    PrivateData       = @{
        PSData = @{
            # Tags applied to this module
            Tags = @('PowerShellUniversal')

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''
        }
    }
}