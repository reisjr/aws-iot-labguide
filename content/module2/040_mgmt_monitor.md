---
title: "Monitor Fleet Behavior"
chapter: false
weight: 40
---

![Monitoring](/images/monitoring.png)



When you have organized your fleet into groups, you can use this feature to control your fleet. This is useful to solve problems such as mitigating security incidents or launching new features.<br>
You can also leverage **Logging and Fine-grained Logging** when you organize your thing using Thing Groups.

### Monitoring and Applying Customized Policies on Your Fleet

Your support team reports that some of your customers are opening trouble tickets complaining about a strange behavior on their devices. Only customers in the **NYC** location are being impacted. You want to enable a **DEBUG** log level to this group and start troubleshoot the issue. 
 
AWS IoT can send all progress events about each message as it passes from your devices through the message broker, device gateway, and the rules engine. 

You can configure logging in two ways:

- Global logging
  - It sets one logging level for all logs no matter what resource has triggered the logs
- Fine-grained logging. 
  - It allows you to set a logging level for a specific  thing group.

To enable AWS IoT logging, you must create an AWS Identity and Access Management (IAM) role, register it with AWS IoT, and then configure logging on Cloudwatch.<br>

An IAM role has already been created for you using the name **IoTLogsRole-HASH**. It contains the required permissions:

**Role policy**

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:PutMetricFilter",
                "logs:PutRetentionPolicy"
             ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```
**Trust Policy**

```json
{ 
 "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "iot.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

### Enabling Global Logging


Open the AWS IoT Console, if it is not already opened:

1. Type `iot core` on the **Find Services**
2. Click on **IoT Core** result
  ![OpenConsole](/images/020_mgmt_iot_console.png)
Under the IoT Home page, on the left menu:
3. Click **Settings**
4. Under **Logs**, click **Edit**
  ![OpenConsole](/images/030_mgmt_monitor1.png)
5. Under **Level of verbosity**, choose **Info**
6. Under **Set role**, choose the `<StackName>-IoTLogsRole-<HASH>`
7. Click **Update**
8. On the <span style="color:green"><b>green</b></span> panel, click **Upgrade**
  ![OpenConsole](/images/030_mgmt_monitor2.png)
  ![OpenConsole](/images/030_mgmt_monitor2-1.png)

### Enabling fine-grained logging

Still on the **AWS IoT** console:

1. Click **Manage**
2. Click **Thing Groups**
3. Click **Search groups** field
4. Under **Locate or identify specific groups**, click **Search**
  ![OpenConsole](/images/030_mgmt_monitor3.png)
  ![OpenConsole](/images/030_mgmt_monitor4.png)
5. Under **Search** field, type `NYC`
6. Click **Search**
7. Click **NYC** Group
  ![OpenConsole](/images/030_mgmt_monitor5.png)
8. Click **Logs**
9. Notice **Local logging settings** is disabled. Only Global settings is applied place right now.
10. Click **Edit**
![OpenConsole](/images/030_mgmt_monitor6.png)
11. Choose **Debug (most verbose)** option
12. Click **Update**
13. Back in the group details page, click **Logs**
14. Notice this group is in **DEBUG** mode, while the others are follow the **Global** level
![OpenConsole](/images/030_mgmt_monitor7.png)

### Checking Logs (Optional)
___

You can use the AWS Cloudwatch console to see the AWS ioT logs.

Open the **Aamazon CloudWatch** console, if it is not already opened:

1. Type `cloudwatch` on the **Find Services**
2. Click on **Cloudwatch** result
  ![OpenConsole](/images/030_mgmt_cloudwatch1.png)
3. Under **Logs** on the left side, click **Log groups**
4. Click on **AWSIotLogsV2** LogGroup on the list
5. Feel free to explore the logs

### Conclusion

Congratulations! You have enabled logging to monitor your fleet. You can now move to the other section.