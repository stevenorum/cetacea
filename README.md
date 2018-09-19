# cetacea
Pipeline for building Docker images.  I use this to generate AmazonLinux images for CodeBuild, as the built-in ones only support Windows and Ubuntu, but it could be used to generate any sort of image by updating the Dockerfile.

## To use
### Set up an AWS account
Fairly obvious, but if you don't have an AWS account, go and set one up.  [Here are instructions.](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)
### Clone this repo
Clone this repo so you have a copy in your github account.
### Create the CloudFormation stack
For general info on how to set up the CF stack, see the "codepipeline-github.cf.json" section of the [stevenorum/cloudformation-templates README](https://github.com/stevenorum/cloudformation-templates).  Follow those instructions, but use [codepipeline-docker.cf.json](https://github.com/stevenorum/cetacea/blob/master/codepipeline-docker.cf.json) instead of the template in that package.
### Use the image in CloudFormation stacks
Assuming you used the template without any changes, you can now refer to this image in other CloudFormation templates with ```{"Fn::ImportValue":"amazonlinux-codebuild-image-$STACK_NAME"}```, where ```$STACK_NAME``` is, fairly obviously, the name of the stack you created to generate the image.  I generally just name the stack "cetacea" and most of my example templates will assume that import is available.
### Use the image elsewhere
There are instructions on pulling images for use outside of AWS services [in the AWS ECR docs](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-pull-ecr-image.html).  The image name will be ```$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/cetacea:$STACK_NAME```, where ```$ACCOUNT_ID``` is your 12-digit AWS account ID and ```$REGION``` is the AWS region name (for example, "us-east-1").

## Why the name "cetacea"?
Docker's logo is a whale and cetacea is [the taxonomic category containing whales](https://en.wikipedia.org/wiki/Cetacea).
