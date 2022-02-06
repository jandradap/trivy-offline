FROM ghcr.io/aquasecurity/trivy:latest

RUN apk add --update-cache \
    tree \
  && rm -rf /var/cache/apk/*

RUN trivy i --download-db-only \
  && trivy fs --skip-update --security-checks vuln,config --offline-scan --exit-code 0 /tmp

ENTRYPOINT [ "trivy", "i", "--skip-update" ]
