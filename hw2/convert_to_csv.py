import sys
from libsvm2csv import convert

file_path = sys.argv[1]
file_destination = sys.argv[2]
convert(file_path, file_destination)
