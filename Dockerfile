FROM rabbitmq:management

RUN addgroup --system rabbitmq && adduser --system --ingroup rabbitmq rabbitmq

WORKDIR /var/lib/rabbitmq

RUN chown -R rabbitmq:rabbitmq /var/lib/rabbitmq /etc/rabbitmq
COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf
COPY definitions.json /etc/rabbitmq/definitions.json

EXPOSE 5672 15672

USER rabbitmq

CMD ["rabbitmq-server"]