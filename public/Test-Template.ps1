function Test-Template {
    [CmdletBinding()]
    Param()

    end {
        # Ensure Plaster is installed
        if (-not (Get-Module -Name Plaster -ListAvailable)) {
            Write-Warning "Plaster module is not installed. Installing..."
            Install-Module -Name Plaster -Scope CurrentUser -Force
        }

        # Test parameters
        $TestParams = @{
            TemplatePath    = "$PSScriptRoot"
            DestinationPath = "$PSScriptRoot\test-output"
            ModuleName      = "PowerShellUniversal.Apps.TestApp"
            AppName         = "TestApp"
            Description     = "A test PowerShell Universal Dashboard Application"
            Author          = "Test User"
            Version         = "1.0.0"
            Authentication  = "Yes"
            IncludePages    = "Yes"
        }

        # Clean up previous test if it exists
        if (Test-Path $TestParams.DestinationPath) {
            Write-Host "Removing previous test output..." -ForegroundColor Yellow
            Remove-Item -Path $TestParams.DestinationPath -Recurse -Force
        }

        # Create the module from template
        Write-Host "`nCreating test module from Plaster template..." -ForegroundColor Cyan
        Invoke-Plaster @TestParams

        # Display results
        Write-Host "`nTest module created successfully!" -ForegroundColor Green
        Write-Host "`nGenerated structure:" -ForegroundColor Cyan
        Get-ChildItem -Path "$($TestParams.DestinationPath)\$($TestParams.ModuleName)" -Recurse | 
        Select-Object -ExpandProperty FullName | 
        ForEach-Object { $_.Replace("$($TestParams.DestinationPath)\$($TestParams.ModuleName)", "") }

        Write-Host "`nTo view the generated files:" -ForegroundColor Yellow
        Write-Host "  cd '$($TestParams.DestinationPath)\$($TestParams.ModuleName)'" -ForegroundColor White

        Write-Host "`nTo import the module:" -ForegroundColor Yellow
        Write-Host "  Import-Module '$($TestParams.DestinationPath)\$($TestParams.ModuleName)\$($TestParams.ModuleName).psd1'" -ForegroundColor White
    }

}


