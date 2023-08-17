D=`date`
echo "Pre-Deployment script started $D"
echo "Pre-Deployment script started $D" > script-status.txt
az account show
az account show >> script-status.txt
