+++
title = "Email API"
menuTitle = "Email"
chapter = false
+++
This is a API Document about Email.

| {ts}Parameter Name{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} | {ts}Field Help{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts} | {ts}Unique Email ID{/ts} |
| contact_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to Contact ID{/ts} |
| location_type_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Which Location does this email belong to.{/ts} |
| email | {ts}String{/ts}(varchar) | 64 |  |  | {ts}Email address{/ts} |
| is_primary | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Default Value{/ts}: 0 | {ts}Is this the primary email for this contact and location.{/ts} |
| is_billing | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Default Value{/ts}: 0 | {ts}Is this the billing?{/ts} |
| on_hold | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Required{/ts}, {ts}Default Value{/ts}: 0 | {ts}Is this address on bounce hold?{/ts} |
| is_bulkmail | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Required{/ts}, {ts}Default Value{/ts}: 0 | {ts}Is this address for bulk mail ?{/ts} |
| hold_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}When the address went on bounce hold{/ts} |
| reset_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}When the address bounce status was last reset{/ts} |
| signature_text | {ts}String{/ts}(text) | 65535 |  | {ts}Default Value{/ts}: NULL | {ts}Text formatted signature for the email.{/ts} |
| signature_html | {ts}String{/ts}(text) | 65535 |  | {ts}Default Value{/ts}: NULL | {ts}HTML formatted signature for the email.{/ts} |


## Email Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=Email&action=get&json={"contact_id":21,"location_type_id":6,"email":"api.test@civicrm.test.org"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=get&pretty=1&json={"contact_id":21,"location_type_id":6,"email":"api.test@civicrm.test.org"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Email&action=get&json={"contact_id":21,"location_type_id":6,"email":"api.test@civicrm.test.org"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 22,
    "values": [
        {
            "id": "22",
            "contact_id": "21",
            "location_type_id": "6",
            "email": "api.test@civicrm.test.org",
            "is_primary": "1",
            "is_billing": "0",
            "on_hold": "0",
            "is_bulkmail": "0"
        }
    ]
}
{/literal}```

## Email Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Email&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "contact_id": 22,
    "location_type_id": 8,
    "email": "api.test@civicrm.test.org",
    "is_primary": 1
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={"contact_id":22,"location_type_id":8,"email":"api.test@civicrm.test.org","is_primary":1}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"contact_id":22,"location_type_id":8,"email":"api.test@civicrm.test.org","is_primary":1}{/literal}' \
  '<entrypoint>?entity=Email&action=create'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 23,
    "values": [
        {
            "id": "23",
            "contact_id": "22",
            "location_type_id": "8",
            "email": "api.test@civicrm.test.org",
            "is_primary": "1",
            "is_billing": "",
            "on_hold": "",
            "is_bulkmail": "",
            "hold_date": "",
            "reset_date": "",
            "signature_text": "",
            "signature_html": ""
        }
    ]
}
{/literal}```

## Email Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Email&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "contact_id": 26,
    "location_type_id": 16,
    "email": "test.update@civicrm.test.org",
    "is_primary": 1,
    "id": 27
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={"contact_id":26,"location_type_id":16,"email":"test.update@civicrm.test.org","is_primary":1,"id":27}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"contact_id":26,"location_type_id":16,"email":"test.update@civicrm.test.org","is_primary":1,"id":27}{/literal}' \
  '<entrypoint>?entity=Email&action=create'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 27,
    "values": [
        {
            "id": "27",
            "contact_id": "26",
            "location_type_id": "16",
            "email": "test.update@civicrm.test.org",
            "is_primary": "1",
            "is_billing": "0",
            "on_hold": "0",
            "is_bulkmail": "0",
            "hold_date": "",
            "reset_date": "",
            "signature_text": "",
            "signature_html": ""
        }
    ]
}
{/literal}```

## Email Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Email&action=delete
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "id": 28
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=delete&pretty=1&json={"id":28}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":28}{/literal}' \
  '<entrypoint>?entity=Email&action=delete'
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
