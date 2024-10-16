#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the latest modification time of the package database
last_update=$(stat -c %Y /var/lib/pacman/local/pacman-*/desc | sort -n | tail -n 1)
current_time=$(date +%s)

# Calculate days since the last update
days_since_update=$(( (current_time - last_update) / 86400 ))

# Format the last update date
last_update_date=$(date -d @$last_update +%m-%d-%Y)

# Output
echo -e "${YELLOW}Days since last 'pacman -Syu': ${GREEN}$days_since_update${NC}"
echo -e "${YELLOW}Last update date: ${BLUE}$last_update_date${NC}"
