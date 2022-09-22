+++
title = "Participant API"
menuTitle = "Participant"
chapter = false
+++
This is a API Document about Participant.

| {ts}Parameter Name{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} | {ts}Field Help{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 更新時必填 | {ts}Participant Id{/ts} |
| contact_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 預設值: 0 | {ts}FK to Contact ID{/ts} |
| event_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 預設值: 0 | {ts}FK to Event ID{/ts} |
| status_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 必填, 預設值: 1 | {ts}Participant status ID. FK to civicrm_participant_status_type. Default of 1 should map to status = Registered.{/ts} |
| role_id | {ts}String{/ts}(varchar) | 128 |  | 預設值: NULL | {ts}Participant role ID. Implicit FK to civicrm_option_value where option_group = participant_role.{/ts} |
| register_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}When did contact register for event?{/ts} |
| source | {ts}String{/ts}(varchar) | 128 |  |  | {ts}Source of this event registration.{/ts} |
| fee_level | {ts}String{/ts}(text) | 65535 |  |  | {ts}Populate with the label (text) associated with a fee level for paid events with multiple levels. Note that we store the label value and not the key{/ts} |
| is_test | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| is_pay_later | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| fee_amount | {ts}Number{/ts}(decimal) | 20,2 | 00.00 |  | {ts}actual processor fee if known - may be 0.{/ts} |
| registered_by_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 預設值: NULL | {ts}FK to Participant ID{/ts} |
| discount_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 預設值: NULL | {ts}FK to Discount ID{/ts} |
| fee_currency | {ts}String{/ts}(varchar) | 3 |  | 預設值: NULL | {ts}3 character string, value derived from config setting.{/ts} |


## Participant Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Participant&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "contact_id": 7,
    "event_id": 241,
    "status_id": 1,
    "role_id": 1,
    "register_date": "2007-07-21 00:00:00",
    "source": "Online Event Registration: API Testing"
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Participant&action=get&pretty=1&json={"contact_id":7,"event_id":241,"status_id":1,"role_id":1,"register_date":"2007-07-21 00:00:00","source":"Online Event Registration: API Testing"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"contact_id":7,"event_id":241,"status_id":1,"role_id":1,"register_date":"2007-07-21 00:00:00","source":"Online Event Registration: API Testing"}{/literal}' \
  '<entrypoint>?entity=Participant&action=create'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 5,
    "values": {
        "5": {
            "id": "5",
            "contact_id": "7",
            "event_id": "241",
            "status_id": "1",
            "role_id": "1",
            "register_date": "20070721000000",
            "source": "Online Event Registration: API Testing",
            "fee_level": "",
            "is_test": "",
            "is_pay_later": "",
            "fee_amount": "",
            "registered_by_id": "",
            "discount_id": "",
            "fee_currency": ""
        }
    }
}
{/literal}```

## Participant Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=Participant&action=get&json={"contact_id":2,"event_id":242,"status_id":1,"role_id":1,"register_date":"2007-07-21 00:00:00","source":"Online Event Registration: API Testing","custom_1":"custom string"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Participant&action=get&pretty=1&json={"contact_id":2,"event_id":242,"status_id":1,"role_id":1,"register_date":"2007-07-21 00:00:00","source":"Online Event Registration: API Testing","custom_1":"custom string"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Participant&action=get&json={"contact_id":2,"event_id":242,"status_id":1,"role_id":1,"register_date":"2007-07-21 00:00:00","source":"Online Event Registration: API Testing","custom_1":"custom string"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 4,
    "values": {
        "4": {
            "contact_id": "2",
            "contact_type": "Individual",
            "contact_sub_type": "",
            "sort_name": "Test YSqSo Unit",
            "display_name": "Test YSqSo Unit",
            "event_id": "242",
            "event_title": "Annual CiviCRM meet",
            "event_start_date": "2008-10-21 00:00:00",
            "event_end_date": "2008-10-23 00:00:00",
            "participant_id": "4",
            "participant_fee_level": "",
            "participant_fee_amount": "",
            "participant_fee_currency": "",
            "event_type": "研討會",
            "event_type_id": "1",
            "participant_status_id": "1",
            "participant_status": "已登記",
            "participant_role_id": "1",
            "participant_register_date": "2007-07-21 00:00:00",
            "participant_source": "Online Event Registration: API Testing",
            "participant_is_pay_later": "0",
            "participant_is_test": "0",
            "participant_registered_by_id": "",
            "participant_discount_name": "",
            "civicrm_value_testgetwithcustom_1_id": "1",
            "custom_1": "custom string",
            "custom_1_1": "custom string",
            "id": "4"
        }
    }
}
{/literal}```

## Participant Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Participant&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "id": 4,
    "contact_id": 3,
    "event_id": 285,
    "status_id": 3,
    "role_id": 3,
    "register_date": "2006-01-21",
    "source": "US Open",
    "event_level": "Donation"
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Participant&action=create&pretty=1&json={"id":4,"contact_id":3,"event_id":285,"status_id":3,"role_id":3,"register_date":"2006-01-21","source":"US Open","event_level":"Donation"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":4,"contact_id":3,"event_id":285,"status_id":3,"role_id":3,"register_date":"2006-01-21","source":"US Open","event_level":"Donation"}{/literal}' \
  '<entrypoint>?entity=Participant&action=create'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 4,
    "values": {
        "4": {
            "id": "4",
            "contact_id": "3",
            "event_id": "285",
            "status_id": "3",
            "role_id": "3",
            "register_date": "20060121000000",
            "source": "US Open",
            "fee_level": "",
            "is_test": "0",
            "is_pay_later": "0",
            "fee_amount": "",
            "registered_by_id": "",
            "discount_id": "",
            "fee_currency": ""
        }
    }
}
{/literal}```

## Participant Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Participant&action=delete
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "id": 1
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Participant&action=delete&pretty=1&json={"id":1}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":1}{/literal}' \
  '<entrypoint>?entity=Participant&action=delete'
```

### 回傳範例
```{literal}
{
    "is_error": 1,
    "error_message": "Not enough data to create activity object,",
    "tip": "add debug=1 to your API call to have more info about the error"
}
{/literal}```
