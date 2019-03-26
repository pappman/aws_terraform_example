resource "aws_instance" "instance" {
    #count = "${var.instance_count}"

    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "${var.zone_1}"
    instance_type = "${var.aws_instance_type}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.instance-sg.id}"]
    subnet_id = "${aws_subnet.public-subnet-zone-a.id}"
    associate_public_ip_address = true
    source_dest_check = false
    user_data = "${file("config.sh")}"

    tags {
        Name = "Instance Percis"
    }
}