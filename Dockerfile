FROM openjdk:8
COPY ./out/production/InternshipProject/ /tmp
WORKDIR /tmp

RUN echo "r <- getOption('repos'); r['MICROSOFT'] <- 'https://www.nuget.org/packages/Microsoft.Azure.ServiceBus/'; options(repos = r);" > ~/.Rprofile

RUN Rscript -e "install.packages('Microsoft.Azure.ServiceBus')"

ENTRYPOINT ["java","MyServiceBusTopicClient"]