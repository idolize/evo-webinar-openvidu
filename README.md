# Evo: openvidu-streaming

The web application that connects to a running OpenVidu streaming service and manages connections of various clients.

Technology stack:
- AWS EC2, Elastic IP, Route 53, Redis
- OpenVidu and Kurento for media server
- Node.js application server and OpenVidu client

Currently deployed to https://evo.idol.software

> Originally based on the [openvidu-js-node tutorial](https://openvidu.io/docs/tutorials/openvidu-js-node/)

![Architecture Diagram](https://docs.google.com/uc?id=0B61cQ4sbhmWSVkNVZ2s3cmk2aHM)

## Deployment

Currently, this application is deployed *manually* using AWS EC2.

Instructions:
1. ssh into EC2 instance
1. Upload the files from this repo to `/opt/webapp`
1. `npm install`
1. Restart Nginx: `systemctl restart nginx`
1. Restart Supervisor: `systemctl restart supervisor`

[Additional documentation on deploying to AWS](https://openvidu.io/docs/deployment/deploying-app/)

### Logs

Logs can be found in the `/var/log/supervisor` directory of the EC2 instance.

### OpenVidu server dashboard

Note: this is a separate server (just concerned with streaming media) and is different from this server!

1. Go to https://evo.idol.software:4443
1. Use username `OPENVIDUAPP` and `evostreams` to log in to the OpenVidu admin dashboard

## Running locally

This service can be run locally (assuming the openvidu service is open on EC2) by doing the following:

1. `npm install`
1. `node server.js https://evo.idol.software:4443 evostreams`
1. Open web browser to https://localhost:5005
