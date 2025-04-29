# Gunakan image dasar Ubuntu
FROM ubuntu:latest

# Install dependensi dasar
RUN apt-get update && apt-get install -y curl

# Set working directory
WORKDIR /app

# Buat direktori cache
RUN mkdir -p /app/cache

# Install Kuzco dari skrip resmi
RUN curl -fsSL https://inference.supply/install.sh | sh

# Tambahkan direktori cargo ke PATH (jika dibutuhkan manual)
ENV PATH="/root/.cargo/bin:${PATH}"

# Jalankan Kuzco dengan variabel lingkungan
CMD ["sh", "-c", "kuzco worker start --worker $KUZCO_WORKER --code $KUZCO_CODE --cache-directory-override=/app/cache"]
