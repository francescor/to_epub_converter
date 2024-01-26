#!/bin/bash
#
# https://github.com/francescor/to_epub_converter

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 input_directory output_directory extensions" >&2
    echo "e.g."
    echo "$0 /tmp/input /tmp/output pdf,doc,txt"
    echo
    exit 1
fi

input_dir=$1
output_dir=$2
extensions=$3

if [ ! -d "$input_dir" ]; then
    echo "Input directory not found: $input_dir" >&2
    exit 1
fi

if [ ! -d "$output_dir" ]; then
    echo "Output directory not found: $output_dir" >&2
    exit 1
fi

EBOOK_CONVERT_PATH=$(which ebook-convert)
if [ $? -ne 0 ]; then
    echo "ebook-convert is not installed or not found in the PATH. Please install Calibre and try again." >&2
    exit 1
fi

for ext in $(echo $extensions | tr ',' ' '); do
  for file in ${input_dir}/*.${ext}; do
    echo ">> Checking $file"
    if [ -e "$file" ]; then
      filename=$(basename -- "$file")
      extension="${filename##*.}"
      filename="${filename%.*}"
      if [ ! -f "$output_dir/$filename.epub" ]; then
        echo ">> Converting $file to $output_dir/$filename.epub"
        $EBOOK_CONVERT_PATH "$file" "$output_dir/$filename.epub"
        chmod --reference="$file" "$output_dir/$filename.epub"  # Preserve the same permissions
        chown --reference="$file" "$output_dir/$filename.epub"  # Preserve the same owner
      else
        echo ">>   Already converted"
      fi
    fi
  done
done

