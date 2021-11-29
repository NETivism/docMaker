+++
title = "Contribution API"
menuTitle = "Contribution"
chapter = false
+++
This is a API Document about contribution.

| 變數名稱 | 類型 | 長度 | 格式 | 建立規則 | 說明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 數字(int unsigned) | 10 | >= 0 | 必填 | Unique Contribution ID |
| contact_id | 數字(int unsigned) | 10 | >= 0 | 必填 | FK to Contact ID |
| solicitor_id | 數字(int unsigned) | 10 | >= 0 |  | FK to Solicitor ID |
| contribution_type_id | 數字(int unsigned) | 10 | >= 0 |  | FK to Contribution Type |
| contribution_page_id | 數字(int unsigned) | 10 | >= 0 |  | The Contribution Page which triggered this contribution |
| payment_processor_id | 數字(int unsigned) | 10 | >= 0 |  | FK to Payment Processor |
| payment_instrument_id | 數字(int unsigned) | 10 | >= 0 |  | FK to Payment Instrument |
| created_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | when was contribution submitted |
| receive_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | when was gift received(or got authorized by credit card) |
| non_deductible_amount | 數字(decimal) | 20,2 | 00.00 | 預設值: 0 | Portion of total amount which is NOT tax deductible. |
| total_amount | 數字(decimal) | 20,2 | 00.00 | 必填 | Total amount of this contribution. |
| fee_amount | 數字(decimal) | 20,2 | 00.00 |  | Payment processor fee when available. |
| net_amount | 數字(decimal) | 20,2 | 00.00 |  | net amount + fee amount = total amount |
| trxn_id | 字串(varchar) | 255 |  |  | unique transaction id by this application |
| invoice_id | 字串(varchar) | 255 |  |  | unique invoice id, system generated or passed in |
| currency | 字串(varchar) | 3 |  | 預設值: NULL | 3 character string, value from config setting. |
| cancel_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | when was gift cancelled |
| cancel_reason | 字串(text) | 65535 |  |  | Reason that gift was cancelled |
| receipt_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Record date after (email)receipt sent. |
| thankyou_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | when (if) was donor thanked |
| source | 字串(varchar) | 255 |  |  | Origin of this Contribution. |
| amount_level | 字串(text) | 65535 |  |  | Amount level / label that donor choose in contribution page. |
| note | 字串(text) | 65535 |  |  | Note and/or Comment. |
| contribution_recur_id | 數字(int unsigned) | 10 | >= 0 |  | FK to Contribution Recurring. If this set, this contribution is belong to a recurring order. |
| honor_contact_id | 數字(int unsigned) | 10 | >= 0 |  | FK to contact ID. If this set, contribution is honor of other contact. |
| is_test | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 | Mark 1 when this order is a testing contribution. |
| is_pay_later | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 | Mark 1 when this order is not paid by real-time payment instrument. eg. ATM is not real-time. |
| contribution_status_id | 數字(int unsigned) | 10 | >= 0 | 預設值: 1 | 1=completed, 2=pending, 3=cancel, 4=failed |
| honor_type_id | 數字(int unsigned) | 10 | >= 0 |  | Implicit FK to civicrm_option_value. |
| address_id | 數字(int unsigned) | 10 | >= 0 |  | Conditional foreign key to civicrm_address.id. We insert an address record for each contribution when we have associated billing name and address data. |
| check_number | 字串(varchar) | 255 |  |  |  |
| receipt_id | 字串(varchar) | 255 |  |  |  |
| expire_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | when is payment expiration |


## Contribution Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```
<entrypoint>?entity=Contribution&action=get&json={"contribution_id":51}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=get&pretty=1&json={"contribution_id":51}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Contribution&action=get&json='
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 51,
    "values": {
        "51": {
            "contact_id": "28",
            "contact_type": "Individual",
            "contact_sub_type": "",
            "sort_name": "Test ARDeN Unit",
            "display_name": "Test ARDeN Unit",
            "contribution_id": "51",
            "currency": "USD",
            "contribution_page_id": "",
            "created_date": "2021-11-29 15:04:09",
            "receive_date": "2021-11-29 15:04:09",
            "non_deductible_amount": "10.00",
            "total_amount": "100.00",
            "fee_amount": "50.00",
            "net_amount": "90.00",
            "trxn_id": "eQTmpujhlN",
            "invoice_id": "hi3KyqRwZW",
            "cancel_date": "",
            "cancel_reason": "",
            "receipt_date": "",
            "thankyou_date": "",
            "contribution_source": "Contribution Unit Test",
            "amount_level": "",
            "is_test": "0",
            "is_pay_later": "0",
            "check_number": "",
            "receipt_id": "",
            "contribution_type_id": "1",
            "contribution_type": "\u4e00\u822c\u6350\u6b3e",
            "accounting_code": "",
            "payment_instrument_id": "",
            "payment_instrument": "",
            "product_id": "",
            "product_name": "",
            "sku": "",
            "contribution_product_id": "",
            "product_option": "",
            "fulfilled_date": "",
            "contribution_start_date": "",
            "contribution_end_date": "",
            "contribution_recur_id": "",
            "contribution_note": "",
            "contribution_status_id": "1",
            "contribution_status": "\u5df2\u5b8c\u6210",
            "contribution_payment_instrument": "",
            "contribution_check_number": "",
            "contribution_referrer_type": "",
            "civicrm_value_shou_ju_zi_xun_1_id": "",
            "custom_1": "",
            "custom_2": "",
            "custom_3": "",
            "custom_4": ""
        }
    }
}
```

## Contribution Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Contribution&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "contact_id": 29,
    "receive_date": "2021-11-29 15:04:09",
    "total_amount": 100,
    "contribution_type_id": 1,
    "non_deductible_amount": 10,
    "fee_amount": 50,
    "net_amount": 90,
    "source": "Contribution Unit Test",
    "contribution_status_id": 1,
    "trxn_id": "pxhaDtwFII",
    "invoice_id": "e1uGoCG25Q",
    "payment_instrument_id": 1
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=create&pretty=1&json={"contact_id":29,"receive_date":"2021-11-29 15:04:09","total_amount":100,"contribution_type_id":1,"non_deductible_amount":10,"fee_amount":50,"net_amount":90,"source":"Contribution Unit Test","contribution_status_id":1,"trxn_id":"pxhaDtwFII","invoice_id":"e1uGoCG25Q","payment_instrument_id":1}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":29,"receive_date":"2021-11-29 15:04:09","total_amount":100,"contribution_type_id":1,"non_deductible_amount":10,"fee_amount":50,"net_amount":90,"source":"Contribution Unit Test","contribution_status_id":1,"trxn_id":"pxhaDtwFII","invoice_id":"e1uGoCG25Q","payment_instrument_id":1}' \
  '<entrypoint>?entity=Contribution&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 53,
    "values": [
        {
            "id": "53",
            "contact_id": "29",
            "contribution_type_id": "1",
            "contribution_page_id": "",
            "payment_processor_id": "",
            "payment_instrument_id": "1",
            "created_date": "20211129150409",
            "receive_date": "20211129150409",
            "non_deductible_amount": "10",
            "total_amount": "100",
            "fee_amount": "50",
            "net_amount": "90",
            "trxn_id": "pxhaDtwFII",
            "invoice_id": "e1uGoCG25Q",
            "currency": "USD",
            "cancel_date": "",
            "cancel_reason": "",
            "receipt_date": "",
            "thankyou_date": "",
            "source": "Contribution Unit Test",
            "amount_level": "",
            "contribution_recur_id": "",
            "honor_contact_id": "",
            "is_test": "",
            "is_pay_later": "",
            "contribution_status_id": "1",
            "honor_type_id": "",
            "address_id": "",
            "check_number": "null",
            "receipt_id": "",
            "expire_date": ""
        }
    ]
}
```

## Contribution Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Contribution&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 59,
    "total_amount": 9999,
    "contribution_type_id": 1,
    "non_deductible_amount": 10,
    "net_amount": 100,
    "contribution_status_id": 3,
    "cancel_date": "20211129150410",
    "cancel_reason": "The reason to cancel"
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=create&pretty=1&json={"id":59,"total_amount":9999,"contribution_type_id":1,"non_deductible_amount":10,"net_amount":100,"contribution_status_id":3,"cancel_date":"20211129150410","cancel_reason":"The reason to cancel"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":59,"total_amount":9999,"contribution_type_id":1,"non_deductible_amount":10,"net_amount":100,"contribution_status_id":3,"cancel_date":"20211129150410","cancel_reason":"The reason to cancel"}' \
  '<entrypoint>?entity=Contribution&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 59,
    "values": {
        "59": {
            "id": "59",
            "contact_id": "",
            "contribution_type_id": "1",
            "contribution_page_id": "",
            "payment_processor_id": "",
            "payment_instrument_id": "",
            "created_date": "",
            "receive_date": "",
            "non_deductible_amount": "10",
            "total_amount": "9999",
            "fee_amount": "",
            "net_amount": "100",
            "trxn_id": "",
            "invoice_id": "",
            "currency": "USD",
            "cancel_date": "20211129150410",
            "cancel_reason": "The reason to cancel",
            "receipt_date": "",
            "thankyou_date": "",
            "source": "",
            "amount_level": "",
            "contribution_recur_id": "",
            "honor_contact_id": "",
            "is_test": "",
            "is_pay_later": "",
            "contribution_status_id": "3",
            "honor_type_id": "",
            "address_id": "",
            "check_number": "",
            "receipt_id": "",
            "expire_date": ""
        }
    }
}
```

## Contribution Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Contribution&action=delete
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 60
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=delete&pretty=1&json={"id":60}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":60}' \
  '<entrypoint>?entity=Contribution&action=delete'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
```