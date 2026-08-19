name: 🔒 25-Second Security Sweep

on:
  push:
    branches: [ main, master ]
  pull_request:
    branches: [ main, master ]

jobs:
  security-check:
    runs-on: ubuntu-latest
    
    steps:
      - name: 📥 Checkout code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0  # Required to scan git history for secrets

      - name: ⚙️ Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'

      - name: 📦 Install dependencies (for accurate audit)
        run: npm ci

      - name: 🔐 Run security sweep
        run: |
          chmod +x security-sweep.sh
          ./security-sweep.sh
