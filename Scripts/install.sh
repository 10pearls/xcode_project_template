used_shell=$(ps -o comm= -p $$)
echo "Shell being used: $used_shell"  

#!/bin/$used_shell

xcode_seed_filename="xcode-seed"
dir_bin_root="/usr/local/"
dir_bin="/usr/local/bin"
dir_xcode_seed="$dir_bin/$xcode_seed_filename"
is_dir_already_exist=0
uid=$(id -u)

if  [ $uid -ne 0 ]
then
    echo "+------------------------------------------------+"
    echo "| You may run this script with 'sudo' to avoid   |"
    echo "| script termination due to permission issues... |"
    echo "+------------------------------------------------+"
    echo "| Example: sudo bash install.sh                  |"
    echo "+------------------------------------------------+"
fi

echo "Targetted directory path for download: $dir_bin"
echo "Checking directory existance"
if [ ! -d $dir_bin ]
then
    # Directory existance check fot its permission
    echo "Directory doesn't exists"
    echo "Checking directory create permission..."
    stat=$(stat -f '%A' $dir_bin_root)
    if [ $stat -ne 777 ] && [ $stat -ne 775 ] &&  ([ $stat -eq 755 ] && [ $uid -ne 0 ])
    then
        echo "Create directory permission on $dir_bin_root is not available. You need to either run this script with sudo or contact administrator to provide this user sufficient access."
        echo "Terminating script execution..."
        exit
    else
        echo "Creating directory $dir_bin"
        mkdir -p -m 777 $dir_bin
    fi
else
    echo "Directory exists"
    is_dir_already_exist=1
    stat=$(stat -f '%A' $dir_bin)
    if [ $stat -ne 777 ] && [ $stat -ne 775 ] && [ [ $stat -eq 755 ] && [ $uid -ne 0 ] ]
    then
        echo "Create file permission on $dir_bin is not available. You need to either run this script with sudo or contact administrator to provide this user sufficient access."
        echo "Terminating script execution..."
        exit
    fi
fi


# Check if directory has been created by user entering credentials
if [ ! -d $dir_bin ]
then
    echo "Failed to create directory. Enough permission is not granted"
    echo "Terminating script execution..."
    exit
else
    if [ $is_dir_already_exist -eq 0 ]
    then
        echo "Directory $dir_bin has been successfully created and granted $(stat -f='%A' $dir_bin) permission"
    fi
fi

echo "Changing directory to $dir_bin for downloading"
cd $dir_bin


# Checking old file existance and attributes for xcode-seed
if [ ! -f $dir_xcode_seed ]
then
    echo "File '$xcode_seed_filename' is not present"
else
    last_modified_date=$(stat -f "%Sm"  -t "%Y-%m-%d %H:%M:%S" $dir_xcode_seed)
    echo "Last modified date : $last_modified_date"
fi


echo "Downloading..."
curl_res=$(curl -OSsw %{http_code} --connect-timeout 30 https://raw.githubusercontent.com/10pearls/xcode_project_template/master/Scripts/xcode-seed)
echo "Response code: $curl_res"
if [ ! -z "$curl_res" ] && [ $curl_res -eq 200 ]
then
    echo "Downloaded"
    current_modified_date=$(stat -f "%Sm"  -t "%Y-%m-%d %H:%M:%S" $dir_xcode_seed)
    echo "Current modified date : $current_modified_date"
else
    echo "Terminating script execution due to error in downloading..."
    exit
fi


# If file wasn't downloaded previously
if [ -z "$last_modified_date" ]
then
    echo "Updated $xcode_seed_filename present in directory"
else
    last_date=$(date -j -f "%Y-%m-%d %H:%M:%S" "$last_modified_date")
    curr_date=$(date -j -f "%Y-%m-%d %H:%M:%S" "$current_modified_date")
    t_old=$(date -j -f "%F %T" "$last_modified_date" "+%s")
    t_new=$(date -j -f "%F %T" "$current_modified_date" "+%s")

    if [ $[ t_new - t_old ] -gt 0 ]
    then
        echo "Updated '$xcode_seed_filename' file has been downloaded"
    else
        echo "File '$xcode_seed_filename' is unchanged"
    fi
fi


echo "Setting permissions to '$xcode_seed_filename' file..."
chmod 777 xcode-seed
echo "Permission granted..."
