#  matlab scripts

## comsol_start.sh
Script to start comsol matlab.
    - Since comsol chooses a socket port and outputs it
    - This scripts finds the port from output and then matlab can connect to that port

## abaqus_wait.sh
On Ubuntu  18.04 the Abaqus script does not exit when the job is done.
See https://askubuntu.com/questions/1062058/process-hangs-before-termination-with-ubuntu-18-04

This script will wait for the job by looking at the .sta file

## Support
Please create issues if you want enhancements to the script.
