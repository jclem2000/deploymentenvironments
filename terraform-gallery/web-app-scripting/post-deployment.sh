# Get Date and message start of script
D=`date`
echo "Post-Deployment script started $D"
echo "Post-Deployment script started $D" >> script-status.txt
#
# Get formatted date to append to file name
DF=`date +%Y%m%d%H%M%S`
#
# Save the script status file to Azure Storage
az storage blob upload \
    --account-name <use your storage account here> \
    --container-name tfdeployments \
    --name script-status-$DF.txt \
    --file script-status.txt \
    --auth-mode login