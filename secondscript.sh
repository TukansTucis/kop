#!/bin/bash

echo "Date: $(date)"
echo "System uptime: $(uptime -p)"

mkdir -p test_dir

touch test_dir/test.txt
