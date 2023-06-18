param ([Parameter(Mandatory=$true)] $repoName)
$orgName = "myOrg"
$pat = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($env:GH_PAT)"))
$body = @{name="$repoName"}
$params = @{
'Uri' = ('https://api.github.com/orgs/{0}/repos' -f $orgName)
'Headers'     = @{'Authorization' = 'Basic ' + $pat}
'Method'      = 'Post'
'ContentType' = 'application/json'
'Body'        = ($body | ConvertTo-Json)}
Invoke-RestMethod @params
