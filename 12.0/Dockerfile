FROM python:3.6-slim-stretch

RUN mkdir -p /usr/share/man/man1
RUN mkdir -p /usr/share/man/man7
RUN apt-get update \
        && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
        postgresql-client wget git tcl gcc bzip2 expect-dev \
        python-lxml libxmlsec1-dev pkg-config libsasl2-dev \
        libldap2-dev libxml2-dev libxslt-dev zlib1g-dev libcups2-dev \
        openssh-client \
        && rm -rf /var/lib/apt/lists/* \
        && apt-get clean
RUN wget -q -O - https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y --no-install-recommends nodejs
RUN mkdir /root/.ssh && ssh-keyscan -H github.com >> /root/.ssh/known_hosts
RUN pip install -r https://raw.githubusercontent.com/odoo/odoo/12.0/requirements.txt
RUN pip install -r https://raw.githubusercontent.com/OCA/maintainer-quality-tools/master/requirements.txt
ENV LINT_CHECK 0
ENV TESTS 1
ENV ODOO_REPO "odoo/odoo"
ENV VERSION "12.0"
COPY bin/* /usr/local/bin/
LABEL maintainer="Studio73" \
        org.label-schema.vendor="Studio73" \
        org.label-schema.url="https://www.studio73.es" \
        org.label-schema.vcs-url="https://github.com/Studio73/gha-oca-mqt"