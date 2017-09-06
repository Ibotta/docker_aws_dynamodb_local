#
# Dockerfile for DynamoDB Local
#
# https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html
#
FROM openjdk:8-jre-slim
# forked from MAINTAINER Dean Giberson <dean@deangiberson.com>, and edited
MAINTAINER Ibotta <jobs@ibotta.com>

# Create working space
WORKDIR /var/dynamodb_wd

# Default port for DynamoDB Local
EXPOSE 8000

# Get the package from Amazon
ADD https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz /tmp/dynamodb_local_latest.tar.gz
RUN tar xfz /tmp/dynamodb_local_latest.tar.gz && rm -f /tmp/dynamodb_local_latest.tar.gz

# Default command for image
ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-port", "8000"]

# Make it easy to switch to -inMemory
CMD ["-dbPath", "/var/dynamodb_local", "-sharedDb", "-optimizeDbBeforeStartup"]

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME ["/var/dynamodb_local", "/var/dynamodb_wd"]
