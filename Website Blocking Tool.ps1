function Format-Domain {
    param (
        [Parameter(Mandatory=$true)]
        [string]$domain
    )
    
    # Strip off 'http://' or 'https://' if provided
    $domain = $domain -replace "^http://", "" -replace "^https://", ""

    # Output the different formats
    "*.$domain/*"
    "*.$domain"
    "  $domain/*"
    "  $domain "
}

# Test the function
$domainInput = Read-Host -Prompt 'Enter the domain'
Format-Domain -domain $domainInput
