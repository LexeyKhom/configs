if status is-interactive
    # For NoeVim tests
    alias tvim='XDG_DATA_HOME=~/Documents/NeoVim/.local/share XDG_CONFIG_HOME=~/Documents/NeoVim/ nvim'

    # Rclone sync
    alias 'rclone-upload'='echo "Upload from $DRIVE to $REMOTE_DRIVE"; rclone sync $DRIVE $REMOTE_DRIVE  --exclude-from $RCLONE_IGNORE --delete-excluded -Pi'
    alias 'rclone-download'='echo "Download from $REMOTE_DRIVE to $DRIVE"; rclone sync $REMOTE_DRIVE $DRIVE --exclude-from $RCLONE_IGNORE -Pi'
end
