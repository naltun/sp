#!/bin/sh
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

help() {
    echo "USAGE: sp [hostname] [port[s]]"
    echo "Eg. sp scanme.nmap.org 22-100"
}

check_args() {
    [ -z "$1" ] && help && exit 1
    [ -z "$2" ] && help && exit 2
}

run() {
    case "$2" in
        *-*)
            start_port=$(echo "$2" | awk '{split($0, ports, "-"); print ports[1]}')
            end_port=$(echo "$2"   | awk '{split($0, ports, "-"); print ports[2]}')
            for port in $(seq "$start_port" "$end_port"); do
                nc -z "$1" "$port"
            done
            ;;
        *)
            nc -z "$1" "$2"
            ;;
    esac
}

main() {
    check_args "$@"
    run "$@"
}

main "$@"
