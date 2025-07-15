FROM headwindmdm/hmdm:0.1.5

ENV HMDM_URL=https://h-mdm.com/files/hmdm-5.35.1-$HMDM_VARIANT.war
ENV CLIENT_VERSION=6.22

RUN cp /docker-entrypoint.sh /root/docker-entrypoint.sh

RUN sed -i 's/echo "Keys not found, waiting..."/exit 0/' /root/docker-entrypoint.sh

RUN timeout 300 /root/docker-entrypoint.sh

RUN mv /root/docker-entrypoint.sh /docker-entrypoint.sh
