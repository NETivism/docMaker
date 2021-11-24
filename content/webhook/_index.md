+++
title = "Webhook API 簡介"
menuTitle = "Webhook 簡介"
+++

## Webhook API 簡介

可以自訂當捐款者捐款交易完成後，以及通知最新一筆捐款交易的資訊到指定的網址。
利用 HTTP POST 傳送請求，帶入指定參數可以進行Webhook的觸發動作。

## Webhook API 使用入口

本文件所述的 <site-domain> 表示網站網域名稱
本文件所有的 <entrypoint> ，也就是 API 的入口，為CRM的活動頁或募款頁
```
https://<site-domain>/civicrm/contribute/transact?reset=1&id=<page_id>
```
```
https://<site-domain>/civicrm/event/info?reset=1&id=<event_id>
```

之後文件所述的<entrypoint>替代符號，皆是此網址，也請注意，網址需要將<site-domain>替換為自己網站的網域名稱。


## 設定

netiCRM的網站設定中，需要事先設定完以下常數，Webhook僅會於指定的網域驗證通過後觸發。

以https開頭指定Webhook網域: `<civicrm_webhook_domain>`
驗證用的Secret: `<civicrm_webhook_secret>`

下文將會以這兩個變數說明


## Redirection Webhook
_wh_redirect"回傳value中的網址，進行轉址。設定轉址網址只需要更改value雙引號中間的網址。

### 發送範例

#### HTTP 方法

`POST`

#### Request Content Type

`application/x-www-form-urlencoded`

#### Request URL

`<entrypoint>`

#### Request Body

`_wh_redirect=<civicrm_webhook_domain>/your-redirection-path`

#### curl 發送範例

```bash
curl \
--request POST -d '_wh_redirect=<civicrm_webhook_domain>/your-redirection-path' \
'<endpoint>'
```


## Notification Webhook

### 發送範例

#### HTTP 方法

`POST`

#### Request Content Type

`application/x-www-form-urlencoded`

#### Request URL

`<entrypoint>`

#### Request Body

`_wh_notify=<civicrm_webhook_domain>`

#### curl 發送範例

```bash
curl \ 
--request POST -d '_wh_notify=<civicrm_webhook_domain>/your-notification-path' \ 
'<endpoint>'
```

### 回傳範例

回傳的捐款資訊會通知到指定的網址。回傳的捐款資訊內容請見下方回傳格式的範例。

##### Response Header:
記錄網站網域、捐款通知回傳的格式、WebhookID與內容的字數
```
Content-Type: application/json
X-Civicrm-Webhook-Signature: ********************
```

##### Response Body:

預設回傳格式為JSON，被記錄的捐款資訊欄位是固定的，如下範例：

```json
{
    "contact_id":"1",
    "external_identifier":"abcd1234",
    "contribution_id":"1",
    "contribution_page_id":"1",
    "contribution_type_id":"1",
    "payment_instrument_id":"",
    "trxn_id":"",
    "contribution_status_id":"1",
    "amount_level":"XXX",
    "currency":"TWD",
    "total_amount":"200.00",
    "receipt_id":"***********",
    "receipt_date":"2021-08-18 15:51:00",
    "created_date":"2021-08-18 15:07:13",
    "receive_date":"2021-08-18 17:13:00"
}
```
### 驗證回傳值

接收到 Notification 後，建議您務必驗證來源
HTTP Header 將會附上 `X-Civicrm-Webhook-Signature` 這個字串標記。
接收到此標記後，請您使用 `<civicrm_webhook_secret>` 密鑰搭配進行驗證

驗證方式說明如下：
netiCRM 使用 HMAC sha1演算法進行加密，針對每筆捐款交易產生一組簽名與密鑰。透過相同方式進行驗算，比對 `X-Civicrm-Webhook-Signature` 的簽名與 `<civicrm_webhook_secret>` 密鑰雜湊運算後是否相符合，驗證 HTTP POST request 是不是來自於 netiCRM。以下以PHP為例。

#### 驗證範例

```
$hash = hash_hmac('sha1', $json_body, '<civicrm_webhook_secret>');
echo $hash; # this should be the same with X-Civicrm-Webhook-Signature
```
