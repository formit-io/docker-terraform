FROM alpine:latest
ARG TERRAFORM_VER
ARG TERRAGRUNT_VER

COPY src/*.sh "/bin/"

RUN apk add --update bash ca-certificates curl zip jq graphviz ttf-freefont git && \
  update-ca-certificates && \
  curl -sSL https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip \
  -o /tmp/terraform.zip && \
  unzip /tmp/terraform.zip -d /usr/bin && \
  rm /tmp/terraform.zip && \
  curl -sL https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VER}/terragrunt_linux_amd64 -o /bin/terragrunt && \
  chmod +x /bin/terragrunt && \
  apk -Uuv add groff less python3 py-pip  && \
  pip3 install awscli  && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/docker-entrypoint.sh"]
CMD ["/bin/bash"]
