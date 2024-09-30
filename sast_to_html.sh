#!/bin/bash

# Run Snyk test and output the results to a JSON file
snyk test --json > sast_json_output
exit_code=$?

# Check if the exit code indicates success or failure
if [ $exit_code -ne 0 ]; then
    echo "Snyk test failed with exit code $exit_code. Review the results before proceeding."
    exit 1
else
    # Convert the JSON results into an HTML report if the test was successful
    snyk-to-html sast_json_output -o sast_html_report
    echo "Snyk test passed. HTML report generated at sast_html_report"
fi
