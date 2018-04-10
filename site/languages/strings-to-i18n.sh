#!/bin/bash

while read line; do

  # start of a new section?
  if echo "${line}" | grep -Eq "^[\s]*\[.+?\]"; then
    section=`echo "${line}" | grep -Eo "\[.+?\]" | sed -E "s|\[\|\]||g"`
    section=`echo $section | sed -E "s|Languages\...\.||"`
    if [[ "$newline" -eq "y" ]]; then
      newline=n
    else
      echo
    fi
  elif echo "${line}" | grep -Eiq "^[\s]*[[:alnum:]]+?\s*="; then
    key=`echo "${line}" | grep -Eio "^[\s]*[[:alnum:]]+?\s*=" | sed -E -e "s|\s||g" -e "s|=||"`
    key="$section.$key"
    value=`echo "${line}" | sed -E "s|.*=\s*?(\".*\")|\1|"`

    echo "[$key]"
    echo "other= $value"
  elif echo "${line}" | grep -Eq "^\s*#"; then
    echo
    echo "$line"
    newline=y
  fi

done < strings.en.toml
