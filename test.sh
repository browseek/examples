#!/bin/bash

# Check if Ansible is installed
if ! command -v ansible &> /dev/null
then
    echo "Ansible is not installed. Please run install.sh first."
    exit 1
fi

# Run the Ansible playbook
ansible-playbook e2e_tests.yml

# Check the exit status
if [ $? -eq 0 ]; then
    echo "All tests passed successfully!"
else
    echo "Some tests failed. Please check the output above."
    exit 1
fi
