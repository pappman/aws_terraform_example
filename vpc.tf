resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "Instance VPC"
    }
}
resource "aws_subnet" "public-subnet-zone-a" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet}"
    availability_zone = "${var.zone_1}"

    tags {
        Name = "Public Subnet"
    }
}
resource "aws_subnet" "private-subnet" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet}"
    availability_zone = "${var.zone_1}"

    tags {
        Name = "Private Subnet"
    }
}
resource "aws_route_table" "public-subnet-zone-a" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet Zone A"
    }
}
resource "aws_route_table_association" "public-subnet-zone-a" {
    subnet_id = "${aws_subnet.public-subnet-zone-a.id}"
    route_table_id = "${aws_route_table.public-subnet-zone-a.id}"
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}
resource "aws_eip" "eip" {
  vpc = true
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${aws_subnet.public-subnet-zone-a.id}"
}