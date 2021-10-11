printf "Step 1:Setting up Temp variables";
export DEV_UN=kishan75289@pwc.com;
export consumer_key=3MVG9fe4g9fhX0E4O2xNyNuXD0qDJoUumlelZBzYyVutz8UNH9T.ifxEcbscvqM7jkgajQmSbRzESFbZBIyXS
export key_location="D:\Lightning Codes\AutomatedDevelopments\Assets\server.key"
export project_path="D:\Lightning Codes\AutomatedDevelopments\Projects"

printf "Step 2:Moving in Project folder"

cd "$project_path"
pwd

printf "Step 3:creating new Directory $(date +'%Y%m%d')\n";

mkdir  $(date +'%Y%m%d')

cd  $(date +'%Y%m%d')

pwd

printf "Step 4:cloning github";

git clone https://github.com/Kishan752/tree-plantation.git

cd tree-plantation

printf "Step 5:authorizing Dev Hub";

sfdx force:auth:jwt:grant --clientid $consumer_key --jwtkeyfile "$key_location" --username $DEV_UN --setdefaultdevhubusername

printf "authorizing Completed";

printf "Step 6:Creating a Scratch org";

#sfdx force:org:create -a myScratchOrg -d 30 -f ".\config\project-scratch-def.json" -s

sfdx force:org:create --setdefaultusername --definitionfile config/project-scratch-def.json --setalias $(date +'%Y%m%d') --wait 10  --durationdays 30

printf "Step 7: Opening Scratch Org";

sfdx force:org:open






