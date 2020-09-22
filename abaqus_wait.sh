#!/bin/sh

JOB=$1


wait_for_abaqus() {
  file="$1.sta"
  tail -f "$file" | grep  --quiet --line-regexp --fixed-strings --max-count=1 --regexp=' THE ANALYSIS HAS NOT BEEN COMPLETED' --regexp=' THE ANALYSIS HAS COMPLETED SUCCESSFULLY'
}

wait_for_abaqus "$JOB"



