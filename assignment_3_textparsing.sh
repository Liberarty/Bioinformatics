#!bin/bash

#1
#removes all lines containing the word "zoo" (upper and lowercase) and prints the output to a new file called panda_zoos.txt
sed '/Zoo/Id' pandas.tsv >> panda_zoos.txt

#2
#sorts pandas by sex and prints their name in column 1, age in column 2, and sex in column 3 in a new file called sorted_pandas.txt.
awk '{print $1,$4,$2}' pandas.tsv | tail -n +2 | sort -k3 >> sorted_pandas.txt

#3
#print an alphabetically sorted list of zoo/reserve names to a new file called panda_zoos_A2Z.txt
grep -e "Zoo" -e "Reserve" pandas.tsv | grep -v "logical" | awk '{print $5}' | sort >> panda_A2Z.txt

#4
# replaces all instances of "male" with "M" and "female" with "F" and prints the results to a new file called panda_m_f.txt
sed 's/female/F/' pandas.tsv | sed 's/male/M/' >> panda_m_f.txt

#5
#counts how many female pandas were born in October (Does not make a new file)
grep --count  -E 'female.*October|October.*female' pandas.tsv

#6
#print the pandas.txt file (to a new file called panda_names.txt) with line numbers appended as prefixes (e.g. "1 Name....." on the first line)
grep -n ".*" pandas.tsv >> panda_names.txt

#7
#prints lines 1, 6, and 17 to a new file called lines_1_6_17.txt
sed -n '1p;6p;17p' pandas.tsv >> lines_1_6_17.txt

#8
#print lines to a new file that contain the letter "x" (capital or lowercases) and print this to a new file called x_lines.txt.
grep -i 'x' pandas.tsv >> x_lines.txt

#9
#find the location of pandas with unique locations where no other pandas are currently kept, and print these to a new file called unique_places.txt
awk '!seen[$2]++ {print $5}' pandas.tsv >> unique_places.txt

#10
#sort panda ages from youngest to oldest and print to a new file, only the pandas age 10 and younger with their names in column 1 and ages in column 2. Name the file young_pandas.txt
sort -n -k4 pandas.tsv | awk '$4<=10 {print $1, $4}' >> young_pandas.txt
