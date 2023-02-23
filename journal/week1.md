# Week 1 — App Containerization
## Tasks completed for week 1
***
## Checklist Assignment 
1. Containerize the application
2.  Document the notification endpoint
3.  Write a flask endpoint for notification
4.  Run DynamoDB Local Container and ensure it works
5.  Run Postgres Container and ensure it works
### CONTAINERIZE THE APPLICATION 
1. BACKEND
    * Add the [Backend Dockerfile](../backend-flask/Dockerfile) in the `./backend-flask` directory.

    * Build the container 
    ```sh
        docker build -t  backend-flask .
    ```
    ![img](/_docs/assets/img1/built%20backend%20image.png)
    * Run the container
    ```sh
        docker run --rm -p 4567:4567 -it -e FRONTEND_URL='*' -e BACKEND_URL='*' backend-flask
    ```
    ![img](/_docs/assets/img1/dockerized%20backend%20running.png)

    * Verify the backend is running on the port in the browser
    ![img](/_docs/assets/img1/backend%20localhost.png)

    * Check the backend image ruuning
    ```sh
        docker images
    ```
    ![img](/_docs/assets/img1/backend-image.png)

 2. FRONTEND
    * Add the [Frontend Dockerfile](../frontend-react-js/Dockerfile) in the `./frontend-react-js` directory.

    * Run `npm i` in the directory above then build the container

    * Build the container 
    ```sh
        docker build -t  frontend-react-js .
    ```
    ![img](/_docs/assets/img1/build-frontend-container.png)
    * Run the container
    ```sh
        docker run -p 3000:3000 -d frontend-react-js
    ```
    ![img](/_docs/assets/img1/running%20frontend.png)
    * Verify the backend is running on the port in the browser
    ![img](/_docs/assets/img1/frontend%20running.png)

3. MULTIPLE CONTAINERS
* Create a [docker-compose.yml](../docker-compose.yml) at the project root directory
* Run the compose file
    ```sh
        docker compose up -d
    ```
* Verify that the multiple containers are up and running from your browser;
![img](/_docs/assets/img1/signed%20in%20to%20the%20cruddr.png)

### WRITE A FLASK ENDPOINT FOR NOTIFICATION 
