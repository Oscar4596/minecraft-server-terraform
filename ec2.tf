# Minecraft Server on Ubuntu 22.04 EC2 Instance
# Docs:
# <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance>

resource "aws_instance" "minecraft_server" {
  ami                         = "ami-0c7217cdde317cfec" # Ubuntu Jammy 22.04
  instance_type               = "t2.medium"             # RAM: 4 | vCPU: 2
  key_name                    = "test"
  associate_public_ip_address = true
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.minecraft_server.id]

  user_data = <<-EOF
              #!/bin/bash
              set -e
              sudo apt update
              sudo apt install -y openjdk-17-jre
              mkdir minecraft_server
              cd minecraft_server
              wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/435/downloads/paper-1.20.4-435.jar -O server.jar
              echo "eula=true" > eula.txt
              java -Xms2G -Xmx4G -jar server.jar nogui
              EOF
}
