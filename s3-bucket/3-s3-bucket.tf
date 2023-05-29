resource "aws_s3_bucket" "this" {
  bucket        = "${var.cluster_state_bucket_name}"
  force_destroy = var.force_destroy
  tags          = "${merge(var.tags)}"
}