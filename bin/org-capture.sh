#!/bin/bash
## invoke a silent org-capture from shell

## ensure we get correct emacsclient
export PATH=/usr/local/bin:/usr/bin

## escape text to make it URI-safe
data=$(perl -MURI::Escape -e "print uri_escape('$*');")

## send to org-mode
emacsclient org-protocol://capture://x/${data}