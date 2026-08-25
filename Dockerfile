# Stage 1: Builder
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --prefix=/install -r requirements.txt

# Stage 2: Runtime
FROM python:3.12-slim
WORKDIR /app
# Copy installed packages from builder stage
COPY --from=builder /install /usr/local
# Copy application
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]
