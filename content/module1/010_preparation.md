---
title: "Preparation"
chapter: false
weight: 11
---

Before you start, you need to setup the environment for this workshop.

## Open the AWS Cloud9 Environment

{{% notice warning %}}
The Cloud9 workspace should be built by an IAM user with Administrator privileges,
not the root account user. Please ensure you are logged in as an IAM user, not the root
account user.
{{% /notice %}}

{{% notice tip %}}
Ad blockers, javascript disablers, and tracking blockers should be disabled for
the Cloud9 domain, or connecting to the workspace might be impacted.
Cloud9 requires third-party-cookies. You can whitelist the [specific domains](https://docs.aws.amazon.com/cloud9/latest/user-guide/troubleshooting.html#troubleshooting-env-loading).
{{% /notice %}}

## Getting the Console Link

For re:invent, you will receive an account to execute the labs.

[Click here](https://gist.github.com/reisjr/e4efe6063691b811122e0e88fc470fe3) to get the link.

## Launch AWS Cloud9 in your Closest Region

The Cloud9 environment will simplify the execution of different steps on this workshop. Available regions:

 Region | Link
 -------------  | -------------
  **Virginia** | [Click here - https://us-east-1.console.aws.amazon.com/cloud9/home?region=us-east-1](https://us-east-1.console.aws.amazon.com/cloud9/home?region=us-east-1)
  **Oregon**   | [Click here - https://us-east-1.console.aws.amazon.com/cloud9/home?region=us-west-2](https://us-west-2.console.aws.amazon.com/cloud9/home?region=us-west-2)

To launch the environment, after opening one of the URLs above, follow the instructions:

* Select **Create environment**

![c9before](/images/10_create_cloud9.png)

- Name it **awsiotworkshop-\<your last name\>**
- Choose **Next step**

![c9name](/images/10_create_cloud9_name.png)

- Scroll down to find the button, you will use the default configuration
- Choose **Next step**

![c9name](/images/10_create_cloud9_config.png)

- Scroll down to find the button
- Choose **Create environment**

![c9name](/images/10_create_cloud9_review.png)

You launched a new Cloud9 environment to do this workshop. It may take a few minutes before the environment is ready.

## Set up Cloud9 Environment
---

When it comes up, customize the environment 

- Close the **Welcome** tab
- Open a new **terminal** tab in the main work area
- Close **lower work area**

![c9after](/images/10_cloud9_env_setup.png)

Your workspace should now look like this

![c9after](/images/10_cloud9_env_setup_ready.png)

{{% notice tip %}}
You can choose a different theme by selecting **View / Themes** in the Cloud9 workspace menu.
{{% /notice %}}

## Clone the Repository
---
You need to create a few resources which will be used during the workshop. To create them, you will use CDK, an easy way to provision resources on your account. 
Follow the instructions below to complete the set up.

* Go to the Cloud9 terminal
* Clone the workshop github repository

```bash
git clone https://github.com/reisjr/aws-iot-dd-labcode.git
```

## Deploy the Container for Virtual Devices
---
* Go to the root directory of the repository
```bash
cd ~/environment/aws-iot-dd-labcode
```
* Install jq
```bash
$ sudo yum install -y jq
```
* Push the sample code to the pipeline
```bash
$ export AWS_DEFAULT_REGION=<region-you-chose>
$ ./scripts/push.sh
```

## Conclusion

![Journey](/images/20_iot_journey_01.png)

---
## Optional: Launch the CDK

* Go to the cloned repository CDK directory
```bash
cd ~/environment/aws-iot-dd-labcode
```
* Install the [Cloud Development Kit - CDK](https://docs.aws.amazon.com/pt_br/cdk/latest/guide/getting_started.html)
```bash
npm install -g aws-cdk
sudo pip-3.6 install -r requirements.txt
```

* Deploy the CDK stack
```bash
$ cdk deploy
```


