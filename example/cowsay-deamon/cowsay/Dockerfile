FROM python:3
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN pip install -r requirements.txt
EXPOSE 8000
USER root
RUN apt-get update && apt-get -y --fix-missing upgrade && apt-get install -y --fix-missing fortune cowsay
CMD ["./start.sh"]

