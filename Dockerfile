FROM nvcr.io/nvidia/pytorch:26.01-py3-igpu

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install \
    --extra-index-url=https://pypi.nvidia.com \
    "cudf-cu13==26.2.*" "dask-cudf-cu13==26.2.*" "cuml-cu13==26.2.*" \
    "cugraph-cu13==26.2.*" "nx-cugraph-cu13==26.2.*" "cuxfilter-cu13==26.2.*" \
    "cucim-cu13==26.2.*" "pylibraft-cu13==26.2.*" "raft-dask-cu13==26.2.*" \
    "cuvs-cu13==26.2.*" "nx-cugraph-cu13==26.2.*"
    
COPY . .

CMD [ "python", "main.py" ]