#!/bin/bash

JOB=$1


wait_for_abaqus() {
  file="$1.sta"
  grep  --quiet --line-regexp --fixed-strings --regexp=' THE ANALYSIS HAS NOT BEEN COMPLETED' --regexp=' THE ANALYSIS HAS COMPLETED SUCCESSFULLY' <(tail -f "$file")
}

wait_for_abaqus "$JOB"



