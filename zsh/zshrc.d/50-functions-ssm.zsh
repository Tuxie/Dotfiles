function ssm-list {
    aws ec2 describe-instances --output text --query "Reservations[*].Instances[*].{a:(Tags[?Key=='"'Name'"'].Value)[0],b:State.Name,c:InstanceId}"
}

function ssm-id {
    aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" "Name=instance-state-name,Values=running" --output text --query "Reservations[0].Instances[0].InstanceId"
}

function ssm {
    aws ssm start-session --target $(ssm-id $1)
}

function ssm-pf {
    aws ssm start-session --target "$(ssm-id $1)" --document-name AWS-StartPortForwardingSession --parameters "portNumber"="$2","localPortNumber"="$3"
}
