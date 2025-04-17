variable "mime_types" {
  default = {
    htm  = "text/html"
    html = "text/html"
    css  = "text/css"
    ttf  = "font/ttf"
    js   = "application/javascript"
    map  = "application/javascript"
    json = "application/json"
    md   = "text/markdown"
  }
}

resource "aws_s3_object" "website_files" {
  for_each     = fileset("${path.cwd}/files/", "**/*.*")
  bucket       = aws_s3_bucket.website.id
  key          = replace(each.value, "${path.cwd}/files/", "")
  source       = "${path.cwd}/files/${each.value}"
  acl          = "public-read"
  etag         = filemd5("${path.cwd}/files/${each.value}")
  content_type = lookup(var.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}

