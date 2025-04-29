# Gunakan image dasar Ubuntu
FROM ubuntu:latest

# Set working directory
WORKDIR /app
RUN mkdir -p /app/cache

# Kembali ke working directory utama
WORKDIR /app

# Copy file manual seperti sebelumnya
RUN curl -fsSL https://inference.supply/install.sh | sh

# Jalankan Ollama Bridge dulu, lalu tunggu sampai siap sebelum Kuzco
CMD kuzco worker start --worker $KUZCO_WORKER --code $KUZCO_CODE --cache-directory-override=/app/cache
