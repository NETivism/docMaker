+++
title = "Contact API"
menuTitle = "Contact"
weight = 50
+++

| 變數名稱 | 類型 | 長度 | 格式 | 建立規則 | 說明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 數字(int unsigned) | 10 | >= 0 | 更新時必填 | Unique Contact ID |
| contact_type | 字串(varchar) | 64 |  |  | Type of Contact. |
| contact_sub_type | 字串(varchar) | 64 |  |  | May be used to over-ride contact view and edit templates. |
| do_not_email | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| do_not_phone | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| do_not_mail | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| do_not_sms | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| do_not_trade | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| is_opt_out | 布林值(boolean) | 1 | 0 or 1 | 必填, 預設值: 0 | Has the contact opted out from receiving all bulk email from the organization or site domain? |
| legal_identifier | 字串(varchar) | 32 |  |  | May be used for SSN, EIN/TIN, Household ID (census) or other applicable unique legal/government ID. |
| external_identifier | 字串(varchar) | 128 |  |  | Unique trusted external ID (generally from a legacy app/datasource). Particularly useful for deduping operations. |
| sort_name | 字串(varchar) | 128 |  |  | Name used for sorting different contact types |
| display_name | 字串(varchar) | 128 |  |  | Formatted name representing preferred format for display/print/other output. |
| nick_name | 字串(varchar) | 128 |  |  | Nick Name. |
| legal_name | 字串(varchar) | 128 |  |  | Legal Name. |
| home_URL | 字串(varchar) | 128 |  |  | optional "home page" URL for this contact. |
| image_URL | 字串(varchar) | 255 |  |  | optional URL for preferred image (photo, logo, etc.) to display for this contact. |
| preferred_communication_method | 字串(varchar) | 255 |  |  | What is the preferred mode of communication. |
| preferred_language | 字串(varchar) | 5 |  |  | Which language is preferred for communication. FK to languages in civicrm_option_value. |
| preferred_mail_format | 字串(enum) |  | Text, HTML, Both | 預設值: "Both" | What is the preferred mode of sending an email. |
| hash | 字串(varchar) | 32 |  |  | Key for validating requests related to this contact. |
| api_key | 字串(varchar) | 32 |  |  | API Key for validating requests related to this contact. |
| source | 字串(varchar) | 255 |  |  | where contact come from, e.g. import, donate module insert... |
| first_name | 字串(varchar) | 64 |  |  | First Name. |
| middle_name | 字串(varchar) | 64 |  |  | Middle Name. |
| last_name | 字串(varchar) | 64 |  |  | Last Name. |
| prefix_id | 數字(int unsigned) | 10 | >= 0 |  | Prefix or Title for name (Ms, Mr...). FK to prefix ID |
| suffix_id | 數字(int unsigned) | 10 | >= 0 |  | Suffix for name (Jr, Sr...). FK to suffix ID |
| greeting_type | 字串(varchar) | 128 |  |  | Preferred greeting format. |
| greeting_type_id | 數字(int unsigned) | 10 | >= 0 |  | FK to civicrm_option_value.id, that has to be valid, registered Greeting type. |
| custom_greeting | 字串(varchar) | 128 |  |  | Custom greeting message. |
| email_greeting_id | 數字(int unsigned) | 10 | >= 0 |  | FK to civicrm_option_value.id, that has to be valid registered Email Greeting. |
| email_greeting_custom | 字串(varchar) | 128 |  |  | Custom Email Greeting. |
| email_greeting_display | 字串(varchar) | 255 |  |  | Cache Email Greeting. |
| postal_greeting_id | 數字(int unsigned) | 10 | >= 0 |  | FK to civicrm_option_value.id, that has to be valid registered Postal Greeting. |
| postal_greeting_custom | 字串(varchar) | 128 |  |  | Custom Postal greeting. |
| postal_greeting_display | 字串(varchar) | 255 |  |  | Cache Postal greeting. |
| addressee_id | 數字(int unsigned) | 10 | >= 0 |  | FK to civicrm_option_value.id, that has to be valid registered Addressee. |
| addressee_custom | 字串(varchar) | 128 |  |  | Custom Addressee. |
| addressee_display | 字串(varchar) | 255 |  |  | Cache Addressee. |
| job_title | 字串(varchar) | 255 |  |  | 職稱 |
| gender_id | 數字(int unsigned) | 10 | >= 0 |  | FK to gender ID |
| birth_date | 日期(date) |  | yyyy-mm-dd |  | 出生日期 |
| is_deceased | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| deceased_date | 日期(date) |  | yyyy-mm-dd |  | Date of deceased |
| mail_to_household_id | 數字(int unsigned) | 10 | >= 0 |  | OPTIONAL FK to civicrm_contact_household record. If NOT NULL, direct mail communications to household rather than individual location. |
| household_name | 字串(varchar) | 128 |  |  | Household Name. |
| primary_contact_id | 數字(int unsigned) | 10 | >= 0 |  | Optional FK to Primary Contact for this household. |
| organization_name | 字串(varchar) | 128 |  |  | Organization Name. |
| sic_code | 字串(varchar) | 8 |  |  | Standard Industry Classification Code. |
| user_unique_id | 字串(varchar) | 255 |  |  | the OpenID (or OpenID-style http://username.domain/) unique identifier for this contact mainly used for logging in to CiviCRM |
| employer_id | 數字(int unsigned) | 10 | >= 0 |  | OPTIONAL FK to civicrm_contact record. |
| is_deleted | 布林值(boolean) | 1 | 0 or 1 | 必填, 預設值: 0 |  |

# 基本使用

## Contact Get API

### 發送範例

#### HTTP Method

```
GET
```

#### Request URL

取得所有聯絡人
```
<entrypoint>?entity=Contact&action=get&json={}
```

取得特定篩選條件的聯絡人
```
<entrypoint>?entity=Contact&action=get&json={"<field>":"<value>"}}
```

聯絡人編號1234的聯絡人
```
<entrypoint>?entity=Contact&action=get&json={"id":"1234"}}
```

姓氏是王、名字是小明的聯絡人
```
<entrypoint>?entity=Contact&action=get&json={"last_name":"王","first_name":"小明"}}
```

#### API Explorer

```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=get&json={"<field>":"<value>"}>
```

#### curl 發送範例

```bash
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \
  '<entrypoint>?entity=Contact&action=get&json={"<field>":"<value>"}'
```

### 回傳範例
```
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

## Contact Create API

### HTTP 方法

```
POST
```

#### Request Content Type
```
application/json
```

#### Request URL

```
<entrypoint>?entity=Contact&action=create
```

#### Request Body

```
{"first_name":"小明","last_name":"王","contact_type":"Individual"}
```

#### API Explorer

```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=create&json={"first_name":"小明","last_name":"王","contact_type":"Individual"}
```

#### curl Example

```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \
  --header 'content-type: application/json' \
  --request POST \
  --data '{"first_name":"小明","last_name":"王","contact_type":"Individual"}' \
  '<entrypoint>?entity=Contact&action=create'
```

### 回傳範例

```
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

## Contact Update API

### HTTP 方法

```
POST
```

#### Request Content Type
```
application/json
```

#### Request URL

```
<entrypoint>?entity=Contact&action=create
```

#### Request Body

更新聯絡人編號14678的個資，假設原聯絡人資料如下：
```
{
  "id":"14678",
  "first_name":"大明",
  "last_name":"王"
}
```

#### API Explorer

```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=create&json={"id":"14678", "first_name":"小明","last_name":"王"}
```

#### curl 發送範例

```bash
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":"14678", "first_name":"小明","last_name":"王"}' \
  '<entrypoint>?entity=Contact&action=create'
```

### 回傳範例

```
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


## 刪除聯絡人(delete)

透過 delete API，可在刪除網站中儲存的聯絡人，丟到資源回收桶（之後可再復原）。

### 發送範例

#### HTTP 方法：

```
POST
```

#### Request Content Type

```
application/json
```

#### Request URL

```
<entrypoint>?entity=Contact&action=delete
```

#### Request Body

```
{"id":"14678"}
```

#### API Explorer

```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=delete&json={"id":"14678"}
```

#### curl 發送範例

```bash
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":"14678"}' \
  '<entrypoint>?entity=Contact&action=delete'
```

### 回傳範例

```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
```

# 進階使用

## 取得聯絡人-巢狀資料

使用 get API取得聯絡人時，可以一併取得跟聯絡人相關的其他資料，以「取得聯絡人時，同時取得所有Email、自訂欄位」為例

### 發送範例

#### HTTP 方法

```
GET
```

#### Request URL

語法
```
<entrypoint>?entity=Contact&action=get&json={"api.<相關類型API名稱>.get":{"<相關類型API對應欄位>":"$value.<上層類型對應ID>", "<相關類型篩選欄位>":"<篩選值>"}}
```

取得聯絡人1234的資料，以及非主要Email
```
<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id","is_primary":"0"}}
```

取得聯絡人1234的資料，以及自訂欄位
```
<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}
```

串連取得上述資料
```
<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id","is_primary":"0"},"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}
```

#### API Explorer

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id","is_primary":"0"},"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}
```

#### curl 發送範例

```bash
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  '<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id","is_primary":"0"},"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}'
```

### 回傳範例
```
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

## 建立聯絡人-多值建立電話、Email、地址

透過新建 create API，可在 CRM 網站上建立新的聯絡人，或是更新現有聯絡人，同時將Email、電話、地址同時建立

### 發送範例

#### HTTP 方法
```
POST
```

#### Request Content Type
```
application/json
```

#### Request URL 

```
<entrypoint>?entity=Contact&action=create
```

#### Request Body

```
{
  "first_name":"小明",
  "last_name":"王",
  "contact_type":"Individual",
  "email": [
    {
      "email":"abcd@test.com",
      "location_type_id":"1",
    },
    ...
  ]
  "phone": [
    {
      "phone":"0911-222333",
      "location_type_id":"1",
      "phone_type_id":"1",
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


## 取得聯絡人CS

CS(Contact Checksum) 的用途，讓使用者可以填寫表單時，不用重新填寫個資的方式。
設定的變數有 `contact_id` 與 `live`，`contact_id` 為聯絡人id，而`live` 則是設定過多久後會失效，需重新登入，單位為小時。
回傳的`checksum`與`Contact ID`代入捐款頁、活動報名頁於網址參數`cs`、`cid`，使用者點擊該網址，即自動帶出聯絡人個資。

### 發送範例

#### HTTP 方法

```
POST
```

#### Request URL

格式
```
<entrypoint>?entity=Contact&action=checksum&json={"contact_id":"<contact id>", "live":<valid hours>}
```

取得聯絡人編號1234的CheckSum，並設定3小時後失效
```
<entrypoint>?entity=Contact&action=checksum&json={"contact_id":"1234", "live":3}
```

#### API Explorer

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=checksum&json={"contact_id":"1234", "live":3}
```

#### curl 發送範例

```bash
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":1234,"live":3}' \
  '<entrypoint>?entity=Contact&action=checksum'
```

### 回傳範例

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

### 使用範例

以捐款頁為例，ID 為`<page_id>`的捐款頁網址為 `https://<site-domain>/civicrm/contribute/transact?reset=1&id=<page_id>`，在網址後面加上`cs`和`cid`的變數，就會自動代入該聯絡人資料。

組合後網址如下：

```
https://<site-domain>/civicrm/contribute/transact?reset=1&id=<page_id>&cs=<checksum>&cid=<contact_id>
```

#### 使用於捐款頁的範例

以下為 ID=2 的捐款頁，代入上述產生的 ID=1234 之聯絡人資料的網址：

```
https://<site-domain>/civicrm/contribute/transact?reset=1&id=2&cs=abcde12345HQWEQWEASDSASD_1631155364_3&cid=1234
```

#### 使用於活動報名頁的範例

以下為 ID=12 的活動報名頁，代入上述產生的 ID=1234 之聯絡人資料的網址：

```
https://<site-domain>/civicrm/event/register?reset=1&id=12&cs=abcde12345HQWEQWEASDSASD_1631155364_3&cid=1234#register-now
```


