FROM intel/intel-optimized-tensorflow

SHELL ["/bin/bash", "-c"]

ENV OMP_NUM_THREADS=4
ENV OMP_THREAD_LIMIT=4
ENV TF_ENABLE_MKL_NATIVE_FORMAT=1

COPY ./mnist/* /usr/bin/
COPY ./mkl_envs.sh ${HOME}/mkl_envs.sh
