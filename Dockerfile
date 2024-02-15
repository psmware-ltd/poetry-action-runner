FROM ghcr.io/actions/actions-runner:2.313.0


## Install git for actions/checkout@v4
RUN echo 'DPkg::Post-Invoke {"/bin/rm -f /var/cache/apt/archives/*.deb || true";};' | sudo tee /etc/apt/apt.conf.d/clean
RUN sudo apt update && sudo apt install -y git curl


## Install poetry, cos we love poetry
ENV POETRY_HOME="/home/runner/poetry" \
    POETRY_NO_INTERACTION=1 \
    POETRY_VERSION=1.7.1 \
 POETRY_VIRTUALENVS_IN_PROJECT=1

ENV PATH="$POETRY_HOME/bin:$PATH"

RUN curl -sSL https://install.python-poetry.org | python3 -
