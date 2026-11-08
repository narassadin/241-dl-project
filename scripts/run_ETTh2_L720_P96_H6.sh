#!/bin/sh

set -o pipefail

cd  ../FITS

OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 \
python -u run_longExp_F.py \
  --is_training 1 \
  --model_id ETTh2_L720_P96_H6_BF_seed2021 \
  --model FITS \
  --data ETTh2 \
  --root_path "../datasets/" \
  --data_path ETTh2.csv \
  --features M \
  --target OT \
  --freq h \
  --seq_len 720 \
  --label_len 48 \
  --pred_len 96 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --base_T 24 \
  --H_order 6 \
  --cut_freq 0 \
  --train_mode 0 \
  --itr 1 \
  --seed 2021 \
  --batch_size 64 \
  --learning_rate 0.001 \
  --train_epochs 50 \
  --patience 3 \
  --num_workers 0 \
  2>&1 | tee ../logs/pilot_L720_P96_H6_BF_seed2021.log