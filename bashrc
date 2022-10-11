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

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PS1="\[\e[31m\]tf-docker\[\e[m\] \[\e[33m\]\w\[\e[m\] > "
export TERM=xterm-256color
alias grep="grep --color=auto"
alias ls="ls --color=auto"

if [[ $EUID -eq 0 ]]; then
  cat <<WARN
WARNING: You are running this container as root, which can cause new files in
mounted volumes to be created as the root user on your host machine.

To avoid this, run the container by specifying your user's userid:

$ docker run -u \$(id -u):\$(id -g) args...
WARN
else
  cat <<EXPL
You are running this container as user with ID $(id -u) and group $(id -g),
which should map to the ID and group for your user on the Docker host. Great!
EXPL
fi

# Turn off colors
echo -e "\e[m"

NUM_SOCKETS=`lscpu | grep -E '^Socket\(' |  awk '{print $2}'`
CORES_PER_SOCKET=`lscpu | grep -E '^Core\(' |  awk '{print $4}'`
THREADS_PER_CORE=`lscpu | grep -E '^Thread\(' |  awk '{print $4}'`
TF_NUM_INTEROP_THREADS=${NUM_SOCKETS}
TF_NUM_INTRAOP_THREADS=${CORES_PER_SOCKET}
TF_ENABLE_MKL_NATIVE_FORMAT=1

if [[ -z "${CNVRG_COMPUTE_CPU}" ]]; then
  OMP_NUM_THREADS=$((CORES_PER_SOCKET))
  OMP_THREAD_LIMIT=$((NUM_SOCKETS * CORES_PER_SOCKET * THREADS_PER_CORE))
else
  OMP_NUM_THREADS=${CNVRG_COMPUTE_CPU%.*}
  OMP_THREAD_LIMIT=$((OMP_NUM_THREADS * THREADS_PER_CORE))
fi

export TF_NUM_INTEROP_THREADS
export TF_NUM_INTRAOP_THREADS
export TF_ENABLE_MKL_NATIVE_FORMAT
export OMP_NUM_THREADS
export OMP_THREAD_LIMIT
