#!/bin/bash

grep -o -i "$1" $2 | wc -l
