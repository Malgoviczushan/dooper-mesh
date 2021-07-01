FROM python:3.8.5
WORKDIR /code 
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN lscpu
RUN ls && dir
COPY . .
CMD gunicorn foodgram.wsgi:application --bind 0.0.0.0:8000

COPY Test/testsc.sh /entrypoint.sh

CMD chmod 777 entrypoint.sh

RUN ./entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
