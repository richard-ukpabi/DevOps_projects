Error Handling in Shell Scripting

Mini Project - 
Error Handling in Shell Scripting
Error handling is a crucial aspect of scripting that involves anticipating and managing errors that may occur during script execution. These errors could arise from various factors such as incorrect user input, unexpected system behavior, or resource unavailability. Proper error handling is essential for improving the reliability, robustness, and usability of shell scripts.

Implementing Error Handling
When implementing error handling in shell scripting, it's essential to consider various scenarios and develop strategies to handle them effectively. Here are some key steps to think through and implement error handling:

Identify Potential Errors: Begin by identifying potential sources of errors in your script, such as user input validation, command execution, or file operations. Anticipate scenarios where errors may occur and how they could impact script execution.

Use Conditional Statements: Utilize conditional statements (if, elif, else) to check for error conditions and respond accordingly. Evaluate the exit status ($?) of commands to determine whether they executed successfully or encountered an error.

Provide Informative Messages: When errors occur, provide descriptive error messages that clearly indicate what went wrong and how users can resolve the issue.

Handling S3 Bucket Existence Error
In the context of our script to create S3 buckets, an error scenario could arise if the bucket already exists when attempting to create it. To handle this error, we can modify the script to check if the bucket exists before attempting to create it. If the bucket already exists, we can display a message indicating that the bucket is already present.

If you try to run your script more than once, you will end up creating more EC2 instances than required, and S3 bucket creation will fail because the bucket would already exist.

So, you can be as creative as you like, by thinking about the different errors that may occur during script execution and then handle each one carefully.

Here's an updated version of the create_s3_buckets function with error handling for existing buckets:


Copy
# Function to create S3 buckets for different departments
create_s3_buckets() {"\n    company=\"datawise\"\n    departments=(\"Marketing\" \"Sales\" \"HR\" \"Operations\" \"Media\")\n    \n    for department in \"${departments[@]"}"; do
        bucket_name="${company}-${department}-Data-Bucket"
        
        # Check if the bucket already exists
        if aws s3api head-bucket --bucket "$bucket_name" &>/dev/null; then
            echo "S3 bucket '$bucket_name' already exists."
        else
            # Create S3 bucket using AWS CLI
            aws s3api create-bucket --bucket "$bucket_name" --region your-region
            if [ $? -eq 0 ]; then
                echo "S3 bucket '$bucket_name' created successfully."
            else
                echo "Failed to create S3 bucket '$bucket_name'."
            fi
        fi
    done
}
In this updated version, before attempting to create each bucket, we use the aws s3api head-bucket command to check if the bucket already exists. If the bucket exists, a message is displayed indicating its presence. Otherwise, the script proceeds to create the bucket as before. This approach helps prevent errors and ensures that existing buckets are not recreated unnecessarily.

Congratulations for reaching this milestone.


In summarizing, Through this mini project, I learned how essential error handling is for building reliable and predictable shell scripts, especially when working with AWS resources. I explored how to anticipate potential failures—such as invalid user input, failed commands, or resource conflicts—and use conditional statements to detect and respond to these issues gracefully. By checking command exit statuses, validating assumptions, and providing clear, informative messages, scripts become far more robust and user‑friendly. Implementing error handling in the S3 bucket creation function reinforced the importance of verifying resource existence before performing actions, preventing duplicate buckets and unnecessary EC2 instances. Overall, this project strengthened my understanding of writing safer, smarter automation scripts that behave consistently even when unexpected conditions occur. 


Brief Summary of Everything We Covered About Error Handling in Shell Scripts
🔹 1. Exit codes are the foundation
Every command returns an exit code:

0 = success

non‑zero = failure

You can check it manually:

Using if command; then … fi

Or using $? (exit code of last command)

This is the basis of all shell error handling.

🔹 2. Redirecting output to stderr
You learned what:

>&2 → send output to stderr

2>>error.log → append stderr to a file

&>/dev/null → hide all output (stdout + stderr)

This is used to:

hide AWS CLI noise

print clean error messages

separate normal output from error output
🔹 3. Understanding the AWS bucket check
You learned what this means:

bash
aws s3api head-bucket --bucket "$bucket_name" &>/dev/null
It translates to:

“Check if the bucket exists.
Don’t show any output.
Use the exit code to decide what to do next.”

This is why it works inside an if statement.

🔹 4. Manual error handling in your script
Your script uses:

if aws ...; then → checks success

if [ $? -eq 0 ]; then → checks exit code

echo "ERROR..." >&2 → prints errors properly

This is basic but valid error handling.

🔹 5. What set -euo pipefail does
You learned the meaning of each flag:

-e → exit on any error

-u → error on undefined variables

pipefail → pipelines fail if any command fails

With it → script is safe and predictable  
Without it → script continues even after failures

You can run the script without it, but:

failures may go unnoticed

typos become silent bugs

AWS errors won’t stop the script

🔹 6. Why strict mode is recommended
Using set -euo pipefail prevents:

half‑created infrastructure

silent AWS failures

debugging nightmares

undefined variable bugs

It’s the standard for production shell scripts.

