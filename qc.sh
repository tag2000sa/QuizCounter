#!/bin/bash
#Author: Turky Abdulaziz Saderaldin
#Create Date:17/12/22 17:41:44
#Update Date:17/12/22 17:41:48
#Signature: md5sum: 
#Subject: QuizCounter

msg1="use the following options:\n\t-s <seconds>\n\t-m <minutes>\n\t-h <hours>"

if [[ $# -lt 2 || $# -gt 6 || $#%2 -ne 0 ]]; then
	echo -e "Error: "$msg1
	exit
fi
