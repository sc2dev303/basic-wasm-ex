FROM trzeci/emscripten:1.38.48

RUN apt-get update && \
    apt-get install -qqy doxygen