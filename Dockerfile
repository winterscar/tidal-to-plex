FROM python:3.11-buster

RUN pip3 install tidalapi==0.7.1
RUN pip3 install tidal-dl

COPY server.py /server.py
COPY run.sh /run.sh
ENTRYPOINT [ "/run.sh" ]