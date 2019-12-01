---
title: "OTA updates with IoT Jobs"
chapter: false
weight: 60
---

![IoT Job](/images/job.png)


### Remotely Managing and Customizing Devices


The **smart air conditioner** is becoming a huge success. Your company is deploying smart A/Cs in South America, starting in Sao Paulo, Brazil.

As part of IoT Ops, you will manage devices globally and you will implement a change on the behavior of sensors to display the temperature in Celsius degrees, which is the temperature scale used in South America.  

The development team already thought about this requirement and embedded the functionality in the sensor firmware. Your main challenge will be to deploy this new behavior at scale remotely, without compromise the device and lost is connectivity.

To accomplish this task in a repeatable, reliable, controlled and auditable way, you will use **AWS IoT Jobs**. With AWS IoT Jobs, you can send remote actions to devices, such as software updates, reboots, factory resets, and security patches, etc.


To create a job, you must first create a job document that is a description of the remote operations to be performed by the devices. For the purpose of this lab, we are going to use the following job document, which has been uploaded to a **S3 bucket**:

```json
{
    "tempUnit":"celsius",
    "ledColor":"green"
}
```

At first, this looks like a simple document, but your Python code inside the virtual device is expecting it in the following piece of code (*code is redacted for example purposes*):

```python
...
def executeJob(self, execution):
        logger.debug('Executing job ID, version, number: {}, {}, {}'.format(execution['jobId'], execution['versionNumber'], execution['executionNumber']))
        logger.debug('With jobDocument: ' + json.dumps(execution['jobDocument']))
        try:
            global temp_unit
            
            #code omitted (...)
            
            temp_unit = execution['jobDocument']['tempUnit']
            shadowCallbackContainer_Bot.sendUpdate(execution['jobDocument']['ledColor'])

            return True
        except:
            return False
...
```

The Python code is subscribed to the job topics and can access all the information from the job document that is being executed through the `JSON['jobDocument']` element. 

In this case, the device is changing a global variable to convert the temperature to celsius and update the shadow document with the new LED color state.

```python
# Check global var to identify if the job already run
...
    if temp_unit != "celsius":
        temp = (1.8 * temp) + 32
    
    payload = {
        'temp': round(temp, 2), 
        'humid': humid
    }
...
```

### Creating a Job

Open the AWS IoT Console, if it is not already opened:

1. Type `iot core` on the **Find Services**
2. Click on **IoT Core** result

    ![OpenConsole](/images/020_mgmt_iot_console.png)

    Under the IoT Home page, on the left menu:

3. Click **Manage**
4. Click **Jobs**
5. Click **Create a job**

    ![OpenConsole](/images/060_mgmt_jobs1.png)

6. Click **Create custom job**
7. Type `ChangeTempUnit` as **Job ID**
8. Type `My test job` as **description**

    ![OpenConsole](/images/060_mgmt_jobs2.png)

9. On **Select devices to update**, click **select**
10. Click **Thing Groups**
11. Select **SaoPaulo** group

    ![OpenConsole](/images/060_mgmt_jobs3.png)

12. On **Add job file**, click **Select**
13. Type `iotbucket` on the **filter**
14. Select `<Stack>-iotbucket-<HASH>`. 
    - Remember to select the bucket on your **region**
15. Clear the `iotbucket` filter
16. Select **job_config.json**
17. On **Job type** select **CONTINUOUS** option
18. Click **Next**
    ![OpenConsole](/images/060_mgmt_jobs4.png)
    ![OpenConsole](/images/060_mgmt_jobs5.png)
19. Accept **constant rate**
20. Type `1` as **Maximum per minute** 
21. Accept the defaults for the other fields
22. Click **Create**
    ![OpenConsole](/images/060_mgmt_jobs6.png)
    ![OpenConsole](/images/060_mgmt_jobs7.png)

### Monitoring the job execution

Still on **AWS IoT Jobs** console:

1. Click the created **ChangeTempUnit** job

    This is the overview execution of the Job. Note that you can see the summary of how many things are queued to execute the job, how many already succeeded, and failed, etc.

2. Notice that as this job is **CONTINUOUS**, i.e., it will always have **IN_PROGRESS** status as it will run for every thing that joins the group in the future.

3. Every device related to the `SaoPaulo` group was QUEUED to run the job created. The job will follow the concurrency constraints defined by the `maximumPerMinute` parameter and will execute on each target inside the `SaoPaulo` group.

4. Click one of the devices from the Job console (e.g. device-022) 
5. Notice the information about the job creation and its status
6. Click **refresh** a couple times to see the other devices executing the job

    ![OpenConsole](/images/060_mgmt_jobs8.png)


### Monitoring the job execution using device dashboard

You can use the Fleet Dashboard to get an overview of your current fleet and see the devices provisioned on your account.

1. Open the **Fleet Dashboard** tab opened previously.

    After opening the Fleet Dashboard, you  see all the current devices provisioned on your account.

    ![OpenConsole](/images/060_mgmt_jobs9.png)

    Find the devices under de `SaoPaulo` location, which executed your job and check if the LED icon changed from this:  ![red](/images/led_red.png) 
    to this:
    ![green](/images/led_green.png)

{{% notice tip %}}
Notice that while the job is running on each device, the LED will change to blue.
{{% /notice %}}


Additionally, after receiving  messages from the `SaoPaulo` devices, you should notice that the temperature now had changed to **Celsius degrees!**


### Conclusion

Congratulations! You have run successfully a job and monitored its execution until its completion. You can move to the last section.
