FROM python:3.9

ARG USER_TOKEN
ARG CLIENT_ID
ARG CLIENT_SECRET

ENV USER_TOKEN $USER_TOKEN
ENV CLIENT_ID $CLIENT_ID
ENV CLIENT_SECRET $CLIENT_SECRET

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y cron python3-dev libssl-dev openssl libacl1-dev libacl1 build-essential ffmpeg && \
    pip install -U pip setuptools wheel && \
    pip install -U bdfr

COPY crontab /etc/cron.d/simple-cron
COPY entrypoint.sh /
COPY reddit-download.sh /
COPY config.cfg /root/.config/bdfr/default_config.cfg

RUN chmod +x /reddit-download.sh
RUN chmod +x /entrypoint.sh
RUN chmod 0644 /etc/cron.d/simple-cron
RUN touch /var/log/cron.log

CMD ["/entrypoint.sh"]
