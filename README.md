# Terraform_pipeline
Building Pipeline using Terraform:
<br>
This involves using Terraform to set up and manage a pipeline that processes articles collected in a CSV file. The pipeline is designed to run two lambda functions. The first lambda function reads and displays the contents of the CSV file, while the second lambda function extracts a specific keyword from the contents and displays it as the output. These lambda functions are scheduled to run every 5 minutes, and Terraform is used to create and manage the infrastructure required to execute these functions at the scheduled intervals.
