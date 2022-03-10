FROM python:3.7.2

COPY api /api
COPY haystack_try /haystack_try
COPY data /data
#RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt

CMD uvicorn api.fast:app --host 0.0.0.0 --port $PORT