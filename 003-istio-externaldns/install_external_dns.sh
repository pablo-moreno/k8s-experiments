#!/bin/bash
helm install external-dns \
    --set provider=cloudflare \
    --set cloudflare.apiToken=$CF_API_TOKEN \
    --set cloudflare.email=$CF_EMAIL \
    --set rbac.create=true \
    bitnami/external-dns
