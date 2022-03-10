FROM python:3.7.4-stretch

COPY api /api
COPY haystack_try /haystack_try
COPY data /data
COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt

CMD uvicorn api.fast:app --host 0.0.0.0 --port $PORT