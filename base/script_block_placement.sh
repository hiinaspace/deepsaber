#!/bin/bash

#export PYTHONPATH="/home_directory/.local/lib/python3.5/site-packages/"

py=python3
dataset=general_beat_saber
model=wavenet
layers=7
blocks=3
exp=test
num_windows=10

$py train.py --data_dir=../AugDataTest --dataset_name=$dataset --model=$model --batch_size=5 --output_length=128 --num_windows=$num_windows --nepoch=500 --nepoch_decay=500 --layers=$layers --blocks=$blocks \
    --print_freq=1 --experiment_name=$exp --save_by_iter --save_latest_freq=10 \
    --time_shifts=16 \
    --feature_name=mel \
    --feature_size=100 \
    --input_channels=$((100*16)) \
    --num_classes=$((1+4)) \
    --extra_output \
    --using_sync_features \
    --entropy_loss_coeff=0.0 \
    --workers=0 \
    --level_diff=Expert \
    --reduced_state \
    --binarized \
    --gpu_ids=0
    #--load \
    #--load_iter=1070 \
    # --dilation_channels=512 \
    # --residual_channels=256 \
    # --skip_channels=256 \
    # --end_channels=512 \
    #--concat_outputs \
    # --gpu_ids=0,1,2,3,4,5,6,7 \