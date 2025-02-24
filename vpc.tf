


data "aws_vpc" "existing_ce9_vpc" {
 filter {
   name   = "tag:Name"
   values = ["arpita-test-tr-vpc"]
 }
}

data "aws_subnet" "existing_ce9_pub_subnet" {
 filter {
   name   = "tag:Name"
   values = ["arpita-test-tr-vpc-public-us-east-1b"]
 }
}