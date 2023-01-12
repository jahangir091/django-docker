FROM python:3.9-alpine3.13

ENV PYTHONBUFFERED=1


COPY ./requirements.txt /project_code/requirements.txt


COPY ./project_code /project_code


WORKDIR /project_code


EXPOSE 8000


RUN apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-deps \
        build-base postgresql-dev musl-dev linux-headers && \
    pip install -r requirements.txt && \
    apk del .tmp-deps && \
    mkdir -p /vol/web/static && \
    mkdir -p /vol/web/media && \ 
    chown -R nginx:nginx /vol && \
    chmod -R 755/vol

