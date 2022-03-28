+++
title = "netiCRM API v3 簡介"
menuTitle = "API 簡介"
+++

## API 簡介

netiCRM API 可藉由後端觸發的 Curl 程式取得 CRM 資料，此功能並非一開站即設定完成，需先向 Netivism 申請後才會開通，預設並未啟用此功能。

## API 使用入口

本文件所述的 <site-domain> 表示網站網域名稱
本文件所有的 <entrypoint> ，也就是 API 的入口如下
```
https://<site-domain>/sites/all/modules/civicrm/extern/rest.php
```
之後文件所述的<entrypoint>替代符號，皆是此網址，也請注意，網址需要將<site-domain>替換為自己網站的網域名稱。


## API 認證

### API 取得認證金鑰流程

1. 請新增一個網站使用者帳號，密碼建議為亂數，接著填寫聯絡人的個資，並確保網站使用者有連結該聯絡人
2. 請為該使用者帳號設定角色（參考[權限控管](#權限控管)）
3. 透過 netiCRM 客服設定後，會透過系統產生一組 API Secret Key 儲存於聯絡人中
4. 存取請都帶入API Secret Key，等同於該登入的使用者操作網站（參考[API 認證金鑰使用流程](#API-認證金鑰使用流程)）
5. 同一個聯絡人、網站使用者，只能有一組API Secret Key


### API 認證金鑰使用流程

請於每次請求加入指定的API Secret Key、Site Key，建議驗證方式為使用 HTTP Header 加入這兩個密鑰，密鑰取得方式如下：
* API的 `<secret-key>` 需要由 netiCRM 客服協助設定
* API的 `<site-key>` 則於網站登入後，可以於「設定>則於網站登入後，可以於「設定 > 全域設定 > CiviCRM 私密金鑰 」中呈現。(網址路徑：`https://<site-domain>/civicrm/admin/setting?reset=1`)

密鑰的 HTTP Header 格式如下：
x-civicrm-api-key: `<secret-key>`
x-civicrm-site-key: `<site-key>`

#### curl 操作範例：
`<entrypoint>`、`<secret-key>`、`<site-key>`、`<entity-name>`請自行替換
```bash
curl -g \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>' \
'<entrypoint>?entity=<entity-name>&action=get'
```


## API 限制
* 頻率限制：系統有針對連線、IP進行流量控管，並會針對太過頻繁存取的IP自動封鎖。大量抓取資料時，請每次Request間隔0.5秒或以上，以免影響線上網站運作。
* 抓取數量限制：預設抓取數量為每次Request 25筆，改變數量請參照[取得特定數量資料](#取得特定數量資料)的方式，然而一次獲取數量將有上限100筆的限制。


## API 請求方法
目前提供 POST / GET 方式儲存、刪除以及取得資料
| METHOD | 用法 | Request Header Content-Type |
| -------- | -------- | ---- |
| GET    | 取得單筆或多筆資料 | API忽略傳入的Content Type請求，網址若帶入json(小寫)參數，將可以進行進階查詢|
| POST    | 新增或刪除單筆資料 | Content Type為`application/json`時：整個Request Body需要是合法的JSON物件|
| POST    | 新增或刪除單筆資料 | Content Type為其他時，如 `Content-Type: application/x-www-form-urlencoded`：需要傳入`json`欄位值|






## 權限控管

API 的權限為綁定聯絡人所連結的網站使用者決定。簡而言之，該使用者的角色決定了API有哪些權限。詳細權限設定，可參考網站中的權限設定。
`https://<site-domain>/admin/people/permissions`

注意：若使用者需要能連到 [API Explorer](#API-Explorer)，需有 `administer CiviCRM` 權限。


## 回傳格式

預設回傳格式為JSON，並會於回應的類型中，在 HTTP Response Header 加入 `Content-Type` 宣告
`Content-Type: application/json`

若 Url 代入參數 `pretty=1`，則回傳的 JSON 會有易讀性排版的格式。

範例，上述呼叫 <entrypoint>?entity=Contact&action=get&pretty=1` 的回傳結果：
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
            "sort_name": "林怡君",
            "display_name": "林怡君",
            ......
            "id": "1"
        },
        ......
    ]
}
```

## API Explorer

使用管理員帳號，進入到 netiCRM 網站的 `https://<site-domain>/civicrm/apibrowser` 網址，可透過網頁 UI 介面取得或測試相關的 API。
