# Use a slim Python image for a smaller with supported n tested on my devices
FROM python:3.12-slim

RUN groupadd -r appuser && useradd -r -g appuser appuser

WORKDIR /app

COPY app/requirements.txt app/requirements.txt

RUN pip install --no-cache-dir -r app/requirements.txt

COPY . .

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8080

CMD ["python", "app/app.py"]
