# <%=$PLASTER_PARAM_ModuleName%>

<%=$PLASTER_PARAM_Description%>

## Structure

```
<%=$PLASTER_PARAM_ModuleName%>/
├── <%=$PLASTER_PARAM_ModuleName%>.psd1   # Module manifest
├── <%=$PLASTER_PARAM_ModuleName%>.psm1   # Module script
├── .universal/
│   └── dashboards.ps1                     # PowerShell Universal app registration
├── dashboards/
│   ├── App.ps1                            # Main dashboard file
│   └── pages/                             # Dashboard pages
│       └── homepage.ps1                   # Sample homepage
├── private/                               # Private functions (not exported)
└── public/                                # Public functions (exported)
    └── New-UD<%=$PLASTER_PARAM_AppName%>App.ps1  # App creation command
```

## Usage

### Import the Module

```powershell
Import-Module .\<%=$PLASTER_PARAM_ModuleName%>\<%=$PLASTER_PARAM_ModuleName%>.psd1
```

### Register in PowerShell Universal

1. Copy the module folder to your PowerShell Universal modules directory
2. PowerShell Universal will automatically detect the `.universal/dashboards.ps1` file
3. The app uses the `New-UD<%=$PLASTER_PARAM_AppName%>App` command to create the dashboard
4. The dashboard will be registered with the base URL: `/<%=$PLASTER_PARAM_AppName%>`
<%
if ($PLASTER_PARAM_Authentication -eq 'Yes') {
@'
5. Configure roles and authentication in PowerShell Universal settings
'@
}
%>

You can also manually test the app command:
```powershell
Import-Module .\<%=$PLASTER_PARAM_ModuleName%>\<%=$PLASTER_PARAM_ModuleName%>.psd1
New-UD<%=$PLASTER_PARAM_AppName%>App
```

## Development

### Adding New Pages

Create new page files in the `dashboards/pages/` folder:

```powershell
$mypage = New-UDPage -Id 'mypage' -Name 'My Page' -Url '/mypage' -Content {
    # Your page content here
}
```

### Adding Functions

- **Public functions**: Add to `public/` folder - will be exported from the module
- **Private functions**: Add to `private/` folder - internal use only

## Author

<%=$PLASTER_PARAM_Author%>

## Version

<%=$PLASTER_PARAM_Version%>
