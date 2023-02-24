# Week 1 — App Containerization
# **TASKS COMPLETED FOR WEEK 1**

1. CHECKLIST ASSIGNMENT
2. HOMEWORK CHALLENGE 
## **CHECKLIST ASSIGNMENT** 
1. Containerize the application
2.  Document the notification endpoint
3.  Write a flask endpoint for notification
4. Write a React Page for Notifications
4.  Run DynamoDB Local Container and ensure it works
5.  Run Postgres Container and ensure it works
### **CONTAINERIZE THE APPLICATION** 
1. BACKEND
    * Add the [Backend Dockerfile](../backend-flask/Dockerfile) in the `./backend-flask` directory.

    * Build the container 
    ```sh
        docker build -t  backend-flask .
    ```
    ![img](/img1/built%20backend%20image.png)
    * Run the container
    ```sh
        docker run --rm -p 4567:4567 -it -e FRONTEND_URL='*' -e BACKEND_URL='*' backend-flask
    ```
    ![img](/img1/dockerized%20backend%20running.png)

    * Verify the backend is running on the port in the browser
    ![img](/img1/backend%20localhost.png)

    * Check the backend image ruuning
    ```sh
        docker images
    ```
    ![img](/img1/backend-image.png)

 2. FRONTEND
    * Add the [Frontend Dockerfile](../frontend-react-js/Dockerfile) in the `./frontend-react-js` directory.

    * Run `npm i` in the directory above then build the container

    * Build the container 
    ```sh
        docker build -t  frontend-react-js .
    ```
    ![img](/img1/build-frontend-container.png)
    * Run the container
    ```sh
        docker run -p 3000:3000 -d frontend-react-js
    ```
    ![img](/img1/running%20frontend.png)
    * Verify the frontend is running on the port in the browser
    ![img](/img1/frontend%20running.png)

3. MULTIPLE CONTAINERS
* Create a [docker-compose.yml](../docker-compose.yml) at the project root directory
* Run the compose file
    ```sh
        docker compose up -d
    ```
* Verify that the multiple containers are up and running from your browser;
![img](/img1/signed%20in%20to%20the%20cruddr.png)

### **DOCUMENT THE NOTIFICATION ENDPOINT**
Add an endpoint for the notification tab in the [openapi-3.0.yml](../backend-flask/openapi-3.0.yml) file
```sh
/api/activities/notifications:
    get:
      description: 'Return a feed activity for people I follow'
      parameters: []
      responses:
        '200':
          description: returns an array of activities
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Activity'

```
![img](/img1/notification%20added%20code.png)
![img](/img1/notifcation%20documentation.png)



### **WRITE A FLASK ENDPOINT FOR NOTIFICATION**
Step1: Update the  [app.py](../backend-flask/app.py) with the following codes
```sh
    @app.route("/api/activities/notifications", methods=['GET'])
def data_notifications():
  data = NotificationsActivities.run()
  return data, 200
```
```sh
from services.notifications_activities import *
```
Step2: Create the [notifications_activities](../backend-flask/services/notifications_activities.py) file.

Step3: Verify from the browser
![img](/img1/notification%20web%20browser.png)

### **WRITE A REACT PAGE FOR NOTIFICATIONS**
Step1: Update the [App.js](../frontend-react-js/src/App.js) with the following codes
```sh
    path: "/notifications",
    element: <NotificationsFeedPage />
  },
```
```
import NotificationsFeedPage from './pages/NotificationsFeedPage.js';
```

Step2: Create and the following files;
* [NotificationsFeedPage.css](../frontend-react-js/src/pages/NotificationsFeedPage.css)
* [NotificationsFeedPage.js](../frontend-react-js/src/pages/NotificationsFeedPage.js)

Step 3: Verify from the browser
![img](/img1/notification%20web%20page.png)

### **RUN DYNAMODB ON THE LOCAL CONTAINER AND ENSURE IT WORKS**
Step1: Lets integrate the following into our existing docker compose file
```sh
services:
  dynamodb-local:
    # https://stackoverflow.com/questions/67533058/persist-local-dynamodb-data-in-volumes-lack-permission-unable-to-open-databa
    # We needed to add user:root to get this working.
    user: root
    command: "-jar DynamoDBLocal.jar -sharedDb -dbPath ./data"
    image: "amazon/dynamodb-local:latest"
    container_name: dynamodb-local
    ports:
      - "8000:8000"
    volumes:
      - "./docker/dynamodb:/home/dynamodblocal/data"
    working_dir: /home/dynamodblocal

```
Volumes;
```sh
    volumes: 
        - "./docker/dynamodb:/home/dynamodblocal/data"
```
STEP2: Create a table
```sh
aws dynamodb create-table \
    --endpoint-url http://localhost:8000 \
    --table-name Music \
    --attribute-definitions \
        AttributeName=Artist,AttributeType=S \
        AttributeName=SongTitle,AttributeType=S \
    --key-schema AttributeName=Artist,KeyType=HASH AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
    --table-class STANDARD

```
Step3: Create an item
```sh
aws dynamodb put-item \
    --endpoint-url http://localhost:8000 \
    --table-name Music \
    --item \
        '{"Artist": {"S": "No One You Know"}, "SongTitle": {"S": "Call Me Today"}, "AlbumTitle": {"S": "Somewhat Famous"}}' \
    --return-consumed-capacity TOTAL  
```
![img](/img1/created%20dynamodb%20item.png)

Step4: List Records
```sh
aws dynamodb list-tables --endpoint-url http://localhost:8000
```
![img](/img1/listed%20dynamodb%20item.png)
Step5: Get Records
```
aws dynamodb scan --table-name cruddur_cruds --query "Items" --endpoint-url http://localhost:8000
```
![img](/img1/dynamo%20db%20terminal%20verified.png)

### **RUN POSTGRES CONTAINER AND ENSURE IT WORKS**
Step1:Lets integrate the following into our existing docker compose file;
```sh
services:
  db:
    image: postgres:13-alpine
    restart: always
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
    ports:
      - '5432:5432'
    volumes: 
      - db:/var/lib/postgresql/data
volumes:
  db:
    driver: local

```
Step2: To install the postgres client into Gitpod
```sh
  - name: postgres
    init: |
      curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
      echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
      sudo apt update
      sudo apt install -y postgresql-client-13 libpq-dev

```

step3: Volumes
```sh
volumes: 
  - db:/var/lib/postgresql/data

volumes:
  db:
    driver: local
```

Step4: Verify
![img](/img1/postgres%20verified.png)
## **HOMEWORK CHALLENGE**
1. 