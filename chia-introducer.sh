#!/bin/bash

cd ~/chia-blockchain
. ./activate
chia show -a introducer-va.chia.net:8444
chia show -a introducer-or.chia.net:8444
chia show -a introducer-eu.chia.net:8444
