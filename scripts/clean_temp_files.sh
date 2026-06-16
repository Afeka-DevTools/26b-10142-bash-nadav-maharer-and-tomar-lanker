#!/bin/bash
find ./ -name "*.pyc" -delete
find ./ -name "*.class" -delete
find ./ -type d -name "node_modules" -print0 | xargs -0 rm -rf
