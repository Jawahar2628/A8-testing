#!/bin/bash

folder=./flyte

if [ -d "$folder" ]; then
    # Check if run-registration.sh exists in the directory
    if [ -x "$folder/run-registration.sh" ]; then
        # Execute run-registration.sh in the directory
        echo "Executing run-registration.sh in $folder"
        cd "$folder"
        ./run-registration.sh
        cd ..
    else
        echo "Warning: run-registration.sh not found or not executable in $folder"
    fi
fi