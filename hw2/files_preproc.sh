#!/bin/bash

txt_folder=datasets/txt/
csv_folder=datasets/csv/
url=https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/binary/
python_script=convert_to_csv.py
mkdir -p $txt_folder
mkdir -p $csv_folder
for file in a{1..9}a
do
    echo $file is downloading
    wget -nc -q ${url}${file} -P $txt_folder && \
        echo $file downloaded and now is reading && \
        python $python_script ${txt_folder}${file} ${csv_folder}${file}.csv && \
        echo $file is read &
done
wait
echo all files downloaded
