FROM python:3.11-buster

RUN pip3 install tidalapi
RUN pip3 install tidal-dl

COPY server.py /server.py
COPY run.sh /run.sh
ENTRYPOINT [ "/run.sh" ]