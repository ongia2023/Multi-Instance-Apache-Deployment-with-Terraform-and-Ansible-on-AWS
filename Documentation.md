**Multi-Instance Apache Deployment with Terraform and Ansible on AWS***

This project showcases scalable web application deployment on AWS using Terraform and Ansible. Three EC2 instances are provisioned, an Elastic Load Balancer distributes traffic, and Ansible automates Apache setup.

 Features

- IaC with Terraform: Declaratively define and manage AWS resources.
- Configuration with Ansible:Automate Apache installation and configuration on EC2 instances.
- Elastic Load Balancing: Distribute traffic across instances for high availability.
- Domain Registration: Register a ".ug" domain using AWS Route53.

How to Use

1. Clone the Repository:
   ```bash
   git clone https://github.com/ongia2023/multi-instance-apache-deployment.git
   cd multi-instance-apache-deployment
   ```

2. Update Configuration:
   - Replace `"wi-otem.com.ug"` in `main.tf` with your desired domain.

3. Deploy Infrastructure:
   ```bash
   terraform init
   terraform apply
   ```

4. Configure Instances:
   ```bash
   ansible-playbook -i host-inventory deploy.yml
   ```

5. Access Web Application:
   Visit "terraform-test.yourdomain.com.ug" to view content from rotating EC2 instances.

 Contribution

Contributions are welcome! Open issues, submit pull requests, or provide feedback to enhance this project.

---