provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "spring_boot_instance" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (Change based on your needs)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer_key.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo yum install docker -y",
      "sudo systemctl start docker",
      # "sudo docker run -d -p 8080:8080 <your-springboot-docker-image>"
      "sudo docker run -d -p 8080:8080 spring-boot-terraform-example-app"
    ]
  }

  tags = {
    Name = "spring-boot-example"
  }
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "terraform-springboot-key"
  public_key = file(var.public_key_path)
}

output "instance_ip" {
  value = aws_instance.spring_boot_instance.public_ip
}