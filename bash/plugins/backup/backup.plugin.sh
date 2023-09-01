#!/usr/bin/env bash
 
BACKUPS_ROOT=/backups
export BACKUPS_HOME=$BACKUPS_ROOT/$USER
BACKUPS_DIR=$BACKUPS_HOME/pc
alias rs="rsync -avh --progress --delete-after"


backup_full() {
   backup_pc
   backup_server
}

backup_pc() {
    BACKUPS_DIR=$BACKUPS_HOME/pc

    backup_pc_file "/etc/hosts"
    backup_pc_file "/etc/fstab"
    backup_pc_file "/home/$USER/" "rsync-homedir-excludes.txt"
}

backup_pc_file() {
    file=$1
    if [ -z "$2" ]
    then
        rs $file $BACKUPS_DIR$file
    else        
        excludes=$2
        excludes=$DOTFILES_HOME/bash/plugins/backup/$excludes
        rs --exclude-from=$excludes $file $BACKUPS_DIR$file
    fi
}

backup_server() {
    BACKUPS_DIR=$BACKUPS_HOME/server
    rs server:/backups/sdcard.img $BACKUPS_DIR
}

backup_router() {
    BACKUPS_DIR=$BACKUPS_HOME/router

    backup_router_device "router"
    backup_router_device "cap1"
    backup_router_device "cap2"
}

backup_router_device() {
    device=$1    
    mv $BACKUPS_DIR/$device.rsc $BACKUPS_DIR/$device.old.rsc
    ssh $device export --show-sensitive > $BACKUPS_DIR/$device.rsc
}

disk_mount=/media/backups

backup_mount() {
    sudo mount -L Backups -o noatime,user,noexec $disk_mount
    sudo mount --bind $disk_mount $BACKUPS_ROOT
}

backup_unmount() {    
    sudo umount $disk_mount
    sudo umount $BACKUPS_ROOT
}