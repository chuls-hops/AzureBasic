$groupName = "rg-skcc1-homepage-dev"
$locationName = "koreacentral"
$zone=1

$vnetName = "vnet-skcc1-dev"
$vnetAddressPrefix = '10.0.0.0/16'

$subnetFrontendName = 'snet-skcc1-dev-frontend'
$subnetFronendAddressPrefix = '10.0.0.0/28'
$subnetBackendName = 'snet-skcc1-dev-backend'
$subnetAddressPrefix = '10.0.1.0/28'

$storageAccountName = 'skccdevhomepagedev'
$storageAccountSkuName ='Standard_LRS'

$nsgName = 'nsg-skcc1-homepage' 

$pipName = 'pip-skcc1-comdpt1'
$nicName = 'nic-skcc1-comdpt1'

$vmName = "vm-skcc1-comdpt1"
$vmSize = "Standard_B2s"

$vmOSDisk = $vmName + "-OSDisk01"
$osDiskType = "StandardSSD_LRS"
$osDiskSizeInGB = 64

$vmDataDisk = $vmName + "-DataDisk01"
$osDataDiskSizeInGB = 64
$StorageAccountType = 'StandardSSD_LRS'
$storageAccountName = "skcc1devhomepagedev01"

$openPorts = '10080,22'

$tags = @{
  owner='SeoTaeYeol'
  environment='dev'
  serviceTitle='homepage'
  personalInformation='no'
}