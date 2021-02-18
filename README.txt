+---------------------+
| Simple Port scanner |
+---------------------+

A simple port scanner that uses only POSIX-compliant utilities. This means it should run on:

* Linux
* BSD
* Darwin
* Solaris? AIX?

`sp' is a thin wrapper around `netcat'.

'Why not use netcat then?', I can hear you ask. netcat can be intimidating for people who have never
used it before, so `sp' aims to be an easy-to-use, straight-forward utility that obscures having to learn
the `nc' command.

HOWTO

sp [hostname] [port[s]] [-u|--udp]

LICENSE

Proudly Free Software, this software is licensed under the terms of the Mozilla Public License Version 2.0.
