# Docker container for AWS DynamoDB Local

AWS DynamoDB Local will let you test against DynamoDB without needing
a full network. For details see https://aws.amazon.com/blogs/aws/dynamodb-local-for-desktop-development/

https://hub.docker.com/r/ibotta/aws-dynamodb-local/

## Usage

```sh
docker run -p 8000:8000 ibotta/aws-dynamodb-local
```

## Notes

* Exposes the data file as a separate volume
* Uses the `-sharedDb` flag so different access IDs get the same database
