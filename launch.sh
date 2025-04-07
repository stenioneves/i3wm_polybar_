#!/bin/bash

# Esperar alguns segundos para garantir que o sistema esteja completamente inicializado
sleep 2

# Terminate already running bar instances
killall -q i3bar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Assegurar que o xrdb está carregado
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Esperar um pouco mais para garantir que o pywal tenha sido aplicado
if pidof wal >/dev/null; then
    while pidof wal >/dev/null; do sleep 0.5; done
    sleep 1
fi

# Launch Polybar, using default config location ~/.config/polybar/config
polybar main &

echo "Polybar launched..."
