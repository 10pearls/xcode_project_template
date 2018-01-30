#!/bin/bash
projectTemplateDeploymentScript="./install_project_template_v3.sh"
fileTemplateDeploymentScript="./install_file_template.sh"
UserDataDeploymentScript="./install_user_data.sh"

repoUrl="http://10.0.0.192/git/xcode_project_template/repository/archive.zip"
repoZipFileName="xcode_project_template-master"

function main() {

	echo "Downloading content from repository..."
	curl -L $repoUrl > "/tmp/$repoZipFileName.zip"
	echo "Unzipping content..."
	unzip -a "/tmp/$repoZipFileName.zip" -d "/tmp/"

	# echo "Do you want to deploy the Tenpearls Project Template? (Y/N)"
	# read deployProjTemplate
	# echo -e "\n\n\n"

	# if [ "$deployProjTemplate" = "Y" ] || [ "$deployProjTemplate" = "y" ]; then
		sh $projectTemplateDeploymentScript $repoZipFileName
	# else
	# 	echo "Tenpearls Project Template not deployed"
	# fi

	# echo -e "\n\n\n"
	# echo "Do you want to deploy the Tenpearls File Template? (Y/N)"
	# read deployFileTemplate
	# echo -e "\n\n\n"

	# if [ "$deployFileTemplate" = "Y" ] || [ "$deployFileTemplate" = "y" ]; then
		sh $fileTemplateDeploymentScript $repoZipFileName
	# else
	# 	echo "Tenpearls File Template not deployed"
	# fi

	# echo -e "\n\n\n"
	# echo "Do you want to deploy the User Data update? (Y/N)"
	# read deployUserData
	# echo -e "\n\n\n"

	# if [ "$deployUserData" = "Y" ] || [ "$deployUserData" = "y" ]; then
		sh $UserDataDeploymentScript $repoZipFileName
	# else
	# 	echo "User Data not updated"
	# fi

	echo -e "\n\n\n"
	echo "Cleaning up after ourself..."
	rm -R "/tmp/$repoZipFileName"*


	echo "INSTALLATION COMPLETED..."
}


#run script
main