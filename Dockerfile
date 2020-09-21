FROM alpine as builder
WORKDIR /workspace/app
COPY . .
RUN apk update && apk add openjdk14 maven --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN mvn package

FROM alpine
RUN apk update && apk add openjdk14-jre --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
ARG JAR_FILE=target/InternshipProject-1.0-SNAPSHOT-jar-with-dependencies.jar
COPY --from=builder /workspace/app/${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]