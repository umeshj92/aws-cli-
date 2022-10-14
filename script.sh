pipeline {
  agent any
  environment {
    AWS_DEFAULT_REGION="us-east-1"
  }
  stages {
    stage('Hello') {
      steps {
        sh '''
          aws --version
          #! /bin/bash

# Given string 
string="database-1,database-2"

# Setting IFS (input field separator) value as ","
IFS=','

# Reading the split string into array
read -ra arr <<< "$string"

# Print each value of the array by using the loop
for val in "${arr[@]}";
do
  echo "Stopping: ${val}" 
           aws rds stop-db-instance --db-instance-identifier ${val} --region us-east-1 
done
        '''
      }
    }
  }
}
