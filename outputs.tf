output "lambda_read_result" {
  value = module.Lambda_read_invoke.lambda_result
}

output "lambda_extract_result" {
  value = module.Lambda_extract_invoke.lambda_result
}