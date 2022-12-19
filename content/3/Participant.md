+++
title = "Participant API"
menuTitle = "Participant"
chapter = false
+++
This is a API Document about Participant.

| 變數名稱 | 類型 | 長度 | 格式 | 建立規則 | 說明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 數字(int unsigned) | 10 | >= 0 | 更新時必填 | 參加者編號 |
| contact_id | 數字(int unsigned) | 10 | >= 0 | 預設值: 0 | FK to Contact ID |
| event_id | 數字(int unsigned) | 10 | >= 0 | 預設值: 0 | FK to Event ID |
| status_id | 數字(int unsigned) | 10 | >= 0 | 必填, 預設值: 1 | Participant status ID. FK to civicrm_participant_status_type. Default of 1 should map to status = Registered. |
| role_id | 字串(varchar) | 128 |  | 預設值: NULL | Participant role ID. Implicit FK to civicrm_option_value where option_group = participant_role. |
| register_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | When did contact register for event? |
| source | 字串(varchar) | 128 |  |  | Source of this event registration. |
| fee_level | 字串(text) | 65535 |  |  | Populate with the label (text) associated with a fee level for paid events with multiple levels. Note that we store the label value and not the key |
| is_test | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| is_pay_later | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| fee_amount | 數字(decimal) | 20,2 | 00.00 |  | actual processor fee if known - may be 0. |
| registered_by_id | 數字(int unsigned) | 10 | >= 0 | 預設值: NULL | FK to Participant ID |
| discount_id | 數字(int unsigned) | 10 | >= 0 | 預設值: NULL | FK to Discount ID |
| fee_currency | 字串(varchar) | 3 |  | 預設值: NULL | 3 character string, value derived from config setting. |


## Participant Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Participant&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "contact_id": 7,
    "event_id": 241,
    "status_id": 1,
    "role_id": 1,
    "register_date": "2007-07-21 00:00:00",
    "source": "Online Event Registration: API Testing"
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Participant&action=get&pretty=1&json={"contact_id":7,"event_id":241,"status_id":1,"role_id":1,"register_date":"2007-07-21 00:00:00","source":"Online Event Registration: API Testing"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":7,"event_id":241,"status_id":1,"role_id":1,"register_date":"2007-07-21 00:00:00","source":"Online Event Registration: API Testing"}' \
  '<entrypoint>?entity=Participant&action=create'
```

### 回傳範例
```
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
```

## Participant Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```
<entrypoint>?entity=Participant&action=get&json={"contact_id":2,"event_id":242,"status_id":1,"role_id":1,"register_date":"2007-07-21 00:00:00","source":"Online Event Registration: API Testing","custom_1":"custom string"}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Participant&action=get&pretty=1&json={"contact_id":2,"event_id":242,"status_id":1,"role_id":1,"register_date":"2007-07-21 00:00:00","source":"Online Event Registration: API Testing","custom_1":"custom string"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Participant&action=get&json='
```

### 回傳範例
```
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
```

## Participant Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Participant&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
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
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Participant&action=create&pretty=1&json={"id":4,"contact_id":3,"event_id":285,"status_id":3,"role_id":3,"register_date":"2006-01-21","source":"US Open","event_level":"Donation"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":4,"contact_id":3,"event_id":285,"status_id":3,"role_id":3,"register_date":"2006-01-21","source":"US Open","event_level":"Donation"}' \
  '<entrypoint>?entity=Participant&action=create'
```

### 回傳範例
```
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
```

## Participant Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Participant&action=delete
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 49
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Participant&action=delete&pretty=1&json={"id":49}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":49}' \
  '<entrypoint>?entity=Participant&action=delete'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
```