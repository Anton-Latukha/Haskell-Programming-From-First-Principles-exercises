FROM haskell:8
RUN apt update && apt -yy upgrade
RUN apt -yy install xz-utils make
RUN /bin/bash -c 'alias stack="stack --allow-different-user"'
RUN stack setup --install-ghc ghc-7.10.3
RUN echo 'allow-different-user: true' >> /root/.stack/config.yaml
VOLUME /root/project
WORKDIR /root/project
ENTRYPOINT ["bash"]
