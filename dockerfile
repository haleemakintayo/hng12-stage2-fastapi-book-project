
FROM python:3.12


WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt


RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

RUN rm /etc/nginx/sites-enabled/default

COPY . /app

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


EXPOSE 80

CMD ["/entrypoint.sh"]