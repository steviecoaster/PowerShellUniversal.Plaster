# Homepage for <%=$PLASTER_PARAM_AppName%>

$homepage = New-UDPage -Id 'home' -Name 'Home' -Url '/' -Content {
    New-UDTypography -Text 'Welcome to <%=$PLASTER_PARAM_AppName%>' -Variant h3
    
    New-UDCard -Title 'Getting Started' -Content {
        New-UDTypography -Text 'This is your homepage. Edit this file to customize your app.'
        
        New-UDElement -Tag 'ul' -Content {
            New-UDElement -Tag 'li' -Content { 'Add new pages in the pages folder' }
            New-UDElement -Tag 'li' -Content { 'Create custom functions in the public/private folders' }
            New-UDElement -Tag 'li' -Content { 'Update the App.ps1 file to configure your dashboard' }
        }
    }
}
