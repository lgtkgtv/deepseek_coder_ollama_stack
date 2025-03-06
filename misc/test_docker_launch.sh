#!/bin/bash

# Script to download Docker images and launch containers for testing.

# Function to download an image
download_image() {
    local image_name="$1"
    log_message "Downloading image: $image_name"
    if ! docker pull "$image_name"; then
        log_message "Error: Failed to download image $image_name"
        return 1
    fi
    return 0
}

# Function to launch a container
launch_container() {
    local image_name="$1"
    local container_name="$2"
    local run_args="${@:3}" # Capture any extra run arguments.
    log_message "Launching container: $container_name from image: $image_name"
    if ! docker run --name "$container_name" "$run_args" "$image_name"; then
        log_message "Error: Failed to launch container $container_name"
        return 1
    fi
    return 0
}

# Function to log messages
log_message() {
    echo "$(date) - $1"
}

# Test cases:

# 1. Download and launch a basic image (alpine)
log_message "--- Test Case 1: Basic Download and Launch ---"
if download_image alpine:latest && launch_container alpine:latest alpine_test1 sh -c "echo 'Hello from alpine' && sleep 5"; then
    log_message "Test Case 1 passed."
else
    log_message "Test Case 1 failed."
fi

# 2. Download and launch an image with port mapping (nginx)
log_message "--- Test Case 2: Port Mapping ---"
if download_image nginx:alpine && launch_container nginx:alpine nginx_test2 -p 8080:80 -d; then
    log_message "Test Case 2 passed. (Check http://localhost:8080)"
else
    log_message "Test Case 2 failed."
fi

# 3. Download and launch an image with a volume mount (busybox)
log_message "--- Test Case 3: Volume Mount ---"
mkdir -p test_volume
echo "Test data" > test_volume/test.txt
if download_image busybox:latest && launch_container busybox:latest busybox_test3 -v "$(pwd)/test_volume:/test_volume" sh -c "cat /test_volume/test.txt"; then
    log_message "Test Case 3 passed."
else
    log_message "Test Case 3 failed."
fi

# 4. Attempt to launch a non-existent image
log_message "--- Test Case 4: Non-Existent Image ---"
if download_image non_existent_image:latest; then
    log_message "Error: Test Case 4 should have failed (non-existent image)."
else
    log_message "Test Case 4 passed (image download failed as expected)."
fi

# 5. Attempt to launch a container with a name that already exists
log_message "--- Test Case 5: Duplicate Container Name ---"
if launch_container alpine:latest alpine_test1 sh -c "echo 'This should fail'"; then
    log_message "Error: Test Case 5 should have failed (duplicate name)."
else
    log_message "Test Case 5 passed (duplicate name launch failed as expected)."
fi

# 6. Launch a container with environment variables
log_message "--- Test Case 6: Environment Variables ---"
if download_image alpine:latest && launch_container alpine:latest alpine_test6 -e "TEST_VAR=test_value" sh -c "echo \$TEST_VAR"; then
    log_message "Test Case 6 passed."
else
    log_message "Test Case 6 failed."
fi

# 7. Launch a detached container and then stop it.
log_message "--- Test Case 7: Detached Container and Stop ---"
if download_image alpine:latest && launch_container alpine:latest alpine_test7 -d sh -c "sleep 100"; then
    log_message "Test Case 7 launch passed. stopping container."
    docker stop alpine_test7
    log_message "Test Case 7 stop passed."
else
    log_message "Test Case 7 failed."
fi

# 8. Launch a container with network options.
log_message "--- Test Case 8: Network Options ---"
docker network create test_network
if download_image alpine:latest && launch_container alpine:latest alpine_test8 --network test_network sh -c "ping -c 1 8.8.8.8"; then
    log_message "Test Case 8 passed."
else
    log_message "Test Case 8 failed."
fi
docker network rm test_network

# 9. Test a command that exits with a non-zero exit code
log_message "--- Test Case 9: Non-zero Exit Code ---"
if download_image alpine:latest && launch_container alpine:latest alpine_test9 sh -c "exit 1"; then
    log_message "Error: Test Case 9 should have failed (non-zero exit code)."
else
    log_message "Test Case 9 passed (non-zero exit code failed as expected)."
fi

log_message "--- Testing complete ---"
