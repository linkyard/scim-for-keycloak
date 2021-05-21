FROM maven:3.8-jdk-11 as build

RUN mkdir -p /app
WORKDIR /app

COPY . /app/

RUN ls -la
RUN mvn package
RUN cp scim-for-keycloak-deployment/target/scim-for-keycloak-*.ear scim-for-keycloak-deployment/target/scim-for-keycloak.ear


FROM busybox

COPY --from=build scim-for-keycloak-deployment/target/scim-for-keycloak.ear /scim-for-keycloak.ear
COPY app/src/main/docker/copy-extension.sh /copy-extension.sh

CMD ["/copy-theme.sh"]
