FROM python:3.6-slim-stretch

RUN mkdir -p /usr/share/man/man1
RUN mkdir -p /usr/share/man/man7
RUN apt-get update --fix-missing \
        && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
        postgresql-client wget tcl gcc bzip2 expect-dev \
        python-lxml libxmlsec1-dev pkg-config libsasl2-dev \
        libldap2-dev libxml2-dev libxslt-dev zlib1g-dev libcups2-dev \
        openssh-client default-libmysqlclient-dev \
        libcurl4-gnutls-dev libexpat1-dev gettext \
        && rm -Rf /var/lib/apt/lists/* \
        && apt-get clean
ARG GIT_VERSION=2.28.0
RUN wget -q https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz -O /tmp/git.tar.gz \
        && tar -xf /tmp/git.tar.gz -C /tmp \
        && make prefix=/usr/local --directory=/tmp/git-${GIT_VERSION} all \
        && make prefix=/usr/local --directory=/tmp/git-${GIT_VERSION} install \
        && rm -Rf /tmp/*
RUN wget -q -O - https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y --no-install-recommends nodejs
RUN mkdir /root/.ssh && ssh-keyscan -H github.com >> /root/.ssh/known_hosts
RUN pip install --upgrade pip
ARG VERSION=12.0
RUN pip install -r https://raw.githubusercontent.com/odoo/odoo/${VERSION}/requirements.txt
RUN pip install -r https://raw.githubusercontent.com/OCA/maintainer-quality-tools/master/requirements.txt
ENV LINT_CHECK 0
ENV TESTS 1
ENV ODOO_REPO "odoo/odoo"
COPY bin/* /usr/local/bin/
LABEL maintainer="Studio73" \
        org.label-schema.vendor="Studio73" \
        org.label-schema.url="https://www.studio73.es" \
        org.label-schema.vcs-url="https://github.com/Studio73/gha-oca-mqt"