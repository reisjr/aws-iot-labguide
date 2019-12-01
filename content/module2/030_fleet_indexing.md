---
title: "Fleet Indexing"
chapter: false
weight: 30
---

![Fleet Indexing](/images/fleet_indexing.png)

To include all things from your fleet into the newly created groups, you need to enable fleet indexing. 
<p>
Fleet Indexing is a managed service included in AWS IoT that enables you to index and search your registry (things and groups) and shadow data in the cloud.<br>
After indexing, you can use a simple query language to search across this data, such as finding all devices that are handheld and have a battery life greater than 70%.<br> 
AWS IoT keeps it continuously updated with your latest data.
</p>

## Enable Fleet Indexing


Let´s configure your indexing configuration and run your search queries. 

Go back to the Cloud9 tab opened previously: 

1. Copy and paste the command is below into the Cloud9 **terminal**:

```bash
aws iot update-indexing-configuration \
    --thing-indexing-configuration thingIndexingMode=REGISTRY_AND_SHADOW \
    --thing-group-indexing-configuration thingGroupIndexingMode=ON &&\
echo "Fleet Indexing enabled successfully"|| echo "Error executing the command"
```
AWS IoT should complete the indexing in a few minutes. If you see errors in the next steps, maybe you have to wait a little more.

You have enabled Fleet Indexing. Now you will use it to query the devices and register accordingly in groups.

### Learning about Fleet Indexing capabilities

Now that you enabled Fleet Indexing, you can use it to identify every device in the LasVegas Location:

Open the AWS IoT Console, if it is not already opened:

1. Type `iot core` on the **Find Services**
2. Click on **IoT Core** result
    ![OpenConsole](/images/020_mgmt_iot_console.png)
    Under the IoT Home page, on the left menu:
3. Under **Manage** click **Things**
4. Click **Search Thing** Field
5. Click **Search** under **Locate or identify specific devices**
{{% notice tip %}}
If the **Advanced Search Fleet Indexing** screen doesn't show up, try refresh the page
{{% /notice %}}
    ![Fleet Indexing](/images/030_mgmt_fleetindex1.png)
    ![Fleet Indexing](/images/030_mgmt_fleetindex2.png)
6. On the **Search** field, type `attributes.Location:LasVegas`
    - On the <span style="color:green"><b>green</b></span> panel, click **skip quick tour**
7. Click **search**
8. Notice the devices under **Las Vegas** location
    (The returned devices might differ from your screen)
    ![Fleet Indexing](/images/030_mgmt_fleetindex3.png)
9. On the **Search** field type `attributes.serialNumber:[10 TO 15]`
10. Click **Serch**
11. Notice the returned things.
    (Again, the returned devices might differ from your screen)


### Adding Things to Groups
___

In this exercise, you will leverage queries to include devices into the correct groups, beginning with SaoPaulo devices. 

The following command iterates on every device that has the Location attribute as `SaoPaulo` and add it to the corresponding group. As the output of the AWS IoT command is in JSON format, it will use the jq command to parse the results. 

Go back to the Cloud9 tab opened previously: 

1. Copy and paste the command is below into the Cloud9 **terminal**:
    ```bash
    # Using search index, add things to their respective groups
    # to deal with the json output from the search-index command, we are going to use jq
    JSON=`aws iot search-index \
        --query-string attributes.Location:SaoPaulo \
        --output json` &&
    for row in $(echo "$JSON"| jq -r '.things[] |@base64'); \
    do  
        aws iot add-thing-to-thing-group \
        --thing-group-name SaoPaulo \
        --thing-name $(echo "$row"| base64 --decode |jq -r '.thingName'); \
    done &&
    echo "Things added successfully" || echo "Error executing the command"
    ```
    Now run the following script to add every device left in the **US** to its matching group:
2. Copy and paste the command is below into the Cloud9 **terminal**:
    ```bash
    # Using search index, adding things on respective group
    # to deal with the json output from the search-index command, we are going to use jq
    JSON=`aws iot search-index \
        --query-string 'NOT attributes.Location:SaoPaulo' \
        --output json` &&
    for row in $(echo "$JSON"| jq -r '.things[] |@base64'); \
    do  
        aws iot add-thing-to-thing-group \
        --thing-group-name $(echo "$row"| base64 --decode |jq -r '.attributes.Location') \
        --thing-name $(echo "$row"| base64 --decode |jq -r '.thingName'); \
    done &&
    echo "Things added successfully" || echo "Error executing the command"
    ```
    This command can take a while to execute. Wait for the success message.

### Conclusion

Congratulations! You have learned to index and search your registry. You can move to the next section.