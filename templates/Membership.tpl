+++
title = "Membership API"
menuTitle = "Membership"
chapter = false
+++
This is a API Document about Membership.

| {ts}Parameter Name{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} | {ts}Field Help{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 更新時必填 | {ts}Membership Id{/ts} |
| contact_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 必填 | {ts}FK to Contact ID{/ts} |
| membership_type_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 必填 | {ts}FK to Membership Type{/ts} |
| join_date | {ts}Date{/ts}(date) |  | yyyy-mm-dd |  | {ts}Beginning of initial membership period (member since...).{/ts} |
| start_date | {ts}Date{/ts}(date) |  | yyyy-mm-dd |  | {ts}Beginning of current uninterrupted membership period.{/ts} |
| end_date | {ts}Date{/ts}(date) |  | yyyy-mm-dd |  | {ts}Current membership period expire date.{/ts} |
| source | {ts}String{/ts}(varchar) | 128 |  |  |  |
| status_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 必填 | {ts}FK to Membership Status{/ts} |
| is_override | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 |  | {ts}Admin users may set a manual status which overrides the calculated status. When this flag is true, automated status update scripts should NOT modify status for the record.{/ts} |
| reminder_date | {ts}Date{/ts}(date) |  | yyyy-mm-dd |  | {ts}When should a reminder be sent.{/ts} |
| owner_membership_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Optional FK to Parent Membership.{/ts} |
| is_test | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| is_pay_later | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 |  |


## Membership Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Membership&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
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
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Membership&action=get&pretty=1&json={"contact_id":"54","membership_type_id":"9","join_date":"2009-01-21","start_date":"2009-01-21","end_date":"2009-12-21","source":"Payment","is_override":1,"status_id":"2"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"contact_id":"54","membership_type_id":"9","join_date":"2009-01-21","start_date":"2009-01-21","end_date":"2009-12-21","source":"Payment","is_override":1,"status_id":"2"}{/literal}' \
  '<entrypoint>?entity=Membership&action=create'
```

### 回傳範例
```{literal}
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
{/literal}```

## Membership Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=Membership&action=get&json={"id":29}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Membership&action=get&pretty=1&json={"id":29}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Membership&action=get&json={"id":29}'
```

### 回傳範例
```{literal}
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
{/literal}```

## Membership Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Membership&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
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
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Membership&action=create&pretty=1&json={"id":31,"membership_type_id":"9","contact_id":"54","join_date":"2006-01-21","start_date":"2006-01-21","end_date":"2006-12-21","source":"Payment","is_override":1,"status_id":"2"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":31,"membership_type_id":"9","contact_id":"54","join_date":"2006-01-21","start_date":"2006-01-21","end_date":"2006-12-21","source":"Payment","is_override":1,"status_id":"2"}{/literal}' \
  '<entrypoint>?entity=Membership&action=create'
```

### 回傳範例
```{literal}
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
{/literal}```

## Membership Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Membership&action=delete
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "id": 48,
    "contact_id": "54"
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Membership&action=delete&pretty=1&json={"id":48,"contact_id":"54"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":48,"contact_id":"54"}{/literal}' \
  '<entrypoint>?entity=Membership&action=delete'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
{/literal}```
