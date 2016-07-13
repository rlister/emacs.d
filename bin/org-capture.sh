#!/bin/bash

## invoke a silent org-capture from shell
data=$(perl -MURI::Escape -e "print uri_escape('$*');")
emacsclient org-protocol://capture://x/${data}