From python:alpine

COPY ./ ./
RUN apk add gcc
RUN apk add musl-dev
RUN pip install -r requirements.txt
RUN python -m nltk.downloader stopwords

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add mongodb=3.4.4-r0
VOLUME ["/data/db"]
EXPOSE 8000

#CMD ["uvicorn", "scPlMongo:app","--reload"]
CMD ["mongod"]
