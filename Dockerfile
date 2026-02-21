FROM python:3.13-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        ffmpeg \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir uv

COPY . .

RUN uv pip install -e . --system

# ဒါကိုပြင်ရမယ် - start အစား python module ကိုခေါ်မယ်
CMD ["python", "-m", "src"]
