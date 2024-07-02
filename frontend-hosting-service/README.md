# frontend-hosting-service

This service contains the infrastructure as code to host a frontend application in AWS. The project can be deployed with the SAM CLI. 

The AWS resources provisioned by the service are defined in the `template.yaml` file. 

## Overview of service resources
This service provisions an S3 bucket with public access permissions which allow a website can be served from it.

### Requirements

- [SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)

## Deploy this service
1. Delete the `samconfig.toml` file. 
2. Ensure you have your AWS credentials loaded as environment variables. You can test this by running `aws sts get-caller-identity --query 'Account' --output text` and checking if there is an account-id outputted and if it is correct. 
3. Run `sam build`
4. Run `sam deploy --guided`, fill in the parameters, and select deploy the changeset.

The first command will build the source of your application. The second command will package and deploy your application to AWS, with a series of prompts:

* **Stack Name**: Just call this your project name. 
* **AWS Region**: The AWS region you want to deploy your app to - `eu-west-1` is fine.
* **Confirm changes before deploy**: **Yes** - it's very valuable to be able to review a list of the provisioned resources before they are deployed.
* **Allow SAM CLI IAM role creation**: Yes, they allows SAM to create IAM roles for some resources. Be default they have low privileges. 
* **Save arguments to samconfig.toml**: Yes. This saves your deploy config to `samconfig.toml` so in future your can just run `sam-deploy` without specifying parameters to deploy changes to your application.

You will be prompted to keep your bucket name as default (`frontend-hosting-service-${account-id}-${region}`) or provide a new one, you should keep this as default or the upload and rollback scripts won't work. 


## Extending this service
SAM is an extension of AWS CloudFormation that uses a simpler syntax for configuring serverless applciations. For resources not included in [the SAM specification](https://github.com/awslabs/serverless-application-model/blob/master/versions/2016-10-31.md), you can use standard [AWS CloudFormation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html) resource types.


## Cleanup
To delete your provisioned infrastructure you can run:

```bash
sam delete --stack-name frontend-hosting-service
```

## Resources

[AWS SAM docs](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html).
