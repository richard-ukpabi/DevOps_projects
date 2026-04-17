#!/bin/bash

# AWS IAM Manager Script for CloudOps Solutions
# This script automates the creation of IAM users, groups, and permissions

# Define IAM User Names Array
IAM_USER_NAMES=("devops1" "devops2" "devops3" "devops4" "devops5")

# Function to create IAM users
create_iam_users() {
    echo "Starting IAM user creation process..."
    echo "-------------------------------------"

    for user in "${IAM_USER_NAMES[@]}"; do
        echo "Creating IAM user: $user"
        aws iam create-user --user-name "$user" >/dev/null 2>&1

        if [ $? -eq 0 ]; then
            echo "Success: User $user created"
        else
            echo "Warning: User $user may already exist or creation failed"
        fi
    done

    echo "------------------------------------"
    echo "IAM user creation process completed."
    echo ""
}

# Function to create admin group and attach policy
create_admin_group() {
    echo "Creating admin group and attaching policy..."
    echo "--------------------------------------------"

    # Check if group already exists
    aws iam get-group --group-name "admin" >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Admin group does not exist. Creating..."
        aws iam create-group --group-name "admin"
    else
        echo "Admin group already exists."
    fi

    # Attach AdministratorAccess policy
    echo "Attaching AdministratorAccess policy..."
    aws iam attach-group-policy \
        --group-name "admin" \
        --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

    if [ $? -eq 0 ]; then
        echo "Success: AdministratorAccess policy attached"
    else
        echo "Error: Failed to attach AdministratorAccess policy"
    fi

    echo "----------------------------------"
    echo ""
}

# Function to add users to admin group
add_users_to_admin_group() {
    echo "Adding users to admin group..."
    echo "------------------------------"

    for user in "${IAM_USER_NAMES[@]}"; do
        echo "Adding $user to admin group..."
        aws iam add-user-to-group --user-name "$user" --group-name "admin"

        if [ $? -eq 0 ]; then
            echo "Success: $user added to admin group"
        else
            echo "Warning: Failed to add $user to admin group"
        fi
    done

    echo "----------------------------------------"
    echo "User group assignment process completed."
    echo ""
}

# Main execution function
main() {
    echo "=================================="
    echo " AWS IAM Management Script"
    echo "=================================="
    echo ""

    # Verify AWS CLI is installed and configured
    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed. Please install and configure it first."
        exit 1
    fi

    # Execute the functions
    create_iam_users
    create_admin_group
    add_users_to_admin_group

    echo "=================================="
    echo " AWS IAM Management Completed"
    echo "=================================="
}

# Execute main function
main

exit 0
