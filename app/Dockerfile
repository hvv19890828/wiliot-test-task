FROM ubuntu AS build
RUN apt-get update -y && \
    apt-get install -y --reinstall python-pkg-resources && \
    apt-get install -y build-essential python-dev-is-python3
WORKDIR /
# Making binary from app.py
RUN apt-get install -y git && \
    git clone https://github.com/hvv19890828/wiliot-test-task.git && \
    cd wiliot-test-task/app/ && \
    apt-get -y install python3-pip && \
    pip3 install -r requirements.txt && \
    pip3 install pyinstaller && \
    pyinstaller app.py

# Run-time image guild
FROM ubuntu
RUN apt-get update -y && \
    apt-get install -y git && \
    git clone https://github.com/hvv19890828/wiliot-test-task.git && \
    mkdir -p /wiliot && \
    cp -r wiliot-test-task/app/templates /wiliot && \
    rm -r wiliot-test-task && \
    apt-get purge -y git

WORKDIR /wiliot
COPY --from=build /wiliot-test-task/app/dist/app .

EXPOSE 8080
ENTRYPOINT ["./app"]

