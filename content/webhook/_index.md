+++
title = "Webhook API 簡介"
menuTitle = "Webhook 簡介"
+++

## Webhook API 概要說明

### Webhook API 簡介

可以讓管理員自訂當使用者完成捐款交易，或完成活動報名時，讓使用者導向到管理員自定義非 netiCRM 網域的頁面，或是發送該交易資訊的通知到管理員指定的網址。

管理員需自行建立簡易的 HTML Form 表單頁面，引導使用者送出表單後進到 netiCRM 捐款頁或報名頁入口網址，開始進行 Webhook 的觸發動作。

### netiCRM 入口網址說明

本文件所述的`<site-domain>`表示 netiCRM 網站網域名稱。

本文件所述的`<entrypoint>`，也就是 API 的入口，為 netiCRM 的活動頁或募款頁

#### 募款頁網址

```
https://<site-domain>/civicrm/contribute/transact?reset=1&id=<page_id>
```

#### 活動報名頁網址

```
https://<site-domain>/civicrm/event/register?reset=1&id=<event_id>
```

#### 網址說明

以上的`<page_id>`請自行代換成募款頁 ID ，`<event_id>`請自行代換成活動 ID，`<site-domain>`替換成自己 netiCRM 網站的網域名稱。

之後文件所述的`<entrypoint>`替代符號，皆是此網址。


### 事前設定

netiCRM 的網站設定中，需要事先提供以下常數完成設定，Webhook 僅會於指定的網域驗證通過後觸發。

* 以`https`開頭指定 Webhook 網域：`<civicrm_webhook_domain>`
* 驗證用的 Secret（僅用於 Notification Webhook）：`<civicrm_webhook_secret>`

下文將會以這兩個變數說明

## Redirection Webhook

### 發動方式

1. 建立包含下列`name`的 Html Form 頁面：
    * Form 參數`action`為上述的`<entrypoint>`入口頁面，參數`method`為`post`
    * Form 之中包含 <input> 物件，其中參數如下：
        * `type`為`hidden`。
        * `name`為`_wh_redirect`。
        * `value`為完成時要導向的網址`https://<civicrm_webhook_domain>/your-redirection-path`。

2. 發送該表單給使用者端瀏覽器（可藉 Javascript 跳過呈現此頁的步驟，詳看[本文件最後的說明](#跳過-html-form-頁面)）。

3. 送出表單後，使用者會導向到 netiCRM 的`<entrypoint>`入口頁面（捐款頁或活動報名頁），在最後完成填表送出時，不會導到感謝頁，而是導到自訂的`https://<civicrm_webhook_domain>/your-redirection-path`網址。

### 實作 Html 頁面範例

#### Html Form 範例

```html
<form action="<entrypoint>" method="post">
    <input type="hidden" name="_wh_redirect" value="https://<civicrm_webhook_domain>/your-redirection-path">
    <input type="submit" value="送出">
</form>
```

#### 範例說明

1. 使用者的頁面上會呈現「送出」的按鈕，按下送出按鈕後，會帶使用者轉向到`<entrypoint>`入口頁面（捐款頁或活動報名頁），同時代入`_wh_redirect=https://<civicrm_webhook_domain>/your-redirection-path`參數給伺服器。
2. 要透過 Javascript 讓使用者跳過點擊按鈕的步驟，請看[本文件最後的說明](#跳過-html-form-頁面)。
3. 請網站管理員自行替換正確的`<entrypoint>`和`https://<civicrm_webhook_domain>/your-redirection-path`參數。

## Notification Webhook

### 發動方式

1. 建立包含下列`name`的 Html Form 頁面：
    * Form 參數`action`為上述的`<entrypoint>`入口頁面，參數`method`為`post`
    * Form 之中包含 <input> 物件，其中參數如下：
        * `type`為`hidden`。
        * `name`為`_wh_notify`。
        * `value`為完成時要傳送通知的網址`https://<civicrm_webhook_domain>/your-notification-path`。

2. 發送該表單給使用者端瀏覽器（可藉 Javascript 跳過呈現此頁的步驟，詳看[本文件最後的說明](#跳過-html-form-頁面)）。

3. 送出表單到最後全步驟完成、導向到感謝頁時，伺服器會發送一個 Notification Post 到自定義的`https://<civicrm_webhook_domain>/your-notification-path`。

### 實作 Html 頁面範例

#### Form 範例

```html
<form action="<entrypoint>" method="post">
    <input type="hidden" name="_wh_notify" value="https://<civicrm_webhook_domain>/your-notification-path">
    <input type="submit" value="送出">
</form>
```
#### 範例說明

1. 使用者的頁面上會呈現「送出」的按鈕，按下送出按鈕後，會帶使用者轉向到`<entrypoint>`入口頁面（捐款頁或活動報名頁），同時代入`_wh_notify=https://<civicrm_webhook_domain>/your-notification-path`參數給伺服器。
2. 要透過 Javascript 讓使用者跳過點擊按鈕的步驟，請看[本文件最後的說明](#跳過-html-form-頁面)。
3. 請網站管理員自行替換正確的`<entrypoint>`和`https://<civicrm_webhook_domain>/your-redirection-path`參數。

### 回傳範例

回傳的捐款資訊會通知到指定的網址。回傳的捐款資訊內容請見下方回傳格式的範例。

#### Response Header
記錄網站網域、捐款通知回傳的格式、WebhookID 與內容的字數：
```
Content-Type: application/json
X-Civicrm-Webhook-Signature: ********************
```

#### Response Body

預設回傳格式為 JSON，被記錄的捐款資訊欄位是固定的，如下範例：

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
HTTP Header 將會附上`X-Civicrm-Webhook-Signature`這個字串標記。
接收到此標記後，請您使用`<civicrm_webhook_secret>`密鑰搭配進行驗證

驗證方式說明如下：
netiCRM 使用 HMAC sha1演算法進行加密，針對每筆捐款交易產生一組簽名與密鑰。透過相同方式進行驗算，比對`X-Civicrm-Webhook-Signature`的簽名與`<civicrm_webhook_secret>`密鑰雜湊運算後是否相符合，驗證 HTTP POST request 是不是來自於 netiCRM。以下以 PHP 為例。

#### 驗證範例

```php
$hash = hash_hmac('sha1', $json_body, '<civicrm_webhook_secret>');
echo $hash; # this should be the same with X-Civicrm-Webhook-Signature
```

## 跳過 Html Form 頁面

提供給使用者 Html 表單時，可透過在`</form>`後面加入下列`<script>`元件，執行 Javascirpt 來跳過表單頁，直接進入`<entrypoint>`入口頁面。

```html
<script type="text/javascript">
    var form = document.getElementsByTagName('form')[0];
    // 隱藏送出按鈕
    var btn = form.querySelector('[type="submit"]');
    btn.style.display = "none";
    // 自動送出表單
    form.submit();
    // 沒有轉向成功的話，5 秒後提供轉向按鈕給使用者點擊
    setTimeout(function(){
        btn.style.display = "block";
    }, 5000);
</script>
```

組合後的 Html 全頁結構範例如下：

```html
<!DOCTYPE html>
<html lang="zh-Hant-TW">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Redirect</title>
    </head>
    <body>
        <form action="<entrypoint>" method="post">
            <input type="hidden" name="_wh_redirect" value="https://<civicrm_webhook_domain>/your-notification-path">
            <input type="submit" value="送出">
        </form>
        <script type="text/javascript">
            var form = document.getElementsByTagName('form')[0];
            // 隱藏送出按鈕
            var btn = form.querySelector('[type="submit"]');
            btn.style.display = "none";
            // 自動送出表單
            form.submit();
            // 沒有轉向成功的話，5 秒後提供轉向按鈕給使用者點擊
            setTimeout(function(){
                btn.style.display = "block";
            }, 5000);
        </script>
    </body>
</html>
```