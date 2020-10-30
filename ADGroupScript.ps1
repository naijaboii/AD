$names = @('Users','SecGroup','Dept',"Administrators","desktops")
$path = "ECManaged,DC=ephraimconsults,DC=local"

$test = Get-ADOrganizationalUnit -Identity -Filter name -like $name -ErrorAction SilentlyContinue
if ($null -eq $test) {

    foreach ($name in $names) {
        New-ADOrganizationalUnit -Name $name -Path $path -ProtectedFromAccidentalDeletion $true
    }
}