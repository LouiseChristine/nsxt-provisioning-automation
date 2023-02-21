Push-Location "C:\Users\louise_09496\Documents\EC 2.0 Provisioning"

Move-Item -Path .\workspace\6_vcd_t1.tf -Destination .\
Start-Sleep -Milliseconds 20;

Move-Item -Path .\workspace\5_vcd_t0.tf -Destination .\
Start-Sleep -Milliseconds 20;

Move-Item -Path .\workspace\4_3_org_vdc.tf -Destination .\
Start-Sleep -Milliseconds 20;

Move-Item -Path .\workspace\4_2_org_user.tf -Destination .\
Start-Sleep -Milliseconds 20;

Move-Item -Path .\workspace\4_1_org.tf -Destination .\
Start-Sleep -Milliseconds 20;

Move-Item -Path .\workspace\3_t0.tf -Destination .\
Start-Sleep -Milliseconds 20;
