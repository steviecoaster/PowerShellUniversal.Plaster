# PowerShell Universal App Configuration
# This file is used by PowerShell Universal to register the app

$app = @{
    Name        = '<%=$PLASTER_PARAM_AppName%>'
    BaseUrl     = '/<%=$PLASTER_PARAM_AppName%>'
    Module      = '<%=$PLASTER_PARAM_ModuleName%>'
    Command     = 'New-UD<%=$PLASTER_PARAM_AppName%>App'
    AutoDeploy  = $true
    Description = '<%=$PLASTER_PARAM_Description%>'
    Environment = '<%=$PLASTER_PARAM_Environment%>'
<%
if ($PLASTER_PARAM_Authentication -eq 'Yes') {
@'
    Authenticated = $true
    Role = @('Administrator')
'@
} else {
@'
    Authenticated = $false
'@
}
%>
}

New-PSUApp @app
