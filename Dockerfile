FROM python:3.12-slim-bookworm

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    SODIUM_INSTALL=system

# ffmpeg untuk audio streaming, libsodium untuk PyNaCl
RUN apt-get update && apt-get install -y --no-install-recommends \
      ffmpeg \
      libsodium23 \
      libffi8 \
      ca-certificates \
      curl \
      unzip \
    && rm -rf /var/lib/apt/lists/*

# Deno runtime untuk yt-dlp n-challenge solver (EJS)
RUN curl -fsSL https://github.com/denoland/deno/releases/latest/download/deno-x86_64-unknown-linux-gnu.zip -o /tmp/deno.zip \
    && unzip -o /tmp/deno.zip -d /usr/local/bin \
    && chmod +x /usr/local/bin/deno \
    && rm /tmp/deno.zip \
    && deno --version

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080
CMD ["sh", "-c", "uvicorn dashboard:app --host 0.0.0.0 --port ${PORT:-8080}"]
