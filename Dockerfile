FROM python:alpine3.8
RUN apk add --no-cache gcc linux-headers make musl-dev python-dev g++
EXPOSE 9484
WORKDIR /app
COPY src/ /app
RUN pip install -r requirements.txt
CMD python ./kubedex.py
