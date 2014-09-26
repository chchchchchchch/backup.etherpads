#!/bin/bash

  URL=http://pad.constantvzw.org/p/conversations.jhaltiwanger/export/txt
  BACKUPDIR=backup
  TMPDIR=.


  
  NAME=`echo $URL | rev | cut -d "/" -f 3 | rev`
  BACKUPFILE=$BACKUPDIR/${NAME}.txt
  EPDUMPFILE=${TMPDIR}/${NAME}.tmp

  if [ -f $BACKUPFILE ]; then

       MD5BACKUP=`md5sum $BACKUPFILE | cut -d " " -f 1` 
  else
       MD5BACKUP=XX  
  fi

  echo $MD5BACKUP

  wget --no-check-certificate -O ${TMPDIR}/${NAME}.tmp $URL > /dev/null 2>&1

  MD5EPDUMP=`md5sum $EPDUMPFILE | cut -d " " -f 1`
  echo $MD5EPDUMP

  if [ $MD5BACKUP != $MD5EPDUMP ]; then

       mv $EPDUMPFILE $BACKUPFILE
       GITM="$URL backed up on "`date +%d.%m.%Y`


  else
       echo "$NAME already updated"
       rm $EPDUMPFILE
  fi



 exit 0;


















exit 0;
