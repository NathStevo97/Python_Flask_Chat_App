#Docker file to build image for the simple python flask app
#build image from python
FROM python:3.7
#define working directory for project
WORKDIR /app
#Ensure flask is installed on system
RUN pip install flask
#Copy appropriate files to working directory
COPY . .
#Define entrypoint for running app 
ENTRYPOINT [ "python" ]
#run the app
CMD [ "main.py" ]
