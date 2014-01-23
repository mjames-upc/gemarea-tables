#!/usr/bin/python
#
# return log base 2 of satellite ID number
# M.James/Unidata	01/14	Created
import sys
import math

def get_power(num):
	return math.log(num,2)

power = get_power(int(sys.argv[1]))

if power < 10:
	print str(power)[0:1]
else:
	print str(power)[0:2]
