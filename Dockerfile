FROM python:3.11.6-slim-bullseye
WORKDIR /app
COPY requirements.txt requirements.txt
RUN apt-get update -y && apt-get upgrade -y && \
    python -m pip install --upgrade pip \
    apt-get install python3-tk -y

RUN pip install -r requirements.txt
COPY . .
EXPOSE 8017
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8017"]
