# PowerShellUniversal.Plaster

PowerShellUniversal.Plaster is a PowerShell module that provides Plaster templates for accelerating the development of PowerShell Universal applications.

## Available Templates

- `PowerShellUniversalApp` : Scaffolds a new PowerShell module which contains a PowerShell Universal app


## Installation

### PowerShell Gallery

```powershell
Install-PSResource PowerShell.Plaster -Repository PSGallery -Scope CurrentUser
```

### Manual

1. Clone this repository

```powershell
git clone https://github.com/steviecoaster/PowerShellUniversal.Plaster.git
```


## Usage

### From the Gallery

```powershell
Import-Module PowerShell.Plaster

New-PSUAppModule
```

### From manual installation

```powershell
cd .\PowerShell.Plaster
Import-Module .\PowerShellUniversal.Plaster.psd1

New-PSUAppModule
```

You can run `Get-Help New-PSUAppModule -Full` for more usage examples

## Contributing

Many things inside of PowerShell Universal can be delivered via PowerShell modules. Apps, Endpoints, and even Components, can all be packaged.
If you would like to add a template for a particular type of App, Endppoint, or Component, feel free to file a Pull Request!

Just add a new folder to the `Templates` directory, and add your template code to that new folder!