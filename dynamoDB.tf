resource "aws_dynamodb_table" "terraform_locks" {
  name         = "devsecopsb35-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}