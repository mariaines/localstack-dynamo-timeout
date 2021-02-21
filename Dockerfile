# Dockerfile for uvicorn app
FROM amazonlinux
RUN yum -y install \
    autoconf \
    automake \
    gcc \
    gcc-c++ \
    make \
    python3 \
    python3-devel
RUN pip3 install uvicorn[standard]
RUN pip3 install wsproto
RUN pip3 install ipython
# Versions should match the ones in dev-requirements.txt
RUN pip3 install \
    aiobotocore==1.2.1 \
    aiodataloader==0.2.0 \
    aiohttp==3.7.3 \
    ariadne==0.12.0 \
    boto3==1.16.52 \
    elasticsearch-dsl==6.3.1 \
    graphql-core==3.0.5 \
    launchdarkly-server-sdk==7.0.1 \
    mmh3==2.5.1 \
    pytz==2021.1 \
    ptvsd==4.3.2 \
    pycryptodome==3.10.1 \
    python-dateutil==2.8.1 \
    sentry-sdk==0.20.1 \
    ulid-py==1.1.0 \
    ujson==4.0.2
WORKDIR /home
CMD uvicorn local_app:app --host 0.0.0.0 --reload --ws wsproto
