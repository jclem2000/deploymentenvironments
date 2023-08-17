# Get Date and message start of script
D=`date`
echo "Pre-Deployment script started $D"
echo "Pre-Deployment script started $D" > script-status.txt
#
# Get the account that the script is running under and output it to the status file
az account show
az account show >> script-status.txt
