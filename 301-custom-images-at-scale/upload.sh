# accepts a storage account name and a key
[[ -z "$HOME" || ! -d "$HOME" ]] && { echo 'fixing $HOME'; HOME=/root; } 
export HOME 

export AZURE_STORAGE_ACCOUNT="$1" 
export AZURE_STORAGE_ACCESS_KEY="$2" 
azure storage container create vhds

blob_path=$(cut -f2 -d, /mnt/config.txt) 
blob_name=$(cut -f4 -d/ /mnt/config.txt)
attempts=0
response=1
while [ $response -ne 0 -a $attempts -lt 5 ]
do
  blobxfer $1 vhds "/mnt/$blob_path" --remoteresource "$blob_name" --storageaccountkey $2 --upload --no-computefilemd5 --autovhd --endpoint core.chinacloudapi.cn
  response=$?
  attempts=$((attempts+1))
done
 
