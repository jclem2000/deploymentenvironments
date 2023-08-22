# Get Date and message start of script
D=`date`
echo "Pre-Deployment script started $D"
echo "Pre-Deployment script started $D" > script-status.txt
#
# Get the account that the script is running under and output it to the status file
az account show
az account show >> script-status.txt

# Get formatted date to append to file name
DF=`date +%Y%m%d%H%M%S`
#
# Save the script status file to Azure Storage
az storage blob upload \
    --account-name a214143dcsa \
    --container-name tfdeployments \
    --name pre-script-status-$DF.txt \
    --file script-status.txt \
    --auth-mode login