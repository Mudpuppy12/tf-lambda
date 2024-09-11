# Fetch our file from the local file system

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "./src/handlers/is-odd-lambda/dist/index.js"
  output_path = "./src/handlers/is-odd-lambda/dist/index.zip"
}

#Create our lambda function
resource "aws_lambda_function" "is-odd" {
  filename      = "./src/handlers/is-odd-lambda/dist/index.zip"
  function_name = "is-odd"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256
  layers           = [aws_lambda_layer_version.is_odd_layer.arn]

  runtime = "nodejs18.x"

}

# Create layer for lambda
resource "aws_lambda_layer_version" "is_odd_layer" {
  filename            = "./src/layers/util-layer/util-layer.zip"
  layer_name          = "util_layer"
  compatible_runtimes = ["nodejs18.x", "nodejs20.x"]
  source_code_hash    = filebase64sha256("./src/layers/util-layer/util-layer.zip")
}
