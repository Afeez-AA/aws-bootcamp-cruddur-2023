# Week 1 — App Containerization
## Tasks completed for week 1
***
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
Add an endpoint for the notification tab
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

### **RUN DYNAMODB LOCAL CONTAINER AND ENSURE IT WORKS**


