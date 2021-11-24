+++
title = "Event API"
menuTitle = "Event"
+++

## 取得活動頁資料

透過 get API ，可取得 CRM 網站上活動資訊

### 查詢範例

#### HTTP方法

`GET`

#### Request URL

取得所有活動頁
`<entrypoint>?entity=Event&action=get`

取得活動編號6的活動頁
`<entrypoint>?entity=Event&action=get&json={"id":"6"}`


#### API Explorer 路徑

`https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Event&action=get&pretty=1`


#### CURL 發送範例

```bash

curl -g \
--header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
'<entrypoint>?entity=Event&action=get'
```

### 回傳範例

```json=
{
    "is_error": 0,                                     #是否有錯誤
    "version": 3,                                      #API的版本
    "count": 1,                                        #此次查詢比數
    "values": [                                        #此次查詢結果
        {
            "id": "9",                                 #活動編號
            "title": "OOOO",                           #活動標題
            "event_title": "OOOO",                     #同上
            "event_type_id": "1",                      #活動類型
            "is_public": "1",                          #是否為公開活動，未公開活動仍可存取、報名"0"或"1"
            "start_date": "2020-12-24 16:01:00",       #活動開始日期時間（時區固定為Asia/Taipei）
            "event_start_date": "2020-12-24 16:01:00", #同上
            "is_online_registration": "1",             #是否允許線上報名，"0"或"1"，"0"時無法線上報名
            "is_qrcode": "0",                          #是否啟用報到碼
            "registration_start_date": "2020-01-13 00:00:00",
                                                       #報名開始日期時間
            "registration_end_date": "2020-01-21 00:00:00",
                                                       #報名截止日期時間
            "max_participants": "5",                   #活動名額（最大參加數量），若未限制，則無此欄位
            "event_full_text": "此活動目前已報名額滿。",   #額滿時，出現的文字
            "is_monetary": "0",                        #活動是否啟付費功能，"0"或"1"
            "contribution_type_id": "0",               #當is_monetary="1"時，需要有費用類型的編號
            "is_map": "0",                             #活動是否顯示地圖於地點
            "is_active": "1",                          #活動是否啟用，"0"為停用或"1"啟用，當活動停用時，活動無法存取、報名
            "is_show_location": "1",                   #活動是否顯示活動地點
            "loc_block_id": "5",                       #內部紀錄，請略過
            "default_role_id": "1",                    #活動的參加者預設角色
            "is_email_confirm": "0",                   #是否寄送報名確認信件，"0"或"1"
            "allow_cancel_by_link": "0",               #當is_email_confirm="1"時，是否包含取消活動報名的連結
            "is_pay_later": "0",                       #是否啟用稍後付款，僅於is_monetary="1"時有用
            "is_multiple_registrations": "0",          #一次是否可報名多位參加者，"0"或"1"
            "allow_same_participant_emails": "0",      #多位參加者報名時，是否允許用相同Email，"0"或"1"
            "has_waitlist": "0",                       #是否啟用了候補功能，"0"或"1"
            "waitlist_text": "此活動已額滿，您的報名將列為候補，若有名額將再通知您完成報名。",
                                                       #候補功能時，名額已滿的顯示文字
            "is_template": "0",                        #是否為活動範本，固定為"0"
            "template_title": "有名額限制，不開放候補",    #活動範本的標題，請略過
            "created_id": "1",                         #活動建立者的聯絡人編號
            "created_date": "2020-12-24 16:01:35",     #活動建立時的日期時間
            "available_places": "5",                   #活動剩餘名額，若未限制max_participants時，此固定為""
            "is_full": "0",                            #活動是否額滿，若已額滿，為"1"，未額滿，為"0"
                                                       #當未提供max_participants時，永遠為"0"
            "location_address": "512 彰化縣永靖鄉ABCD",  #活動地點完整地址
            "location_phone": "0955533333",            #活動資訊聯絡電話
            "location_email": "jjj@bbb.com"            #活動資訊聯絡Email
            "is_discount": "0",                        #活動是否提供早鳥優惠，"0"或"1"
            "price_set_id": "0",                       #若啟用價格表，則為價格表ID，"0"表示未啟用價格表
            "fee_block": [                             #活動費用，每個項目一個費用
                {
                    "label": "OOO",                    #費用名稱
                    "value": "111"                     #費用金額
                },
                {
                    "label": "PPP",
                    "value": "222"
                }
            ]
        }
    ]
}
```
