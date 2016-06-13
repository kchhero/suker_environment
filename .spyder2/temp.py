# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

def file_gathering():
    resultpath = ""
    destpath = []
    try :
        with open("result.txt") as data :
            for line in data :
                resultpath = lie
    except IOError :
        print "File open error"
    
    try :
        with open(sys.argv[1]) as data :
            for line in data :
                destpath.append(line)
                
    except IOError :
        print "File open error"
        
    print resultpath
    print destpath
    
file_gathering()