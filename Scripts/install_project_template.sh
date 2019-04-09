#!/bin/bash
repoFolder="$1"

tpTemplateDir="$HOME/Library/Developer/Xcode/Templates/Project Templates/TenPearls"
projectTemplateDir="$HOME/Library/Developer/Xcode/Templates/Project Templates"

function doesTenpearlsTemplateExist(){
	[ -d "$tpTemplateDir" ]
}

function shouldReplaceExistingTemplate(){
	echo "TenPearls template already exists. Do you want to replace it? (Y/N)"
	read shouldReplace

	[ "$shouldReplace" = "Y" ] || [ "$shouldReplace" = "y" ]
}

function main() {

	if ! doesTenpearlsTemplateExist; then
		echo "Creating directory structure..."
		mkdir -p "$projectTemplateDir"
	fi

	echo "Moving into Project Templates directory..."
	cd "$projectTemplateDir"

	echo "Copying downloaded project templates into Project Templates directory..."
	cp -R "/tmp/$repoFolder"*"/Project Templates/"* "$(pwd)"

	echo "TenPearls project template deployed"
}


#run script
main