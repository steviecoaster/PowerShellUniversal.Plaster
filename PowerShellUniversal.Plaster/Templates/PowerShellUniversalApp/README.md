# PowerShell Universal App Plaster Template

This repository contains a Plaster template for creating PowerShell Universal App modules with a standardized structure.

## Prerequisites

- PowerShell 5.1 or higher
- Plaster module

Install Plaster if you haven't already:

```powershell
Install-Module -Name Plaster -Scope CurrentUser
```

## Usage

### Create a New App Module

Navigate to the directory where you want to create your new app module and run:

```powershell
Invoke-Plaster -TemplatePath "C:\Users\stephen\Documents\Git\PowerShellUniversal.Plaster" -DestinationPath .
```

You'll be prompted for:
- **ModuleName**: The full module name (e.g., `PowerShellUniversal.Apps.MyApp`)
- **AppName**: A friendly name for your app (e.g., `MyApp`)
- **Description**: A brief description of your app
- **Author**: Your name
- **Version**: Module version (default: 1.0.0)
- **Authentication**: Whether the app requires authentication
- **IncludePages**: Whether to include sample page templates

### Example

```powershell
PS> Invoke-Plaster -TemplatePath ".\PowerShellUniversal.Plaster" -DestinationPath "C:\MyApps"

# You'll be prompted:
# ModuleName: PowerShellUniversal.Apps.MyDashboard
# AppName: MyDashboard
# Description: A custom dashboard for monitoring
# Author: John Doe
# Version: 1.0.0
# Authentication: Yes
# IncludePages: Yes
```

## Template Structure

The template creates the following structure:

```
PowerShellUniversal.Apps.YourApp/
├── PowerShellUniversal.Apps.YourApp.psd1   # Module manifest
├── PowerShellUniversal.Apps.YourApp.psm1   # Module script
├── README.md                                # Documentation
├── .universal/
│   └── dashboards.ps1                       # PowerShell Universal app registration
├── dashboards/
│   ├── App.ps1                              # Main dashboard file
│   └── pages/                               # Dashboard pages
│       └── homepage.ps1                     # Sample homepage (if included)
├── private/                                 # Private functions
│   └── .gitkeep
└── public/                                  # Public functions
    ├── .gitkeep
    └── New-UDYourAppApp.ps1                 # App creation command
```

## Module Development

Once you have created the base structure from your template you need only do the following:

1. Add public functions to the public folder in their respecitive .ps1 file(s). 
2. Add private functions to the private folder in their respective .ps1 file(s).
3. For public functions, ensure they are adding to the `FunctionsToExport` array inside your `.psd1` file
4. Add any additional pages to the `pages` folder. Added pages will automatically be picked up by the dashboard upon update.

## Customizing the Template

To modify the template:

1. Edit `plasterManifest.xml` to add/remove parameters or content
2. Modify template files in the root directory:
   - `template.psd1` - Module manifest template
   - `template.psm1` - Module script template
   - `.universal/dashboards.ps1` - App registration template
   - `public/New-UDApp.ps1` - App command function template
   - `dashboards/App.ps1` - Dashboard template
   - `dashboards/pages/homepage.ps1` - Sample page template
   - `README.md` - Documentation template

## Testing the Template

```powershell
# Test the template
Test-PlasterManifest -Path ".\PowerShellUniversal.Plaster"

# Create a test instance
Invoke-Plaster -TemplatePath ".\PowerShellUniversal.Plaster" -DestinationPath ".\test"
```

## Contributing

Feel free to submit issues or pull requests to improve this template.