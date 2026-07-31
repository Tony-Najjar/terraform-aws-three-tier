resource "aws_db_subnet_group" "main" {

  name = "${var.project_name}-db-subnet-group"

  subnet_ids = [
    var.private_subnet_1,
    var.private_subnet_2
  ]

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}


resource "aws_db_instance" "main" {

  identifier = "${var.project_name}-database"

  engine = "mysql"
  port   = 3306

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  username = var.db_username

  password = var.db_password


  db_subnet_group_name = aws_db_subnet_group.main.name


  vpc_security_group_ids = [
    var.database_security_group_id
  ]


  publicly_accessible = false


  skip_final_snapshot = true


  backup_retention_period = 7


  tags = {
    Name = "${var.project_name}-database"
  }
}
