#!/bin/bash

echo "CHECKING IF CHIA IS RUNNING"
sleep 1
if [[ $(pgrep -c chia) -gt 1 ]]; then
        echo -e "CHIA RUNNING, EXITING.\nSTOP CHIA, DEACTIVATE, AND RUN AGAIN.\n"
        echo "Run the following:"
        echo "chia stop -d all"
        echo "deactivate"
        echo "cd"
        echo "chia-upgrade.sh"
        exit 1
fi

echo "CHIA NOT RUNNING, CONTINUING"
echo "Waiting for 3 seconds..."
sleep 3
deactivate
cd ~/chia-blockchain
git fetch
git checkout latest
git reset --hard FETCH_HEAD --recurse-submodules
git status

sh install.sh
. ./activate

chia init

echo "DONE. JUST RUN:"
echo "chia start farmer"
