#!/bin/bash

# Download jenkins-cli.jar
wget http://localhost:8080/jnlpJars/jenkins-cli.jar

# Create a Jenkins job named "pipeline4" using pipeline.xml
java -jar jenkins-cli.jar -s http://localhost:8080 -auth minhuix:11228a5e8142985b86fbd8d5b2eb927a86 create-job pipeline4 < pipeline.xml

# Build the "pipeline4" job
java -jar jenkins-cli.jar -s http://localhost:8080 -auth minhuix:11228a5e8142985b86fbd8d5b2eb927a86 build pipeline4
