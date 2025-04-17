# rhoton_website

Repo backing the steverhoton.com website

## Technology Stack

This website is built using:
- [Hugo](https://gohugo.io/) - A fast and modern static site generator written in Go
- [Ananke Theme](https://github.com/theNewDynamic/gohugo-theme-ananke) - A responsive Hugo theme
- AWS S3 for hosting
- AWS CloudFront for content delivery
- GitHub Actions for CI/CD

## Local Development

To run the site locally:

1. Clone this repository
2. Make sure Hugo is installed (`brew install hugo` on macOS)
3. Run `hugo server -D` to start the development server
4. Visit http://localhost:1313/ in your browser

## Deployment

The site is automatically deployed to AWS when changes are pushed to the main branch via GitHub Actions.

## Infrastructure Requirements

To deploy this website, you need:
1. An S3 bucket configured for static website hosting
2. A CloudFront distribution pointing to the S3 bucket
3. GitHub repository secrets:
   - AWS_ROLE_ARN: The ARN of the IAM role with permissions to deploy to S3 and invalidate CloudFront
   - AWS_S3_BUCKET: The name of the S3 bucket
   - CLOUDFRONT_DISTRIBUTION_ID: The ID of the CloudFront distribution
