ARG IMAGE=store/intersystems/irishealth-community:2020.2.0.196.0

FROM $IMAGE

RUN echo "password" > /tmp/password.txt && /usr/irissys/dev/Container/changePassword.sh /tmp/password.txt

# Installs ZPM
# https://community.intersystems.com/post/introducing-intersystems-objectscript-package-manager
RUN mkdir -p /tmp/deps \
 && cd /tmp/deps \
 && wget -q https://pm.community.intersystems.com/packages/zpm/latest/installer -O zpm.xml

# Copy fhiranalytics ZPM installer
# TODO: remove after publish in ZPM
COPY ./module.xml /tmp/deps/

COPY ./src /tmp/deps/src

COPY ./install.sh /tmp/install.sh

RUN iris start $ISC_PACKAGE_INSTANCENAME EmergencyId=sys,sys && \
 sh /tmp/install.sh && \
 /bin/echo -e "sys\nsys\n\n" | iris stop $ISC_PACKAGE_INSTANCENAME quietly 

WORKDIR /home/irisowner/