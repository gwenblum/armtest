param(
    [string] $StorageAccountName,
    [string] $BlobContainerName
)

##### Parameters

$StorageAccountName
$BlobContainerName

$ResourceGroupName = ${Env:ResourceGroupName}

##### Variables

$StartTime = Get-Date
$EndTime = $startTime.AddHours(2.0)

##### Storage account

$StorageAccount = Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName
$uriStorageAccountBlobContainerWritableSasToken = New-AzStorageContainerSASToken -FullUri -Name $BlobContainerName -context $StorageAccount.Context  -Permission rawcl  -StartTime $StartTime -ExpiryTime $EndTime

##### Output
$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['uriStorageAccountBlobContainerWritableSasToken'] = $uriStorageAccountBlobContainerWritableSasToken
