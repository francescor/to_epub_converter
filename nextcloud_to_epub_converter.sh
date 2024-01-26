#!/bin/bash
#
# https://github.com/francescor/to_epub_converter
#
set -e

# cron script to convert nextcloud files to epub

# we want to conver files for this Nextcloud User
NEXTCLOUD_USER=francesco
# here the directory as the user see them in his File/home
NEXTCLOUD_USER_INPUT_DIR=AutoConvert/input
NEXTCLOUD_USER_OUTPUT_DIR=AutoConvert/output
EXTENSIONS_TO_CONVERT=pdf,txt,doc

# Nextcloud
NEXTCLOUD_DATA_DIR=/var/www/nextcloud/data
NEXTCLOUD_OCC=/var/www/nextcloud/occ
NEXTCLOUD_WEB_USER=www-data

# useful so to execute this script in cron
SUDO=$(which sudo)
AWK=$(which awk)
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONVERTER_SCRIPT=$THIS_DIR/to_epub_converter.sh

INPUT_DIR=$NEXTCLOUD_DATA_DIR/$NEXTCLOUD_USER/files/$NEXTCLOUD_USER_INPUT_DIR
OUTPUT_DIR=$NEXTCLOUD_DATA_DIR/$NEXTCLOUD_USER/files/$NEXTCLOUD_USER_OUTPUT_DIR

command="$CONVERTER_SCRIPT $INPUT_DIR $OUTPUT_DIR  $EXTENSIONS_TO_CONVERT"
echo "Executing command:"
echo "$command"
output=$($command)
FILE_COUNT=$(echo $output | $AWK -F"===>" '{print $2}')
echo
echo "$output"

# scan only if files have been elaborated
if [[ -v FILE_COUNT && $FILE_COUNT -gt 0 ]]; then
  # scan user directory, so that the user is able to see new files in his output directory
  $SUDO -u $NEXTCLOUD_WEB_USER php $NEXTCLOUD_OCC files:scan --path=/$NEXTCLOUD_USER/files/$NEXTCLOUD_USER_OUTPUT_DIR $USER
else
  echo "No new files, so Skipping scan for new files in Nextcloud"
fi

