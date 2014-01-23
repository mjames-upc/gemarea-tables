#!/usr/bin/python
import sys
import math

def get_power(num):
	return math.log(num,2)

power = get_power(int(sys.argv[1]))

if power < 10:
	print str(power)[0:1]
else:
	print str(power)[0:2]
