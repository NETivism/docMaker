+++
title = "Phone API"
menuTitle = "Phone"
chapter = false
+++
This is a API Document about Phone.

| {ts}Parameter Name{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} | {ts}Field Help{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 更新時必填 | {ts}Unique Phone ID{/ts} |
| contact_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to Contact ID{/ts} |
| location_type_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Which Location does this phone belong to.{/ts} |
| is_primary | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 | {ts}Is this the primary phone for this contact and location.{/ts} |
| is_billing | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 | {ts}Is this the billing?{/ts} |
| mobile_provider_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Which Mobile Provider does this phone belong to.{/ts} |
| phone | {ts}String{/ts}(varchar) | 32 |  |  | {ts}Complete phone number.{/ts} |
| phone_type | {ts}String{/ts}(enum) |  | Phone, Mobile, Fax, Pager |  | {ts}What type of telecom device is this.{/ts} |
| phone_type_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Which type of phone does this number belongs.{/ts} |


## Phone Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Phone&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "contact_id": 348,
    "location_type_id": 329,
    "phone": "021 512 755",
    "is_primary": 1
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Phone&action=get&pretty=1&json={"contact_id":348,"location_type_id":329,"phone":"021 512 755","is_primary":1}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"contact_id":348,"location_type_id":329,"phone":"021 512 755","is_primary":1}{/literal}' \
  '<entrypoint>?entity=Phone&action=create'
```

### 回傳範例
```{literal}
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
{/literal}```

## Phone Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Phone&action=delete
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "contact_id": 349,
    "location_type_id": 330,
    "phone": "021 512 755",
    "is_primary": 1
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Phone&action=delete&pretty=1&json={"contact_id":349,"location_type_id":330,"phone":"021 512 755","is_primary":1}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"contact_id":349,"location_type_id":330,"phone":"021 512 755","is_primary":1}{/literal}' \
  '<entrypoint>?entity=Phone&action=delete'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": "1"
}
{/literal}```

## Phone Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=Phone&action=get&json={"contact_id":"353","phone":"021 512 755"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Phone&action=get&pretty=1&json={"contact_id":"353","phone":"021 512 755"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Phone&action=get&json={"contact_id":"353","phone":"021 512 755"}'
```

### 回傳範例
```{literal}
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
{/literal}```

## Phone Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Phone&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "contact_id": 361,
    "location_type_id": 342,
    "phone": "000 512 755",
    "is_primary": 1,
    "id": 1
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Phone&action=create&pretty=1&json={"contact_id":361,"location_type_id":342,"phone":"000 512 755","is_primary":1,"id":1}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"contact_id":361,"location_type_id":342,"phone":"000 512 755","is_primary":1,"id":1}{/literal}' \
  '<entrypoint>?entity=Phone&action=create'
```

### 回傳範例
```{literal}
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
{/literal}```
