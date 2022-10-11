FROM intel/intel-optimized-tensorflow

SHELL ["/bin/bash", "-c"]

ENV OMP_NUM_THREADS=4
ENV OMP_THREAD_LIMIT=4

COPY ./mnist.py ${HOME}/mnist.py
COPY ./omp_envs.sh ${HOME}/omp_envs.sh
COPY ./run_mnist.sh ${HOME}/run_mnist.sh

RUN chmod +x /run_mnist.sh && \
    ln -sf /run_mnist.sh /usr/bin/
