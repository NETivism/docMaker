# ContributionRecur API


This is a API document about recurring contribution.


| 變數名稱 | 說明 | 類型 | 長度 | 格式 | 建立規則 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | Contribution Recur ID | 數字(int unsigned) | 10 | >= 0 | 必填 |
| contact_id | Foreign key to civicrm_contact.id . | 數字(int unsigned) | 10 | >= 0 | 必填 |
| amount | Amount to be contributed or charged each recurrence. | 數字(decimal) | 20,2 | 00.00 | 必填 |
| currency | 3 character string, value from config setting or input via user. | 字串(varchar) | 3 |  | 預設值: NULL |
| frequency_unit | Time units for recurrence of payment. | 字串(enum) |  | day,week,month,year | 預設值: 'month' |
| frequency_interval | Number of time units for recurrence of payment. | 數字(int unsigned) | 10 | >= 0 | 必填 |
| installments | Total number of payments to be made. Set this to 0 if this is an open-ended commitment i.e. no set end date. | 數字(int unsigned) | 10 | >= 0 |  |
| start_date | The date the first scheduled recurring contribution occurs. | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss | 必填 |
| create_date | When this recurring contribution record was created. | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss | 必填 |
| modified_date | Last updated date for this record. mostly the last time a payment was received | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| cancel_date | Date this recurring contribution was cancelled by contributor- if we can get access to it | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| end_date | Date this recurring contribution finished successfully | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| processor_id | FK to payment processor | 數字(int unsigned) | 10 | >= 0 |  |
| external_id | Possibly needed to store a unique identifier for this recurring payment order - if this is available from the processor?? | 字串(varchar) | 255 |  |  |
| trxn_id | unique transaction id. may be processor id, bank id + trans id, or account number + check number... depending on payment_method | 字串(varchar) | 255 |  |  |
| invoice_id | unique invoice id, system generated or passed in | 字串(varchar) | 255 |  |  |
| contribution_status_id |  | 數字(int unsigned) | 10 | >= 0 | 預設值: 1 |
| is_test |  | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |
| cycle_day | Day in the period when the payment should be charged e.g. 1st of month, 15th etc. | 數字(int unsigned) | 10 | >= 0 | 必填, 預設值: 1 |
| next_sched_contribution | At Groundspring this was used by the cron job which triggered payments. If we\'re not doing that but we know about payments, it might still be useful to store for display to org andor contributors. | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| failure_count | Number of failed charge attempts since last success. Business rule could be set to deactivate on more than x failures. | 數字(int unsigned) | 10 | >= 0 | 預設值: 0 |
| failure_retry_date | At Groundspring we set a business rule to retry failed payments every 7 days - and stored the next scheduled attempt date there. | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| auto_renew | Some systems allow contributor to set a number of installments - but then auto-renew the subscription or commitment if they do not cancel. | 布林值(boolean) | 1 | 0 or 1 | 必填, 預設值: 0 |
| last_execute_date | Last expected execute transaction date. | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |


## Recurring Contribution Get API

  API

### HTTP Method
```
GET
```

### Request URL
```
<entrypoint>?entity=contribution_recur&action=get&json={"id":85}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=get&pretty=1&json={"id":85}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contribution_recur&action=get&json='
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 85,
    "values": {
        "85": {
            "id": "85",
            "contact_id": "660",
            "amount": "500.00",
            "currency": "TWD",
            "frequency_unit": "month",
            "frequency_interval": "1",
            "installments": "12",
            "start_date": "2021-10-25 14:03:01",
            "create_date": "2021-10-01 14:03:01",
            "modified_date": "2021-11-24 14:03:01",
            "trxn_id": "HKOVvvL4mi",
            "invoice_id": "ogQMpTGr1XOP45N0XQamuiVoYWn7Jfru",
            "contribution_status_id": "5",
            "is_test": "0",
            "cycle_day": "5",
            "next_sched_contribution": "2021-11-25 14:03:01",
            "failure_count": "0",
            "auto_renew": "0"
        }
    }
}
```

## Recurring Contribution Create API

  API

### HTTP Method
```
POST
```

### Request URL
```
<entrypoint>?entity=contribution_recur&action=create
```

### Request Content Type
```
application/json
```

### Request body
```
{
    "contact_id": 661,
    "amount": "500.00",
    "currency": "TWD",
    "frequency_unit": "month",
    "frequency_interval": "1",
    "installments": "12",
    "start_date": "2021-10-25 14:03:01",
    "create_date": "2021-10-01 14:03:01",
    "cancel_date": "",
    "end_date": "",
    "processor_id": "",
    "external_id": "",
    "trxn_id": "JBDIxFGe8D",
    "invoice_id": "aYKfxYoCDImHqOqididjLhsvZeOx1yKX",
    "contribution_status_id": 5,
    "is_test": 0,
    "cycle_day": 5,
    "next_sched_contribution": "2021-11-25 14:03:01",
    "failure_count": 0,
    "failure_retry_date": "",
    "auto_renew": 0,
    "last_execute_date": ""
}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=create&pretty=1&json={"contact_id":661,"amount":"500.00","currency":"TWD","frequency_unit":"month","frequency_interval":"1","installments":"12","start_date":"2021-10-25 14:03:01","create_date":"2021-10-01 14:03:01","cancel_date":"","end_date":"","processor_id":"","external_id":"","trxn_id":"JBDIxFGe8D","invoice_id":"aYKfxYoCDImHqOqididjLhsvZeOx1yKX","contribution_status_id":5,"is_test":0,"cycle_day":5,"next_sched_contribution":"2021-11-25 14:03:01","failure_count":0,"failure_retry_date":"","auto_renew":0,"last_execute_date":""}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":661,"amount":"500.00","currency":"TWD","frequency_unit":"month","frequency_interval":"1","installments":"12","start_date":"2021-10-25 14:03:01","create_date":"2021-10-01 14:03:01","cancel_date":"","end_date":"","processor_id":"","external_id":"","trxn_id":"JBDIxFGe8D","invoice_id":"aYKfxYoCDImHqOqididjLhsvZeOx1yKX","contribution_status_id":5,"is_test":0,"cycle_day":5,"next_sched_contribution":"2021-11-25 14:03:01","failure_count":0,"failure_retry_date":"","auto_renew":0,"last_execute_date":""}' \
  '<entrypoint>?entity=contribution_recur&action=create'
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 86,
    "values": {
        "86": {
            "id": "86",
            "contact_id": "661",
            "amount": "500.00",
            "currency": "TWD",
            "frequency_unit": "month",
            "frequency_interval": "1",
            "installments": "12",
            "start_date": "20211025140301",
            "create_date": "20211001140301",
            "modified_date": "20211124140301",
            "cancel_date": "null",
            "end_date": "null",
            "processor_id": "null",
            "external_id": "null",
            "trxn_id": "JBDIxFGe8D",
            "invoice_id": "aYKfxYoCDImHqOqididjLhsvZeOx1yKX",
            "contribution_status_id": "5",
            "is_test": "0",
            "cycle_day": "5",
            "next_sched_contribution": "20211125140301",
            "failure_count": "0",
            "failure_retry_date": "null",
            "auto_renew": "0",
            "last_execute_date": "null"
        }
    }
}
```

## Recurring Contribution Update API

  API

### HTTP Method
```
POST
```

### Request URL
```
<entrypoint>?entity=contribution_recur&action=create
```

### Request Content Type
```
application/json
```

### Request body
```
{
    "id": 87,
    "contribution_status_id": 1,
    "next_sched_contribution": "",
    "end_date": "2021-11-24 14:03:01"
}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=create&pretty=1&json={"id":87,"contribution_status_id":1,"next_sched_contribution":"","end_date":"2021-11-24 14:03:01"}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":87,"contribution_status_id":1,"next_sched_contribution":"","end_date":"2021-11-24 14:03:01"}' \
  '<entrypoint>?entity=contribution_recur&action=create'
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 87,
    "values": {
        "87": {
            "id": "87",
            "contact_id": "662",
            "amount": "500.00",
            "currency": "TWD",
            "frequency_unit": "month",
            "frequency_interval": "1",
            "installments": "12",
            "start_date": "20211025140301",
            "create_date": "20211001140301",
            "modified_date": "20211124140301",
            "cancel_date": "",
            "end_date": "20211124140301",
            "processor_id": "",
            "external_id": "",
            "trxn_id": "CvzMMwGynz",
            "invoice_id": "lcxgKmGInd8seyEw2QVcKcOj6Foe4N44",
            "contribution_status_id": "1",
            "is_test": "0",
            "cycle_day": "5",
            "next_sched_contribution": "null",
            "failure_count": "0",
            "failure_retry_date": "",
            "auto_renew": "0",
            "last_execute_date": ""
        }
    }
}
```

## Recurring Contribution Delete API

  API

### HTTP Method
```
POST
```

### Request URL
```
<entrypoint>?entity=contribution_recur&action=delete
```

### Request Content Type
```
application/json
```

### Request body
```
{
    "id": 88
}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=delete&pretty=1&json={"id":88}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":88}' \
  '<entrypoint>?entity=contribution_recur&action=delete'
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
```
