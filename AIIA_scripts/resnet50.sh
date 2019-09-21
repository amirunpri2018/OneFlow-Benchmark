#! /bin/bash

GPU_NUM_PER_NODE=${1}
NODE_NUM=${2}
NODE_LIST=${3}
RUN_REAL_DATA=${4}
RUN_SYNTHETIC_DATA=${5}
LOGFILE=${6}

CMD="python ../cnn_benchmark/of_cnn_benchmarks.py \
--model=resnet50 \
--gpu_num_per_node=$GPU_NUM_PER_NODE \
--node_num=$NODE_NUM \
--node_list=$NODE_LIST \
--batch_size_per_device=8 \
--iter_num=5 \
--learning_rate=0.01 \
--optimizer=sgd \
--loss_print_every_n_iter=1 \
--warmup_iter_num=2"


# synthetic data


# real data
if [ $RUN_REAL_DATA = "True" ] ; then
CMD+=" --data_dir=/dataset/PNGS/PNG228/of_record_repeated"
#set -x
    (
     $CMD
    ) |& tee $LOGFILE".real"

#set +x
fi