#!/bin/bash

# Define environments to process
environments=("dev" "prod" "qqa")
REGION=“eu-central-1”

# Process each environment
for env in "${environments[@]}"; do
  echo "Processing environment: $env"
  
  # Fetch instance IDs for current environment
  instance_ids=$(aws ec2 describe-instances \
    --filters "Name=tag:Environment,Values=$env" "Name=tag:Role,Values=web" "Name=instance-state-name,Values=running" \
    --query 'Reservations[*].Instances[*].InstanceId' \
    --output text)
  
  # Check if any instances found
  if [ -z "$instance_ids" ]; then
    echo "No running web instances found for environment: $env"
    continue
  fi
  
  # Sort instance IDs deterministically
  sorted_ids=($(echo "$instance_ids" | tr '\t' '\n' | sort))
  
  # Rename instances sequentially for this environment
  counter=1
  for id in "${sorted_ids[@]}"; do
    name="$env-web-$(printf "%02d" $counter)"
    echo "Tagging $id as $name"
    aws ec2 create-tags --resources "$id" \
      --tags Key=Name,Value="$name"
    ((counter++))
  done
  
  echo "Completed processing $env environment"
  echo "---"
done

echo "All environments processed"