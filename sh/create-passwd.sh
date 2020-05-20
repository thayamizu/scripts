#!/bin/bash
cat /dev/urandom | LC_CTYPE=C tr -dc '12345678abcdefghijkmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ+\-!' | fold -w 12 | grep -E '[12345678]' | grep -E '[,\.+\-\!]' | head -5