#!/bin/bash
#this script runs the YCSB performance experiment of the paper 
./exp_base.sh 1 thp load 16 1
./exp_base.sh 1 thp load 16 2
./exp_base.sh 1 thp load 16 3
./exp_base.sh 1 thp ra 16 1
./exp_base.sh 1 thp ra 16 2
./exp_base.sh 1 thp ra 16 3
./exp_base.sh 1 thp rb 16 1
./exp_base.sh 1 thp rb 16 2
./exp_base.sh 1 thp rb 16 3
./exp_base.sh 1 thp rc 16 1
./exp_base.sh 1 thp rc 16 2
./exp_base.sh 1 thp rc 16 3
./exp_base.sh 1 thp rd 16 1
./exp_base.sh 1 thp rd 16 2
./exp_base.sh 1 thp rd 16 3
./exp_base_pbr.sh 1 thp load 16 1
./exp_base_pbr.sh 1 thp ra 16 1
./exp_base_pbr.sh 1 thp rb 16 1
./exp_base_pbr.sh 1 thp rc 16 1
./exp_base_pbr.sh 1 thp rd 16 1