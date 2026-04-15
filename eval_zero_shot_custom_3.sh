#!/bin/bash

MODEL_PATH=$1
REVISION_NAME=$2
BACKEND=$3
EVAL_DIR=${4:-"evaluation_data/custom_3"}

if [[ "$BACKEND" == *"enc_dec"* ]]; then
    BACKEND_READ="enc_dec"
else
    BACKEND_READ=$BACKEND
fi

python -m evaluation_pipeline.sentence_zero_shot.run --model_path_or_name $MODEL_PATH --backend $BACKEND --task blimp --data_path "${EVAL_DIR}/blimp_entity_understanding" --save_predictions --revision_name $REVISION_NAME