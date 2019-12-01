---
title: "Managing the Registry"
chapter: false
weight: 20
---

![Registry](/images/device_registry.png)


In this exercise, you are going to use the **thing groups** functionality in the IoT Registry to manage several things at once. You can use this functionality to categorize things into groups, create a hierarchy of groups, and attach a policy to a group to change permissions and behavior of its things all at once. 

You will walk through a solution which has the following tasks:

* Configure Thing Groups
* Configure Thing Groups Hierarchy
* Configure IoT Fleet Indexing
* Add Things to its respective groups

{{% notice warning %}}
**You should only use the architecture and sample code displayed below as a guideline**.
{{% /notice %}}

Your **smart air conditioners** are getting online all over the world as you could see in the last section. To improve the way you manage things at scale, you will organize them in a layered hierarchical structure. The **Location** group should be at the root level.

The diagram below shows the hierarchical organization after creating all the groups in this exercise.

![group hierarchy](/images/10_mgmt_group_diagram.png)


For the following tasks, you will use both the AWS Console and AWS CLI to execute commands and procedures. First, you will organize your things into groups.

### Creating Thing Groups
___


Open the AWS IoT Console, if it is not already opened:

1. Type `iot core` on the **Find Services**
2. Click on **IoT Core** result
    ![OpenConsole](/images/020_mgmt_iot_console.png)
    Under the IoT Home page, on the left menu:
3. Click **Manage**
4. Click **Thing Groups**
5. Click **Create a thing Group**
    ![OpenConsole](/images/010_mgmt_thinggroup1.png)
6. Click **Create Thing Group**
7. Type `Location` as **Name**
8. Type `root level group` as **Description**
9. Under **Set group attributes**, type `DeviceRunningType` as **Attribute key**
10. Type `Production` as **Value** 
11. Click **Add Another**
12. Type `Level` as **Attribute key**
13. Type `Root` as **Value** 
14. Click **Create thing group**
    ![OpenConsole](/images/010_mgmt_thinggroup2.png)
    ![OpenConsole](/images/010_mgmt_thinggroup3.png)

### Create the layers of group hierarchy
___

In order to speed up the other groups creation, let´s use **Cloud9** and the **AWS CLI** commands.

You will start making children groups by creating the **East-USA** group. This group helps you define the first layer of specialization for your fleet and is the child of the **Location** group. 

You will create your thing group using the `create-thing-group` command in the AWS CLI. The command requires parameters, similar the ones you have used in AWS console, except the group hierarchy relationship, represented by the `--parent-group-name` parameter.

Go back to the Cloud9 tab opened previously: 

1. Copy and paste the command is below into the Cloud9 **terminal**:

```bash
# Create a Thing Group
aws iot create-thing-group \
    --thing-group-name East-USA \
    --parent-group-name Location \
    --thing-group-properties 'thingGroupDescription=child level group,attributePayload={attributes={DeviceRunningType=Production,Level=us-east},merge=true}'
```
2. Hit enter
    If the command executes successfully, the output will look like this:
    ![OpenConsole](/images/010_mgmt_cloud9-4.png)
    Next, create two child groups: **East-USA** group, **NYC** and **Miami** respectively. Concatenate the two commands together to improve speed:
3. Copy and paste the command is below into the Cloud9 **terminal**:
    ```bash
    # Create a Thing Groups
    aws iot create-thing-group \
        --thing-group-name NYC \
        --parent-group-name East-USA \
        --thing-group-properties 'thingGroupDescription=child level group,attributePayload={attributes={DeviceRunningType=Production,MaintWindow=00-06},merge=true}' &&\

    aws iot create-thing-group \
        --thing-group-name Miami \
        --parent-group-name East-USA \
        --thing-group-properties 'thingGroupDescription=child level group,attributePayload={attributes={DeviceRunningType=Production,MaintWindow=00-06},merge=true}' \
    && echo "Command completed successfully" || echo "Error executing the command"
    ```
4. Hit Enter
    If the command executes successfully, the output will look like this:
    ![OpenConsole](/images/010_mgmt_cloud9-5.png)
    You have created the first branch of the organization hierarchy. Now you have to define the **West-USA** and **South-America** organizations and their respective child groups. To quickly define this configuration, run the concatenated group creation command shown below. Be aware of different **attributes** and child relationships with higher hierarchy levels of the organization.  
5. Copy and paste the command is below into the Cloud9 **terminal**:
    ```bash
    # Create Thing Groups
    aws iot create-thing-group --thing-group-name West-USA --parent-group-name Location --thing-group-properties \
    'thingGroupDescription=child level group,attributePayload={attributes={DeviceRunningType=Production,Level=us-west},merge=true}'&&\
    aws iot create-thing-group --thing-group-name LasVegas --parent-group-name West-USA --thing-group-properties \
    'thingGroupDescription=child level group,attributePayload={attributes={DeviceRunningType=Production,MaintWindow=00-06},merge=true}'&&\
    aws iot create-thing-group --thing-group-name SanFrancisco --parent-group-name West-USA --thing-group-properties \
    'thingGroupDescription=child level group,attributePayload={attributes={DeviceRunningType=Production,MaintWindow=00-06},merge=true}' &&\
    aws iot create-thing-group --thing-group-name South-America --parent-group-name Location --thing-group-properties \
    'thingGroupDescription=child level group,attributePayload={attributes={DeviceRunningType=Production,Level=South-America},merge=true}'&&\
    aws iot create-thing-group --thing-group-name SaoPaulo --parent-group-name South-America --thing-group-properties \
    'thingGroupDescription=child level group,attributePayload={attributes={DeviceRunningType=Production,MaintWindow=00-06},merge=true}'\
    && echo "Command completed successfully" || echo "Error executing the command"

    ```
6. Hit Enter
    If the command executes successfully, the output will look like this:
    ![OpenConsole](/images/010_mgmt_cloud9-6.png)

### Checking the Created Groups in AWS IoT Console
___

Use the following steps to inspect the groups in the AWS IoT console and verify that all the commands ran successfully. 

Open the AWS IoT Console, if it is not already opened:

1. Type `iot core` on the **Find Services**
2. Click on **IoT Core** result
    ![OpenConsole](/images/020_mgmt_iot_console.png)
    Under the IoT Home page, on the left menu:
3. Click **Manage**
4. Click **Thing Groups**
6. Click on **Location** group on the canvas
    ![AWS IoT Core Console](/images/010_mgmt_thinggroup4.png)
    - Notice the DeviceRunningType and Level Attributes
        - These attributes will extend the thing metadata and can be queried later on
    ![AWS IoT Core Console](/images/010_mgmt_thinggroup5.png)
7. Click on **Groups** on the left
8.  Notice that **South-America, East-USA** and **West-USA** are child groups of **Location**
    ![AWS IoT Core Console](/images/010_mgmt_thinggroup6.png)
9. Click **South-America** 
10. Notice the child group **SaoPaulo** and click it
11. Click **Details** on the left
12. Notice the different attributes from the upper levels, like **MaintWindow** for example
    ![AWS IoT Core Console](/images/010_mgmt_thinggroup7.png)

Keep in mind that everything you created so far is searchable from fleet Indexing. You are going to enable it to include the things on this organization.

### Conclusion
**Congratulations**! You have added things to groups and organized your fleet into logical groups. You can now move to the next section.
