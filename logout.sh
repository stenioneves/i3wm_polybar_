#!/bin/bash

yad --question \
  --title="Sair" \
  --text="<b>Deseja encerrar sua sessão?</b>" \
  --button="Não:1" \
  --button="Sim:0" \
  --timeout=30 \
  --timeout-indicator=top

case $? in
  0) i3-msg exit ;;     # Confirm
  1) exit 0 ;;          # Cancel
  70) i3-msg exit ;;    # Timeout (execute logout)
  *) exit 0 ;;          # Window closed
esac
