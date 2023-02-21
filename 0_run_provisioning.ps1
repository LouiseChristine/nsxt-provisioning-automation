Set-Location .\workspace
terraform apply -auto-approve
Start-Sleep -Milliseconds 150;

Push-Location "C:\Users\louise_09496\Documents\EC 2.0 Provisioning"
Move-Item -Path .\3_t0.tf -Destination .\workspace
Start-Sleep -Milliseconds 50;

Set-Location .\workspace
terraform apply -auto-approve
Start-Sleep -Milliseconds 1000;

Push-Location "C:\Users\louise_09496\Documents\EC 2.0 Provisioning"
Move-Item -Path .\4_1_org.tf -Destination .\workspace
Start-Sleep -Milliseconds 20;

Set-Location .\workspace
terraform apply -auto-approve
Start-Sleep -Milliseconds 3000;

Push-Location "C:\Users\louise_09496\Documents\EC 2.0 Provisioning"
Move-Item -Path .\4_2_org_user.tf -Destination .\workspace
Start-Sleep -Milliseconds 2000;

Set-Location .\workspace
terraform apply -auto-approve
Start-Sleep -Milliseconds 150;

Push-Location "C:\Users\louise_09496\Documents\EC 2.0 Provisioning"
Move-Item -Path .\4_3_org_vdc.tf -Destination .\workspace
Start-Sleep -Milliseconds 20;

Set-Location .\workspace
terraform apply -auto-approve
Start-Sleep -Milliseconds 25000;

$From = Get-Content -Path .\vcd_nsxt_tier0_router.txt
Add-Content -Path .\0_service_definition.tf -Value $From


#Move-Item -Path .\0_service_definition.tf -Destination .\done
Push-Location "C:\Users\louise_09496\Documents\EC 2.0 Provisioning"
#Move-Item -Path .\0_service_definition.tf -Destination .\workspace #>
Move-Item -Path .\5_vcd_t0.tf -Destination .\workspace
Start-Sleep -Milliseconds 20;


Set-Location .\workspace
terraform apply -auto-approve
Start-Sleep -Milliseconds 1500;

Push-Location "C:\Users\louise_09496\Documents\EC 2.0 Provisioning"
Move-Item -Path .\6_vcd_t1.tf -Destination .\workspace
Start-Sleep -Milliseconds 20;

Set-Location .\workspace
terraform apply -auto-approve
Start-Sleep -Milliseconds 1500; 

Push-Location "C:\Users\louise_09496\Documents\EC 2.0 Provisioning"

#>
