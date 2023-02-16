# 1.This is used to save your AWS credential variables
# export AWS_ACCESS_KEY_ID=""
# export AWS_SECRET_ACCESS_KEY=""
# export AWS_DEFAULT_REGION=us-east-1

# 2. To confirm your account is properly linked 
# -aws sts get-caller-identity

# 3. To set billing alarm
# -aws sns create-topic --name billing-alarm
# -aws sns subscribe \
#     --topic-arn TopicARN \
#     --protocol email \
#     --notification-endpoint your@email.com
# -aws cloudwatch put-metric-alarm --cli-input-json file://aws/json/alarm_config.json

# 4. To set budget
# -aws sts get-caller-identity --query Account --output text
# -aws budgets create-budget \
#     --account-id AccountID \
#     --budget file://aws/json/budget.json \
#     --notifications-with-subscribers file://aws/json/budget-notifications-with-subscribers.json


# 5. This is to install aws cli
# -curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# -unzip awscliv2.zip
# -sudo ./aws/install