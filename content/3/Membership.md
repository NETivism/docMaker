+++
title = "Membership API"
menuTitle = "Membership"
chapter = false
+++
This is a API Document about Membership.

| 變數名稱 | 類型 | 長度 | 格式 | 建立規則 | 說明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 數字(int unsigned) | 10 | >= 0 | 更新時必填 | Membership Id |
| contact_id | 數字(int unsigned) | 10 | >= 0 | 必填 | FK to Contact ID |
| membership_type_id | 數字(int unsigned) | 10 | >= 0 | 必填 | FK to Membership Type |
| join_date | 日期(date) |  | yyyy-mm-dd |  | Beginning of initial membership period (member since...). |
| start_date | 日期(date) |  | yyyy-mm-dd |  | Beginning of current uninterrupted membership period. |
| end_date | 日期(date) |  | yyyy-mm-dd |  | Current membership period expire date. |
| source | 字串(varchar) | 128 |  |  |  |
| status_id | 數字(int unsigned) | 10 | >= 0 | 必填 | FK to Membership Status |
| is_override | 布林值(boolean) | 1 | 0 or 1 |  | Admin users may set a manual status which overrides the calculated status. When this flag is true, automated status update scripts should NOT modify status for the record. |
| reminder_date | 日期(date) |  | yyyy-mm-dd |  | When should a reminder be sent. |
| owner_membership_id | 數字(int unsigned) | 10 | >= 0 |  | Optional FK to Parent Membership. |
| is_test | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| is_pay_later | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |


## Membership Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Membership&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "contact_id": "54",
    "membership_type_id": "9",
    "join_date": "2009-01-21",
    "start_date": "2009-01-21",
    "end_date": "2009-12-21",
    "source": "Payment",
    "is_override": 1,
    "status_id": "2"
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Membership&action=get&pretty=1&json={"contact_id":"54","membership_type_id":"9","join_date":"2009-01-21","start_date":"2009-01-21","end_date":"2009-12-21","source":"Payment","is_override":1,"status_id":"2"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":"54","membership_type_id":"9","join_date":"2009-01-21","start_date":"2009-01-21","end_date":"2009-12-21","source":"Payment","is_override":1,"status_id":"2"}' \
  '<entrypoint>?entity=Membership&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 27,
    "values": {
        "27": {
            "id": "27",
            "contact_id": "54",
            "membership_type_id": "9",
            "join_date": "2009-01-21",
            "start_date": "2009-01-21",
            "end_date": "2009-12-21",
            "source": "Payment",
            "status_id": "2",
            "is_override": "1",
            "reminder_date": "",
            "owner_membership_id": "",
            "is_test": "0",
            "is_pay_later": "0"
        }
    }
}
```

## Membership Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```
<entrypoint>?entity=Membership&action=get&json={"id":29}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Membership&action=get&pretty=1&json={"id":29}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Membership&action=get&json='
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 29,
    "values": {
        "29": {
            "id": "29",
            "contact_id": "54",
            "membership_type_id": "9",
            "join_date": "2009-01-21",
            "start_date": "2009-01-21",
            "end_date": "2009-12-21",
            "source": "Payment",
            "status_id": "2",
            "is_override": "1",
            "is_test": "0",
            "is_pay_later": "0",
            "membership_name": "測試會員",
            "relationship_name": "Child of"
        }
    }
}
```

## Membership Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Membership&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 31,
    "membership_type_id": "9",
    "contact_id": "54",
    "join_date": "2006-01-21",
    "start_date": "2006-01-21",
    "end_date": "2006-12-21",
    "source": "Payment",
    "is_override": 1,
    "status_id": "2"
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Membership&action=create&pretty=1&json={"id":31,"membership_type_id":"9","contact_id":"54","join_date":"2006-01-21","start_date":"2006-01-21","end_date":"2006-12-21","source":"Payment","is_override":1,"status_id":"2"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":31,"membership_type_id":"9","contact_id":"54","join_date":"2006-01-21","start_date":"2006-01-21","end_date":"2006-12-21","source":"Payment","is_override":1,"status_id":"2"}' \
  '<entrypoint>?entity=Membership&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 31,
    "values": {
        "31": {
            "id": "31",
            "contact_id": "54",
            "membership_type_id": "9",
            "join_date": "2006-01-21",
            "start_date": "2006-01-21",
            "end_date": "2006-12-21",
            "source": "Payment",
            "status_id": "2",
            "is_override": "1",
            "reminder_date": "",
            "owner_membership_id": "",
            "is_test": "0",
            "is_pay_later": "0"
        }
    }
}
```

## Membership Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Membership&action=delete
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 48,
    "contact_id": "54"
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Membership&action=delete&pretty=1&json={"id":48,"contact_id":"54"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":48,"contact_id":"54"}' \
  '<entrypoint>?entity=Membership&action=delete'
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