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

main() {
    check_args "$@"
}

main "$@"
