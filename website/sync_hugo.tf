resource "null_resource" "hugo_build" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "cd /Users/steverhoton/git/rhoton_website && hugo"
  }
}

resource "aws_s3_object" "hugo_files" {
  depends_on = [null_resource.hugo_build]
  for_each   = fileset("/Users/steverhoton/git/rhoton_website/public/", "**/*")
  bucket     = aws_s3_bucket.website.id
  key        = each.value
  source     = "/Users/steverhoton/git/rhoton_website/public/${each.value}"
  etag       = filemd5("/Users/steverhoton/git/rhoton_website/public/${each.value}")
  acl        = "public-read"
  content_type = lookup(
    {
      "css"   = "text/css"
      "html"  = "text/html"
      "js"    = "application/javascript"
      "json"  = "application/json"
      "map"   = "application/json"
      "svg"   = "image/svg+xml"
      "jpg"   = "image/jpeg"
      "jpeg"  = "image/jpeg"
      "png"   = "image/png"
      "gif"   = "image/gif"
      "ico"   = "image/x-icon"
      "xml"   = "application/xml"
      "txt"   = "text/plain"
      "md"    = "text/markdown"
    },
    length(regexall("\\.", each.value)) > 0 ? element(split(".", each.value), length(split(".", each.value)) - 1) : "",
    "binary/octet-stream"
  )
}
