# Get Date and message start of script
D=`date`
echo "Post-Deployment script started $D"
echo "Post-Deployment script started $D" >> script-status.txt
#
az resource list --query "[?name=='pre_script']" -otable >> script-status.txt
# Get formatted date to append to file name
DF=`date +%Y%m%d%H%M%S`
#
# Save the script status file to Azure Storage
az storage blob upload \
    --account-name <your local storageAccountName> \
    --container-name tfdeployments \
    --name post-script-status-$DF.txt \
    --file script-status.txt \
    --auth-mode login