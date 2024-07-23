![Copy of 3-tier App1 drawio](https://github.com/user-attachments/assets/4d613e39-a30e-4435-91c5-34c234e8eb42)


Building A 3-Tier Architecture With Terraform

STEPS
1) Secure The Presentation Tier (Front-End)
   - Avoid Direct Public Endpoint Access:The front-end should not directly access public internet endpoints.
   - Implement A Web Server: Deploy Nginx, the webserver acts like an entry point for users and control access to backend   
     services.
2) Secure The Application Tier (Back-End)
   - Authentication and Authorisation: implement mechanisms within the API Gateway to     
     authenticate users and authorise their access to specific functionalities.
3) Secure The Data-Tier (Azure SQL Database)
   - Leverage Azure Security Features: Azure SQL Database offers built-in security features.  
     Utilise Azure directory for databse authentication and implement granular access controls to restrict who can access and      modify data.
VNET/SUBNET and Service Endpoint.
VNet Integration
