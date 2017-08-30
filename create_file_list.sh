#!/bin/bash

# Input the address of the root file
in_filename="/address/of/root/files/from/your/dataset/"  # don't forget last "/"
out_filename="/address/of/file/which/build/city_list/"	# don't forget last "/"
touch $out_filename/list_city.txt   # build a Text to print childfile address of root file
cd $in_filename
ls | sed "s:^:`pwd`/:" > $out_filename/list_city.txt  # read all child_files' addresses and write in Text

filename="$out_filename/list_city.txt"
IFS=$'\n' Address_file=($(cat $filename))
for i in `seq 0 ${#Address_file[*]}`; #traversing all files
do

    a=${Address_file[i]} 
    childfile_name=`basename $a`
    cd $out_filename
    touch $childfile_name.txt  
    cd $in_filename$childfile_name 
    ls | sed "s:^:`pwd`/:" > $out_filename$childfile_name.Text	## read all Images' addresses and write in Text
done
    