FROM ubuntu

# Set architecture
ENV ARCH="arm"
ARG URL
ARG TOKEN
ENV URL=$URL
ENV TOKEN=$TOKEN
ENV RUNNER_ALLOW_RUNASROOT=1

RUN apt update 
RUN apt install curl wget -y
WORKDIR /actions-runner

COPY install_runner install_runner
RUN ./install_runner $ARCH

ENTRYPOINT [ "./run.sh" ]
