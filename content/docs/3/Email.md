# Email API


This is a API Document about Email.


| 變數名稱 | 類型 | 長度 | 格式 | 建立規則 | 說明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 數字(int unsigned) | 10 | >= 0 | 必填 | Unique Email ID |
| contact_id | 數字(int unsigned) | 10 | >= 0 |  | FK to Contact ID |
| location_type_id | 數字(int unsigned) | 10 | >= 0 |  | Which Location does this email belong to. |
| email | 字串(varchar) | 64 |  |  | Email address |
| is_primary | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 | Is this the primary email for this contact and location. |
| is_billing | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 | Is this the billing? |
| on_hold | 布林值(boolean) | 1 | 0 or 1 | 必填, 預設值: 0 | Is this address on bounce hold? |
| is_bulkmail | 布林值(boolean) | 1 | 0 or 1 | 必填, 預設值: 0 | Is this address for bulk mail ? |
| hold_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | When the address went on bounce hold |
| reset_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | When the address bounce status was last reset |
| signature_text | 字串(text) | 65535 |  | 預設值: NULL | Text formatted signature for the email. |
| signature_html | 字串(text) | 65535 |  | 預設值: NULL | HTML formatted signature for the email. |


## Email Get API

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
