# <%=$PLASTER_PARAM_AppName%> Dashboard
# Created: <%=$PLASTER_Date%>

# Import pages
$Pages = @()
$PageFiles = Get-ChildItem -Path "$PSScriptRoot\pages\*.ps1" -ErrorAction SilentlyContinue

foreach ($PageFile in $PageFiles) {
    . $PageFile.FullName
    $Pages += Get-Variable -Name $PageFile.BaseName -ValueOnly -ErrorAction SilentlyContinue
}

# Dashboard configuration
$DashboardConfig = @{
    Title = '<%=$PLASTER_PARAM_AppName%>'
    Pages = $Pages
<%
if ($PLASTER_PARAM_Authentication -eq 'Yes') {
@'
    # Authentication is required for this dashboard
    # Configure authentication in PowerShell Universal settings
'@
}
%>
}

# Create and return the dashboard
New-UDDApp @DashboardConfig
