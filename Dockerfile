# # python docker and alpine linux docker
# FROM python:3.9-alpine3.13
# # who maintain the project
# LABEL maintainer="Bashar"

# ENV PYTHONUNBUFFERED 1

# #copy our requirements.txt file to docker images tmp/folder
# COPY ./requirements.txt /tmp/requirements.txt
# COPY ./requirements.dev.txt /tmp/requirements.dev.txt
# COPY ./app /app
# WORKDIR /app
# EXPOSE 8000
# ARG DEV = false
# # here we run the project in docker using under arguments
# # so confusing?
# # lets try.
# # atfirst we run this command which run in under alpine linux

# # this line creates a new virtualenv. To reduce the risk we should create virtual environment. for avoiding confliction we should do this
# RUN python -m venv /py && \
# # full path of our venv then command is upgrade the pip (python package manager) version then install all requirements.txt file from 
# #docker's tmp folder where we copy our requiremets.txt file
#     /py/bin/pip install --upgrade pip && \
#     /py/bin/pip install -r /tmp/requirements.txt && \
#     # then we remove the tmp directory coz we dont need extra dependency on our image while already once is been created 
#     # keep docker image as light as possible. its best practice
#     if [$DEV = "true"];\
#         then /py/bin/pip install -r /tmp/requirements.dev.txt && ; \
#     fi && \
#     rm -rf /tmp && \
#     # we have this adduser block. this does add user command which make a new user inside our image. reason the best practice not to use root user
#     # root user has the all access 
#     # dont run your application using the root user coz if your application is compromized then attacker gain full root access on that docker 
#     # container
#     adduser \
#     # we dont wanna to login with password so disable password
#         --disabled-password \
#         --no-create-home \
#         # name of user of the container
#         django-user

# # create path in our linux. To avoid full path while run our python we create this
# ENV PATH="/py/bin:$PATH"
# # when run docker the default user or last user is django-user
# # anytime that we run from our docker image the user will be django-user
# USER django-user

# then we crate a dockerignore file

# python docker and alpine linux docker
FROM python:3.9-alpine3.13
# who maintain the project
LABEL maintainer="Bashar"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        # name of user of the container
        django-user

# create path in our linux. To avoid full path while run our python we create this
ENV PATH="/py/bin:$PATH"
# when run docker the default user or last user is django-user
# anytime that we run from our docker image the user will be django-user
USER django-user

# then we crate a dockerignore file


