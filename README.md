                    Multi Environment VM Monitoring with Ansible 

Project Aim
This as a learning project to get hands on experience with Ansible, understand how dynamic inventories actually work, and figure out how to manage multiple environments without losing my mind

Problem Statement 

Managing infrastructure across Development, Production, and QA environments creates operational challenges: manual health checks are time consuming and error prone, resource utilization lacks centralized visibility, and critical issues often go unnoticed until they cause outages. As infrastructure scales, these problems become unmanageable.

What I Built

I decided to learn Ansible and build something practical an automated monitoring system that actually tells me what's happening across all my environments without me having to SSH into every single box.

Here's what it does

Automatic Discovery: Using AWS EC2 dynamic inventory, it finds all my servers automatically based on their environment tags. No more maintaining static IP lists that get outdated the moment someone spins up a new instance.

Health Snapshots: It runs across all servers, grabs CPU, memory, and disk usage, then packages everything into a single email report. Color coded sections for each environment make it easy to spot trouble at a glance.

Actually Useful Reports: Instead of raw numbers in a terminal, I get HTML emails with progress bars and health badges. If something's running at 85% memory, it shows up in red and I know to investigate.

Why This Approach?

I know Prometheus and Grafana exist for real time monitoring and fancy dashboards. But for periodic health checks and email summaries, Ansible was simpler to set up and does exactly what I needed no database to maintain, no exporters to configure on every server, just playbooks that run and send me reports.


![alt text](<Screenshot 2025-10-04 at 14.02.43.png>)

![alt text](<Screenshot 2025-10-04 at 14.03.09.png>)

![alt text](<Screenshot 2025-10-04 at 14.03.41.png>)