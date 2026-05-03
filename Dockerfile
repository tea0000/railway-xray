FROM alpine:latest
RUN apk add -y --no-cache wget unzip 
WORKDIR /app
# 下载xray
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    chmod +x xray && \
    rm -rf Xray-linux-64*
COPY config.json .
EXPOSE 8080
CMD ["./xray", "run", "-c", "config.json"]
