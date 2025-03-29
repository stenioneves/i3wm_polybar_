#!/bin/bash

yad --question \
  --title="Reiniciar" \
  --text="<b>Deseja reiniciar o sistema?</b>" \
  --button="Cancelar:1" \
  --button="Confirmar:0" \
  --timeout=30 \
  --timeout-indicator=top

case $? in
  0) shutdown -r now ;;  # Confirm
  1) shutdown -c ;;      # Cancel
  70) shutdown -r now ;; # Timeout (execute reboot)
  *) shutdown -c ;;      # Window closed
esac
