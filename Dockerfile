FROM python:3.11-buster

RUN pip3 install tidalapi
RUN pip3 install tidal-dl

# https://github.com/BlackLight/python-tidal/commit/91e6b4983d1561a92c149a829781969f2c083cb7
RUN sed -i "s|json_obj\['picture']|json_obj.get('picture', '')|g" /usr/local/lib/python3.11/site-packages/tidalapi/user.py
COPY server.py /server.py
COPY run.sh /run.sh
ENTRYPOINT [ "/run.sh" ]