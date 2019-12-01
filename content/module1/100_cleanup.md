---
title: "Clean up"
chapter: false
weight: 100
---

{{% notice warning %}}
If you are using a **PRODUCTION** or **CORPORATE** account **DON'T** execute the clean up procedure. It may remove critical resources 
or reconfigure your services impacting your environment.
{{% /notice %}}

```bash
# Remove CFN

remove roles devicedefender-DDA*

aws iot delete-policy \
    --delete-scheduled-audits

aws iot delete-account-audit-configuration \
    --delete-scheduled-audits

aws iot set-logging-options \
    --logging-options-payload roleArn="",logLevel=DISABLED

aws iot set-v2-logging-level \
    --log-target targetType="",targetName=DEFAULT
    --log-level DISABLED
```

## Survey




