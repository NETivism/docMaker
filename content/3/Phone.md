+++
title = "Phone API"
menuTitle = "Phone"
chapter = false
+++
This is a API Document about Phone.

| 變數名稱 | 類型 | 長度 | 格式 | 建立規則 | 說明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 數字(int unsigned) | 10 | >= 0 | 更新時必填 | Unique Phone ID |
| contact_id | 數字(int unsigned) | 10 | >= 0 |  | FK to Contact ID |
| location_type_id | 數字(int unsigned) | 10 | >= 0 |  | Which Location does this phone belong to. |
| is_primary | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 | Is this the primary phone for this contact and location. |
| is_billing | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 | Is this the billing? |
| mobile_provider_id | 數字(int unsigned) | 10 | >= 0 |  | Which Mobile Provider does this phone belong to. |
| phone | 字串(varchar) | 32 |  |  | Complete phone number. |
| phone_type | 字串(enum) |  | Phone, Mobile, Fax, Pager |  | What type of telecom device is this. |
| phone_type_id | 數字(int unsigned) | 10 | >= 0 |  | Which type of phone does this number belongs. |


## Phone Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Phone&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "contact_id": 348,
    "location_type_id": 329,
    "phone": "021 512 755",
    "is_primary": 1
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Phone&action=get&pretty=1&json={"contact_id":348,"location_type_id":329,"phone":"021 512 755","is_primary":1}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":348,"location_type_id":329,"phone":"021 512 755","is_primary":1}' \
  '<entrypoint>?entity=Phone&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 1,
    "values": {
        "1": {
            "id": "1",
            "contact_id": "348",
            "location_type_id": "329",
            "is_primary": "1",
            "is_billing": "",
            "mobile_provider_id": "",
            "phone": "021 512 755",
            "phone_type_id": ""
        }
    }
}
```

## Phone Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Phone&action=delete
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "contact_id": 349,
    "location_type_id": 330,
    "phone": "021 512 755",
    "is_primary": 1
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Phone&action=delete&pretty=1&json={"contact_id":349,"location_type_id":330,"phone":"021 512 755","is_primary":1}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":349,"location_type_id":330,"phone":"021 512 755","is_primary":1}' \
  '<entrypoint>?entity=Phone&action=delete'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": "1"
}
```

## Phone Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```
<entrypoint>?entity=Phone&action=get&json={"contact_id":"353","phone":"021 512 755"}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Phone&action=get&pretty=1&json={"contact_id":"353","phone":"021 512 755"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Phone&action=get&json='
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 1,
    "values": {
        "1": {
            "id": "1",
            "contact_id": "353",
            "location_type_id": "334",
            "is_primary": "1",
            "is_billing": "0",
            "phone": "021 512 755"
        }
    }
}
```

## Phone Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Phone&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "contact_id": 361,
    "location_type_id": 342,
    "phone": "000 512 755",
    "is_primary": 1,
    "id": 1
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Phone&action=create&pretty=1&json={"contact_id":361,"location_type_id":342,"phone":"000 512 755","is_primary":1,"id":1}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":361,"location_type_id":342,"phone":"000 512 755","is_primary":1,"id":1}' \
  '<entrypoint>?entity=Phone&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 1,
    "values": {
        "1": {
            "id": "1",
            "contact_id": "361",
            "location_type_id": "342",
            "is_primary": "1",
            "is_billing": "0",
            "mobile_provider_id": "",
            "phone": "000 512 755",
            "phone_type_id": ""
        }
    }
}
```