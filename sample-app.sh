#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/status

cp sample_app.py tempdir/.


echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile


echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/sample_app.py" >> tempdir/Dockerfile

cd tempdir

sudo docker build -t sampleapp .

sudo docker run -t -d -p 5050:5050 --name samplerunning sampleapp

sudo docker ps -a
