# =============================================
# Project: Quant Monte Carlo Simulation (GBM)
# Author: Rivaldo Billy
# =============================================

# Base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir numpy matplotlib scipy jupyter

# Expose Jupyter Notebook port
EXPOSE 8888

# Default command: run Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
