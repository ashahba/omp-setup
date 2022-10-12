# omp-setup
Scripts and example scripts to run TensorFlow on Intel CPU machines

## To build the container
```
$ TF_VER=2.9.1 && docker build --build-arg IMAGE_TAG=${TF_VER} . -t intel/intel-optimized-tensorflow:${TF_VER}-omp
```

## To test the container
```
$ docker run --rm intel/intel-optimized-tensorflow:${TF_VER}-omp run_mnist.sh
```

## Check the output
Running above container generates logs similar to these:
```
TensorFlow version: 2.9.1
Downloading data from https://storage.googleapis.com/tensorflow/tf-keras-datasets/mnist.npz
11490434/11490434 [==============================] - 0s 0us/step
2022-10-12 00:04:13.360941: I tensorflow/core/platform/cpu_feature_guard.cc:193] This TensorFlow binary is optimized with oneAPI Deep Neural Network Library (oneDNN) to use the following CPU instructions in performance-critical operations:  AVX2 AVX512F FMA
To enable them in other operations, rebuild TensorFlow with the appropriate compiler flags.

User settings:

   KMP_AFFINITY=granularity=fine,verbose,compact,1,0
   KMP_BLOCKTIME=1
   KMP_SETTINGS=1
   OMP_NUM_THREADS=28
   OMP_THREAD_LIMIT=4

Effective settings:

   KMP_ABORT_DELAY=0
   KMP_ADAPTIVE_LOCK_PROPS='1,1024'
   KMP_ALIGN_ALLOC=64
   KMP_ALL_THREADPRIVATE=448
   KMP_ATOMIC_MODE=2
   KMP_BLOCKTIME=1
   KMP_CPUINFO_FILE: value is not defined
   KMP_DETERMINISTIC_REDUCTION=false
   KMP_DEVICE_THREAD_LIMIT=2147483647
   KMP_DISP_NUM_BUFFERS=7
   KMP_DUPLICATE_LIB_OK=false
   KMP_ENABLE_TASK_THROTTLING=true
   KMP_FORCE_REDUCTION: value is not defined
   KMP_FOREIGN_THREADS_THREADPRIVATE=true
   KMP_FORKJOIN_BARRIER='2,2'
   KMP_FORKJOIN_BARRIER_PATTERN='hyper,hyper'
   KMP_GTID_MODE=3
   KMP_HANDLE_SIGNALS=false
   KMP_HOT_TEAMS_MAX_LEVEL=1
   KMP_HOT_TEAMS_MODE=0
   KMP_INIT_AT_FORK=true
   KMP_LIBRARY=throughput
   KMP_LOCK_KIND=queuing
   KMP_MALLOC_POOL_INCR=1M
   KMP_NUM_LOCKS_IN_BLOCK=1
   KMP_PLAIN_BARRIER='2,2'
   KMP_PLAIN_BARRIER_PATTERN='hyper,hyper'
   KMP_REDUCTION_BARRIER='1,1'
   KMP_REDUCTION_BARRIER_PATTERN='hyper,hyper'
   KMP_SCHEDULE='static,balanced;guided,iterative'
   KMP_SETTINGS=true
   KMP_SPIN_BACKOFF_PARAMS='4096,100'
   KMP_STACKOFFSET=64
   KMP_STACKPAD=0
   KMP_STACKSIZE=8M
   KMP_STORAGE_MAP=false
   KMP_TASKING=2
   KMP_TASKLOOP_MIN_TASKS=0
   KMP_TASK_STEALING_CONSTRAINT=1
   KMP_TEAMS_THREAD_LIMIT=112
   KMP_TOPOLOGY_METHOD=all
   KMP_USE_YIELD=1
   KMP_VERSION=false
   KMP_WARNINGS=true
   OMP_AFFINITY_FORMAT='OMP: pid %P tid %i thread %n bound to OS proc set {%A}'
   OMP_ALLOCATOR=omp_default_mem_alloc
   OMP_CANCELLATION=false
   OMP_DEFAULT_DEVICE=0
   OMP_DISPLAY_AFFINITY=false
   OMP_DISPLAY_ENV=false
   OMP_DYNAMIC=false
   OMP_MAX_ACTIVE_LEVELS=1
   OMP_MAX_TASK_PRIORITY=0
   OMP_NESTED: deprecated; max-active-levels-var=1
   OMP_NUM_THREADS='28'
   OMP_PLACES: value is not defined
   OMP_PROC_BIND='intel'
   OMP_SCHEDULE='static'
   OMP_STACKSIZE=8M
   OMP_TARGET_OFFLOAD=DEFAULT
   OMP_THREAD_LIMIT=4
   OMP_WAIT_POLICY=PASSIVE
   KMP_AFFINITY='verbose,warnings,respect,granularity=fine,compact,1,0'

OMP: Info #211: KMP_AFFINITY: decoding x2APIC ids.
OMP: Info #209: KMP_AFFINITY: Affinity capable, using global cpuid leaf 11 info
OMP: Info #154: KMP_AFFINITY: Initial OS proc set respected: 0-111
OMP: Info #156: KMP_AFFINITY: 112 available OS procs
OMP: Info #157: KMP_AFFINITY: Uniform topology
OMP: Info #179: KMP_AFFINITY: 2 packages x 28 cores/pkg x 2 threads/core (56 total cores)
OMP: Info #213: KMP_AFFINITY: OS proc to physical thread map:
OMP: Info #171: KMP_AFFINITY: OS proc 0 maps to package 0 core 0 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 56 maps to package 0 core 0 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 1 maps to package 0 core 1 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 57 maps to package 0 core 1 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 2 maps to package 0 core 2 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 58 maps to package 0 core 2 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 3 maps to package 0 core 3 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 59 maps to package 0 core 3 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 4 maps to package 0 core 4 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 60 maps to package 0 core 4 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 5 maps to package 0 core 5 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 61 maps to package 0 core 5 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 6 maps to package 0 core 6 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 62 maps to package 0 core 6 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 7 maps to package 0 core 8 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 63 maps to package 0 core 8 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 8 maps to package 0 core 9 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 64 maps to package 0 core 9 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 9 maps to package 0 core 10 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 65 maps to package 0 core 10 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 10 maps to package 0 core 11 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 66 maps to package 0 core 11 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 11 maps to package 0 core 12 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 67 maps to package 0 core 12 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 12 maps to package 0 core 13 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 68 maps to package 0 core 13 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 13 maps to package 0 core 14 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 69 maps to package 0 core 14 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 14 maps to package 0 core 16 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 70 maps to package 0 core 16 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 15 maps to package 0 core 17 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 71 maps to package 0 core 17 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 16 maps to package 0 core 18 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 72 maps to package 0 core 18 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 17 maps to package 0 core 19 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 73 maps to package 0 core 19 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 18 maps to package 0 core 20 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 74 maps to package 0 core 20 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 19 maps to package 0 core 21 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 75 maps to package 0 core 21 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 20 maps to package 0 core 22 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 76 maps to package 0 core 22 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 21 maps to package 0 core 24 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 77 maps to package 0 core 24 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 22 maps to package 0 core 25 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 78 maps to package 0 core 25 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 23 maps to package 0 core 26 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 79 maps to package 0 core 26 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 24 maps to package 0 core 27 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 80 maps to package 0 core 27 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 25 maps to package 0 core 28 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 81 maps to package 0 core 28 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 26 maps to package 0 core 29 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 82 maps to package 0 core 29 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 27 maps to package 0 core 30 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 83 maps to package 0 core 30 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 28 maps to package 1 core 0 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 84 maps to package 1 core 0 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 29 maps to package 1 core 1 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 85 maps to package 1 core 1 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 30 maps to package 1 core 2 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 86 maps to package 1 core 2 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 31 maps to package 1 core 3 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 87 maps to package 1 core 3 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 32 maps to package 1 core 4 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 88 maps to package 1 core 4 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 33 maps to package 1 core 5 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 89 maps to package 1 core 5 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 34 maps to package 1 core 6 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 90 maps to package 1 core 6 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 35 maps to package 1 core 8 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 91 maps to package 1 core 8 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 36 maps to package 1 core 9 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 92 maps to package 1 core 9 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 37 maps to package 1 core 10 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 93 maps to package 1 core 10 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 38 maps to package 1 core 11 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 94 maps to package 1 core 11 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 39 maps to package 1 core 12 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 95 maps to package 1 core 12 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 40 maps to package 1 core 13 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 96 maps to package 1 core 13 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 41 maps to package 1 core 14 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 97 maps to package 1 core 14 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 42 maps to package 1 core 16 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 98 maps to package 1 core 16 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 43 maps to package 1 core 17 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 99 maps to package 1 core 17 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 44 maps to package 1 core 18 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 100 maps to package 1 core 18 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 45 maps to package 1 core 19 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 101 maps to package 1 core 19 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 46 maps to package 1 core 20 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 102 maps to package 1 core 20 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 47 maps to package 1 core 21 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 103 maps to package 1 core 21 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 48 maps to package 1 core 22 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 104 maps to package 1 core 22 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 49 maps to package 1 core 24 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 105 maps to package 1 core 24 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 50 maps to package 1 core 25 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 106 maps to package 1 core 25 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 51 maps to package 1 core 26 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 107 maps to package 1 core 26 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 52 maps to package 1 core 27 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 108 maps to package 1 core 27 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 53 maps to package 1 core 28 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 109 maps to package 1 core 28 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 54 maps to package 1 core 29 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 110 maps to package 1 core 29 thread 1 
OMP: Info #171: KMP_AFFINITY: OS proc 55 maps to package 1 core 30 thread 0 
OMP: Info #171: KMP_AFFINITY: OS proc 111 maps to package 1 core 30 thread 1 
OMP: Info #249: KMP_AFFINITY: pid 21 tid 21 thread 0 bound to OS proc set 0
OMP: Warning #96: Cannot form a team with 28 threads, using 4 instead.
OMP: Hint Consider unsetting KMP_DEVICE_THREAD_LIMIT (KMP_ALL_THREADS), KMP_TEAMS_THREAD_LIMIT, and OMP_THREAD_LIMIT (if any are set).
OMP: Info #249: KMP_AFFINITY: pid 21 tid 80 thread 1 bound to OS proc set 1
OMP: Info #249: KMP_AFFINITY: pid 21 tid 81 thread 2 bound to OS proc set 2
OMP: Info #249: KMP_AFFINITY: pid 21 tid 82 thread 3 bound to OS proc set 3
Epoch 1/2
OMP: Info #249: KMP_AFFINITY: pid 21 tid 78 thread 4 bound to OS proc set 4
OMP: Info #249: KMP_AFFINITY: pid 21 tid 89 thread 5 bound to OS proc set 5
OMP: Info #249: KMP_AFFINITY: pid 21 tid 91 thread 7 bound to OS proc set 7
OMP: Info #249: KMP_AFFINITY: pid 21 tid 90 thread 6 bound to OS proc set 6
OMP: Info #249: KMP_AFFINITY: pid 21 tid 79 thread 8 bound to OS proc set 8
OMP: Info #249: KMP_AFFINITY: pid 21 tid 92 thread 9 bound to OS proc set 9
OMP: Info #249: KMP_AFFINITY: pid 21 tid 93 thread 10 bound to OS proc set 10
OMP: Info #249: KMP_AFFINITY: pid 21 tid 94 thread 11 bound to OS proc set 11
1875/1875 [==============================] - 2s 958us/step - loss: 2.7906 - accuracy: 0.1004
Epoch 2/2
1875/1875 [==============================] - 2s 967us/step - loss: 4.6164 - accuracy: 0.1022
313/313 - 0s - loss: 7.8463 - accuracy: 0.1040 - 303ms/epoch - 969us/step
```
