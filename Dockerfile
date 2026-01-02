FROM python:3.9-slim-bullseye

RUN apt update
RUN apt install -y python3-opencv wget tesseract-ocr

WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["/bin/bash"]
