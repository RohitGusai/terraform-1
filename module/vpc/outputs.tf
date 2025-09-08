output "vpc_id" {
    value = aws_vpc.main.id
}

locals {
    public_subnet_for = {for key , config in local.public_subnet : key => {
        subnet_id = aws_subnet.public[key].id
        az = aws_subnet.public[key].availability_zone
    }
    }
    
    private_subnet_for = {for key , config in local.private_subnet : key => {
        subnet_id = aws_subnet.public[key].id
        az = aws_subnet.public[key].availability_zone
    }
    }
}


output "public"{
    value = local.public_subnet_for
}

output "private" {
    value = local.private_subnet_for
}



