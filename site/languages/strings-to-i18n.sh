#!/bin/bash

# strings to ignore
ignore=("languageCode" "languageName" "arguments_list" "arguments_list_icon")

while read line; do

  # start of a new section?
  if echo "${line}" | grep -Eq "^[\s]*\[.+?\]"; then
    section=`echo "${line}" | grep -Eo "\[.+?\]" | sed -E "s|\[\|\]||g"`
    section=`echo $section | sed -E -e "s|Languages\...\.||" -e "s|\.|_|g"`
    if [[ "$newline" -eq "y" ]]; then
      newline=n
    else
      echo
    fi
  elif echo "${line}" | grep -Eiq "^[\s]*[[:alnum:]]+?\s*="; then
    key=`echo "${line}" | grep -Eio "^[\s]*[[:alnum:]]+?\s*=" | sed -E -e "s|\s||g" -e "s|=||"`
    key=`echo "${section}_${key}" | sed -E "s|^Languages_.._||"`
    value=`echo "${line}" | sed -E "s|.*=\s*?(\".*\")|\1|"`

    if [[ ! " ${ignore[@]} " =~ " ${key} " ]]; then   # if key contains string
      echo "[$key]"
      echo "other= $value"
    fi

  elif echo "${line}" | grep -Eq "^\s*#"; then
    echo
    echo "$line"
    newline=y
  fi

done < "$1"
