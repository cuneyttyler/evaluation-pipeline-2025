#!/bin/bash

MODEL_PATH=$1
REVISION_NAME=$2
BACKEND=$3
EVAL_DIR=${4:-"evaluation_data/fast_eval"}

if [[ "$BACKEND" == *"enc_dec"* ]]; then
    BACKEND_READ="enc_dec"
else
    BACKEND_READ=$BACKEND
fi

python -m evaluation_pipeline.reading.run --model_path_or_name $MODEL_PATH --backend $BACKEND_READ --data_path "${EVAL_DIR}/reading/reading_data.csv" --revision_name $REVISION_NAME