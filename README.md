# Code of SlimKV

## Testbed Preparation  
We use RS(4,2), which needs to prepare the following machines.
- 4 primary nodes
- 2 backup nodes
- 2 extra nodes
- 1 master node
- 1 client node

Make sure that the client node can ssh others without password.

### Setting
Modify setting.sh in /YCSB-C-master.

## Project Structure

### File directory
- YCSB-C-master contains the C++ version of the YCSB benchmark along with a 
slimKV client.
- src/primary/src contains the source code of primary nodes.
- src/backup/src contains the source code of backup/extra/master nodes.

## Build Dependencies
We build all dependencies on the client machine first.

### Infiniband verbs
For Mellanox cards, the Infiniband and RDMA libraries are included in the software package provided by the vendor. 

### RocksDB
We implement the LSM-tree based on RocksDB v6.6.4.

We slightly change the source code of RocksDB for primary nodes.

Please use files in "rocksdb_change_file" to replace the files in RocksDB.

Please follow the instruction in https://github.com/facebook/rocksdb.

Please copy static library of RocksDB("librocksdb.a") to /src/priarmy/src/ and /src/backup/src.

### ISA-L
ISA-L is a collection of optimized low-level functions targeting storage applications. We use it for erasure coding.

Follow the instruction in https://github.com/intel/isa-l.

Copy static library of libisal.a to ~/slimKV/src/backup/src.

Add include file into INCLUDE-PATH

### oneTBB
oneTBB is a flexible C++ library that simplifies the work of adding parallelism to complex applications. We use it to implement a LRU cache to compare with subread.

Follow the instruction in https://github.com/oneapi-src/oneTBB/.

Install oneTBB in all backup/extra/client nodes.

## Build

### Try compilation
- primary : 
```
cd ~/slimKV/src/primary
make
```
- backup :
``` 
cd ~/slimKV/src/backup
make b
```
- extra : 
```
make e
```
- master : 
```
make m
```
- client : 
```
cd ~/slimKV/YCSB-C-master 
make
```

### Build code
- Make sure every node has a directory named ~/slimKV.
```
cd ~/slimKV/src/primary
./build_dir.sh
cd ~/slimKV/src/backup
./build_dir.sh
cd ~/slimKV/YCSB-C-master
./build_all_code.sh
```
## Run
### Scripts in YCSB-C-master
- exp_base.sh is for running SlimKV.
- exp_base_pbr.sh is for running PBR.
- exp_normal_gc.sh is for running SlimKV without sync-gc.
- exp_ec.sh is for running SlimKV without subread.
- exp_lru.sh is for running SlimKV which replaces subread with LRU read cache.

###  To run a script
```./exp_xxx.sh ${exp_id} ${exp_label} ${workload} ${thread_nums} ${rounds}```

Please replace exp_xxx.sh with one of the above scripts. The primary parameters are ```workload``` and ```thread_nums```, which mean the YCSB workload used and the number of threads; the other parameters are used to name the output result. For example, if we need to test SlimKV with 16 threads under workload load, we can use the following command. 

```./exp_base.sh 1 test load 16 1```

To modify ibv config, please change ```-d ${device} -i ${ib-port} -g ${gid}``` in command.sh (which is called by exp_xxx.sh) based on your testbed setting.

To terminate the whole system, please use YCSB-C-master/kill_all.sh to kill the processes in each node except the client.
