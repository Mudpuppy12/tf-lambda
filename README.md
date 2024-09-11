# tf-lambda

Example of using Terraform, a Lambda, and Lambda Layers. Project setup / structure / etc. Send a number to API endpoint
and it will tell you if it's odd or not.

## Usage
    # cd my-service
    # make
    # terraform init
    # terraform apply

# Test
    curl -X POST -H "Content-Type: application/json" -d '{"number": 2}' <API ENDPOINT>
# Links

* https://medium.com/@heenriquecds/terraform-creating-node-js-lambda-functions-with-packages-cddc9a91cf93
* https://medium.com/twodigits/setting-up-a-nodejs-project-for-aws-lambda-and-layers-with-terraform-c4b3488b2794


