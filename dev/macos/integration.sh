#!/usr/bin/env bash

set -o errtrace -o pipefail -o errexit

TEST_SPLITS="${TEST_SPLITS:-1}"
TEST_GROUP="${TEST_GROUP:-1}"

eval "$(sudo python -m conda init bash --dev)"
conda info
python -m pytest \
    --cov=conda \
    --durations-path=./tools/durations/${OS}.json \
    -m "integration" \
    --splits=${TEST_SPLITS} \
    --group=${TEST_GROUP}
python -m conda.common.io
