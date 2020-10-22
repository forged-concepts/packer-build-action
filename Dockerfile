FROM forgedconcepts/packer-aws-session-manager:latest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]