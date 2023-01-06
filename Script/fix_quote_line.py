#!/usr/local/bin/python3
# -*- coding: UTF-8 -*-

in_file = 'quote_word_7_en.txt'
max_line_length = 100

#----------------------------------------------------
out_filename = 'out_' + in_file
out_file = open(out_filename, 'w', encoding='utf-8')

lines = []

with open(in_file, 'r', encoding='utf-8') as f:
    for line in f:
        lines.append(line)
        
for line in lines:
    if len(line) < max_line_length:
        out_file.write(line)
    
out_file.close()