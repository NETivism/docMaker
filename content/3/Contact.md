+++
title = "Contact API"
menuTitle = "Contact"
weight = 50
+++

## 基本使用

### 取得聯絡人（get）

透過 get API，可在 CRM 網站上建立新的聯絡人。

#### 發送範例

##### HTTP 方法

`GET`

##### Request URL

取得所有聯絡人
`<entrypoint>?entity=Contact&action=get&json={}`

取得特定篩選條件的聯絡人
`<entrypoint>?entity=Contact&action=get&json={"<field>":"<value>"}}`

聯絡人編號1234的聯絡人
`<entrypoint>?entity=Contact&action=get&json={"id":"1234"}}`

姓氏是王、名字是小明的聯絡人
`<entrypoint>?entity=Contact&action=get&json={"last_name":"王","first_name":"小明"}}` 


##### API Explorer

`https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=get&json={"<field>":"<value>"}>`

##### curl 發送範例

```bash
curl -g \
--header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
'<entrypoint>?entity=Contact&action=get&json={"<field>":"<value>"}'
```

#### 回傳範例
```json
{
    "is_error": 0,
    "version": 3,
    "count": 25,
    "values": [
        {
            "contact_id": "1",
            "contact_type": "Individual",
            "contact_sub_type": "",
            "sort_name": "蔡怡君",
            "display_name": "蔡怡君",
            ......
            "id": "1"
            ......
        },
        ......
    ]
}
```

### 建立或更新聯絡人(create)

#### 說明

透過新建 create API，可在 CRM 網站上建立新的聯絡人，或是更新現有聯絡人

#### HTTP 方法

`POST`

##### Request Content Type
`application/x-www-form-urlencoded`

##### Request URL 

`<entrypoint>?entity=Contact&action=create`

##### Request Body

新建聯絡人
`json={"first_name":"小明","last_name":"王","contact_type":"Individual"}`

更新聯絡人編號1234的個資
`json={"id":"1234","first_name":"小明","last_name":"王","contact_type":"Individual"}`


##### API Explorer

`https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=create&json={"first_name":"小明","last_name":"王","contact_type":"Individual"}`

##### curl 發送範例

```bash
curl -g \
--header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
--request POST -d 'json={"first_name":"小明","last_name":"王","contact_type":"Individual"}' \
'<entrypoint>?entity=Contact&action=create'
```

#### 回傳範例

```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 14678,
    "values": [
        {
            "id": "14678",
            "contact_type": "Individual",
            ......
            "first_name": "小明",
            "middle_name": "",
            "last_name": "王",
            ......
        }
    ]
}
```

### 刪除聯絡人(delete)

#### 說明

透過 delete API，可在刪除網站中儲存的聯絡人，丟到資源回收桶（之後可再復原）。

#### 發送範例

##### HTTP 方法：

`POST`

##### Request Content Type

`application/x-www-form-urlencoded`

##### Request URL 

`<entrypoint>?entity=Contact&action=delete`

##### Request Body

`json={"id":"14678"}`

##### API Explorer

`https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=delete&json={"id":"14678"}`

##### curl 發送範例

```bash
curl -g \
--header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
--request POST -d 'json={"id":"14678"}' \
'<entrypoint>?entity=Contact&action=delete'
```

#### 回傳範例

```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
```

## 進階使用

### 取得聯絡人-巢狀資料

#### 說明
使用 get API取得聯絡人時，可以一併取得跟聯絡人相關的其他資料，以「取得聯絡人時，同時取得所有Email、自訂欄位」為例

#### 發送範例

##### HTTP 方法

`GET`

##### Request URL

語法
`<entrypoint>?entity=Contact&action=get&json={"api.<相關類型API名稱>.get":{"<相關類型API對應欄位>":"$value.<上層類型對應ID>", "<相關類型篩選欄位>":"<篩選值>"}}`

取得聯絡人1234的資料，以及非主要Email
`<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id","is_primary":"0"}}`

取得聯絡人1234的資料，以及自訂欄位
`<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}`

串連取得上述資料
`<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id","is_primary":"0"},"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}`

##### API Explorer

`https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id","is_primary":"0"},"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}`

##### curl 發送範例

```bash
curl -g \
--header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
'<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id","is_primary":"0"},"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}'
```

#### 回傳範例
```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": [
        {
            "id": "1234",
            "contact_id": "1234",
            "contact_type": "Individual",
            "contact_sub_type": "",
            "sort_name": "蔡怡君",
            "display_name": "蔡怡君",
            ......
            "api.Email.get": {
                "is_error": 0,
                "version": 3,
                "count": 1,
                "values": [
                    {
                        "id": "2",
                        "contact_id": "1234",
                        "location_type_id": "1",
                        "email": "jayden.nelson@netivism-is-best.com.tw",
                        "is_primary": "0",
                        "is_billing": "0",
                        "on_hold": "0",
                        "is_bulkmail": "0"
                    }
                ]
            },
            "api.CustomValue.get": {
                "is_error": 0,
                "version": 3,
                "count": 3,
                "values": [
                    {
                        "entity_id": "1234",
                        "latest": "",
                        "id": "1",
                        "0": ""
                    },
                    {
                        "entity_table": "Contact"
                    },
                    {
                        "entity_id": "1234",
                        "latest": "500,000",
                        "id": "2",
                        "0": "500,000"
                    },
                    {
                        "entity_id": "1234",
                        "latest": "",
                        "id": "3",
                        "0": ""
                    }
                ]
            }
        }
        ......
    ]
}
```

### 建立聯絡人-多值建立電話、Email、地址

#### 說明

透過新建 create API，可在 CRM 網站上建立新的聯絡人，或是更新現有聯絡人，同時將Email、電話、地址同時建立

#### 發送範例

##### HTTP 方法
`POST`

##### Request Content Type
`application/json`

##### Request URL 

`<entrypoint>?entity=Contact&action=create`

##### Request Body

```json
{
  "first_name":"小明",
  "last_name":"王",
  "contact_type":"Individual",
  "email": [
    {
      "email":"abcd@test.com",
      "location_type_id":"1",
      "append":"1"
    },
    ...
  ]
  "phone": [
    {
      "phone":"abcd@test.com",
      "location_type_id":"1",
      "phone_type_id":"1",
      "append":"1"
    },
    ...
  ],
  "address": [
    {
        "location_type_id":"1",
        "country": "TW",
        "postal_code": 100,
        "state_province_name": "臺北市",
        "city": "中正區",
        "street_address": "林森南路..."    
    },
    ...
  ]
}
```


### 取得聯絡人CS

#### 說明
CS(Contact Checksum) 的用途，讓使用者可以填寫表單時，不用重新填寫個資的方式。
設定的變數有 `contact_id` 與 `live`，`contact_id` 為聯絡人id，而`live` 則是設定過多久後會失效，需重新登入，單位為小時。

#### 發送範例

##### HTTP 方法
`GET`

##### Request URL

格式
`<entrypoint>?entity=Contact&action=checksum&json={"contact_id":"<contact id>", "live":<valid hours>}`

取得聯絡人編號1234的Checksum，並設定3小時後失效
`<entrypoint>?entity=Contact&action=checksum&json={"contact_id":"1234", "live":3}`

##### API Explorer

`https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=checksum&json={"contact_id":"1234", "live":3}`

#### 回傳範例

回傳的 values 內儲存的 key 為設定的聯絡人id，value 為 checksum。

```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 0,
    "values": [
        {
            "1234": "abcde12345HQWEQWEASDSASD_1631155364_3"
        }
    ]
}
```


