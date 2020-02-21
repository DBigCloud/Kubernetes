# Example how to deploy a high availability application with Nutanix and Kubernetes for www.dbigcloud.com
## Redis Guestbook APP for DBigCloud
#### Folders
- **Blueprint**: contains a JSON file for import the blueprint created for Nutanix Calm
- **Master**: contains yaml files for create POD, Container and Service for Redis Master POD
- **Slave**: contains yaml files for create POD, Container and Service for Redis Slaves PODs
- **Frontend**: contains yaml files for create POD, Container and Service for FrotendPod PODs

#### **NOTE**: This yaml files are ready for paste in the POD Editor console - Nutanix CALM. Be carefourl with the namespace valule, change it.
#### This example was based on the Kubernetes official tutorial: [Example: Deploying PHP Guestbook application with Redis](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/) and adapted it for Nutanix Calm blueprint.
