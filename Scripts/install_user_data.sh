#!/bin/bash

userDataDir="$HOME/Library/Developer/Xcode/UserData"

function doesUserDataExist() {
	[ -d "$userDataDir" ]
}

function main() {
	if doesUserDataExist; then
		echo "Moving into User Data directory..."
		cd "$userDataDir"

		echo "Copying downloaded file templates into User Data directory..."
		cp -R "/tmp/$repoFolder"*"/Xcode File Macros/"* "$(pwd)"

		echo "File deployed in User Data"	
	else
		echo "User Data directory not found"	
	fi
}


#run script
main