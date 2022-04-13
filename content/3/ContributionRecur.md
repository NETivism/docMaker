+++
title = "Contribution Recurring API"
menuTitle = "Contribution Recurring"
chapter = false
+++
This is a API document about recurring contribution.

| 變數名稱 | 類型 | 長度 | 格式 | 建立規則 | 說明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 數字(int unsigned) | 10 | >= 0 | 更新時必填 | Unique Contribution Recur ID |
| contact_id | 數字(int unsigned) | 10 | >= 0 | 必填 | Foreign key to civicrm_contact.id |
| amount | 數字(decimal) | 20,2 | 00.00 | 必填 | Amount to be contributed or charged each recurrence. |
| currency | 字串(varchar) | 3 |  | 預設值: NULL | 3 character string, value from config setting. |
| frequency_unit | 字串(enum) |  | day,week,month,year | 預設值: 'month' | Time units for recurrence of payment. |
| frequency_interval | 數字(int unsigned) | 10 | >= 0 | 必填 | Number of time units for recurrence of payment. |
| installments | 數字(int unsigned) | 10 | >= 0 |  | Total number of payments to be made. Set this to 0 if this is an open-ended commitment. |
| start_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss | 必填 | The date the first scheduled recurring contribution occurs. |
| create_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss | 必填 | When this recurring contribution record was created. |
| modified_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Last updated date for this record. mostly the last time a payment was received |
| cancel_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Date this recurring contribution was cancelled by contributor- if we can get access to it |
| end_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Date this recurring contribution finished successfully |
| processor_id | 數字(int unsigned) | 10 | >= 0 |  | FK to Payment Processor |
| external_id | 字串(varchar) | 255 |  |  | an external unique identifier for this recurring payment order provide by payment method |
| trxn_id | 字串(varchar) | 255 |  |  | unique transaction id or this recurring defined by this application |
| invoice_id | 字串(varchar) | 255 |  |  | unique invoice id, system generated or passed in |
| contribution_status_id | 數字(int unsigned) | 10 | >= 0 | 預設值: 1 | 1=completed, 2=pending, 3=cancel, 4=failed, 5=in progress, 6=overdue, 7=suspend |
| is_test | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 | Mark 1 when this order is an testing order. |
| cycle_day | 數字(int unsigned) | 10 | >= 0 | 必填, 預設值: 1 | Day in the period when the payment should be charged e.g. 1st of month, 15th etc. |
| next_sched_contribution | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Next payment day for display or execution(if needed). |
| failure_count | 數字(int unsigned) | 10 | >= 0 | 預設值: 0 | Number of failed charge attempts since last success. |
| failure_retry_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Record retried date after payment fail retry. |
| auto_renew | 布林值(boolean) | 1 | 0 or 1 | 必填, 預設值: 0 | Auto renew card expiration date when available. |
| last_execute_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Last payment execution transaction date to prevent duplicate execution at the same frequency_unit. |


## Recurring Contribution Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```
<entrypoint>?entity=contribution_recur&action=get&json={"id":1}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=get&pretty=1&json={"id":1}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contribution_recur&action=get&json='
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 1,
    "values": [
        {
            "id": "1",
            "contact_id": "46",
            "amount": "500.00",
            "currency": "TWD",
            "frequency_unit": "month",
            "frequency_interval": "1",
            "installments": "12",
            "start_date": "2021-10-25 13:31:13",
            "create_date": "2021-10-01 13:31:13",
            "modified_date": "2021-11-29 13:31:13",
            "trxn_id": "NRLOHgp8jE",
            "invoice_id": "ae836EMdxfLyYG4AjhSK9u1h83hgO3Tx",
            "contribution_status_id": "5",
            "is_test": "0",
            "cycle_day": "5",
            "next_sched_contribution": "2021-11-25 13:31:13",
            "failure_count": "0",
            "auto_renew": "0"
        }
    ]
}
```

## Recurring Contribution Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=contribution_recur&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "contact_id": 47,
    "amount": "500.00",
    "currency": "TWD",
    "frequency_unit": "month",
    "frequency_interval": "1",
    "installments": "12",
    "start_date": "2021-10-25 13:31:13",
    "create_date": "2021-10-01 13:31:13",
    "cancel_date": "",
    "end_date": "",
    "processor_id": "",
    "external_id": "",
    "trxn_id": "qYL8Pp0tLb",
    "invoice_id": "CXn30Uj2Cebpt1ZsQMwWv8Y5ABtn54VH",
    "contribution_status_id": 5,
    "is_test": 0,
    "cycle_day": 5,
    "next_sched_contribution": "2021-11-25 13:31:13",
    "failure_count": 0,
    "failure_retry_date": "",
    "auto_renew": 0,
    "last_execute_date": ""
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=create&pretty=1&json={"contact_id":47,"amount":"500.00","currency":"TWD","frequency_unit":"month","frequency_interval":"1","installments":"12","start_date":"2021-10-25 13:31:13","create_date":"2021-10-01 13:31:13","cancel_date":"","end_date":"","processor_id":"","external_id":"","trxn_id":"qYL8Pp0tLb","invoice_id":"CXn30Uj2Cebpt1ZsQMwWv8Y5ABtn54VH","contribution_status_id":5,"is_test":0,"cycle_day":5,"next_sched_contribution":"2021-11-25 13:31:13","failure_count":0,"failure_retry_date":"","auto_renew":0,"last_execute_date":""}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":47,"amount":"500.00","currency":"TWD","frequency_unit":"month","frequency_interval":"1","installments":"12","start_date":"2021-10-25 13:31:13","create_date":"2021-10-01 13:31:13","cancel_date":"","end_date":"","processor_id":"","external_id":"","trxn_id":"qYL8Pp0tLb","invoice_id":"CXn30Uj2Cebpt1ZsQMwWv8Y5ABtn54VH","contribution_status_id":5,"is_test":0,"cycle_day":5,"next_sched_contribution":"2021-11-25 13:31:13","failure_count":0,"failure_retry_date":"","auto_renew":0,"last_execute_date":""}' \
  '<entrypoint>?entity=contribution_recur&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 2,
    "values": [
        {
            "id": "2",
            "contact_id": "47",
            "amount": "500.00",
            "currency": "TWD",
            "frequency_unit": "month",
            "frequency_interval": "1",
            "installments": "12",
            "start_date": "20211025133113",
            "create_date": "20211001133113",
            "modified_date": "20211129133113",
            "cancel_date": "null",
            "end_date": "null",
            "processor_id": "null",
            "external_id": "null",
            "trxn_id": "qYL8Pp0tLb",
            "invoice_id": "CXn30Uj2Cebpt1ZsQMwWv8Y5ABtn54VH",
            "contribution_status_id": "5",
            "is_test": "0",
            "cycle_day": "5",
            "next_sched_contribution": "20211125133113",
            "failure_count": "0",
            "failure_retry_date": "null",
            "auto_renew": "0",
            "last_execute_date": "null"
        }
    ]
}
```

## Recurring Contribution Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=contribution_recur&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 3,
    "contribution_status_id": 1,
    "next_sched_contribution": "",
    "end_date": "2021-11-29 13:31:13"
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=create&pretty=1&json={"id":3,"contribution_status_id":1,"next_sched_contribution":"","end_date":"2021-11-29 13:31:13"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":3,"contribution_status_id":1,"next_sched_contribution":"","end_date":"2021-11-29 13:31:13"}' \
  '<entrypoint>?entity=contribution_recur&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 3,
    "values": [
        {
            "id": "3",
            "contact_id": "48",
            "amount": "500.00",
            "currency": "TWD",
            "frequency_unit": "month",
            "frequency_interval": "1",
            "installments": "12",
            "start_date": "20211025133113",
            "create_date": "20211001133113",
            "modified_date": "20211129133113",
            "cancel_date": "",
            "end_date": "20211129133113",
            "processor_id": "",
            "external_id": "",
            "trxn_id": "TpKKXvwiVo",
            "invoice_id": "Rzvma2K6NZh3ws1jWMDUvDyblbotfvD1",
            "contribution_status_id": "1",
            "is_test": "0",
            "cycle_day": "5",
            "next_sched_contribution": "null",
            "failure_count": "0",
            "failure_retry_date": "",
            "auto_renew": "0",
            "last_execute_date": ""
        }
    ]
}
```

## Recurring Contribution Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=contribution_recur&action=delete
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 4
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=delete&pretty=1&json={"id":4}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":4}' \
  '<entrypoint>?entity=contribution_recur&action=delete'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": []
}
```