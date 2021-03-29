# DEMETER Access Control System

https://acs.bse.h2020-demeter-cloud.eu:5443

# License

Authorization source code files are made avaialable under the Apache License, Version 2.0 (Apache-2.0), located into the LICENSE file.

# Contact List

| Request | Contact |
| ------ | ------ |
| Create account in Demeter ACS | https://acs.bse.h2020-demeter-cloud.eu:5443/sign_up/ |
| Access to DEH | Marko Stojanovic <Marko.Stojanovic@eng.it>, Antonio Caruso <Antonio.Caruso@eng.it> |
| Access to BSE | Yannis Oikonomidis <Yannis.OIKONOMIDIS@intrasoft-intl.com>, Dimitrios Skias <Dimitrios.Skias@intrasoft-intl.com> |
| Register new service in Demeter ACS | lmerino@vicomtech.org, jafernandez@vicomtech.org |
| Issues with account activation | lmerino@vicomtech.org, jafernandez@vicomtech.org |

# Update

Demeter ACS framework domain: https://acs.bse.h2020-demeter-cloud.eu:5443

# Introduction and description

Project: DEMETER

Aim: Create a distributed access control platform for the project. The components are based partly in the [Fiware framework](https://www.fiware.org/developers/). This repository contains the Identity Manager - Keyrock. From UMU, other modules are integrated to achieve a final platform with a PDP (Keyrock), PEP (from UMU), and a PAP (from UMU) to manage [access and permission](https://gitlab.com/demeterproject/wp3/se/components/authorization) in an environment.

# Documentation

There are several sections in this guide depending on the action that wants to be done.

- Acess DEH and BSE resources in Demeter Cloud: **OPTION A: Demeter Cloud ACS access request**
- Make use of the Access Control System (authentication and authorization) instance in Demeter Cloud ACS as a client application: **OPTION B: Demeter Cloud ACS integration with client application**
- Deploy its own ACS (authentication and authorization components) instance (not part of Demeter Hub or Project): **OPTION C: ACS Bundle Deployment**

# Repository description

## Authentication Directory

- keyrock-instance: directory with allnecessary files to deploy a keyrock instance apart from the one already existing in the Demeter Cloud.
- docker-compose.yml: docker environment configuration file to deploy mentioned modules in several containers.
- .env: configuration file with environment variables for the docker-compose
- keyrock-dockerfile/Dockerfile: docker image for keyrock
- mysql-data stores database backups for Keyrock
- example-application: directory with all necessary files to replicate an  example application that akes use of Keyrock for authentication as well as the authroization modules in https://gitlab.com/demeterproject/wp3/se/components/authorization 
- webapp-dockerfile/Dockerfile: docker image for web app
- composeexample and login directories, as well as manage.py script store web app source code.

## Authorization Directory

The authorization side (authorization subfolder) of ACS project contains two developments:

1. XACML_PAP_PDP. Offers a web environment to manage subjects, actions and resources and policies (PAP) and an endpoint to verify if a subject can perform an action over a specific resource through the policies (PDP).
2. Py_CapabilityManagerWebService (Capability Manager). Offers an endpoint to obtain the capability token to a specific subject, action and resource.

Each development corresponds with a subfolder.

# Demeter Cloud ACS access requests

1. Create a user account in Keyrock with the [registration form](https://acs.bse.h2020-demeter-cloud.eu:5443/sign_up/)
2. For account enabling once it has been created (step 1), please check your mail inbox and SPAM folders for activation message of the Identity Provider. 
3. Email BSE oro DEH administrator to assign role and that way, achive permission to resources.

# OPTION A: Demeter Cloud ACS integration with client application

This guide explains the steps for a client application that wants to make use of the Demeter Cloud Access Control System (Demeter Cloud ACS, composed by Keyrock Identity Manager for authentication and the Capacity Manager, XACML PDP module and PEP Proxy module) for authorization to be taken.

For a better understanting, an example can be found in the following address:

https://vicomlab.ddns.net:5999


## Prerequisites

The web service must be deployed in a machine with access to the internet and that can also be accessed and reached through a URL (domain or fix IP address + port + route).

> Get a public domain (for example, with [no-ip](https://www.noip.com/)) for the HTTPS certificates in Keyrock, as well as configuring a DNS server if necessary.

It is also required to use TLS (HTTPS) certificates with a domain to secure communications.

> Generate certificates with [Let's Encrypt](https://letsencrypt.org/). It is necessary to have ports 80 and 443 free so that the [certbot](https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71) of Let's Encrypt is able to carry out the handshake to assure domain is owned by the machine.

## Step-by-step guide

1. Create a user account in Keyrock with the [registration form](https://acs.bse.h2020-demeter-cloud.eu:5443/sign_up/)
2. For account enabling once it has been created (step 1), please check your mail inbox and SPAM folders for activation message of the Identity Provider. 
3. Email [Keyrock administrator](jafernandez@vicomtech.org, lmerino@vicomtech.org) to register applications and creating roles.

- **Application Name**: a name to identify the application
- **Application Description**: a brief description of the application function
- **Url**: IP address or domain + port + route of the client app from where the authentication requests to Keyrock are sent and where authentication credentials are recieved when successful.
- **Callback Url**: IP address or domain + port + route of the client app where the app will deal with failed authentication requests.
- **Logout Url**: IP address or domain + port + route of the client app where user is redirected after logging out from the application.
- **Provider**: Keyrock user dealing with permissions in the app.

- Roles to create in the application.

4. Give permissions to Demeter Cloud ACS administrator (if not already done):
Click in Authorization button
![alt text](authentication/documentation-images/1.png "Click in Authorization button")
Search admin user and add to application
![alt text](authentication/documentation-images/2.png "Search admin user and add to application")
Assign Provider role to admin
![alt text](authentication/documentation-images/3.png "Assign Provider role to admin")
Check changes have been successfully saved
![alt text](authentication/documentation-images/4.png "Check changes have been successfully saved")

5. Implement the authentication token request in client application that will make use of Keyrock as the Identity Manager for users to authenticate in the app:

```bash
curl -i --location --request POST 'https://acs.bse.h2020-demeter-cloud.eu:5443/v1/auth/tokens' \
--header 'Content-Type: application/json' \
--data-raw '{
"name": "[USER EMAIL]",
"password": "[USER PASSWORD]"
}'
```

This query will return the authentication token in the header, as well as the expiration time of the token:

```bash
HTTP/1.1 201 Created
Cache-Control: no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0
X-Subject-Token: 2eecbf4b-c93b-4001-8bc0-3616f44fb291
Content-Type: application/json; charset=utf-8
Content-Length: 141
ETag: W/"8d-ps+pfBENqpqFXyxdqXOD7auouzo"
Set-Cookie: session=eyJyZWRpciI6Ii8ifQ==; path=/; expires=Wed, 07 Oct 2020 15:56:43 GMT; secure; httponly
Set-Cookie: session.sig=TqcHvLKCvDVxuMk5xVfrKEP-GSQ; path=/; expires=Wed, 07 Oct 2020 15:56:43 GMT; secure; httponly
Date: Wed, 07 Oct 2020 14:56:43 GMT
Connection: keep-alive

{"token":{"methods":["password"],"expires_at":"2020-10-07T15:56:43.769Z"},"idm_authorization_config":{"level":"advanced","authzforce":false}}
```

6. Design desired authorization policies and send them to [Capability Manager Administrator](https://gitlab.com/demeterproject/wp3/se/components/authorization)

7. Register users who will access the resources, link them to desired application in Keyrock, and [assign roles to them](https://fiware-idm.readthedocs.io/en/latest/user_and_programmers_guide/application_guide/index.html#authorize-users-and-organizations).

8. Deploy authorization [PEP Proxy](https://gitlab.com/demeterproject/wp3/se/components/authorization) and configure it to protect the desired resource to which the authorization policy will be applied.

9. Implement the authorization token request in the client application:

```bash
curl -i -X POST 'https://acs.bse.h2020-demeter-cloud.eu:3030/' \
-H 'Content-Type: application/json' \
--data-raw '{ "token": "[AUTHENTICATION TOKEN RETURNED BY KEYROCK]", "ac":"[HTTP VERB OF THE ACTION]", "de":"[PROXY URL]","re":"[RESOURCE TO BE ACCESSED]"}'
```

This query will return the capability token, similar to this:

```bash
{"id": "f6ov8md6uo3fvf2jg9qoh1n486", "ii": 1601378324, "is": "capabilitymanager@odins.es", "su": [USERNAME], "de": "https://acs.bse.h2020-demeter-cloud.eu:1028", "si": "MEQCICJe/eGFeyUWAXESa4SLBVWeNfEHo+w92l4AvOAbvLPZAiAHgdu+MpXZ41s+pVr1PdM1LDjZrn0rhd3Oflty4+w6cA==", "ar": [{"ac": [HTTP_VERB], "re": [RESOURCE]}], "nb": 1601379324, "na": 1601389324}
```

10. Request the content to the PEP Proxy

```bash
curl -ik -X [HTTP_VERB] \
[PROXY URL + RESOURCE PATH] \
-H 'accept: application/json' \
-H 'x-auth-token: [INSERT HERE THE CAPABILITY TOKEN (COMPLETE RESPONSE FROM THE PREVIOUS QUERY)]}'
```
This query will return the content queried.

## Things to take into account with authentication token:

Authentication token refresh request:

The authentication token for a user has an expiration time. If the actual session wants to be mantained, it is essential that the token is renew before expiration time.

Request example:

```bash
curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --data-binary "{
  \"token\": \"token_id\"
}" \
'http://keyrock/v1/auth/tokens'
```

Successful response example:

```bash
201

HEADERS

Content-Type:application/json,application/json; charset=utf-8
X-Subject-Token:04c5b070-4292-4b3f-911b-36a103f3ac3f
Content-Length:74
ETag:W/"4a-jYFzvNRMQcIZ2P+p5EfmbN+VHcw"
Date:Mon, 19 Mar 2018 15:05:35 GMT
Connection:keep-alive

BODY

{
  "token": {
    "methods": [
      "password"
    ],
    "expires_at": "2018-03-20T15:05:35.697Z"
  }
}
```

Failed response returns 404 error code.

Revoke token for log out

If a user wants to log out the token that the user was using for the session should be revoked for security reasons. Avoiding this way that the session keeps valid. Request example:

```bash
curl --include \
     --request DELETE \
     --header "X-Auth-token: auth_token" \
     --header "X-Subject-token: subj_token" \
  'http://keyrock/v1/auth/tokens'
```

Successful response example:

```bash
204

HEADERS

Content-Type:application/json
```
 Failed response returns 404 error code.


# OPTION B: ACS Bundle Deployment

## Prerequisites
This section explains the steps to follow to replicate the deployment of Keyrock.

> This framework has been developed with Docker containers.

1. [Docker](https://docs.docker.com/engine/install/ubuntu/) and [Docker Compose](https://docs.docker.com/compose/install/) have to be installed.
2. Download repository: `$ git clone https://gitlab.com/demeterproject/wp3/se/components/authentication.git`
3. Get a public domain (for example, with [no-ip](https://www.noip.com/)) for the HTTPS certificates in Keyrock, as well as configuring a DNS server if necessary.
4. Generate certificates with [Let's Encrypt](https://letsencrypt.org/). It is necessary to have ports 80 and 443 free so that the [certbot](https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71) of Let's Encrypt is able to carry out the handshake to assure domain is owned by the machine.

## Authentication 

1. Copy generated certificates to directory mapped to Keyrock container volume in `docker-compose.yml` file (`/host/path/to/certs/:/opt/fiware/certs/`) and modify filename in keyrock-dockerfile.
2. Modify .env file to configure framework.
3. Start the platform up: `$ sudo docker-compose up`
4. Load database in Keyrock: `$ sudo cat mysql-data/backup.sql | sudo docker exec -i db-mysql /usr/bin/mysql -u root --password=secret idm`
5. Check Keyrock status: enter `https://keyrock-domain:5443` in a browser or send `$ curl https://keyrock-domain:5443/` and receive a response with an HTML.
6. Login into Keyrock:
    - Username: admin@test.com
    - Password: test

### Troubleshooting

Restart framework:

- `sudo docker-compose down`
- `sudo docker-compose up`

To check container logs:

- `sudo docker-compose logs -f`

Network troubleshooting:

- Network works fine if it is reachable through `ping ip_address`
- Domain works fine if it is reachable through `ping domain`
- Check if certificates have expired
- Check whether all containers are up and running:

```bash
$ sudo docker ps
CONTAINER ID        IMAGE                                      COMMAND                  CREATED             STATUS                    PORTS                                                      NAMES
ef6c82fe4872        fiware/idm-ca                              "/opt/fiware-idm/doc…"   41 minutes ago      Up 41 minutes (healthy)   0.0.0.0:3005->3005/tcp, 3000/tcp, 0.0.0.0:3443->3443/tcp   fiware-keyrock

5fde4a634607        mysql:5.7                                  "docker-entrypoint.s…"   41 minutes ago      Up 41 minutes             0.0.0.0:3306->3306/tcp, 33060/tcp                          db-mysql
```

## Authorization

Configure docker-compose environment variables by accessing the project directory and edit docker-compose to verify environment variables.

### Prerequisites

1. Certificated files must be generated. Copy generated certificates files (fullchain.pem, privkey.pem and cert.pem) to capabilitymanager certs folder (`./authorization/Py_CapabilityManagerWebService/certs/`). You have to respect these file names or update volumes section of capabilitymanager service in docker-compose file.

### XACML_PAP_PDP (xacml service of docker-compose)

If you don't need blockchain integration you can remove the "environment" section or define `BlockChain_integration=0`.

If you need blockchain integration (`BlockChain_integration=1`), you have two ways to configure the integration:

- Using a configuration file (./authorization/XACML_PAP_PDP/PAP/ConfigData/blockchain.conf) : `BlockChain_configuration=0`

- Using the environment variables of docker-compose.yml file : `BlockChain_configuration=1` 				
	
	- BlockChain_protocol=http # Optional: Default value : http
	- BlockChain_domain=demeterdomain # Required 
	- BlockChain_IP=#<specify Blockchain endpoint IP address> # Required
	- BlockChain_port=8000 # Optional Default value : 8000
	- BlockChain_get_resource=/policy/demeterdomain # Optional : Default value : /policy/<BlockChain_domain>
 	- BlockChain_post_resource=/policy/register # Optional : Default value : /policy/register
	- BlockChain_update_resource=/policy/update # Optional : Default value : /policy/update

### Capability Manager (capabilitymanager service of docker-compose)

Certificates: Adjust volumes section to pass certificate files to the component.

Optional: define Capability Manager protocol (optional).

    - capman_protocol: Admitted values: "https","http". Default "https"

You must define the endpoint of IDM-Keyrock

- keyrock_protocol=<specify IdM protocol>. Admitted values: "http","https"
- keyrock_host=<specify IdM Public IP address>
- keyrock_port=<specify IdM Public port>
- keyrock_admin_email=<specify IdM admin email, required to access to applications and roles of IdM>
- keyrock_admin_pass=<specify IdM admin password, required to access to applications and roles of IdM>

If you need blockchain integration you must define the endpoint of blockchain

- blockchain_usevalidation=Define if you need Blockchain integration: Admitted values: "0"-No; "1"-Yes.
- blockchain_protocol=<specify Blockchain protocol>. Admitted values: "http","https"
- blockchain_host=<specify Blockchain Public IP address>
- blockchain_port=<specify Blockchain Public port>


and endpoint of PDP where validate if subject, action and resource is allowed 

- PDP_URL=<specify XACML-PDP Public address (including service) ex: http://acs.bse.h2020-demeter-cloud.eu:8080/XACMLServletPDP/>

### Build the proyect images (USE ONLY IF IMAGES DON'T EXIST):

IMPORTANT: If you have defined access control policies (using PAP component) you don't use these commands to avoid to lose this configuration.

This step is optional because if images don't exist, they will build when running the project (with docker-compose).

To build all authorization project images, access to the authorization subfolder and run:

```bash  
cd authorization
./build-all-images.sh
```

To build individually a project image, access to the specific subdirectory, inside authorization subfolder, and run build.sh file:

```bash
cd authorization/XACML_PAP-PDP
./build.sh<>
```

```bash
cd authorization/Py_CapabilityManagerWebWService
./build.sh<>
```
### Troubleshooting

If the certificates were renovated, you need to include them in capabilitymanager service image. Once certificate files are ubicated at the corresponding folder following prerequisites indications, access to the project directory and run:

```bash  
docker-compose build capabilitymanager
```
After you can run as you can see below.
### Run authorization components:

Once docker-compose file is reviewed, access to the project directory and run:

```bash  
docker-compose up -d
```
You can see if authorization components are running with:

```bash
$ sudo docker ps -as | grep "xacml"
$ sudo docker ps -as | grep "capabilitymanager"
```
### Testing XACML_PAP_PDP

### Testing PAP

Access through a web explorer to `http://<XACML-PublicIP>:8080/XACML-WebPAP-2`. You will see the main webpage of the PAP service. Push `Manage Policies` button and once the page is loaded push `Apply` button, no error has ocurrs.

### Testing PDP

- To test PDP is running you can run:

```bash
curl --location --request GET 'http://<XACML-PublicIP>:8080/XACMLServletPDP'
```

you must obtain a response like this (status=200):

```bash
You have to send a POST message with the XACML Request
```

- To test a PDP request (policies) you can run:

```bash
curl --location --request POST 'http://<XACML-PublicIP>:8080/XACMLServletPDP/' \
--header 'Content-Type: text/plain' \
--data-raw '<Request xmlns="urn:oasis:names:tc:xacml:2.0:context:schema:os">
   <Subject SubjectCategory="urn:oasis:names:tc:xacml:1.0:subject-category:access-subject">
       <Attribute AttributeId="urn:oasis:names:tc:xacml:2.0:subject:role" DataType="http://www.w3.org/2001/XMLSchema#string">
           <AttributeValue>Pedro</AttributeValue>
       </Attribute>  
   </Subject>
   
   <Resource>
       <Attribute AttributeId="urn:oasis:names:tc:xacml:1.0:resource:resource-id" DataType="http://www.w3.org/2001/XMLSchema#string">
           <AttributeValue>https://123.123.123.123:1028/ngsi-ld/v1/entities?type=http://www.w3.org/ns/sosa/Sensor;idPattern=urn:ngsi-ld:Sensor:parking.*</AttributeValue>
       </Attribute>
   </Resource> 

   <Action>
       <Attribute AttributeId="urn:oasis:names:tc:xacml:1.0:action:action-id" DataType="http://www.w3.org/2001/XMLSchema#string">
           <AttributeValue>GET</AttributeValue>
       </Attribute>  
   </Action>

   <Environment/>
</Request>'

```

you must obtain a response like this (status=200):

```bash
<Response>
  <Result ResourceID="https://123.123.123.123:1028/ngsi-ld/v1/entities?type=http://www.w3.org/ns/sosa/Sensor;idPattern=urn:ngsi-ld:Sensor:parking.*">
    <Decision>Permit</Decision>
    <Status>
      <StatusCode Value="urn:oasis:names:tc:xacml:1.0:status:ok"/>
    </Status>
  </Result>
</Response>
```

### Testing Capability Manager

- To test Capability Manager is running you can run:

```bash
curl --location --request GET 'https://<CapabilityManager-PublicIP>:3030'
```

you must obtain a response with status=200.
