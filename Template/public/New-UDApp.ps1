function New-UD<%=$PLASTER_PARAM_AppName%>App {
    [CmdletBinding()]
    Param()
    <#
    .SYNOPSIS
    Creates a new <%=$PLASTER_PARAM_AppName%> app.

    .DESCRIPTION
    Creates a new <%=$PLASTER_PARAM_AppName%> app for PowerShell Universal.
    #>

    try {
        # Get the module root from the module base
        $Module = Get-Module -Name '<%=$PLASTER_PARAM_ModuleName%>'
        if (-not $Module) {
            throw "<%=$PLASTER_PARAM_ModuleName%> module is not loaded"
        }
        
        $ModuleRoot = $Module.ModuleBase
        Write-Verbose "Module root: $ModuleRoot"
        
        # Load all page scripts
        $DashboardPath = Join-Path $ModuleRoot -ChildPath 'dashboards'
        $PagesPath = Join-Path $DashboardPath -ChildPath 'pages'
        
        if (Test-Path $PagesPath) {
            Write-Verbose "Loading pages from: $PagesPath"
            Get-ChildItem $PagesPath -Recurse -Filter *.ps1 | ForEach-Object {
                Write-Verbose "Loading page: $($_.FullName)"
                . $_.FullName
            }
        }

        # Execute the main app script and return the app
        $AppScript = Join-Path $DashboardPath 'App.ps1'
        Write-Verbose "Executing app script: $AppScript"
        
        if (-not (Test-Path $AppScript)) {
            throw "App script not found at: $AppScript"
        }
        
        & $AppScript
    }
    catch {
        Write-Error "Failed to create <%=$PLASTER_PARAM_AppName%> app: $_"
        throw
    }
}
