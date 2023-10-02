function Format-Domain {
    param (
        [Parameter(Mandatory=$true)]
        [string]$domain
    )
    
    # Strip off 'http://', 'https://', and trailing slashes if provided
    $domain = $domain -replace "^http://", "" -replace "^https://", "" -replace "/$", ""

    # Remove 'www.' prefix
    $domain = $domain -replace "^www\.", ""

    # Remove anything after .co.uk/ or .com/
    $domain = $domain -replace "(\.co\.uk)/.*", "`$1" -replace "(\.com)/.*", "`$1"

    # Output the different formats
    "*.$domain/*"
    "*.$domain"
    "  $domain/*"
    "  $domain "
}

$continue = $true

while ($continue) {
    $domainInput = Read-Host -Prompt 'Enter the domain'
    Format-Domain -domain $domainInput

    $choice = Read-Host "Do you want to enter another domain? (Y/N)"
    if ($choice -ne "Y") {
        $continue = $false
    }
}