FROM haskell:8
RUN apt update && apt -yy upgrade && apt -yy install xz-utils make
VOLUME /root/project
WORKDIR /root/project
ENTRYPOINT ["bash"]
