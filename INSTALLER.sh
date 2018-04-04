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

	cd "/tmp/$repoZipFileName"*/
	cd "./InstallerScripts"
	sh $projectTemplateDeploymentScript $repoZipFileName

	sh $fileTemplateDeploymentScript $repoZipFileName

	sh $UserDataDeploymentScript $repoZipFileName

	echo -e "\n\n\n"
	echo "Cleaning up after ourself..."
	rm -R "/tmp/$repoZipFileName"*

	echo "INSTALLATION COMPLETED..."
}


#run script
main