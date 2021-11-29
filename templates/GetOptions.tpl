+++
title = "Get Options API"
menuTitle = "Get Options"
chapter = false
+++
This is a API document about getoptions action.




## <field_name> options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=<entity>&action=getoptions&json=
{/literal}```


#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=<entity>&action=getoptions&json='
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 3,
    "values": [
        {
            "value": 1001,
            "label": "example label 1"
        },
        {
            "value": 1002,
            "label": "example label 2"
        },
        {
            "value": 1003,
            "label": "example label 3"
        }
    ]
}
{/literal}```

## contact_type options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json=null
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json=null
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json=null'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 3,
    "values": [
        {
            "value": "Individual",
            "label": "個人"
        },
        {
            "value": "Household",
            "label": "家庭"
        },
        {
            "value": "Organization",
            "label": "組織"
        }
    ]
}
{/literal}```

## contact_sub_type options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"contact_sub_type"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"contact_sub_type"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"contact_sub_type"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": [
        {
            "id": "4",
            "name": "NPO",
            "label": "NPO",
            "parent": "Organization",
            "value": "4"
        }
    ]
}
{/literal}```

## prefix_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"prefix_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"prefix_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"prefix_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 4,
    "values": [
        {
            "value": 1,
            "label": "女士"
        },
        {
            "value": 2,
            "label": "小姐"
        },
        {
            "value": 3,
            "label": "先生"
        },
        {
            "value": 4,
            "label": "博士"
        }
    ]
}
{/literal}```

## suffix_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"suffix_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"suffix_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"suffix_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 8,
    "values": [
        {
            "value": 1,
            "label": "Jr."
        },
        {
            "value": 2,
            "label": "Sr."
        },
        {
            "value": 3,
            "label": "II"
        },
        {
            "value": 4,
            "label": "III"
        },
        {
            "value": 5,
            "label": "IV"
        },
        {
            "value": 6,
            "label": "V"
        },
        {
            "value": 7,
            "label": "VI"
        },
        {
            "value": 8,
            "label": "VII"
        }
    ]
}
{/literal}```

## gender_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"gender_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"gender_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"gender_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 3,
    "values": [
        {
            "value": 1,
            "label": "女"
        },
        {
            "value": 2,
            "label": "男"
        },
        {
            "value": 3,
            "label": "跨性別"
        }
    ]
}
{/literal}```

## location_type_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"location_type_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"location_type_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"location_type_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 5,
    "values": [
        {
            "value": 3,
            "label": "主要"
        },
        {
            "value": 1,
            "label": "住家"
        },
        {
            "value": 4,
            "label": "其他"
        },
        {
            "value": 2,
            "label": "工作"
        },
        {
            "value": 5,
            "label": "帳單"
        }
    ]
}
{/literal}```

## worldregion_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"worldregion_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"worldregion_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"worldregion_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 6,
    "values": [
        {
            "value": 1,
            "label": "Europe and Central Asia"
        },
        {
            "value": 2,
            "label": "America South, Central, North and Caribbean"
        },
        {
            "value": 3,
            "label": "Middle East and North Africa"
        },
        {
            "value": 4,
            "label": "Asia-Pacific"
        },
        {
            "value": 5,
            "label": "Africa West, East, Central and Southern"
        },
        {
            "value": 99,
            "label": "unassigned"
        }
    ]
}
{/literal}```

## country_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"country_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"country_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"country_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 2,
    "values": [
        {
            "value": 1228,
            "label": "美國"
        },
        {
            "value": 1208,
            "label": "臺灣"
        }
    ]
}
{/literal}```

## state_province_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"state_province_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"state_province_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"state_province_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 22,
    "values": [
        {
            "value": 4855,
            "label": "南投縣"
        },
        {
            "value": 5222,
            "label": "嘉義市"
        },
        {
            "value": 4849,
            "label": "嘉義縣"
        },
        {
            "value": 4864,
            "label": "基隆市"
        },
        {
            "value": 4852,
            "label": "宜蘭縣"
        },
        {
            "value": 4857,
            "label": "屏東縣"
        },
        {
            "value": 4848,
            "label": "彰化縣"
        },
        {
            "value": 4860,
            "label": "新北市"
        },
        {
            "value": 5223,
            "label": "新竹市"
        },
        {
            "value": 4850,
            "label": "新竹縣"
        },
        {
            "value": 4862,
            "label": "桃園市"
        },
        {
            "value": 4856,
            "label": "澎湖縣"
        },
        {
            "value": 5219,
            "label": "臺中市"
        },
        {
            "value": 5221,
            "label": "臺北市"
        },
        {
            "value": 5224,
            "label": "臺南市"
        },
        {
            "value": 4861,
            "label": "臺東縣"
        },
        {
            "value": 4851,
            "label": "花蓮縣"
        },
        {
            "value": 4854,
            "label": "苗栗縣"
        },
        {
            "value": 5225,
            "label": "連江縣"
        },
        {
            "value": 5226,
            "label": "金門縣"
        },
        {
            "value": 4863,
            "label": "雲林縣"
        },
        {
            "value": 5220,
            "label": "高雄市"
        }
    ]
}
{/literal}```

## phone_type_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"phone_type_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"phone_type_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"phone_type_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 5,
    "values": [
        {
            "value": 2,
            "label": "行動電話"
        },
        {
            "value": 1,
            "label": "電話"
        },
        {
            "value": 3,
            "label": "傳真"
        },
        {
            "value": 4,
            "label": "呼叫器"
        },
        {
            "value": 5,
            "label": "語音郵件"
        }
    ]
}
{/literal}```

## provider_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contact&action=getoptions&json={"field":"provider_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"provider_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"provider_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 3,
    "values": [
        {
            "value": 6,
            "label": "Skype"
        },
        {
            "value": 7,
            "label": "LINE"
        },
        {
            "value": 8,
            "label": "Facebook"
        }
    ]
}
{/literal}```

## contribution_type_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contribution&action=getoptions&json={"field":"contribution_type_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution&action=getoptions&pretty=1&json={"field":"contribution_type_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contribution&action=getoptions&json={"field":"contribution_type_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 4,
    "values": [
        {
            "value": 1,
            "label": "一般捐款"
        },
        {
            "value": 3,
            "label": "指定捐款"
        },
        {
            "value": 2,
            "label": "會費"
        },
        {
            "value": 4,
            "label": "活動費用"
        }
    ]
}
{/literal}```

## contribution_page_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contribution&action=getoptions&json={"field":"contribution_page_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution&action=getoptions&pretty=1&json={"field":"contribution_page_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contribution&action=getoptions&json={"field":"contribution_page_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 4,
    "values": [
        {
            "value": 1,
            "label": "捐款贊助"
        },
        {
            "value": 2,
            "label": "捐款贊助"
        },
        {
            "value": 3,
            "label": "捐款贊助"
        },
        {
            "value": 4,
            "label": "捐款贊助"
        }
    ]
}
{/literal}```

## contribution_status_id options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contribution&action=getoptions&json={"field":"contribution_status_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution&action=getoptions&pretty=1&json={"field":"contribution_status_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contribution&action=getoptions&json={"field":"contribution_status_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 7,
    "values": [
        {
            "value": 1,
            "label": "已完成"
        },
        {
            "value": 2,
            "label": "待處理"
        },
        {
            "value": 3,
            "label": "已取消"
        },
        {
            "value": 4,
            "label": "已失敗"
        },
        {
            "value": 5,
            "label": "進行中"
        },
        {
            "value": 6,
            "label": "已過期"
        },
        {
            "value": 7,
            "label": "暫停中"
        }
    ]
}
{/literal}```

## currency options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contribution&action=getoptions&json={"field":"currency"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution&action=getoptions&pretty=1&json={"field":"currency"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contribution&action=getoptions&json={"field":"currency"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": [
        {
            "value": "TWD",
            "label": "TWD (NT$)"
        }
    ]
}
{/literal}```

## payment_instrument_id  options API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=contribution&action=getoptions&json={"field":"payment_instrument_id"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contribution&action=getoptions&pretty=1&json={"field":"payment_instrument_id"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contribution&action=getoptions&json={"field":"payment_instrument_id"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 18,
    "values": [
        {
            "value": 10,
            "label": "超商代碼"
        },
        {
            "value": 9,
            "label": "超商條碼繳費"
        },
        {
            "value": 12,
            "label": "ATM 轉帳"
        },
        {
            "value": 1,
            "label": "信用卡"
        },
        {
            "value": 20,
            "label": "支付寶"
        },
        {
            "value": 15,
            "label": "Apple Pay"
        },
        {
            "value": 17,
            "label": "LINE Pay"
        },
        {
            "value": 16,
            "label": "Google Pay"
        },
        {
            "value": 13,
            "label": "Yahoo公益"
        },
        {
            "value": 7,
            "label": "信用卡定期定額（非線上）"
        },
        {
            "value": 8,
            "label": "郵政劃撥"
        },
        {
            "value": 6,
            "label": "信用卡（非線上）"
        },
        {
            "value": 2,
            "label": "簽帳卡"
        },
        {
            "value": 3,
            "label": "現金"
        },
        {
            "value": 4,
            "label": "支票"
        },
        {
            "value": 5,
            "label": "電子轉帳（EFT）"
        },
        {
            "value": 18,
            "label": "ACH 銀行"
        },
        {
            "value": 19,
            "label": "ACH 郵局"
        }
    ]
}
{/literal}```
