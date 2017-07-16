#!/bin/bash
set -x
function check_start {
    if [ $1 -ne 0 ]; then
        echo "Failed to start $2: $1"
        exit $1
    fi
}

function check_running {
    ps aux | grep $1 | grep -q -v grep
    status=$?
    if [ $status -ne 0 ]; then
        echo "$1 stopped. Terminating"
        exit $status
    fi
}

function collect_stdout {
    #sed -e '/^$/d' |  jq -R . | sed -e 's/^/{"'"$1"'":/' -e 's/$/}/' | stdbuf -oL fluent-bit -f 10 -v -i stdin -o forward://fluentd:24224 #segmentation fault...
    logger --rfc5424 -n fluentd -P 5140 -t $1
    #cat
}
