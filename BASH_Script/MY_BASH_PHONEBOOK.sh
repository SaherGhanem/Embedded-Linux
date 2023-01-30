####################################################################################
####################################################################################
###########################		Author: SAHER GHANEM      ##########################
###########################		    ITI-INTAKE43          ##########################
###########################		   Embedded Linux		  ##########################
###########################		    Bash Script		      ##########################
###########################		   Version:1.00 	      ##########################
###########################		  DATE: 01/25/2023        ##########################
####################################################################################
####################################################################################


#! /bin/bash

clear

File_Name="PHONEBOOK_DATA_BASE"

if [ ! -f $File_Name ]
then #file not exists
    touch $File_Name
    chmod u+x $File_Name
    echo "FIRST_NAME" "LAST_NAME" "PHONE_NUMBER">> $File_Name

fi 


if [[ -z $1 ]];
then
	echo "**************** PHONEBOOK ****************"
	echo "INSERT [-i]: To ADD A NEW CONTACT DETALES"
	echo "INSERT [-v]: To VIEW ALL SAVED CONTACTS"
	echo "INSERT [-s]: TO SEARCH FOR CONTACT RECORD"
    echo "INSERT [-e]: TO DELEAT ANY CONTACT"
	echo "INSERT [-d]: TO DELEAT ALL PHONE CONTACTS"
fi

if [[ $1 == *"-i"* ]];
then
	echo "ADD A NEW CONTACT"
	read -p "ENTER CONTACT FIRST NAME:   " fName
	read -p "ENTER CONTACT LAST NAME:    " lName
	read -p "ENTER CONTACT PHONE NUMBER: " pNum
	echo $fName "       "$lName "       "$pNum >> $File_Name

fi



#
#if [[ $1 == *"-i"* ]];
#then
#	echo "ADD A NEW CONTACT"
#	read -p "ENTER CONTACT FIRST NAME:   " fName
#	read -p "ENTER CONTACT LAST NAME:    " lName
#	read -p "ENTER CONTACT PHONE NUMBER: " pNum
#	found=$(grep $fName $lName $pNum $File_Name)
#	if  [ -z "$found" ];
#    then
#	   echo $fName "       "$lName "       "$pNum >> $File_Name
#	else 
#		echo "This CONTACT ALREDY EXIST"
#	fi
#fi

if [[ $1 == *"-v"* ]];
then
	echo "VIEWING ALL SAVED CONTACTS"
	cat $File_Name | while read line ; 
    do
	i=$[ $i +1 ]
    echo "$i $line"
    done
fi



if [[ $1 == *"-s"* ]];
then
	echo "SEARCH FOR A CONTACT"
	read -p "ENTER FIRST OR LAST NAME OR PHONE NUMBER OF THE CONTACT : " search
	found=$(grep $search $File_Name)

	if  [ -z "$found" ];
    then
	    echo "THIS ITEM NOT FOUNDED, PELESE TRY AGAIN"
	else 
	    grep $search $File_Name | while read -r line ; 
        do
	        i=$[ $i +1 ]
            echo "$i $line"
	    done
	fi
fi


if [[ $1 == *"-e"* ]];
then
	echo "SEARCH FOR A CONTACT TO DELEAT"
	read -p "ENTER FIRST OR LAST NAME OR PHONE NUMBER OF THE CONTACT : " search
	found=$(grep $search $File_Name)

	if  [ -z "$found" ];
    then
	    echo "No Item found"
	else 
	    grep $search $File_Name | while read -r line ; 
        do
	        i=$[ $i +1 ]
            echo "$i $line"
	    done


	    read -p "TO DELETE A CONTACT, PLEASE ENTER THE CONTACT_ID : " deleteNo
	    i=0
	    grep $search $File_Name | while read -r line ; 
        do
	    i=$[ $i +1 ]
	        if [ $deleteNo -eq $i ] ;
            then
	            echo "`sed  /"$line"/d `" > PHONEBOOK_DATA_BASE
	        fi
	    done
	fi
fi



if [[ $1 == *"-d"* ]];
then
	echo "ALL SAVED CONTACTS WAS DELETED"
	> $File_Name
fi

