FROM python:3.7-slim

# Define environment variable
ENV MODEL_NAME MyModel
ENV API_TYPE REST
ENV SERVICE_TYPE MODEL
ENV PERSISTENCE 0


COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

WORKDIR /app

COPY /app .

EXPOSE 5000

CMD exec seldon-core-microservice $MODEL_NAME $API_TYPE --service-type $SERVICE_TYPE --persistence $PERSISTENCE
