---
title: "Preparation"
chapter: false
weight: 11
---

## Setup

<details>
    <summary>**Click here if you will use your own AWS account to run the labs** </summary>
<p>

Login into the AWS Console of your own account, choose one of the **supported regions** and click the respective icon:

|<!-- -->|<!-- -->|
|---|---|
**Virginia (us-east-1)**|[![us-east-1](/images/cfn-button.png)](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://us-east-1-gbassan-builders.s3.amazonaws.com/artifacts/iot_setup.yaml&stackName=IoTBuildersMgmt)|
**Ohio (us-east-2)**|[![us-east-1](/images/cfn-button.png)](https://us-east-2.console.aws.amazon.com/cloudformation/home?region=us-east-2#/stacks/create/review?templateURL=https://us-east-2-gbassan-builders.s3.amazonaws.com/artifacts/iot_setup.yaml&stackName=IoTBuildersMgmt)|
**Oregon (us-west-2)**|[![us-east-1](/images/cfn-button.png)](https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/create/review?templateURL=https://us-west-2-gbassan-builders.s3.amazonaws.com/artifacts/iot_setup.yaml&stackName=IoTBuildersMgmt)|

In the opened cloudformation page:

1. Make sure your are in the selected **region**
2. Accepted the default **Stack Name**
3. Select **I ackonwledge ...** checkbox
4. Click **Create stack** 
    ![Sign in](/images/010_mgmt_cfnexec.png)


</p>
</details>

<details>
    <summary>
    **Click here if you will use the provided Re:Invent AWS account** <span style="color:red">(Recommended for Re:Invent´s IoT Builder Session)</span>
    </summary>

<p>
The account provided, will execute the cloudformation template and it will provide all the necessary resources to run the hands-on lab.

1. Click the link to open the [AWS Console](https://console.aws.amazon.com/)
2. Enter the provided **Account ID**
3. Enter the provided **IAM user name**
4. Enter the provided **Password**
5. Click **Sign In**
6. Make sure you are in the corrected designed **region**
    ![Sign in](/images/010_mgmt_signin.png)
    ![Sign in](/images/010_mgmt_region.png)


</p>
</details>


## Open the AWS Cloud9 IDE in your defined region

Before you get started you need to open the Cloud9 environment provided for this workshop.

{{% notice tip %}}
Ads, javascript, and tracking blockers should be disabled for
the Cloud9 domain, or connecting to the workspace might be impacted.
Cloud9 requires third-party-cookies. You can whitelist the [specific domains](https://docs.aws.amazon.com/cloud9/latest/user-guide/troubleshooting.html#troubleshooting-env-loading).
{{% /notice %}}

An instance of **Cloud9 IDE**, a powerful cloud development environment was already provisioned for you, with all the necessary files. Lets open it:

{{< tabs name="Region" >}}
{{< tab name="Virginia" include="010_preparation_us-east-1.md" />}}
{{< tab name="Ohio" include="010_preparation_us-east-2.md" />}}
{{< tab name="Oregon" include="010_preparation_us-west-2.md" />}}
{{< /tabs >}}

On the Cloud9 page, under **Your environments**:

1. Locate the **IoTCloud9** environment
2. Click **Open IDE**
    ![OpenConsole](/images/010_mgmt_cloud9-1.png)
    Wait the Cloud9 become available and then execute the following actions:
3. Close the **Welcome** tab
4. Close the **lower panel**
5. Click the **+** sign
6. Click **New terminal**
    ![OpenConsole](/images/010_mgmt_cloud9-2.png)
    ![OpenConsole](/images/010_mgmt_cloud9-3.png)
    Before move on, lets install a pre-requisite to run the following tasks:
5. Copy and paste the following command in the Cloud9 **terminal** 
    - jq is a command-line JSON processor. For more information, see: https://stedolan.github.io/jq/.
    ```bash
        sudo yum install jq -y
    ```
6. Leave the **Cloud 9 IDE** tab open, you will use for all this hands-on lab.

### Checking your Thing Fleet


Open the AWS IoT Console:

1. Type `iot core` on the **Find Services** field
2. Click on **IoT Core** result
    ![OpenConsole](/images/020_mgmt_iot_console.png)
    Under the IoT Home page, on the left menu:
3. Click **Get started**
4. Click **Manage**
5. Click **Things**
6. Notice the things, representing your **smart air conditioning** are already created and online
    - On the <span style="color:green"><b>green</b></span> panel, click **skip quick tour**
7. Click on any of the things (Your thing numbers might be different from the screenshot)
    ![OpenConsole](/images/010_mgmt_checkthings1.png)
    Under the thing detail page:
8. Click **Details**
9. Check its **Attributes** (Remember that your choosen thing might differ from the screenshot)
    - Notice the **serial number**
    - Notice the **version**
    - Notice the **Location** 
        - You are going to use this info to add to the right thing group
        - These are static information added on thing creation time
10. Click **Shadow**
    ![OpenConsole](/images/010_mgmt_checkthings2.png)
    Under the shadow detail page:
11. Notice the dynamic thing information 
    - Notice **led color**
    - Notice **alexa integration status**
    - Notice **powersave mode status**
    - Notice **vibration measures**
    ![OpenConsole](/images/010_mgmt_checkthings3.png)
Leave the AWS IoT console open in this browser tab. You are going to use it in the rest of the lab.


## Open the Fleet Dashboard

A web application to visually monitor your fleet has been provided. Let´s open it:

Open the AWS Cloudformation console in a new browser tab:

1. Click **Services** on the upper left section of the console
2. Type `cloudformation` on the **Find Services** field
3. Click on **Cloudformation** result
    ![OpenConsole](/images/010_mgmt_Cloudformation1.png)
4. Click **BuildersIoT** Stack
5. Click **Outputs** Tab
6. Crtl + Click **DashboardURL** link, to open it in another browser tab
    ![OpenConsole](/images/010_mgmt_Cloudformation2.png)
7. You should see this screen (Devices and its locations might differ from your dashboard):
    ![OpenConsole](/images/010_mgmt_Dashboard1.png)

Leave the Fleet Dashboard tab open. You will use for the entire hands-on lab. You can move to the next section.

