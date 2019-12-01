---
title: "Introduction"
chapter: false
weight: 10
---

## Welcome On-board

Hello **IoT Fleet Manager**,

This is a beautiful day to work on the security of your devices!

An IoT solution requires managing many devices, usually hundreds of thousands or millions. When you work at a large scale, you need to keep your fleet protected by continuously checking if it is following security best practices. It can be challenging for organizations to audit all devices and automatically remediate issues.

AWS IoT provides broad and deep functionality, spanning the edge to the cloud, so you can build IoT solutions for virtually any use case across a wide range of devices. Since AWS IoT integrates with AI services, you can make devices smarter, even without Internet connectivity. Built on AWS, which is used by industry-leading customers around the world, AWS IoT can easily scale as your device fleet grows and your business requirements evolve. AWS IoT also offers the most comprehensive security features so you can create preventative security policies and respond immediately to potential security issues.

## Your Mission

You are used to start the day checking all kinds of security issues such as device permissive policies, about to expire certificates, anomalous behavior, among others, but this has been working well for the soft launch stage where you had less than 50 devices to manage. Now that the solution has gathered interest from many customers, the expected amount of devices will increase quickly and you wonder if you can handle this activity by yourself.

In the past, you heard about AWS IoT Device Defender but didn’t have the time to test, but now you probably need a solution that can keep up with millions of devices. In this workshop, you will learn how to leverage AWS IoT Device Defender to execute different security and compliance activities and automate the responses.

## Your Journey Today

To start your journey, you will need to provision a few resources (Lambda functions, IAM Roles, SNS) required by the exercises on this workshop. After that, you will set up AWS IoT Device Defender Audit and learn how to create your first Audit task. Next, you will mitigate an overly permissive policy using a Lambda function. You will learn to use the new Mitigation Action to address an incorrect logging level using no code.

![IoTJourney](/images/10_iot_journey.png)

{{% notice warning %}}
This workshop must be executed in a **SANDBOX** account or one provided by an AWS architect.
**DON'T** run this workshop in a **PRODUCTION** or **CORPORATE** account.
{{% /notice %}}

In the first part, you will learn how to setup AWS IoT Device Defender to continuously audit your fleet for deviation from AWS best practices.

