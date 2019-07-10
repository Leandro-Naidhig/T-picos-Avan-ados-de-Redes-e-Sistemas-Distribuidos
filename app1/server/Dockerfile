FROM perl:5.28
WORKDIR /app
COPY . /app
RUN curl -L https://cpanmin.us | perl - Number::Bytes::Human
CMD [ "perl", "./server.pl" ]
