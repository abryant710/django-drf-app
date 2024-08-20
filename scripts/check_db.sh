docker run -h db2server --name db2server --restart=always --detach --privileged=true -p 50000:50000 --env-file .env -v ./database:/database ibmcom/db2
