#!/usr/bin/env bash

set -x
set -e

echo "Creating or updating the AAI4323_FINAL Conda environment..."

conda env update \
    --name aai4323_final \
    --file aai4323_conda_final.yml \
    --prune

echo "Checking the environment..."

conda run --name aai4323_final python --version
conda run --name aai4323_final python -m pip check

echo "Registering the Jupyter kernel..."

conda run --name aai4323_final python -m ipykernel install \
    --user \
    --name aai4323_final \
    --display-name "Python (AAI4323_FINAL)"

echo "AAI4323_FINAL environment setup completed successfully."

echo "Configuring Conda for new terminals..."

conda init bash

grep -qxF "conda activate aai4323_final" ~/.bashrc || \
    echo "conda activate aai4323_final" >> ~/.bashrc

echo "New terminals will automatically activate the aai4323_final environment."
