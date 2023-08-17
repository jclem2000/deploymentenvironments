D=`date`
echo "Post-Deployment script started $D"
echo "Post-Deployment script started $D" >> script-status.txt
DF=`date +%Y%m%d%H%M%S`
az storage blob upload \
    --account-name a214143dcsa \
    --container-name tfdeployments \
    --name script-status-$DF.txt \
    --file script-status.txt \
    --auth-mode login