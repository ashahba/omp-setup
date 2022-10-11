#!/usr/bin/env bash
#
# Copyright (c) 2022 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

NUM_SOCKETS=`lscpu | grep -E '^Socket\(' |  awk '{print $2}'`
CORES_PER_SOCKET=`lscpu | grep -E '^Core\(' |  awk '{print $4}'`
THREADS_PER_CORE=`lscpu | grep -E '^Thread\(' |  awk '{print $4}'`
TF_NUM_INTEROP_THREADS=${NUM_SOCKETS}
TF_NUM_INTRAOP_THREADS=${CORES_PER_SOCKET}

if [[ -z "${CNVRG_COMPUTE_CPU}" ]]; then
  OMP_NUM_THREADS=$((CORES_PER_SOCKET))
  OMP_THREAD_LIMIT=$((NUM_SOCKETS * CORES_PER_SOCKET * THREADS_PER_CORE))
else
  OMP_NUM_THREADS=${CNVRG_COMPUTE_CPU%.*}
  OMP_THREAD_LIMIT=$((OMP_NUM_THREADS * THREADS_PER_CORE))
fi

OMP_THREAD_LIMIT=$((OMP_THREAD_LIMIT>4 ? 4 : OMP_THREAD_LIMIT))

OMP_NUM_THREADS=${OMP_NUM_THREADS} \
OMP_THREAD_LIMIT=${OMP_THREAD_LIMIT} \
TF_NUM_INTEROP_THREADS=${TF_NUM_INTEROP_THREADS} \
TF_NUM_INTRAOP_THREADS=${TF_NUM_INTRAOP_THREADS} \
python mnist.py
