FROM ubuntu:20.04
# to change user
USER root


RUN apt update
RUN apt install -y python3.9
RUN apt install -y python3-pip

# copying the file on local pc to the container
# COPY local-file-path container-path
COPY requirements.txt .
RUN python3.9 -m pip install -r requirements.txt


ENV SITE_DOMAIN=kai.com

WORKDIR /var

# add file to the container
# ADD file-path-from file-path-to
ADD https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data .

# COPY:　リモート上のファイルを扱えない
#       圧縮ファイルがそのままコピー 
# ADD:　リモート上のファイルも扱える
#       圧縮ファイルが自動で解凍される

# ENTRYPOINT: コンテナ実行(docker run)時に動かしたいシェルコマンドを指定
# ENTRYPOINT:　["file", "param 1", "param 2"]
COPY script.py .
ENTRYPOINT ["python3.9", "script.py"]



# RUN:　コンテナイメージ作成時に実行
# ENTRYPOINT:　コンテナ実行時(docker run)に実行