#!/bin/bash

# Function to display Docker containers with custom formatting and colors
docker_ps() {
    # If you need you can change output format with your requirements
    docker ps --format 'table {{.Names}}\t{{.Status}} : {{.RunningFor}}\t{{.ID}}\t{{.Image}}' | \
    awk '
        BEGIN {
            # Define colors for output of your containers
            SKYBLUE="\033[1;36m";  # Bright Cyan 
            RED="\033[31m";        # Red
            BRIGHT_YELLOW="\033[1;33m";  # Bright Yellow
            RESET="\033[0m";
        }
        # Directories where you store your docker-compose.yml and all containers directories with Dockerfile
        /some-project/ { print SKYBLUE $0 RESET; next }
        # Containers which don't have any Dockerfile (such as databases)
        /mysql-db/ { print SKYBLUE $0 RESET; next }
        /another-mysql-db/ { print RED $0 RESET; next }
        { print $0 }
    '
}

# Call the function
docker_ps
