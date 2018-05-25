FROM openjdk:10-jre-slim

ENV SBT_VERSION 0.13.16
ENV SCALA_VERSION 2.12.2
ENV JAVA_VERSION 10

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y curl wget unzip locales && \
    locale-gen en_US.UTF-8 && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

RUN curl -sSL https://github.com/sbt/sbt/archive/v$SBT_VERSION.zip -o /opt/sbt-$SBT_VERSION.zip && \
    unzip /opt/sbt-$SBT_VERSION.zip -d /opt/ && \
    rm -f /opt/sbt-$SBT_VERSION.zip

ENV PATH="/opt/sbt/bin:${PATH}"

CMD ["sbt"]
