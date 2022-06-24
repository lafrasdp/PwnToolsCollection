$PDC = ($domainObj.PdcRoleOwner).Name
$SearchString = "LDAP://"
$SearchString += $PDC + "/"
$DistinguishedName = "DC=$domainObj.Name.Replace('.', ',DC='))"
$SearchString += $DistinguishedName
$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)
$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$Searcher.SearchRoot = $objDomain

# Search by what
$Searcher.filter="serviceprincipalname=*"

$Result = $Searcher.Findall()

Write-Host "---------------------------"
Foreach($obj in $Result)
{
    
    ForEach($prop in $obj.Properties) {
        # uncommnent to print all attributes
        #$prop
    }
    Write-Host "[SAM Account Name]"
    $obj.Properties.samaccountname
    Write-Host ""
    Write-Host "[User Principal Name]"
    $obj.Properties.userprincipalname
    Write-Host ""
    Write-Host "[Service Principal Name]"
    $obj.Properties.serviceprincipalname
    Write-Host "---------------------------"
}
