#!/bin/bash
#Author: Turky Abdulaziz Saderaldin
#Create Date:17/12/22 17:41:44
#Update Date:17/12/22 17:41:48
#Signature: md5sum: 
#Subject: QuizCounter

## List of Messages ##
msg1="use the following options:\n\t-s <seconds>\n\t-m <minutes>\n\t-h <hours>"

## Check1: Positional parameters must be 2, 4, 0r 6 only ##
if [[ $# -lt 2 || $# -gt 6 || $#%2 -ne 0 ]]; then
	echo -e "Error: "$msg1
	exit
fi
if [[ $# -eq 2 ]]; then
	if [[ $1 == "-h" ]]; then
		let start_time=$2*60*60
	elif [[ $1 == "-m" ]]; then
		let start_time=$2*60
	elif [[ $1 == "-s" ]]; then
		let start_time=$2
	else
		echo -e "Error: "$msg1
		exit
	fi
	echo $start_time
fi
if [[ $# -eq 4 ]]; then
	case $1 in
	"-h")
		let start_time=$2*60*60
		case $3 in
			"-m")
				let start_time=$start_time+$4*60
				;;
			"-s")
				let start_time=$start_time+$4
				;;
			*)
				echo -e "Error: Invalid, note taht you can not use the same option twice\n"$msg1
				exit
				;;
		esac
		;;
	"-m")
		let start_time=$2*60
		case $3 in
			"-h")
				let start_time=$start_time+$4*60*60
				;;
			"-s")
				let start_time=$start_time+$4
				;;
			*)
				echo -e "Error: Invalid, note taht you can not use the same option twice\n"$msg1
				exit
				;;
		esac
		;;
	"-s")
		let start_time=$2
		case $3 in
			"-h")
				let start_time=$start_time+$4*60*60
				;;
			"-m")
				let start_time=$start_time+$4*60
				;;
			*)
				echo -e "Error: Invalid, note taht you can not use the same option twice\n"$msg1
				exit
				;;
		esac
		;;
	*)
		echo "Error: "$msg1
		exit
	esac
	echo $start_time
fi
