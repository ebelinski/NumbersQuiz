import sqlite3;
from datetime import datetime, date;
from os import listdir
from os.path import isfile, join

counter = 0

conn = sqlite3.connect('db.sqlite3')
conn.text_factory = str
c = conn.cursor()

dir = 'ToInsert'

for f in listdir(dir):
    
    if (f == '.DS_Store'):
        print 'Ignored: '+f
    else:
        file = open(dir+'/'+f, 'r')

        lines = file.readlines()
    
        language = f[:-4] # Remove .txt

        for number in lines:

            content = number.replace('\n', '').split(":")
            numeral = content[1]
            translation = content[0]

            print "Language: " + language + " Numeral: " + numeral + " Translation: " + translation
    
            vals = [language, numeral, translation]
    
            sql = "insert into numbers values(?, ?, ?)"
            c.execute(sql, vals)
            
            counter += 1
    
        conn.commit()
        
print "Inserted "+str(counter)+" numerals"