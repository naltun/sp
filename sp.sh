#!/bin/sh
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

help() {
    echo "USAGE: sp [hostname] [port[s]] [-u|--udp]"
    echo "Eg. sp scanme.nmap.org 22-100"
}

check_args() {
    [ -z "$1" ] && help && exit 1
    [ -z "$2" ] && help && exit 2
}

check_host_avail() {
    if ping -c 1 -W 1 "$1" >/dev/null 2>&1; then
        return
    else
        echo "$1 is not available."; exit 3
    fi
}

construct_scan() {
    scan="nc -z"
    [ "$3" = "-u" ] || [ "$3" = "--udp" ] && scan="$scan -u"
    echo "$scan"
}

run() {
    scan_cmd=$(construct_scan "$@")
    case "$2" in
        *-*)
            start_port=$(echo "$2" | awk '{split($0, ports, "-"); print ports[1]}')
            end_port=$(echo "$2" | awk '{split($0, ports, "-"); print ports[2]}')
            for port in $(seq "$start_port" "$end_port"); do
                eval "$scan_cmd $1 $port"
            done
            ;;
        *)
            verify_port "$2"
            eval "$scan_cmd $1 $2"
            ;;
    esac
}

main() {
    check_args "$@"
    check_host_avail "$1"
    run "$@"
}

main "$@"
