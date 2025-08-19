#! /bin/bash

<< readme
This is a script for backup with 5 days rotation

Usage:
./backup.sh <path to your source> <path to back up folder>
readme

function display_usage {
    echo "./backup.sh <path to your source> <path to back up folder>"

}
if [ $# -eq 0 ]; then
    display_usage
fi 

source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M')
backup_dir=$2

function create_backup {
    zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}" > /dev/null
    if [ $? -eq 0]; then
    echo "backup generated successfully for ${timestamp}"
    fi
}

function perform_rotation {
    backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))
    echo "${backups[@]}"
    
    if [ "{backups[@]}" -gt 5]; then
        echo "preform 5 days rotation backup"
    
        backup_remove= ("{backups[@]:5}")
        echo "${backup_remove[@]}

        for backup in "${backup_remove[@]}";
        do
            rm -f ${backup}
        done
    fi
}

create_backup
perform_rotation
