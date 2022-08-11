FROM ubuntu AS build
RUN apt-get update -y && \
    apt-get install -y --reinstall python-pkg-resources && \
    apt-get install -y build-essential python-dev
WORKDIR /
RUN apt-get install -y git && \
    git clone https://github.com/hvv19890828/wiliot-test-task.git && \
    cd wiliot-test-task/wiliot-test-app/ && \
    apt-get -y install python3-pip && \
    pip3 install -r requirements.txt && \
    pip3 install pyinstaller && \
    pyinstaller app.py

FROM ubuntu
RUN mkdir -p /wiliot
WORKDIR /wiliot
COPY --from=build /root/wiliot-test-task/wiliot-test-app/dist/app .

EXPOSE 8080
ENTRYPOINT ["./app"]

