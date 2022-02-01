FROM ghcr.io/aquasecurity/trivy:latest

RUN trivy i --download-db-only

RUN trivy fs --skip-update --security-checks vuln,config --offline-scan --exit-code 0 /tmp

ENTRYPOINT [ "trivy", "i", "--skip-update" ]
