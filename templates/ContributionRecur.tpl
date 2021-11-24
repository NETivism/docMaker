# ContributionRecur API


This is a API document about recurring contribution.


| {ts}Parameter Name{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} | {ts}Field Help{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts} | {ts}Unique Contribution Recur ID{/ts} |
| contact_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts} | {ts}Foreign key to civicrm_contact.id{/ts} |
| amount | {ts}Number{/ts}(decimal) | 20,2 | 00.00 | {ts}Required{/ts} | {ts}Amount to be contributed or charged each recurrence.{/ts} |
| currency | {ts}String{/ts}(varchar) | 3 |  | {ts}Default Value{/ts}: NULL | {ts}3 character string, value from config setting.{/ts} |
| frequency_unit | {ts}String{/ts}(enum) |  | day,week,month,year | {ts}Default Value{/ts}: 'month' | {ts}Time units for recurrence of payment.{/ts} |
| frequency_interval | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts} | {ts}Number of time units for recurrence of payment.{/ts} |
| installments | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Total number of payments to be made. Set this to 0 if this is an open-ended commitment.{/ts} |
| start_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss | {ts}Required{/ts} | {ts}The date the first scheduled recurring contribution occurs.{/ts} |
| create_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss | {ts}Required{/ts} | {ts}When this recurring contribution record was created.{/ts} |
| modified_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Last updated date for this record. mostly the last time a payment was received{/ts} |
| cancel_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Date this recurring contribution was cancelled by contributor- if we can get access to it{/ts} |
| end_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Date this recurring contribution finished successfully{/ts} |
| processor_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to Payment Processor{/ts} |
| external_id | {ts}String{/ts}(varchar) | 255 |  |  | {ts}an external unique identifier for this recurring payment order provide by payment method{/ts} |
| trxn_id | {ts}String{/ts}(varchar) | 255 |  |  | {ts}unique transaction id or this recurring defined by this application{/ts} |
| invoice_id | {ts}String{/ts}(varchar) | 255 |  |  | {ts}unique invoice id, system generated or passed in{/ts} |
| contribution_status_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Default Value{/ts}: 1 | {ts}1=completed, 2=pending, 3=cancel, 4=failed, 5=in progress, 6=overdue, 7=suspend{/ts} |
| is_test | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Default Value{/ts}: 0 | {ts}Mark 1 when this order is an testing order.{/ts} |
| cycle_day | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts}, {ts}Default Value{/ts}: 1 | {ts}Day in the period when the payment should be charged e.g. 1st of month, 15th etc.{/ts} |
| next_sched_contribution | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Next payment day for display or execution(if needed).{/ts} |
| failure_count | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Default Value{/ts}: 0 | {ts}Number of failed charge attempts since last success.{/ts} |
| failure_retry_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Record retried date after payment fail retry.{/ts} |
| auto_renew | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Required{/ts}, {ts}Default Value{/ts}: 0 | {ts}Auto renew card expiration date when available.{/ts} |
| last_execute_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Last payment execution transaction date to prevent duplicate execution at the same frequency_unit.{/ts} |


## Recurring Contribution Get API

### HTTP Method
```
GET
```

### Request URL
```{literal}
<entrypoint>?entity=contribution_recur&action=get&json={"id":85}
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=get&pretty=1&json={"id":85}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contribution_recur&action=get&json={"id":85}'
```

### Response Example
```{literal}
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
{/literal}```

## Recurring Contribution Create API

### HTTP Method
```
POST
```

### Request URL
```{literal}
<entrypoint>?entity=contribution_recur&action=create
{/literal}```

### Request Content Type
```{literal}
application/json
{/literal}```

### Request body
```{literal}
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
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=create&pretty=1&json={"contact_id":661,"amount":"500.00","currency":"TWD","frequency_unit":"month","frequency_interval":"1","installments":"12","start_date":"2021-10-25 14:03:01","create_date":"2021-10-01 14:03:01","cancel_date":"","end_date":"","processor_id":"","external_id":"","trxn_id":"JBDIxFGe8D","invoice_id":"aYKfxYoCDImHqOqididjLhsvZeOx1yKX","contribution_status_id":5,"is_test":0,"cycle_day":5,"next_sched_contribution":"2021-11-25 14:03:01","failure_count":0,"failure_retry_date":"","auto_renew":0,"last_execute_date":""}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"contact_id":661,"amount":"500.00","currency":"TWD","frequency_unit":"month","frequency_interval":"1","installments":"12","start_date":"2021-10-25 14:03:01","create_date":"2021-10-01 14:03:01","cancel_date":"","end_date":"","processor_id":"","external_id":"","trxn_id":"JBDIxFGe8D","invoice_id":"aYKfxYoCDImHqOqididjLhsvZeOx1yKX","contribution_status_id":5,"is_test":0,"cycle_day":5,"next_sched_contribution":"2021-11-25 14:03:01","failure_count":0,"failure_retry_date":"","auto_renew":0,"last_execute_date":""}{/literal}' \
  '<entrypoint>?entity=contribution_recur&action=create'
```

### Response Example
```{literal}
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
{/literal}```

## Recurring Contribution Update API

### HTTP Method
```
POST
```

### Request URL
```{literal}
<entrypoint>?entity=contribution_recur&action=create
{/literal}```

### Request Content Type
```{literal}
application/json
{/literal}```

### Request body
```{literal}
{
    "id": 87,
    "contribution_status_id": 1,
    "next_sched_contribution": "",
    "end_date": "2021-11-24 14:03:01"
}
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=create&pretty=1&json={"id":87,"contribution_status_id":1,"next_sched_contribution":"","end_date":"2021-11-24 14:03:01"}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":87,"contribution_status_id":1,"next_sched_contribution":"","end_date":"2021-11-24 14:03:01"}{/literal}' \
  '<entrypoint>?entity=contribution_recur&action=create'
```

### Response Example
```{literal}
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
{/literal}```

## Recurring Contribution Delete API

### HTTP Method
```
POST
```

### Request URL
```{literal}
<entrypoint>?entity=contribution_recur&action=delete
{/literal}```

### Request Content Type
```{literal}
application/json
{/literal}```

### Request body
```{literal}
{
    "id": 88
}
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution_recur&action=delete&pretty=1&json={"id":88}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":88}{/literal}' \
  '<entrypoint>?entity=contribution_recur&action=delete'
```

### Response Example
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
{/literal}```

