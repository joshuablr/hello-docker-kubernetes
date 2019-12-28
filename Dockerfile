FROM python:3.7.3-stretch

#define the working dir
WORKDIR /app

#copy the app source code to the working directory
COPY hello.py requirements.txt /app/

#install the necessary dependecies
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

#expose the port
EXPOSE 5000

#run the application
CMD ["python","hello.py"]