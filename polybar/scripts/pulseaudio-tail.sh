#!/bin/sh

update_sink() {
    sink=$(pacmd list-sinks | sed -n '/\* index:/ s/.*: //p')
}

volume_up() {
    update_sink
    pactl set-sink-volume "$sink" +2%
}

volume_down() {
    update_sink
    pactl set-sink-volume "$sink" -2%
}

volume_mute() {
    update_sink
    pactl set-sink-mute "$sink" toggle
}

volume_print() {
    update_sink

    active_port=$(pacmd list-sinks | sed -n "/index: $sink/,/index:/p" | grep active)
    if echo "$active_port" | grep -q speaker; then
        icon="蓼"
	output=1
    elif echo "$active_port" | grep -q headphones; then
        icon=""
	output=2
    else
        icon=""
	output=3
    fi
    

    muted=$(pamixer --sink "$sink" --get-mute)

    if [ "$muted" = true ]; then
    	case "$output" in
		1)echo "遼";;
		2)echo "ﳌ";;
	esac
	
    else
        echo "$icon $(pamixer --sink "$sink" --get-volume)%"
	#echo "$(pamixer --sink "$sink" --get-volume)%"
    fi
}

listen() {
    volume_print

    pactl subscribe | while read -r event; do
        if echo "$event" | grep -qv "Client"; then
            volume_print
        fi
    done
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac
