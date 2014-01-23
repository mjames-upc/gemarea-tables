#!/bin/csh
source /home/gempak/GEMPAK7/Gemenviron
cd areas/
echo '# !------------------------------------------------------------------------------'
foreach file ( `find ./ -type f` )
  set filestring = `echo $file:q | sed 's/\// /g'`
  set command = `arinfo -sbrnix $file`
  set imgType = `echo $command[21] | awk '{print substr($0,0,3)}'`
  

  set satName = $command[4]
  if ( $satName == 'unknown' ) then
  	set satName = $filestring[2]
        set imgType = $filestring[4]
  endif
  if ( $command[8] > 100 ) then
  	set power = `/usr/bin/python /home/mjames/arinfo/po2.py $command[8]`
  	echo $satName'               '$imgType'           0    255  '$command[25]'   2**'$power'     1 GRAY'
  else
	set imgPower = $command[8]
        if ( $imgPower < 10 ) then
  		echo $satName'               '$imgType'           0    255  '$command[25]'    '$imgPower'     1 GRAY'
        else
  		echo $satName'               '$imgType'           0    255  '$command[25]'   '$imgPower'     1 GRAY'
        endif
  endif 
end
