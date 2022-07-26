FROM python:3.10-alpine

COPY src/ /usr/local/bin
COPY requirements.txt .

RUN apk add --update \
    bash \
    curl \
    openssl \
    && rm -rf /var/cache/apk/* \
    
RUN apk add --no-cache build-base \
    && python3 -m pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt \
    && chmod +x /usr/local/bin/* \
    && apk del build-base \
    && rm -rf /var/cache/apk/*