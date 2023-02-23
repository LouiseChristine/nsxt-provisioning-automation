# nsxt-provisioning-automation

this project is to automate end-to-end provisioning for onboarding a new customer with dedicated link (ILL/MPLS) requirement.

you might need to update the file paths specified in the Powershell scripts.

run 0_run_provisioning.ps1 and that's it !

or, you can comment out the last few lines of 0_run_provisioning.ps1 and run them separately.
1. 0_run_provisioning.ps1
2. .\workspace\1_remove_all.ps1
3. 2_put_files_back.ps1
