# Email API


This is a API Document about Email.


| 變數名稱 | 說明 | 類型 | 長度 | 格式 | 建立規則 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | Unique Email ID | 數字(int unsigned) | 10 | >= 0 | 必填 |
| contact_id | FK to Contact ID | 數字(int unsigned) | 10 | >= 0 |  |
| location_type_id | Which Location does this email belong to. | 數字(int unsigned) | 10 | >= 0 |  |
| email | Email address | 字串(varchar) | 64 |  |  |
| is_primary | Is this the primary? | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |
| is_billing | Is this the billing? | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |
| on_hold | Is this address on bounce hold? | 布林值(boolean) | 1 | 0 or 1 | 必填, 預設值: 0 |
| is_bulkmail | Is this address for bulk mail ? | 布林值(boolean) | 1 | 0 or 1 | 必填, 預設值: 0 |
| hold_date | When the address went on bounce hold | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| reset_date | When the address bounce status was last reset | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| signature_text | Text formatted signature for the email. | 字串(text) | 65535 |  | 預設值: NULL |
| signature_html | HTML formatted signature for the email. | 字串(text) | 65535 |  | 預設值: NULL |


## Email Get API

  API

### HTTP Method
```
GET
```

### Request URL
```
<entrypoint>?entity=Email&action=get&json={"contact_id":332,"location_type_id":630,"email":"api.test@civicrm.test.org"}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=get&pretty=1&json={"contact_id":332,"location_type_id":630,"email":"api.test@civicrm.test.org"}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Email&action=get&json='
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 565,
    "values": {
        "565": {
            "id": "565",
            "contact_id": "332",
            "location_type_id": "630",
            "email": "api.test@civicrm.test.org",
            "is_primary": "1",
            "is_billing": "0",
            "on_hold": "0",
            "is_bulkmail": "0"
        }
    }
}
```

## Email Create API

  API

### HTTP Method
```
POST
```

### Request URL
```
<entrypoint>?entity=Email&action=create
```

### Request Content Type
```
application/json
```

### Request body
```
{
    "contact_id": 333,
    "location_type_id": 632,
    "email": "api.test@civicrm.test.org",
    "is_primary": 1
}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={"contact_id":333,"location_type_id":632,"email":"api.test@civicrm.test.org","is_primary":1}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":333,"location_type_id":632,"email":"api.test@civicrm.test.org","is_primary":1}' \
  '<entrypoint>?entity=Email&action=create'
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 566,
    "values": {
        "566": {
            "id": "566",
            "contact_id": "333",
            "location_type_id": "632",
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
    }
}
```

## Email Update API

  API

### HTTP Method
```
POST
```

### Request URL
```
<entrypoint>?entity=Email&action=create
```

### Request Content Type
```
application/json
```

### Request body
```
{
    "contact_id": 337,
    "location_type_id": 640,
    "email": "test.update@civicrm.test.org",
    "is_primary": 1,
    "id": 570
}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={"contact_id":337,"location_type_id":640,"email":"test.update@civicrm.test.org","is_primary":1,"id":570}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":337,"location_type_id":640,"email":"test.update@civicrm.test.org","is_primary":1,"id":570}' \
  '<entrypoint>?entity=Email&action=create'
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 570,
    "values": {
        "570": {
            "id": "570",
            "contact_id": "337",
            "location_type_id": "640",
            "email": "test.update@civicrm.test.org",
            "is_primary": "1",
            "is_billing": "",
            "on_hold": "",
            "is_bulkmail": "",
            "hold_date": "",
            "reset_date": "",
            "signature_text": "",
            "signature_html": ""
        }
    }
}
```

## Email Delete API

  API

### HTTP Method
```
POST
```

### Request URL
```
<entrypoint>?entity=Email&action=delete
```

### Request Content Type
```
application/json
```

### Request body
```
{
    "id": 571
}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=delete&pretty=1&json={"id":571}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":571}' \
  '<entrypoint>?entity=Email&action=delete'
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
