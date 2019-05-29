FROM rootproject/root-cc7
RUN yum install -y tkinter wget git
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && \
    pip install pyyaml h5py matplotlib && \
    rm get-pip.py
RUN useradd -ms /bin/bash ahoi
USER ahoi
WORKDIR /home/ahoi
RUN git clone https://gitlab.com/nikoladze/ahoi.git
ENV PYTHONPATH /home/ahoi/ahoi/python:$PYTHONPATH
ENV PATH /home/ahoi/ahoi/scripts:$PATH
CMD /bin/bash
