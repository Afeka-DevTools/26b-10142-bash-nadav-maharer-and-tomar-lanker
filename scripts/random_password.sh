#!/bin/bash
password=$(tr -dc 'a-zA-Z0-9!@#$%^&*_' < /dev/urandom | head -c 10)
re_special='[!@#$%^&*_]'
until [[ "$password" =~ [a-z] ]] && [[ "$password" =~ [A-Z] ]] && [[ "$password" =~ [0-9] ]] && [[ "$password" =~ $re_special ]]; do
    password=$(tr -dc 'a-zA-Z0-9!@#$%^&*_' < /dev/urandom | head -c 10)
done
echo "$password"
