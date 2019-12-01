---
title: "Audit: Setup"
chapter: false
weight: 21
---

Your company developed a new product and delivered thousands of devices to the market. Seeing the growing security issues on other IoT solutions, the CIO requested that you put in place a few compliance checks in a short amount of time. You thought on developing a robust monitoring mechanism, but the estimated effort and time would not meet the company needs. During this investigation, you read about AWS IoT Device Defender and how it can help you.

In this workshop, you will learn how to use AWS IoT Device Defender to simplify this task. The sample architecture shows an example of how to inspect and update AWS IoT policies that are too permissive and don't follow AWS IoT best practices.

You will walk through a solution which has the following tasks:

* Configure AWS IoT Device Defender Audit
* Setup an SNS Topic to send Findings to an AWS Lambda Function
* Understand and update the AWS Lambda function to process the audit results and fix detected issues
* Run an on-demand audit
* Monitor the progress of the audit
* Validate the mitigation action

The diagram below depicts the AWS services used in this solution and the main steps executed after completing the setup. {{% notice warning %}}
**You should only use the architecture and sample code displayed below as a guideline**.
{{% /notice %}}

![Sample Architecture](/images/20_workshop_arch_01.png)

---

## Setting up AWS IoT Device Defender Audit

AWS IoT Device Defender Audit requires a Role with specific Permissions to act on your account. The audit wizard helps you to setup this Role and create an initial Audit configuration.

If you have run the audit wizard before, you may skip this session. Otherwise, you should follow the steps below to finish this setup.

1. Open the AWS IoT console
![OpenConsole](/images/20_workshop_open_iot_console_01.png)
1. Choose **Defend**
1. If you see the screen below, it means you haven't setup the account yet
1. Choose **Get started with an audit**
![Setup1](/images/20_workshop_setup_console_01.png)
1. Choose **Next** 
![Setup2](/images/20_workshop_setup_console_02.png)
1. Choose **Create Role** 

{{% notice tip %}}
You may want to check the Permissions required by AWS IoT Device Defender Audit, clicking on **Permissions**
{{% /notice %}}

![Setup3](/images/20_workshop_setup_console_03_c.png)

1. For Name type `AWSIoTDeviceDefenderAudit_Role`
1. Choose **Create Role** 

![Setup3](/images/20_workshop_setup_console_03_b.png)

1. Choose **Next**

![Setup3](/images/20_workshop_setup_console_03_a.png)

1. Scroll down and choose **Next** 
![Setup4](/images/20_workshop_setup_console_04.png)
![Setup5](/images/20_workshop_setup_console_05.png)
1. Choose **Disabled**, because you will setup this later  
1. Choose **Enable audit** to finish
![Setup6](/images/20_workshop_setup_console_06.png)
1. You will see that AWS IoT Device Defender created a sample Daily Audit (`AWSIoTDeviceDefenderDailyAudit`)
![Setup7](/images/20_workshop_setup_console_07.png)

---

## Conclusion

Well done! You set up AWS IoT Device Defender Audit and created your first audit task. Now, let's work on the mitigation strategy.

![Journey](/images/20_iot_journey_02.png)
