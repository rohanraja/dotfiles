#!/bin/zsh -f

ostype() { echo $OSTYPE | tr '[A-Z]' '[a-z]'; }

export SHELL_PLATFORM='unknown'

case "$(ostype)" in
	*'linux'*	) SHELL_PLATFORM='linux'	;;
	*'darwin'*	) SHELL_PLATFORM='osx'		;;
	*'bsd'*		) SHELL_PLATFORM='bsd'		;;
esac

shell_is_linux() { [[ $SHELL_PLATFORM == 'linux' || $SHELL_PLATFORM == 'bsd' ]]; }
shell_is_osx()   { [[ $SHELL_PLATFORM == 'osx' ]]; }
shell_is_bsd()   { [[ $SHELL_PLATFORM == 'bsd' || $SHELL_PLATFORM == 'osx' ]]; }

netspeed() {
  sleeptime="0.5"
  # if True then
	if shell_is_osx; then
    iface="en0" # Todo: Auto detect active interface

    RXB=$(netstat -i -b | grep -m 1 $iface | awk '{print $7}')
    TXB=$(netstat -i -b | grep -m 1 $iface | awk '{print $10}')
    sleep "$sleeptime"
    RXBN=$(netstat -i -b | grep -m 1 $iface | awk '{print $7}')
    TXBN=$(netstat -i -b | grep -m 1 $iface | awk '{print $10}')
  else
    iface="eth0"
    RXB=$(</sys/class/net/"$iface"/statistics/rx_bytes)
    TXB=$(</sys/class/net/"$iface"/statistics/tx_bytes)
    sleep "$sleeptime"
    RXBN=$(</sys/class/net/"$iface"/statistics/rx_bytes)
    TXBN=$(</sys/class/net/"$iface"/statistics/tx_bytes)
  fi
  RXDIF=$(echo "$((RXBN - RXB)) / 1024 / ${sleeptime}" | bc )
  TXDIF=$(echo "$((TXBN - TXB)) / 1024 / ${sleeptime}" | bc )

  if [ $RXDIF -gt 1024 ]; then
    RXDIF_ECHO="↓ $(echo "scale=1;${RXDIF} / 1024" | bc)M/s"
  else
    RXDIF_ECHO="↓ ${RXDIF}K/s"
  fi
  if [ $TXDIF -gt 1024 ]; then
    TXDIF_ECHO="↑ $(echo "scale=1;${TXDIF} / 1024" | bc)M/s"
  else
    TXDIF_ECHO="↑ ${TXDIF}K/s"
  fi

  echo -e "#[fg=colour221]${RXDIF_ECHO} #[fg=green]${TXDIF_ECHO}"
  return 0
}

print $(netspeed)
