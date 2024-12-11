# Gunakan image Python slim untuk ukuran yang lebih kecil
FROM python:3.9-slim

# Set working directory dalam container
WORKDIR /app

# Salin file requirements.txt ke working directory
COPY requirements.txt .

# Instal dependensi aplikasi
RUN pip install --no-cache-dir -r requirement.txt

# Salin seluruh file aplikasi ke working directory
COPY . .

# Expose port default Flask (5000) untuk digunakan Cloud Run
EXPOSE 8080

# Atur variabel lingkungan untuk Flask
ENV PORT=8080

# Jalankan aplikasi menggunakan gunicorn (direkomendasikan untuk produksi)
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
