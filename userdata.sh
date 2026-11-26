#!/bin/bash

# Generate CPU load for 5 minutes
for i in 1 2; do
    timeout 300s yes > /dev/null &
done
