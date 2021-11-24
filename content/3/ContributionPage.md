+++
title = "Contribution Page API"
menuTitle = "Contribution Page"
+++

## 取得募款頁資料

透過 get API，可取得 CRM 網站上募款頁資訊

### 查詢範例

#### HTTP方法

`GET`

#### Request URL

取得所有募款頁
`<entrypoint>?entity=ContributionPage&action=get`

取得編號3的募款頁
`<entrypoint>?entity=ContributionPage&action=get&json={"id":"3"}`


#### API Explorer 路徑

`https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=ContributionPage&action=get&pretty=1`


#### CURL 發送範例

```bash
curl -g \
--header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
'<entrypoint>?entity=ContributionPage&action=get'
```

### 回傳範例

```json
{
    "is_error": 0,                                     #是否有錯誤
    "version": 3,                                      #API的版本
    "count": 1,                                        #此次查詢比數
    "values": [                                        #此次查詢結果
        {
            "id": "4",                                 #募款頁id
            "title": "範例募款頁",                       #募款頁標題
            "intro_text": "<p>募款頁的介紹訊息！</p>",    #主要介紹訊息，允許HTML
            "contribution_type_id": "1",               #費用類型編號
            "payment_processor": [                     #啟用的金流機制 ID
                "1",
                "5"
            ],
            "is_monetary": "1",                        #是否必要付款，"0" or "1"
            "is_recur": "1",                           #是否定期，"0"或"1"或"2"
                                                       #當"0"表示僅允許單筆，"1"表示允許單筆與定期，"2"表示允許單筆
            "recur_frequency_unit": "month",           #定期的週期別
            "is_recur_interval": "0",                  #週期間隔，固定為"0"
            "installments_option": "1",                #允許使用者在募款頁選擇定期期數
            "is_pay_later": "1",                       #是否允許稍後付款，"0"表示停用，"1"表示啟用
            "pay_later_text": "請設定您的金流服務",       #若 is_pay_later="1"時，稍後付款的文字
            "pay_later_receipt": "選擇金流服務商完成設定，即可提供正式的線上付款工具。",
                                                       #若 is_pay_later="1"時，稍後付款於信件中的說明
            "is_allow_other_amount": "1",              #是否允許自訂金額
            "default_amount_id": "689",                #內部定義金額
            "thankyou_title": "謝謝你的支持",            #感謝頁的標題
            "is_for_organization": "0",                #頁面是否允許組織填寫資訊捐款，"0"或"1"
            "for_organization": "我代表組織捐款。",       #組織捐款時，標題為何
            "is_email_receipt": "1",                   #是否寄送付款成功確認電子郵件，"0"或"1"
            "receipt_from_email": "demo@demo.neticrm.tw",
                                                       #付款成功確認電子郵件的寄件人
            "is_active": "3",                          #"0"，或"1"或"3"
                                                       #"0" 表示停用募款頁，募款頁無法作用
                                                       #"1" 表示啟用募款頁，且是一般型態的募款頁
                                                       #"3" 表示啟用募款頁，且是特殊型態的募款頁
            "footer_text": "<p>OOOOOO</p>",            #頁尾文字，允許HTML
            "amount_block_is_active": "1",             #啟用金額區塊，"0"或"1"
            "honor_block_is_active": "0",              #暫無用途，請略過
            "currency": "TWD",                         #貨幣類型
            "background_URL": "https://full_domain_url/2001_a_space_odyssey_20_2WHxBLyd.jpg",
                                                       #當 is_active="3"時使用的背景圖片
            "mobile_background_URL": "https://full_domain_url/442377_wxLADqLd.jpg",
                                                       #當 is_active="3"時使用的手機背景圖片
            "is_send_sms": "0",                        #目前無作用，固定為"0"
            "sms_text": "",                            #目前無作用
            "goal_type": "recuramount",                #啟用募款進度條、目標種類
            "goal_label": "每月定期目標金額",             #啟用募款進度條、目標種類的文字
            "goal": "1000.00",                         #啟用募款頁進度條
                                                       #當goal_type="recuramount"時，目標為每月的定期金額
                                                       #當goal_type="amount"，目標為該募款頁的總累計金額
                                                       #當goal_type="recurring"，目標為該募款頁的固定定期定額人數
            "goal_achieved": "0",                      #是否達成目標，"0"或"1"
            "goal_achieved_current": "100",            #達成目標的金額或是人數，請看"goal"
            "goal_achieved_percent": "0",              #達成目標的百分比，0-100請看 "goal"
            "price_set_id": "0",                       #若啟用價格表，則為價格表ID，"0"表示未啟用價格表
            "fee_block": {                             #募款頁的價格
                "recurring": [                         #僅於定期定額顯示的價格
                    {
                        "label": "OOO",                #價格的名稱
                        "value": "100"                 #價格的金額
                    },
                    {
                        "label": "ORZ",
                        "value": "444"
                    }
                ],
                "non-recurring": [                     #僅於非定期定額顯示的價格
                    {
                        "label": "XXX",
                        "value": "200"
                    },
                    {
                        "label": "OMG",
                        "value": "888"
                    }
                ],
                "all": [                               #於定期、非定期皆顯示的價格
                    {
                        "label": "###",
                        "value": "333"
                    }
                ]
            }
        }
    ]
}
```

## 取得募款頁、以及該募款頁的相關自訂欄位資料

透過查詢 API (get API)，取得募款頁，以及募款頁相關的自訂欄位資料。

### 查詢範例

#### HTTP方法

`GET`

#### Request URL

`<entrypoint>?entity=ContributionPage&action=get&json={"api.CustomValue.get":{"entity_id":"$value.id"}}`

#### API Explorer 路徑

`https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=ContributionPage&action=get&pretty=1&json={%22api.CustomValue.get%22:{%22entity_id%22:%22$value.id%22}}`

#### CURL 發送範例

```bash
curl -g \
--header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
 '<entrypoint>?entity=ContributionPage&action=get&json={"api.CustomValue.get":{"entity_id":"$value.id"}}'
```

### 回傳範例

```json
{
    "is_error": 0,                                     #是否有錯誤
    "version": 3,                                      #API的版本
    "count": 1,                                        #此次查詢比數
    "values": [                                        #此次查詢結果
        {
            ...                                        #略，同 取得募款頁資料
            "api.CustomValue.get": {                   #取得額外自訂欄位資料
                "is_error": 0,
                "version": 3,
                "count": 3,                            #額外欄位數量
                "values": [                            #取得額外自訂欄位資料的結果，每個欄位一個結果
                    {
                        "entity_table": "ContributionPage"
                                                       #當自訂欄位關聯的不是聯絡人，就會顯示關聯的類型
                    },
                    {
                        "entity_id": "4",              #關聯的資料ID，此為募款頁ID
                        "id": "14",                    #自訂欄位ID
                        "latest": "1",                 #此自訂欄位的值，請略過此欄位
                        "0": "1",                      #此自訂欄位的值，請以此為準
                        "uri": "https://<full_domain_url>/fake_image.jpg"
                                                       #若自訂欄位為檔案時，且檔案為圖片時，回傳圖片的完整網址
                    },
                    {
                        "entity_id": "4",              #關聯的資料ID，此為募款頁ID
                        "id": "15",                    #自訂欄位ID
                        "latest": "募款頁簡介募款頁簡介募款頁簡介募款頁簡介",
                                                       #此自訂欄位的值，請略過此欄位
                        "0": "募款頁簡介募款頁簡介募款頁簡介募款頁簡介"
                                                       #此自訂欄位的值，請以此為準
                    }
                ]
            }
        }
    ]
}
```

