#!/bin/sh
set -eu

TARGET=${DEPLOYMENT_DIR:-/opt/jboss/keycloak/standalone/deployments}

echo "Copying SCIM-for-Keycloak extension"
cp "/scim-for-keycloak.ear" "${TARGET}/scim-for-keycloak.ear"
echo "SCIM-for-Keycloak extension copied to ${TARGET}"
