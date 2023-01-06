#!/usr/local/bin/python3
# -*- coding: UTF-8 -*-

import random

random_count = 3
in_file = 'quotes-zh.txt'

#----------------------------------------------------
out_filename = 'out_' + in_file
out_file = open(out_filename, 'w', encoding='utf-8')

lines = []

with open(in_file, 'r', encoding='utf-8') as f:
    for line in f:
        lines.append(line)

for index in range(random_count):
    print(str(index+1) + "随机")
    random.shuffle(lines)

for line in lines:
    out_file.write(line)
    
out_file.close()