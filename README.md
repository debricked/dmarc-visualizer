# dmarc-visualizer

Analyse and visualize DMARC results using open-source tools.

* [parsedmarc](https://github.com/domainaware/parsedmarc) for parsing DMARC reports,
* [Elasticsearch](https://www.elastic.co/) to store aggregated data.
* [Grafana](https://grafana.com/) to visualize the aggregated reports.

See the full blog post with instructions at https://debricked.com/blog/2020/05/14/analyse-and-visualize-dmarc-results-using-open-source-tools/.

## Rasperry Pi

To me this is the perfect project for a constantly watching Rasperry Pi. These steps for initial setup have been working fine for me on a Rasperry Pi 4 8GB:

* Install OS: Ubuntu Server 20.10 - run all the updates
* Install Docker - taken from https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04 and https://askubuntu.com/questions/1288835/how-to-install-docker-on-ubuntu-20-10
* Install latest docker-compose Version - Taken from https://ovks.de/2020/05/how-to-install-newest-docker-compose-on-a-raspberry-pi-ubuntu-aarch64/
    
First, update your existing list of packages:
    
    sudo apt update && sudo apt upgrade
 Next, install a few prerequisite packages which let apt use packages over HTTPS:
 
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
Then add the GPG key for the official Docker repository to your system:

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
Add the Docker repository to APT sources:

    sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
Next, update the package database with the Docker packages from the newly added repo:

    sudo apt update
Make sure you are about to install from the Docker repo instead of the default Ubuntu repo:

    apt-cache policy docker-ce
You’ll see output like this, although the version number for Docker may be different:

    Output of apt-cache policy docker-ce
    docker-ce:
    Installed: (none)
    Candidate: 5:19.03.9~3-0~ubuntu-focal
    Version table:
    5:19.03.9~3-0~ubuntu-focal 500
    500 https://download.docker.com/linux/ubuntu focal/stable amd64 Packages
Notice that docker-ce is not installed, but the candidate for installation is from the Docker repository for Ubuntu 20.04 (focal).

Finally, install Docker:

    sudo apt install docker-ce
Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it’s running:

    sudo systemctl status docker
 
The output should be similar to the following, showing that the service is active and running:

    Output
    ● docker.service - Docker Application Container Engine
    Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
    Active: active (running) since Tue 2020-05-19 17:00:41 UTC; 17s ago
    TriggeredBy: ● docker.socket
    Docs: https://docs.docker.com
    Main PID: 24321 (dockerd)
    Tasks: 8
    Memory: 46.4M
    CGroup: /system.slice/docker.service
    └─24321 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
Install latest docker-compose version 

    mkdir compose && cd $_ && wget https://github.com/docker/compose/archive/1.26.0-rc4.tar.gz && sudo apt update && sudo apt-get install -y build-essential python3-pip libffi-dev libssl-dev && tar xf 1.26.0-rc4.tar.gz && cd compose-* && sudo python3 setup.py install

Download the files in this repo and navigate to the extracted folder, first into parsedmarc subfolder. As root (sudo) Type

    nano parsedmarc.ini
 To adjust the IMAP Details to your needs (Special characters in PW will not work by the way). Then type

    docker-compose up
    
  And visit http://localhost:3000 respectively your devices IP.
    
 

## Screenshot

![Screenshot of Grafana dashboard](/big_screenshot.png?raw=true)
