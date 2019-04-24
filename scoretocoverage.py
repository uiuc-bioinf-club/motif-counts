import numpy as np
import sys

def get_coverage(filename):
    counts = []
    count = 0
    for line in reversed(open(filename).readlines()):
        if line[0] != ">":
            count += 1
        else:
            counts.append(str(count)+"\n")
            count = 0
    return counts[::-1]

scorefilename = sys.argv[1]
outfilename = '.'.join(scorefilename.split('.')[0:-1])+".coverage"

with open(outfilename, 'w') as f:
    #f.writelines([str(i) for i in get_coverage(scorefilename)])
    f.writelines(get_coverage(scorefilename))



