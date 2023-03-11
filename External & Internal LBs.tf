# External LB
resource "aws_lb" "external-elb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-sg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}

resource "aws_lb_target_group" "external-elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "external-elb" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.webserver2.id
  port             = 80

  depends_on = [
    aws_instance.webserver2
  ]
}

resource "aws_lb_target_group_attachment" "external-elb2" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.webserver1.id
  port             = 80

  depends_on = [
    aws_instance.webserver1
  ]
}

resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
}

resource "aws_lb_listener" "external-elb2" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
}


# Internal LB
resource "aws_lb" "internal-elb" {
  name               = "Internal-LB"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.appserver-sg.id]
  subnets            = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
}

resource "aws_lb_target_group" "internal-elb" {
  name     = "IntALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "internal-elb" {
  target_group_arn = aws_lb_target_group.internal-elb.arn
  target_id        = aws_instance.appserver1.id
  port             = 80

  depends_on = [
    aws_instance.appserver1
  ]
}

resource "aws_lb_target_group_attachment" "internal-elb2" {
  target_group_arn = aws_lb_target_group.internal-elb.arn
  target_id        = aws_instance.appserver2.id
  port             = 80

  depends_on = [
    aws_instance.appserver2
  ]
}

resource "aws_lb_listener" "internal-elb" {
  load_balancer_arn = aws_lb.internal-elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.internal-elb.arn
  }
}