#!/bin/bash

#1+3 make a database for mystery nucleotide and limit e value and limit to 15 results
makeblastdb -in database_mystery_transcripts.fasta -dbtype nucl -out database_mystery_transcripts
blastn -db database_mystery_transcripts -query query_mystery_nucleotide.fasta -evalue 1e-3 -max_hsps 5 -outfmt 7 -out results_nucleotides.out

#4 best hits
#T010027234997
#T010003453160
#T010027234995

#5Useing awk and/or grep to print sequence names with ID over 90% into file called most_similar.txt
awk -v s="T" 'index($2, s) == 1' results_nucleotides.out | awk '$2 >= 90' |  awk '{print $2}' >> most_similar.txt

#2+6 make a database for mystery protein and limit e value and limit to 15 results
makeblastdb -in database_mystery_proteins.fasta -dbtype prot -out database_mystery_protiens 
blastp -db database_mystery_protiens -query query_mystery_protein.fasta -evalue 1e-5 -max_hsps 15  -outfmt 7 -out results_protein.out 

#7 best hits
#P010027090796

#8 what is the species name in the transcripts file
#	Coffea arabica/Arabica coffee

#9 what specis is the query
#	Gardenia jasminoides/cape jasmine

#10 what gene is in the query
# putative catalase mRNA

