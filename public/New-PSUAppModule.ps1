function New-PSUAppModule {
    <#
    .SYNOPSIS
    Creates a new PowerShell Universal App module using the Plaster template.

    .DESCRIPTION
    This function is a wrapper around Invoke-Plaster that uses the PowerShell Universal App
    template to create a new module structure for a PowerShell Universal dashboard application.

    .PARAMETER DestinationPath
    The path where the new app module should be created.

    .PARAMETER ModuleName
    The full name for the app module (e.g., PowerShellUniversal.Apps.MyApp).

    .PARAMETER AppName
    The friendly app name (e.g., MyApp).

    .PARAMETER Description
    A brief description for this app.

    .PARAMETER Author
    The author name for the module.

    .PARAMETER Version
    The version number for the module. Default is '1.0.0'.

    .PARAMETER Authentication
    Whether the app requires authentication. Valid values are 'Yes' or 'No'.

    .PARAMETER Environment
    The PowerShell environment to use. Valid values are 'PowerShell 7', 'Integrated', or 'Windows PowerShell'.

    .PARAMETER IncludePages
    Whether to include sample page templates. Valid values are 'Yes' or 'No'.

    .EXAMPLE
    New-PSUAppModule -DestinationPath C:\PSUApps

    Creates a new PSU app module and prompts for all parameters interactively.

    .EXAMPLE
    New-PSUAppModule -DestinationPath C:\PSUApps -ModuleName 'PowerShellUniversal.Apps.Dashboard' -AppName 'Dashboard'

    Creates a new PSU app module with specified name and default settings.

    .EXAMPLE
    New-PSUAppModule -DestinationPath . -ModuleName 'PowerShellUniversal.Apps.MyApp' -AppName 'MyApp' -Authentication Yes -Environment 'PowerShell 7' -IncludePages Yes

    Creates a new PSU app module with all parameters specified (no prompts).

    .NOTES
    This function requires the Plaster module to be installed.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string]$DestinationPath,

        [Parameter()]
        [string]$ModuleName,

        [Parameter()]
        [string]$AppName,

        [Parameter()]
        [string]$Description,

        [Parameter()]
        [string]$Author,

        [Parameter()]
        [string]$Version,

        [Parameter()]
        [ValidateSet('Yes', 'No')]
        [string]$Authentication,

        [Parameter()]
        [ValidateSet('PowerShell 7', 'Integrated', 'Windows PowerShell')]
        [string]$Environment,

        [Parameter()]
        [ValidateSet('Yes', 'No')]
        [string]$IncludePages
    )

    begin {
        # Check if Plaster is available
        if (-not (Get-Module -Name Plaster -ListAvailable)) {
            throw "Plaster module is required but not installed. Install it with: Install-Module -Name Plaster"
        }

        # Get the template path (assumes it's in the module directory)
        $TemplatePath = Join-Path (Split-Path -Parent $PSScriptRoot) 'Template'
        
        if (-not (Test-Path (Join-Path $TemplatePath 'plasterManifest.xml'))) {
            throw "Plaster manifest not found at: $TemplatePath"
        }
    }

    process {
        $plasterParams = @{
            TemplatePath    = $TemplatePath
            DestinationPath = $DestinationPath
        }

        # Only add parameters that were explicitly provided
        # If not provided, Plaster will prompt for them
        if ($PSBoundParameters.ContainsKey('ModuleName')) {
            $plasterParams['ModuleName'] = $ModuleName
        }
        if ($PSBoundParameters.ContainsKey('AppName')) {
            $plasterParams['AppName'] = $AppName
        }
        if ($PSBoundParameters.ContainsKey('Description')) {
            $plasterParams['Description'] = $Description
        }
        if ($PSBoundParameters.ContainsKey('Author')) {
            $plasterParams['Author'] = $Author
        }
        if ($PSBoundParameters.ContainsKey('Version')) {
            $plasterParams['Version'] = $Version
        }
        if ($PSBoundParameters.ContainsKey('Authentication')) {
            $plasterParams['Authentication'] = $Authentication
        }
        if ($PSBoundParameters.ContainsKey('Environment')) {
            $plasterParams['Environment'] = $Environment
        }
        if ($PSBoundParameters.ContainsKey('IncludePages')) {
            $plasterParams['IncludePages'] = $IncludePages
        }

        if ($PSCmdlet.ShouldProcess($DestinationPath, "Create new PSU App Module")) {
            Invoke-Plaster @plasterParams
        }
    }
}
