#!/bin/bash

timestamp=$(date +"%Y%m%d-%H%M%S")

# Create the archive directory
echo "Creating archive directory..."
mkdir -p dist/archive/$timestamp/

# Create copy of latest build to archive directory
# Using rsync instead of cp to avoid recursion mess 
echo "Copying latest build to archive directory..."
rsync -av --exclude='archive' dist/ dist/archive/$timestamp/