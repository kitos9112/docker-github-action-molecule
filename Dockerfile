FROM fedora:37

LABEL maintainer="Marcos Soutullo <marcos.soutullo91@gmail.com>"
LABEL build_date="2022-04-24"

WORKDIR /github/workspace

RUN dnf install -y docker \
    gcc \
    git-core \
    python3-devel \
    python3-libselinux \
    python3-jmespath \
    python3-pip ; \
    dnf clean all

ADD requirements.txt /requirements.txt
RUN python3 -m pip install -r /requirements.txt

ADD cmd.sh /cmd.sh
CMD sh /cmd.sh
