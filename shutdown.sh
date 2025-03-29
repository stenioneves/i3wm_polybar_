#!/bin/bash

yad --question \
  --title="Desligar o sistema" \
  --text="<b>Deseja desligar o computador?</b>" \
  --button="Não:1" \
  --button="Sim:0" \
  --timeout=30 \
  --timeout-indicator=top

case $? in
  0) shutdown -h now ;;  # Confirm
  1) shutdown -c ;;      # Cancel
  70) shutdown -h now ;; # Timeout (execute shutdown)
  *) shutdown -c ;;      # Window closed
esac
