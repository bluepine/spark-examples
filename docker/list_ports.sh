#!/bin/bash
find ./copy/ -type f -exec grep  -e ':[0-9]' /dev/null {} \;
find ./copy/ -type f -exec grep -e 'port[[:space:]]' /dev/null {} \; | grep -v export
find ./copy/ -type f -exec grep -e 'port$' /dev/null {} \;

