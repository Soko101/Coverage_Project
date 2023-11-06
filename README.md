# Coverage_Project
- Manually created two high coverage test suites, one for each of two languages spanning different application domains
- and programming languages which provided overall coverage and created new images. 
- Developed a debugging support tool by implementing delta debugging to minimize “interesting”
- sets which resulted in the reduction of effort associated with software maintenance

**Script 1: coverage project**

This script is designed for a code coverage project and has the following components:

1. **Argument Checking**: The script first checks if a program to run is provided as an argument. If not, it displays a usage message and exits.

2. **Test Counting**: It counts the number of tests by counting the input files located in the "tests/inputs" directory.

3. **Timeout Calculation**: It calculates a timeout time for each test based on the maximum execution time (5 minutes, with a 1-second buffer) divided by the number of tests.

4. **Temporary File**: It creates a temporary file called "temp_out.tmp" to store the actual output of each test.

5. **Test Loop**: It then iterates over each test input file, sorts them alphabetically, and runs the program with the input file as an argument using the `timeout` command. It captures the actual output and stores it in the temporary file.

6. **Output Comparison**: It compares the actual output with the expected output for each test using the `diff` command. If the outputs match, it prints "TEST number: PASS"; otherwise, it prints "TEST number: FAIL."

7. **Temporary File Cleanup**: After each test, it removes the temporary file.

8. **Overall Functionality**: This script essentially automates running a set of tests, comparing the program's output with the expected output, and reporting the results (pass or fail) for each test.

**Script 2: is-interesting.sh**

This script appears to be related to managing source code and patches. It performs the following actions:

1. **Backup Copy**: It creates a backup copy of the original source file named "wireworld-copy.c" by copying "wireworld-original.c" to "wireworld-copy.c."

2. **Patch Application**: It then processes each patch file provided as arguments. It uses the `patch` command to apply the patches to the "wireworld-copy.c" file.

3. **Compilation**: After applying all the patches, it attempts to compile the modified source code using the `gcc` command.

4. **Exit Status Check**: It checks the exit status of the compilation. If the compilation is successful (exit code 0), it exits with a status of 0. Otherwise, it exits with a status of 1.

In summary, the second script is used for managing source code patches and checking whether the compilation is successful, while the first script is used for automating testing and reporting pass/fail results based on comparisons between expected and actual outputs.
