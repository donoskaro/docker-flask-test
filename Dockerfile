FROM centos:7

# Update OS
RUN yum -y update

# Install Python and required packages
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install python36u
RUN yum -y install python36u-pip
RUN yum -y install python36u-devel
RUN yum -y install gcc

# Copy the required application files
ADD . /application

# Install all Python packages specified in requirements.txt
RUN pip3.6 install uwsgi
RUN pip3.6 install -r /application/requirements.txt

# Set the default directory for the environment
ENV HOME /application
WORKDIR /application

# Expose port 8000 for uwsgi
EXPOSE 8000

ENTRYPOINT ["uwsgi", "--http", "0.0.0.0:8000", "--module", "app:app", "--processes", "1", "--threads", "8"]