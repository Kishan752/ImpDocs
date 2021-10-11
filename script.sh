# to run this script file you can use git bash(if you are on windows) and run the below command
# bash script.sh

printf "Step 1:Setting up Temp variables";

export project_path="D:\Lightning Codes\AutomatedDevelopments\Projects" # change this with your own folder Directory name

printf "Step 2:Moving in Project folder"

cd "$project_path"

printf "Step 3:creating new Directory $(date +'%Y%m%d')\n";
# we are creating a new directory with currentdate as name so that everyday we can create a new folder with unique Name
mkdir  $(date +'%Y%m%d')

cd  $(date +'%Y%m%d')

printf "Step 4:cloning github";

git clone https://github.com/Kishan752/SamplelwcStructure.git  # replcae with your own Github repo or you can use this one also for testing

cd SamplelwcStructure

printf "Step 5:authorizing Dev Hub";

#sfdx force:auth:jwt:grant --clientid $consumer_key --jwtkeyfile "$key_location" --username $DEV_UN --setdefaultdevhubusername 
# the Above one requires self signed certificate and Connected app benefit of this authentication is it will automatically authenticate without pop up window without username and password
# but we are doing a normal web flow authentication
sfdx force:auth:web:login -a myDevhub -s -d 

printf "authorization Completed";

printf "Step 6:Creating a Scratch org";

#we are creating a scartch org with alias same as currrentDate
sfdx force:org:create --setdefaultusername --definitionfile config/project-scratch-def.json --setalias $(date +'%Y%m%d') --wait 10  --durationdays 30

printf "Step 7: Opening Scratch Org";

sfdx force:org:open
