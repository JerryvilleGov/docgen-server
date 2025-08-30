FROM python:3.13-slim

# Install git
RUN apt-get update && apt-get install -y git

# Install uv
RUN pip install uv

WORKDIR /app

# Copy dependency files
COPY pyproject.toml .

# Install dependencies using uv
RUN uv pip install --system .

# Copy the rest of the application
COPY . .

# Run the application
CMD ["python3", "app/main.py"]
