# Email



# 電子郵件 API 說明
This is a API Document about Email


| 變數名稱 | 說明 | 類型 | 建立規則 |
| ---- | ---- | ---- | ---- |
| contact_id | 聯絡人 | 數字 |  |
| location_type_id | 地點類型 | 數字 |  |
| email | 電子郵件 | 字串 |  |
| is_primary | 預設 | 布林值(True or False) | 預設值: 0 |
| is_billing | 帳單 | 布林值(True or False) | 預設值: 0 |
| on_hold | 凍結 | 布林值(True or False) | 必填, 預設值: 0 |
| is_bulkmail | 用於大量郵件 | 布林值(True or False) | 必填, 預設值: 0 |
| hold_date | 凍結日期 | 日期 |  |
| reset_date | 重設日期 | 日期 |  |
| signature_text | 簽名（純文字） | 字串 | 預設值: NULL |
| signature_html | 簽名（HTML 格式） | 字串 | 預設值: NULL |



## 建立 電子郵件 

This is tests for creating Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Contact&action=create&pretty=1&json={"email":"api@a-team.com"}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=create&pretty=1&json={"email":"api@a-team.com"}
```

**Request Samples**

```shell
curl -g --request POST '<entrypoint>?entity=Email&action=create&pretty=1&json={"email":"api@a-team.com"}' \
--header 'x-civicrm-api-key: <secret-key>'\
--header 'x-civicrm-site-key: <site-key>''
```

**Response Samples** 
```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 145,
    "values": {
        "145": {
            "id": "145",
            "contact_id": "145",
            "location_type_id": "292",
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

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Contact&action=get&pretty=1
```

**API Explor**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=get&pretty=1
```

**Request Samples**

```
Sample Source Code
```

}


## 刪除 電子郵件 

This is tests for deleting Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Contact&action=get&pretty=1&json={"email":""}
```

**API Explor**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=get&pretty=1&json={"email":""}
```
**Request Samples**

```
Sample Source Code
```

}


## 更新 電子郵件 

This is tests for updating Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Contact&action=get&pretty=1
```

**API Explor**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=get&pretty=1
```

**Request Samples**

```
Sample Source Code
```

}
