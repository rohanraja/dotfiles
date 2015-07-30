!#/bin/bash

function chrome-reload()
{
  chrome_cli list tabs
  
  tabid=chrome_cli list links | ag :3001 | grep -o ':[0-9]\+]'
  

}
