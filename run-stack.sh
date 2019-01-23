#!/bin/bash -x

aws cloudformation $ACTION \
    --region us-west-2 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=801420687740.dkr.ecr.us-west-2.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-a42d01c3 \
    ParameterKey=Cluster,ParameterValue=default \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:us-west-2:801420687740:listener/app/production-website/06a9810e80594273/880d4a5dde5901b9