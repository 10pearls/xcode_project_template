#!/bin/bash
repoFolder="$1"

fileTemplateDir="$HOME/Library/Developer/Xcode/Templates/File Templates"

function doesFileTemplateDirExist(){
	[ -d "$fileTemplateDir" ]
}


function main() {
	if ! doesFileTemplateDirExist; then
		echo "Creating directory structure..."
		mkdir -p "$fileTemplateDir"
	fi

	echo "Moving into File Templates directory..."
	cd "$fileTemplateDir"
	
	echo "Copying downloaded file templates into File Templates directory..."
	cp -R "/tmp/$repoFolder"*"/File Templates/"* "$(pwd)"

	echo "TenPearls file template deployed"
}


#run script
main