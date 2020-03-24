FROM python:2.7.17-alpine3.11
# 3.8.2-alpine3.11
RUN pip install requests

RUN mkdir /workspace && \
    mkdir -p /var/www/plexemail && \
    touch /var/www/plexemail/index.html

WORKDIR /workspace

COPY . /workspace

WORKDIR /workspace/scripts

RUN chmod +x /workspace/run_job.sh

ENTRYPOINT [ "/workspace/run_job.sh" ]
