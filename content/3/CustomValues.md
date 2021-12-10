+++
title = "Custom Value API"
menuTitle = "Custom Value"
chapter = false
+++

## 取得自訂欄位群組、欄位與選項

### Custom Group Get API

#### 傳送範例
##### HTTP Method
```
GET
```

##### Request URL
```
<entrypoint>?entity=CustomGroup&action=get
```

##### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=CustomGroup&action=get
```

##### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=CustomGroup&action=get'
```

#### 回傳範例
```
{
  "is_error": 0,
  "version": 3,
  "count": 10,
  "values": [
      {
          "id": "1",
          "name": "ge_ren_bei_jing",
          "title": "個人背景",
          "extends": "Individual",
          "style": "Inline",
          "collapse_display": "0",
          "help_pre": "",
          "help_post": "",
          "weight": "1",
          "is_active": "1",
          "table_name": "civicrm_value_ge_ren_bei_jing_1",
          "is_multiple": "0",
          "collapse_adv_display": "0"
      },
      ...
  ]
}
```

### Custom Field Get API

#### 傳送範例
##### HTTP Method
```
GET
```

##### Request URL
```
<entrypoint>?entity=CustomField&action=get&json={"custom_group_id":"1"}
```

##### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=CustomField&action=get&pretty=1&json={"custom_group_id":"1"}
```

##### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=CustomField&action=get'
```

#### 回傳範例
```
{
  "is_error": 0,
  "version": 3,
  "count": 3,
  "values": [
      {
          "id": "1",
          "custom_group_id": "1",
          "name": "jiao_yu_cheng_du",
          "label": "教育程度",
          "data_type": "String",
          "html_type": "Radio",
          "is_required": "0",
          "is_searchable": "1",
          "is_search_range": "0",
          "weight": "1",
          "is_active": "1",
          "is_view": "0",
          "column_name": "jiao_yu_cheng_du_1",
          "option_group_id": "69"
      },
      {
          "id": "2",
          "custom_group_id": "1",
          "name": "nian_shou_ru_qu_jian",
          "label": "年收入區間",
          "data_type": "String",
          "html_type": "Radio",
          "is_required": "0",
          "is_searchable": "1",
          "is_search_range": "0",
          "weight": "27",
          "is_active": "1",
          "is_view": "0",
          "options_per_line": "1",
          "column_name": "nian_shou_ru_qu_jian_2",
          "option_group_id": "70"
      },
      ...
      {
        ...
      }
  ]
}
```

### Custom Field Options (Get Options API)

#### 傳送範例
##### HTTP Method
```
GET
```

##### Request URL
```
<entrypoint>?entity=contact&action=getoptions&json={"field":"custom_<field_id>"}
```

##### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=contact&action=getoptions&pretty=1&json={"field":"custom_<field_id>"}
```

##### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=contact&action=getoptions&json={"field":"custom_<field_id>"}'
```

#### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 5,
    "values": [
        {
            "value": "highschool",
            "label": "中學或以下"
        },
        {
            "value": "高中",
            "label": "高中"
        },
        {
            "value": "大學",
            "label": "大學"
        },
        {
            "value": "碩士",
            "label": "碩士"
        },
        {
            "value": "博士",
            "label": "博士"
        }
    ]
}
```

### Group / Fields / Options 巢狀API

一次取得指定自訂群組的欄位、欄位中的選項值

#### 傳送範例
##### HTTP Method
```
GET
```

##### Request URL
```
<entrypoint>?entity=CustomGroup&action=get&json={"id": 1, "api.CustomField.get":{"custom_group_id":"$value.id","api.Contact.getoptions":{"field":"custom_$value.id"}}}
```

##### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=CustomGroup&action=get&pretty=1&json={"id":1,"api.CustomField.get":{"custom_group_id":"$value.id","api.Contact.getoptions":{"field":"custom_$value.id"}}}
```

##### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=CustomGroup&action=get&json={"id":1,"api.CustomField.get":{"custom_group_id":"$value.id","api.Contact.getoptions":{"field":"custom_$value.id"}}}'
```

#### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 1,
    "values": [
        {
            "id": "1",
            "name": "ge_ren_bei_jing",
            "title": "個人背景",
            "extends": "Individual",
            "style": "Inline",
            "collapse_display": "0",
            "help_pre": "",
            "help_post": "",
            "weight": "1",
            "is_active": "1",
            "table_name": "civicrm_value_ge_ren_bei_jing_1",
            "is_multiple": "0",
            "collapse_adv_display": "0",
            "api.CustomField.get": {
                "is_error": 0,
                "version": 3,
                "count": 3,
                "values": [
                    {
                        "id": "1",
                        "custom_group_id": "1",
                        "name": "jiao_yu_cheng_du",
                        "label": "教育程度",
                        "data_type": "String",
                        "html_type": "Radio",
                        "is_required": "0",
                        "is_searchable": "1",
                        "is_search_range": "0",
                        "weight": "1",
                        "is_active": "1",
                        "is_view": "0",
                        "column_name": "jiao_yu_cheng_du_1",
                        "option_group_id": "69",
                        "api.Contact.getoptions": {
                            "is_error": 0,
                            "version": 3,
                            "count": 5,
                            "values": [
                                {
                                    "value": "highschool",
                                    "label": "中學或以下"
                                },
                                {
                                    "value": "高中",
                                    "label": "高中"
                                },
                                {
                                    "value": "大學",
                                    "label": "大學"
                                },
                                {
                                    "value": "碩士",
                                    "label": "碩士"
                                },
                                {
                                    "value": "博士",
                                    "label": "博士"
                                }
                            ]
                        }
                    },
                    {
                        "id": "2",
                        "custom_group_id": "1",
                        "name": "nian_shou_ru_qu_jian",
                        "label": "年收入區間",
                        "data_type": "String",
                        "html_type": "Radio",
                        "is_required": "0",
                        "is_searchable": "1",
                        "is_search_range": "0",
                        "weight": "27",
                        "is_active": "1",
                        "is_view": "0",
                        "options_per_line": "1",
                        "column_name": "nian_shou_ru_qu_jian_2",
                        "option_group_id": "70",
                        "api.Contact.getoptions": {
                            "is_error": 0,
                            "version": 3,
                            "count": 5,
                            "values": [
                                {
                                    "value": "500,000",
                                    "label": "500,000 or below"
                                },
                                {
                                    "value": "500001-1130000",
                                    "label": "500,001元 ~ 1,130,000 oollars"
                                },
                                {
                                    "value": "1130001-2260000",
                                    "label": "1,130,001元 ~ 2,260,000元"
                                },
                                {
                                    "value": "2260001-4230000",
                                    "label": "2,260,001元 ~ 4,230,000元"
                                },
                                {
                                    "value": 4230001,
                                    "label": "4,230,001或以上"
                                }
                            ]
                        }
                    },
                    {
                        "id": "3",
                        "custom_group_id": "1",
                        "name": "yi_hun",
                        "label": "已婚",
                        "data_type": "Boolean",
                        "html_type": "Radio",
                        "is_required": "0",
                        "is_searchable": "1",
                        "is_search_range": "0",
                        "weight": "30",
                        "is_active": "1",
                        "is_view": "0",
                        "column_name": "yi_hun_3",
                        "api.Contact.getoptions": {
                          "is_error": 0,
                          "version": 3,
                          "count": 2,
                          "values": [
                            {
                              "value": 0,
                              "label": "否"
                            },
                            {
                              "value": 1,
                              "label": "是"
                            }
                          ]
                        }
                    }
                ]
            }
        }
    ]
}
```


## 自訂欄位存取與更新

### 範例替換符號

| 替代符號 | 型別 | 限制、預設、允許值 |
| ---- | ---- | ---- |
| <entity_table> | enum | Contact（預設值）, Individual, Organization, Household, Activity, Relationship, Contribution, ContributionPage, Group, Membership, Event, Participant, ParticipantRole, ParticipantEventName, ParticipantEventType, Address, PriceField |
| <entity_id> | int | 必填, entity_table=Contact -> contact.id, entity_table=Contribution->contribution.id ... etc |
| <field_id> | int | CustomField.id（未填寫則會回傳所有欄位） |

### Custom Value Get API

#### 傳送範例
##### HTTP Method
```
GET
```

##### Request URL
回傳聯絡人指定編號、指定自訂欄位
```
<entrypoint>?entity=CustomValue&action=get&json={"entity_table":"<entity_table>","entity_id":"<entity_id>","return.custom_<field_id>":1}
```
```
<entrypoint>?entity=CustomValue&action=get&json={"entity_table":"Contact","entity_id":"3","return.custom_1":1}
```

回傳指定聯絡人的所有自訂欄位
```
<entrypoint>?entity=CustomValue&action=get&json={"entity_table":"<entity_table>","entity_id":"<entity_id>"}
```
```
<entrypoint>?entity=CustomValue&action=get&json={"entity_table":"Contact","entity_id":"3"}
```

##### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=CustomValue&action=get&json={"entity_table":"Contact","entity_id":"3","return.custom_1":1}
```

##### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=CustomValue&action=get&json={"entity_table":"Contact","entity_id":"3","return.custom_1":1}'
```

#### 回傳範例

單值範例
```
{
  "is_error": 0,
  "version": 3,
  "count": 2,
  "values": [
    {
      "id": "1"                 # 欄位編號
      "entity_id": "3",         # 聯絡人編號，或指定的 entity 編號
      "0": "大學",               # 請使用 latest 替代
      "latest": "大學",          # API使用，請取用此值，回傳為選項的「值」
    },
    {
      "entity_table": "Contact" # Request 有帶 entity_table時，結果會回傳此項目
    }
  ]
}
```

多選項範例（如勾選框）
```
{
  "is_error": 0,
  "version": 3,
  "count": 2,
  "values": [
    {
      "id": "10"
      "entity_id": "5697",
      "0": [
        "1",
        "2"
      ],
      "latest": [                # 多值選項，如多選下拉選單，或是勾選匡，將會回傳陣列
        "1",
        "2"
      ],
    }
    {
      "entity_table": "Contact"
    }
  ]
}
```

### Custom Value Create / Update API

#### 傳送範例
##### HTTP Method
```
POST
```

##### Request URL
```
<entrypoint>?entity=CustomValue&action=create
```

##### Request Content Type
```
application/json
```

##### Request body
實例，一次建立（更新）聯絡人系統編號3的3個自訂欄位：

```
{
  "entity_table": "<entity_table>", # 請參照 "範例替換符號" <entity_table> 說明
  "entity_id": "<entity_id>",       # 請參照 "範例替換符號" <entity_id> 說明 
  "custom_<field_id>":"highschool", # 欲更新的欄位，<field_id>為自訂欄位編號
                                    # 單值請直接帶入字串，允許值為自訂欄位選項「值」
  "custom_<field_id>": [            # 多值範例，請傳入陣列，將會清掉現有選項值，重新指定新的選項值
    1,
    2
  ],
  "custom_<field_id>": "[null]"     # 將欄位值清空（NULL）範例，帶入字串"[null]"
}
```

```
{
  "entity_table": "Contact",      # 請參照<entity_table>說明
  "entity_id": "3",               # 聯絡人編號，或指定的 entity_table 編號
  "custom_1": "highschool",       # 自訂欄位編號，欄位名稱格式固定為 custom_<field_id>
                                  # 單值請直接帶入字串，允許值為自訂欄位選項「值」
  "custom_10": [                  # 多值範例，請傳入陣列，將會清掉現有選項值，重新指定新的選項值
    1,
    2
  ],
  "custom_11": "[null]"           # 將欄位值清空（NULL）範例，帶入字串"[null]"
}
```

##### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"entity_table":"Contact","entity_id:3,"custom_1":"highschool","custom_10":[1,2],"custom_11":"[null]"}' \
  '<entrypoint>?entity=CustomValue&action=create'
```

#### 回傳範例

```
{
  "is_error": 0,
  "version": 3,
  "count": 1,
  "values": true
}
```

### 進階範例：建立聯絡人同時更新自訂欄位

#### 傳送範例
##### HTTP Method
```
POST
```

##### Request URL
```
<entrypoint>?entity=Contact&action=create
```

##### Request Content Type
```
application/json
```

##### Request body

```
{
  "contact_type": "Individual",
  "last_name": "王",
  "first_name": "陽明",
  "nick_name": "小明",
  "api.CustomValue.create": {
    "entity_table": "<entity_table>", # 請參照 "範例替換符號" <entity_table> 說明
    "entity_id": "$value.id",         # $value.id 固定會取上層API的id欄位，若是建立聯絡人，將會取新建立的聯絡人ID
    "custom_<field_id>":"highschool", # 欲更新的欄位，<field_id>為自訂欄位編號
                                      # 單值請直接帶入字串，允許值為自訂欄位選項「值」
    "custom_<field_id>": [            # 多值範例，請傳入陣列，將會清掉現有選項值，重新指定新的選項值
      1,
      2
    ],
    "custom_<field_id>": "[null]"     # 將欄位值清空（NULL）範例，帶入字串"[null]"
  }
}
```

#### 回傳範例

```
{
  "is_error": 0,
  "version": 3,
  "count": 1,
  "id": 1234,
  "values": [
    {
      "id": "1234",
      "contact_type": "Individual",
      "contact_sub_type": "",
      "do_not_email": "",
      "do_not_phone": "",
      "do_not_mail": "",
      "do_not_sms": "",
      "do_not_trade": "",
      "is_opt_out": "",
      "legal_identifier": "",
      "external_identifier": "",
      "sort_name": "王陽明",
      "display_name": "王陽明",
      "nick_name": "小明",
      "legal_name": "",
      "image_URL": "",
      "preferred_communication_method": "",
      "preferred_language": "",
      "preferred_mail_format": "",
      "hash": "",
      "api_key": "",
      "first_name": "陽明",
      "middle_name": "",
      "last_name": "王",
      "prefix_id": "",
      "suffix_id": "",
      "email_greeting_id": "",
      "email_greeting_custom": "",
      "email_greeting_display": "",
      "postal_greeting_id": "",
      "postal_greeting_custom": "",
      "postal_greeting_display": "",
      "addressee_id": "",
      "addressee_custom": "",
      "addressee_display": "",
      "job_title": "",
      "gender_id": "",
      "birth_date": "",
      "is_deceased": "",
      "deceased_date": "",
      "household_name": "",
      "primary_contact_id": "",
      "organization_name": "",
      "sic_code": "",
      "user_unique_id": "",
      "api.CustomValue.create": {
        "is_error": 0,
        "version": 3,
        "count": 1,
        "values": true
      }
    }
  ]
}
```