#!/bin/sh
#get env
SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOME_PATH=$(cd ~; pwd)
DESTINATION_DIR="$HOME_PATH/scripts"
AWS=$(ls aws)
SH=$(ls sh)

#setup scriptdir
mkdir -p "$DESTINATION_DIR"

#make symbolic links
for entry in ${AWS[@]}; do
    echo "create link $SCRIPT_DIR/aws/$entry -> $DESTINATION_DIR/$entry"
    if [ -f "$DESTINATION_DIR/$entry" ]; then
        echo "unlink $DESTINATION_DIR/$entry"
        unlink "$DESTINATION_DIR/$entry" 
    fi
    ln -s "$SCRIPT_DIR/aws/$entry" "$DESTINATION_DIR/$entry"
    chmod +x "$DESTINATION_DIR/$entry"
done
for entry in ${SH[@]}; do
    echo "create link $SCRIPT_DIR/sh/$entry -> $DESTINATION_DIR/$entry"
    if [ -f "$DESTINATION_DIR/$entry" ]; then
        echo "unlink $DESTINATION_DIR/$entry"
        unlink "$DESTINATION_DIR/$entry" 
    fi
    ln -s "$SCRIPT_DIR/sh/$entry" "$DESTINATION_DIR/$entry"
    chmod +x "$DESTINATION_DIR/$entry"
done


