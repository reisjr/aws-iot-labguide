---
title: "Applying Group Permissions"
chapter: false
weight: 50
---

![Security](/images/security.png)


You have a new request from the Marketing and Development department: They want to enable a **beta feature in the `SanFrancisco`** devices in **Production** to integrate an Alexa skill on smart A/C devices, that enables voice control for room temperature. 

You need an additional security policy that allows the devices in the **SanFrancisco** location to listen to a new topic named `alexa/integration/<deviceName>`.<br>
 The device already has the code to process the command. 

Attaching a policy to a group will allow every thing under this group or any things/groups bellow its hierarchy, to inherit the policy permissions.

### Creating a new policy
___

In this exercise, you will use a previously created policy file, `alexaPolicy.json` added on your Cloud9 environment.<br>

This policy allows the `subscribe` action to the new topic `alexa/integration/<device-name>`:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iot:Subscribe",
        "iot:Receive"
      ],
      "Resource": [
        "arn:aws:iot:<region>:<account>:topicfilter/alexa/integration/*",
        "arn:aws:iot:<region>:<account>:topic/alexa/integration/*"
      ]
    }
  ]
}

```


In order to process the message successfully, the policy needs to allow both Subscribe and Receive actions. Additionally, it contains a wild card (*) after the `alexa/integration/` because you need to apply the same policy to every device in the group.


{{% notice warning %}}
A very permissive policy has been used to help the flow of the task. The recommended way in production would be using a policy Variable like `${iot.Connection.Thing.ThingName}` or another certificate parameter.
{{% /notice %}} 

Go back to the Cloud9 tab opened previously: 

1. Make sure your are in the right directory by copy and paste the command below into the Cloud9 **terminal**
```bash
cd ~/environment/IoTRepository/
```
2. Copy and paste the command is below into the Cloud9 **terminal**:

```bash
# create iot policy
aws iot create-policy \
    --policy-name alexaPolicy \
    --policy-document file://scripts/alexaPolicy.json
```
Ok! if you see this output, the command run successfully:

![Fleet Indexing](/images/050_mgmt_permission1.png)

### Attaching the policy to the thing group

Open the AWS IoT Console, if it is not already opened:

1. Type `iot core` on the **Find Services**
2. Click on **IoT Core** result
    ![OpenConsole](/images/020_mgmt_iot_console.png)
Under the IoT Home page, on the left menu:
3. Click **Manage**
4. Click **Thing Groups**
5. Click **Search groups** field
6. Under **Locate or identify specific groups**, click **Search**
    ![OpenConsole](/images/030_mgmt_monitor3.png)
    ![OpenConsole](/images/030_mgmt_monitor4.png)
7. Under **Search** field, type `SanFrancisco`
8. Click **Search**
9. Click **SanFrancisco** Group
    ![OpenConsole](/images/050_mgmt_permission2.png)
10. Click **Security**
11. Click **Edit**
    ![OpenConsole](/images/050_mgmt_permission3.png)
12. Choose **alexaPolicy** policy. Click **Close** to select
13. Click **Save**
    ![OpenConsole](/images/050_mgmt_permission4.png)

### Checking changes taking effect

You can use the Fleet Dashboard to get an overview of your current fleet and see the devices provisioned on your account.

1. Open the **Fleet Dashboard** tab opened previously.

After opening the Fleet Dashboard, you  see all the current devices provisioned on your account.

![OpenConsole](/images/050_mgmt_dashboard1.png)

Notice that each device has the following information (in that order):

* DeviceID
* Location
* Temperature
* Humidity
* Led status
* Alexa status


Scroll down to the **SanFrancisco** location devices and check if the Alexa icon changed from |this: ![noalexa](/images/noalexa.png) to this: ![alexa](/images/alexa.png). 

The other locations remains with no Alexa integration, since we just applied **alexaPolicy** on **SanFrancisco** group.

### Conclusion

Congratulations! You have enabled group policies. You can now move to the other section.