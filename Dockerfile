FROM confluentinc/cp-kafka-connect-base:latest

RUN pip3 install --user envtpl

ENV PATH="/home/appuser/.local/bin:${PATH}"

COPY target /home/appuser/target
COPY target/kafka-connect-target/usr/share/kafka-connect/kafka-connect-rabbitmq/* /usr/share/java/kafka/ 
COPY config-templates /home/appuser/config-templates
COPY docker-entrypoint.sh /home/appuser

WORKDIR /home/appuser

CMD [ "./docker-entrypoint.sh" ]
