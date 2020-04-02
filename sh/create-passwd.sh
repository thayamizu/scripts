#!/bin/bash
 cat /dev/urandom | LC_CTYPE=C tr -dc '[:alnum:]' | head -c 12