---
title: "Detect: Mitigation Device Side"
chapter: false
weight: 32
---

Your devices run a local web server allowing customers manage them easily. In the bootstrap, the device starts a socket listening on port 80 to serve requests. This is the only port ever opened by the firmware. A couple of weeks ago, another company faced a security issue where its devices were hacked, creating additional sockets listening on anomalous ports. In this way, the devices were remote controlled by hackers.

You thought that monitoring a few metrics such ports open and amount of packets on the device and reporting them to the IoT solution could help detecting this kind of threat earlier. That is exactly what AWS Device Defender Detect does using device side metrics. 

You need to run an agent on each device that report key metrics to AWS IoT regularly.

[AWS IoT Device Defender Detect](https://docs.aws.amazon.com/iot/latest/developerguide/device-defender-detect.html#DetectMetricsMessages)

## Setting up AWS IoT Device Defender Device Side Metrics

## Forcing an Anomalous Behavior 

## Checking

## Executing a Mitigation Action

## Conclusion