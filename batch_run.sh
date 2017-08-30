#!/bin/bash

# Input the list of city name from .txt file in /home/weiji/tmp/data_flow
filename="/address/of/city_list/from/create_file_list.txt"
out_filename="/address/of/your/output/flow_files/"  # don't forget last "/"
IFS=$'\n' Address_file=($(cat $filename))
#echo ${#Address_file[*]} count the amount of city
for m in `seq 0 ${#Address_file[*]}`; #traversing all files
do

    city_name=${Address_file[m]}
    echo -e "\e[1;3m Start to create the Flow_Image of $city_name ... \e[0m"
    filename_Image="/home/weiji/tmp/data_deepflow/data_flow/$city_name.txt"
    IFS=$'\n' Address_Image=($(cat $filename_Image))
    city_name=`basename $filename_Image .txt`
    length_city_name=${#city_name}
    position_cut1=`expr $length_city_name + 1`

    for i in `seq 0 ${#Address_Image[*]}`; #traversing all Images
    do
        a1=${Address_Image[i]}
        j=`expr $i + 1`
        a2=${Address_Image[j]}
        Image_name1=`basename $a1 .png`  #the first Frame of optical_flow
        Image_name2=`basename $a2 .png`  #the second Frame of optical_flow
        Video_number1=${Image_name1:$position_cut1:6} #intercept the part of Video_number from address
        Video_number2=${Image_name2:$position_cut1:6}
        echo $Image_name1
        echo $Image_name2
        echo -e "\e[1;31m Creating the Flow_Image of $i th Frame ... \e[0m"
        if [ $Video_number1 -eq $Video_number2 ]
        then 
            ./fastdeepflow $a1 $a2 $out_filename$city_name/$Image_name1.flo -sintel
        fi
    done 
    
done
