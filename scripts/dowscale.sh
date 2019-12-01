#!/bin/bash

# how to use
# find . -path ./<path_to_exclude> -prune -o -name "<image_pattern>" -exec ./<path_to>/dowscale.sh '{}' <percent_to_shrink> \;
#example
#find . -path ./backupfiles -prune -o -name "*mgmt*.png" -exec ./scripts/dowscale.sh '{}' 60 \;

shrink_file()
{  
   file=$1
   percent=$(echo "scale=2; toshrink = 100-$2; shrinkpercent = toshrink/100; shrinkpercent" |bc)
   f_width=$(sips -g pixelWidth "$file" | cut -s -d ':' -f 2 | cut -c 2-)
   #removing float 
   new_width=$(printf "%0.f" $(echo "scale=0; $f_width * $percent" | bc))
   echo "Reducing $2%. From $f_width to $new_width pixels"
   #creating a backup of original image
   cp $file{,.bak}
   sips -Z $new_width "$file" --out "$file" &> /dev/null
}

if [ $1 ]
then
   echo Processing file $1;
   shrink_file $1 $2
else
# if a png image has not been provided, find all png images in dir
   find . -name "*.png" -print0 | while IFS= read -r -d '' file; do
      echo Processing file "$file";
      shrink_file $1 $2
   done
fi

