# docker bkms 

**1. Docker Service Autostart on Reboot:**

* **Systemd (Most Linux Distributions):**
    * Use `systemctl is-enabled docker` to check if the Docker service is set to start automatically.
    * Use `sudo systemctl enable docker` to enable autostart.
    * Use `sudo systemctl disable docker` to disable autostart.

* **macOS and Windows (Docker Desktop):**
    * Docker Desktop typically manages this automatically. Check the Docker Desktop settings for startup options.

**2. Docker Containers Autostarting on Reboot:**

* Docker containers can be configured to restart automatically using the `--restart` flag when you run `docker run`.
    * `docker run --restart unless-stopped ...` is a common configuration.
    * `docker ps -a` will list all containers. Then inspect each container with `docker inspect <container_name_or_ID>` and look for the restart policy.
    * To prevent a container from autostarting, you can use `docker update --restart=no <container_name_or_ID>`.

**3. Docker Resources in Current Use:**

* **Containers:** `docker ps` (running containers)
* **Images:** `docker images` (all images)
* **Networks:** `docker network ls` (all networks)
* **Volumes:** `docker volume ls` (all volumes)

**4. Docker Resources Created but Not in Use:**

* **Images:**
    * `docker images --filter "dangling=true"` (dangling images)
* **Networks:**
    * `docker network ls --filter "dangling=true"` (dangling networks, less common)
* **Volumes:**
    * `docker volume ls --filter dangling=true` (Dangling volumes)
* **Containers:**
    * `docker ps -a --filter "status=exited"` (exited containers)

**5. Aggregate Resource Usage of Running Containers:**

* `docker stats`: Shows live resource usage for all running containers.

**6. Cleanup Unused Docker Resources:**

* **Dangling Images:** `docker image prune`
* **Exited Containers:** `docker container prune`
* **Unused Volumes:** `docker volume prune`
* **Unused Networks:** `docker network prune`
* **All Unused Resources:** `docker system prune -a` (use with caution, as it removes everything unused)

**7. Stop All Running Containers and Cleanup Resources:**

* **Stop All Containers:** `docker stop $(docker ps -aq)`
* **Remove All Stopped Containers:** `docker container prune -f`
* **Remove All Unused Images:** `docker image prune -af`
* **Remove All Unused Volumes:** `docker volume prune -af`
* **Remove All Unused Networks:** `docker network prune -af`
* **Remove all unused data:** `docker system prune -af`

**8. Hardening Your Host System and Docker Security:**

* **Minimize Exposed Ports:**
    * Only expose necessary ports using the `-p` or `--publish` flag in `docker run`.
    * Use specific port mappings (e.g., `-p 8080:80`) instead of random ones.
    * Use `netstat -tulnp` or `ss -tulnp` on the host to check for open ports.
* **Use Docker Security Scanning:**
    * Docker Hub provides security scanning for images.
    * Use third-party scanning tools like Trivy or Clair.
* **Implement Docker Content Trust:**
    * Sign and verify images to ensure their integrity.
* **Use Rootless Docker:**
    * Running the docker daemon without root privileges increases security.
* **Container Resource Limits:**
    * Limit container resource usage (CPU, memory) using flags like `--cpus` and `--memory` in `docker run`.
* **Security Profiles:**
    * Use AppArmor or SELinux to restrict container capabilities.
* **Keep Docker Updated:**
    * Install security updates promptly.
* **Network Security:**
    * Use Docker networks to isolate containers.
    * Use firewalls to control network traffic.
* **Secrets Management:**
    * Use Docker secrets to manage sensitive data.
* **Regular Audits:**
    * Periodically review your Docker configuration and security practices.

