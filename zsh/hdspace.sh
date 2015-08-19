#!/bin/sh

size_less=$(df -h | ag backssd | awk '{print $4}')

if true; then
  echo '#[fg=red]dc '$( df -h | ag backssd | awk '{print $4}')

else
  echo '#[fg=yellow]'$( df -h | ag backssd | awk '{print $4}')
fi

