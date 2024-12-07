#!/bin/bash
#this script runs part of the impact of number of client threads experiment of the paper
./exp_ec.sh 3 thread_num_8 rc 8 1

./exp_ec.sh 3 thread_num_16 rc 16 1

./exp_ec.sh 3 thread_num_32 rc 32 1

./exp_ec.sh 3 thread_num_64 rc 64 1

./exp_lru.sh 3 thread_num_8 rc 8 1

./exp_lru.sh 3 thread_num_16 rc 16 1

./exp_lru.sh 3 thread_num_32 rc 32 1

./exp_lru.sh 3 thread_num_64 rc 64 1

./exp_ec.sh 3 thread_num_8 ra 8 1

./exp_ec.sh 3 thread_num_16 ra 16 1

./exp_ec.sh 3 thread_num_32 ra 32 1

./exp_ec.sh 3 thread_num_64 ra 64 1

./exp_lru.sh 3 thread_num_8 ra 8 1

./exp_lru.sh 3 thread_num_16 ra 16 1

./exp_lru.sh 3 thread_num_32 ra 32 1

./exp_lru.sh 3 thread_num_64 ra 64 1