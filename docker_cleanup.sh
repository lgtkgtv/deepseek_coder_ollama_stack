#!/bin/bash

is_valid_container_id() {
    docker ps -a | grep -q "$1"
}

is_valid_image_id() {
    docker images -a | grep -q "$1"
}

list_running_containers() {
    running_count=$(docker ps -q | wc -l | tr -d ' ')
    stopped_count=$(docker ps -aq --filter "status=exited" | wc -l | tr -d ' ')

    if [[ $running_count -eq 0 && $stopped_count -eq 0 ]]; then
        echo "No running or stopped containers found."
    else
        if [[ $running_count -gt 0 ]]; then
            echo "\n--- Running Containers ---"
            docker ps
        fi
        if [[ $stopped_count -gt 0 ]]; then
            echo "\n--- Stopped Containers ---"
            docker ps -a --filter "status=exited"
        fi
    fi
}

remove_containers() {
    running_count=$(docker ps -aq | wc -l | tr -d ' ')

    if [[ $running_count -gt 0 ]]; then
        echo "\nChoose an option:"
        echo "1. Remove all containers"
        echo "2. Keep all containers"
        echo "3. Remove some containers"
        read -p "Enter your choice (1, 2, or 3): " choice

        case "$choice" in
            1)
                docker stop $(docker ps -aq)
                docker container prune -f
                ;;
            2)
                ;;
            3)
                containers=$(docker ps -aq)
                if [[ -n "$containers" ]]; then
                    for container_id in $containers; do
                        container_name=$(docker inspect --format '{{.Name}}' "$container_id" | sed 's/^.//;s/.$//')
                        read -p "\nStop and remove container '$container_name' ($container_id)? (Y/N): " remove_choice
                        if [[ "$remove_choice" == "Y" || "$remove_choice" == "y" ]]; then
                            if ! docker stop "$container_id"; then
                                echo "Error: Failed to stop $container_name ($container_id)"
                            else
                                docker rm "$container_id"
                            fi
                        fi
                    done
                else
                    echo "No containers to remove."
                fi
                ;;
            *)
                echo "Invalid choice."
                ;;
        esac
    else
        echo "No containers to remove."
    fi
}

list_images() {
    echo "\n--- Available Images ---"
    docker images
}

remove_images() {
    image_count=$(docker images -q | wc -l | tr -d ' ')

    if [[ $image_count -gt 0 ]]; then
        echo "\nChoose an option for image removal:"
        echo "1. Remove all images"
        echo "2. Keep all images"
        echo "3. Remove some images"
        read -p "Enter your choice (1, 2, or 3): " choice

        case "$choice" in
            1)
                docker image prune -a -f
                ;;
            2)
                ;;
            3)
                images=$(docker images -q)
                if [[ -n "$images" ]]; then
                    for image_id in $images; do
                        image_name=$(docker images -a --format "{{.Repository}}:{{.Tag}}" "$image_id")
                        read -p "\nRemove image '$image_name' ($image_id)? (Y/N): " remove_choice
                        if [[ "$remove_choice" == "Y" || "$remove_choice" == "y" ]]; then
                            containers_using_image=$(docker ps -a --filter "ancestor=$image_id" --format "{{.ID}}")
                            if [[ -n "$containers_using_image" ]]; then
                                read -p "Stop and remove these containers? (Y/N): " container_stop_choice
                                if [[ "$container_stop_choice" == "Y" || "$container_stop_choice" == "y" ]]; then
                                    for container_id in $containers_using_image; do
                                        if ! docker stop "$container_id"; then
                                            echo "Error: Failed to stop container $container_id"
                                        else
                                            docker rm "$container_id"
                                        fi
                                    done
                                fi
                            fi
                            docker rmi "$image_id"
                        fi
                    done
                else
                    echo "No images to remove."
                fi
                ;;
            *)
                echo "Invalid choice."
                ;;
        esac
    else
        echo "No images to remove."
    fi
}

cleanup_resources() {
    docker volume prune -f
    docker network prune -f
    docker system prune -f --volumes --networks --containers

    dangling_volumes=$(docker volume ls -qf dangling=true)
    dangling_networks=$(docker network ls -qf dangling=true)
    dangling_images=$(docker images -qf dangling=true)

    if [[ -n "$dangling_volumes" ]]; then
        echo "Dangling volumes found."
    fi
    if [[ -n "$dangling_networks" ]]; then
        echo "Dangling networks found."
    fi
    if [[ -n "$dangling_images" ]]; then
        echo "Dangling images found."
    fi
}

list_running_containers
remove_containers
list_images
remove_images
cleanup_resources

echo "Cleanup complete."
