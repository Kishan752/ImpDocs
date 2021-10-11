#generating self Signed certificates using OpenSSL run the below commands in CMD
#   // Creating Key
#openssl genrsa -passout pass:x -out server.pass.key 2048
# //generating server key
# openssl rsa -passin pass:x -in server.pass.key -out server.key
# //generate 
#openssl req -new -key server.key -out server.csr
#//generate cerificate now
#openssl x509 -re -sha256 -days 365 -in server.csr -signkey server.key -out server.crt
#once you get the certificate Create a connected app with the self signed certificate and use the key file in this Script during authorizaion

#Script starts
printf "Step 1:Setting up Temp variables";
export DEV_UN=your_user_name_in_the_Dev_hub_org
export consumer_key=Your_consumerkey_from_connected_App
export key_location="D:\Lightning Codes\AutomatedDevelopments\Assets\server.key" # path to the key file created as part of openssl self signed certificate
export project_path="D:\Lightning Codes\AutomatedDevelopments\Projects" # path where you would clone the repo and create scrath orgs

printf "Step 2:Moving in Project folder"

cd "$project_path"


printf "Step 3:creating new Directory $(date +'%Y%m%d')\n";

mkdir  $(date +'%Y%m%d')

cd  $(date +'%Y%m%d')

printf "Step 4:cloning github";

git clone https://github.com/Kishan752/SamplelwcStructure.git  # replcae with your own Github repo or you can use this one also for testing

cd SamplelwcStructure

printf "Step 5:authorizing Dev Hub";

sfdx force:auth:jwt:grant --clientid $consumer_key --jwtkeyfile "$key_location" --username $DEV_UN --setdefaultdevhubusername

printf "authorizing Completed";

printf "Step 6:Creating a Scratch org";

#sfdx force:org:create -a myScratchOrg -d 30 -f ".\config\project-scratch-def.json" -s

sfdx force:org:create --setdefaultusername --definitionfile config/project-scratch-def.json --setalias $(date +'%Y%m%d') --wait 10  --durationdays 30

printf "Step 7: Opening Scratch Org";

sfdx force:org:open






