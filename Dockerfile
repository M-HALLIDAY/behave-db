FROM python:3.7.12-buster
# ARG VERSION=99.0.0

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

# Do not write .pyc files
ENV PYTHONDONTWRITEBYTECODE 1
# Do not ever buffer console output
ENV PYTHONUNBUFFERED 1

RUN pip install poetry


COPY poetry.lock pyproject.toml README.md /app/
COPY src /app/src/

RUN mkdir /app/var && mkdir /app/var/log 

WORKDIR /app
RUN poetry config virtualenvs.create false
RUN poetry install

RUN useradd -ms /bin/bash behave_db

RUN chown -R behave_db /app

USER behave_db

# Just wait forever
# ENTRYPOINT ["tail"]
# CMD ["sleep", "infinity"]

ENTRYPOINT ["whereis","python"] 
