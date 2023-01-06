#!/usr/local/bin/python3
# -*- coding: UTF-8 -*-

from bs4 import BeautifulSoup
from bs4 import Tag
import requests
import re

page_start = 1
page_end = 3
quote_category = "learning-quotes_"
quote_max_length = 10000

#----------------------------------------------------

quote_content = ""

def fetchQuote(url):
    global quote_content
    req = requests.session()
    data = req.get(url)
    soup = BeautifulSoup(data.content, 'html.parser')
    postags = soup.find_all('div', id=re.compile("pos_"))
    
    for postag in postags:
        quote = ""
        author = ""
        for child in postag.children:
            if type(child) is Tag:
                if child.has_attr("title"):
                    title = child['title']
                    if title == 'view quote':
                        quote = child.getText(strip=True)
                    elif title == 'view author':
                        author = child.getText(strip=True)
        post_content = quote
        if len(post_content) < quote_max_length:
            if len(author) != 0 and (author is not None):
                post_content = post_content + r"\n-" + author
            if len(post_content) != 0:
                quote_content = quote_content + post_content + '\n'

      
def run():
    for i in range(page_start, page_end):
        url = "https://www.brainyquote.com/topics/" + quote_category + str(i)
        fetchQuote(url)
 
    file_name = f'{quote_category}{page_start}_{page_end}.txt'
    with open(file_name, 'w') as f:
        f.write(quote_content)

run()