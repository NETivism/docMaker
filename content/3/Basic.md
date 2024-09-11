+++
title = "API 基礎操作"
menuTitle = "API 基礎操作"
weight = 1
+++

## Entity、Action

每次API呼叫，都需要指定要使用的API名稱，和要進行的動作
此參數為必填，分別是下列網址的`<entity-name>`和`<action>`：

```
<entrypoint>?entity=<entity-name>&action=<action>
```

舉例，如果需要取得聯絡人資料，其 `<entity-name>` 為 `contact`，`<action>`為 `get`

## 範例：取得聯絡人資料


### 發送範例

#### HTTP 方法

```
GET
```

#### Request Content Type
未限制

#### Request URL

```
<entrypoint>?entity=Contact&action=get
```

#### Request Body
無

#### API Explorer

```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contact&action=get
```

#### curl 發送範例

```bash
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \
  '<entrypoint>?entity=Contact&action=get'

```

### 回傳範例

```json
{
    "is_error": 0,
    "version": 3,
    "count": 25,
    "values": [
        {
            "contact_id": "1234",
            "contact_type": "Individual",
            "contact_sub_type": "",
            "sort_name": "蔡怡君",
            "display_name": "蔡怡君",
            ......
            "id": "1234"
        },
        ......
    ]
}
```


## 資料分頁

因受限於[API限制](#API-限制)，每次最多回傳 100 筆資料，可搭配offset擷取更多資料

* 擷取第1-100筆資料：`json={"options":{"limit":100,"offset":0}}`
* 擷取第101-200筆資料：`json={"options":{"limit":100,"offset":100}}`
* 資料結束時，會回傳空的 values ：`{"options":{"limit":100,"offset":50000}}`

整合上例，以下是回傳第100筆開始起算，取得下一百筆資料的網址路徑
```
<entrypoint>?entity=Contact&action=get&json={"options":{"limit":100,"offset":100}}
```


## 資料排序

* 當`<action>`為`get`時，資料順序可透過代入之欄位名稱進行排序，欄位性質必須要為可排序之類型，例如數字、日期。實際用法：
  * 依照建立日期，由舊到新排序（日期由小到大，升冪排序）：`json={"options":{"sort": "created_date asc"}}`
  * 捐款依照總金額，由大到小，降冪排序：`json={"options":{"sort": "total_amount desc"}}`
* 可搭配 `limit` 來取得前 N 筆的聯絡人。

篩選範例：

1. 取得建立日期最早的 10 筆聯絡人
```
<entrypoint>?entity=Contact&action=get&json={"options":{"sort": "created_date asc","limit":10}}
```

2. 取得捐款金額第 101~200 高、「已完成」狀態的捐款（已完成的狀態，`contribution_status_id` 為 1）
```
<entrypoint>?entity=Contribution&action=get&json={"contribution_status_id": 1, "options":{"sort": "total_amount desc", "limit":100, "offset":100}}
```

## 資料篩選

* 當`<action>`為`get`時，資料篩選會根據傳入的JSON物件方式處置。
* 當`<action>`為`create`或`delete`或其他時，JSON物件為要建立的資料，因此無法進行資料篩選。

篩選範例：取得聯絡人編號12345的人
```
<entrypoint>?entity=Contact&action=get&json={"id":"12345"}
```

## 資料巢狀查詢

巢狀查詢，是串連不同API一起查詢的方式，因為API拉取的數量限制，建議可以用巢狀資料查詢，取得對應物件的所有資料，以免短時間呼叫過多API請求。

例如，一次要取得聯絡人編號1234的個人資料，多筆Email、電話、地址、和自訂欄位，可以用以下方式「篩選」，傳入JSON物件

的JSON如下：
```json
{
  "id": 1234,
  "api.Email.get": {
    "contact_id": "$value.id"
  },
  "api.Address.get": {
    "contact_id": "$value.id"
  },
  "api.Phone.get": {
    "contact_id": "$value.id"
  },
  "api.CustomValue.get": {
    "entity_table": "civicrm_contact",
    "entity_id": "$value.id"
  }
}
```

然而因為是 `GET` 方法查詢，需要從網址參數帶入上述物件，將之轉換成為以下的查詢：
```
<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id"},"api.Address.get":{"contact_id":"$value.id"},"api.Phone.get":{"contact_id":"$value.id"},"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}
```

而轉換成 curl 查詢，因為 curl 預設並未支援 JSON 格式的括弧，因此需要帶入參數 -g ，curl 發送範例如下

```bash
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \
  '<entrypoint>?entity=Contact&action=get&json={"id":1234,"api.Email.get":{"contact_id":"$value.id"},"api.Address.get":{"contact_id":"$value.id"},"api.Phone.get":{"contact_id":"$value.id"},"api.CustomValue.get":{"entity_table":"civicrm_contact","entity_id":"$value.id"}}'

```
