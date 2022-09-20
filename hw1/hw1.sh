#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Usage $0 MAXPOINTS"
	exit 1
fi
echo -e "\nMaximum score $1"

homework_directories=students
homework_filename=task1.sh
correct_homework_filename=expected.txt
base_fine=5
for student_dir in ${homework_directories}/*
do
	student_name=${student_dir#*/}
	echo "Processing ${student_name} ..."
	if [ ! -f ${student_dir}/${homework_filename} ]
	then
		echo "$student_name did not turn in the assignment"
	else
		declare -i wrong_lines=$(diff -w $correct_homework_filename <(bash ${student_dir}/${homework_filename}) \
					| grep -E '<|>' | wc -l)

		score=$(($1 - base_fine * wrong_lines))
		if [ $score -lt 0 ]
		then
			score=0
		fi
		if [ $score -ne $1 ]
		then
			echo "$student_name has incorrect output ($wrong_lines lines do not match)"
		else
			echo "$student_name has correct output"
		fi
		echo "$student_name has earned a score of $score / $1" 

	fi
	echo
done
