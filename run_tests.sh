#!/bin/bash

# Check if the program to run is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 program-to-run"
    exit 1.
fi

# Count the number of tests
num_tests=$(ls tests/inputs/*.input | wc -l)

# max_time is 5 minutes - 1 second
max_time=299

# timeout time is max_time / num_tests
timeout_time=$(($max_time / $num_tests))

# temp file to store the actual output
temp_file=temp_out.tmp



# Run each test input file and compare the output with the expected output
# Sort Alphabetically and ascending order
for input_file in $(ls tests/inputs/*.input | sort -V); do
    expected_output_file=$(echo "$input_file" | sed 's/inputs/outputs/')
    expected_output_file=$(echo "$expected_output_file" | sed 's/input/output/')

    # Run the program with the input file as the argument and capture the output
    actual_output=$(timeout "$timeout_time"s "$1" "$input_file" 2>/dev/null)

    # put actual output in a temp file
    echo "$actual_output" >$temp_file

    # Compare the actual output with the expected output
    # number=$(echo "$input_file" | sed 's/.*test_//'); also removes the .input
    number=$(echo "$input_file" | sed 's/.*test_//' | sed 's/.input//')
    # 
    if diff -wB "$expected_output_file" "$temp_file" >/dev/null; then
        echo "TEST $number: PASS"
    else
        echo "TEST $number: FAIL"
    fi
done

# remove the temp file
rm -f "$temp_file"