# Email



# 電子郵件 API 說明
This is a API Document about Email


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



## 建立 電子郵件 

This is tests for creating Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Email&action=create&pretty=1&json={"contact_id":"137","location_type_id":"179","is_primary":"1","email":"api@a-team.com"}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={"contact_id":"137","location_type_id":"179","is_primary":"1","email":"api@a-team.com"}
```

**Request Samples**

```shell
curl -g --request POST '<entrypoint>?entity=Email&action=create&pretty=1&json={"contact_id":"137","location_type_id":"179","is_primary":"1","email":"api@a-team.com"}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**Response Samples** 
```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 46,
    "values": {
        "46": {
            "id": "46",
            "contact_id": "137",
            "location_type_id": "179",
            "email": "api@a-team.com",
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


## Get 電子郵件 

This is tests for get Email 

**HTTP methods: GET**

**路徑**

```
<entrypoint>?entity=Email&action=get&pretty=1&json={"contact_id":"141"}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=get&pretty=1&json={"contact_id":"141"}
```

**Request Samples**

```shell
curl -g --request GET '<entrypoint>?entity=Email&action=get&pretty=1&json={"contact_id":"141"}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**Response Samples** 
```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 50,
    "values": {
        "50": {
            "id": "50",
            "contact_id": "141",
            "location_type_id": "187",
            "email": "api@a-team.com",
            "is_primary": "1",
            "is_billing": "0",
            "on_hold": "0",
            "is_bulkmail": "0"
        }
    }
}
```


## 刪除 電子郵件 

This is tests for deleting Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Email&action=delete&pretty=1&json={"id":"1"}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=delete&pretty=1&json={"id":"1"}
```
**Request Samples**

```bash
curl -g --request POST '<entrypoint>?entity=Email&action=delete&pretty=1&json={"id":"1"}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**Response Samples** 
```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
```


## 更新 電子郵件 

This is tests for updating Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Email&action=create&pretty=1&json={"id":"56","contact_id":"143","location_type_id":"191","is_primary":"1","email":"1-4@example.com"}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={"id":"56","contact_id":"143","location_type_id":"191","is_primary":"1","email":"1-4@example.com"}
```

**Request Samples**

```
curl -g --request POST '<entrypoint>?entity=Email&action=create&pretty=1&json={"id":"56","contact_id":"143","location_type_id":"191","is_primary":"1","email":"1-4@example.com"}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**Response Samples** 
```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 56,
    "values": {
        "56": {
            "id": "56",
            "contact_id": "143",
            "location_type_id": "191",
            "email": "1-4@example.com",
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
