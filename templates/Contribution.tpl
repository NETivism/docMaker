+++
title = "Contribution API"
menuTitle = "Contribution"
chapter = false
+++
This is a API Document about contribution.

| {ts}Parameter Name{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} | {ts}Field Help{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts} | {ts}Unique Contribution ID{/ts} |
| contact_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts} | {ts}FK to Contact ID{/ts} |
| solicitor_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to Solicitor ID{/ts} |
| contribution_type_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to Contribution Type{/ts} |
| contribution_page_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}The Contribution Page which triggered this contribution{/ts} |
| payment_processor_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to Payment Processor{/ts} |
| payment_instrument_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to Payment Instrument{/ts} |
| created_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}when was contribution submitted{/ts} |
| receive_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}when was gift received(or got authorized by credit card){/ts} |
| non_deductible_amount | {ts}Number{/ts}(decimal) | 20,2 | 00.00 | {ts}Default Value{/ts}: 0 | {ts}Portion of total amount which is NOT tax deductible.{/ts} |
| total_amount | {ts}Number{/ts}(decimal) | 20,2 | 00.00 | {ts}Required{/ts} | {ts}Total amount of this contribution.{/ts} |
| fee_amount | {ts}Number{/ts}(decimal) | 20,2 | 00.00 |  | {ts}Payment processor fee when available.{/ts} |
| net_amount | {ts}Number{/ts}(decimal) | 20,2 | 00.00 |  | {ts}net amount + fee amount = total amount{/ts} |
| trxn_id | {ts}String{/ts}(varchar) | 255 |  |  | {ts}unique transaction id by this application{/ts} |
| invoice_id | {ts}String{/ts}(varchar) | 255 |  |  | {ts}unique invoice id, system generated or passed in{/ts} |
| currency | {ts}String{/ts}(varchar) | 3 |  | {ts}Default Value{/ts}: NULL | {ts}3 character string, value from config setting.{/ts} |
| cancel_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}when was gift cancelled{/ts} |
| cancel_reason | {ts}String{/ts}(text) | 65535 |  |  | {ts}Reason that gift was cancelled{/ts} |
| receipt_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Record date after (email)receipt sent.{/ts} |
| thankyou_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}when (if) was donor thanked{/ts} |
| source | {ts}String{/ts}(varchar) | 255 |  |  | {ts}Origin of this Contribution.{/ts} |
| amount_level | {ts}String{/ts}(text) | 65535 |  |  | {ts}Amount level / label that donor choose in contribution page.{/ts} |
| note | {ts}String{/ts}(text) | 65535 |  |  | {ts}Note and/or Comment.{/ts} |
| contribution_recur_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to Contribution Recurring. If this set, this contribution is belong to a recurring order.{/ts} |
| honor_contact_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to contact ID. If this set, contribution is honor of other contact.{/ts} |
| is_test | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Default Value{/ts}: 0 | {ts}Mark 1 when this order is a testing contribution.{/ts} |
| is_pay_later | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Default Value{/ts}: 0 | {ts}Mark 1 when this order is not paid by real-time payment instrument. eg. ATM is not real-time.{/ts} |
| contribution_status_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Default Value{/ts}: 1 | {ts}1=completed, 2=pending, 3=cancel, 4=failed{/ts} |
| honor_type_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Implicit FK to civicrm_option_value.{/ts} |
| address_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Conditional foreign key to civicrm_address.id. We insert an address record for each contribution when we have associated billing name and address data.{/ts} |
| check_number | {ts}String{/ts}(varchar) | 255 |  |  |  |
| receipt_id | {ts}String{/ts}(varchar) | 255 |  |  |  |
| expire_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}when is payment expiration{/ts} |


## Contribution Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=Contribution&action=get&json={"contribution_id":51}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=get&pretty=1&json={"contribution_id":51}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Contribution&action=get&json={"contribution_id":51}'
```

### 回傳範例
```{literal}
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
{/literal}```

## Contribution Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Contribution&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
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
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=create&pretty=1&json={"contact_id":29,"receive_date":"2021-11-29 15:04:09","total_amount":100,"contribution_type_id":1,"non_deductible_amount":10,"fee_amount":50,"net_amount":90,"source":"Contribution Unit Test","contribution_status_id":1,"trxn_id":"pxhaDtwFII","invoice_id":"e1uGoCG25Q","payment_instrument_id":1}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"contact_id":29,"receive_date":"2021-11-29 15:04:09","total_amount":100,"contribution_type_id":1,"non_deductible_amount":10,"fee_amount":50,"net_amount":90,"source":"Contribution Unit Test","contribution_status_id":1,"trxn_id":"pxhaDtwFII","invoice_id":"e1uGoCG25Q","payment_instrument_id":1}{/literal}' \
  '<entrypoint>?entity=Contribution&action=create'
```

### 回傳範例
```{literal}
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
{/literal}```

## Contribution Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Contribution&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
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
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=create&pretty=1&json={"id":59,"total_amount":9999,"contribution_type_id":1,"non_deductible_amount":10,"net_amount":100,"contribution_status_id":3,"cancel_date":"20211129150410","cancel_reason":"The reason to cancel"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":59,"total_amount":9999,"contribution_type_id":1,"non_deductible_amount":10,"net_amount":100,"contribution_status_id":3,"cancel_date":"20211129150410","cancel_reason":"The reason to cancel"}{/literal}' \
  '<entrypoint>?entity=Contribution&action=create'
```

### 回傳範例
```{literal}
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
{/literal}```

## Contribution Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Contribution&action=delete
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "id": 60
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=delete&pretty=1&json={"id":60}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":60}{/literal}' \
  '<entrypoint>?entity=Contribution&action=delete'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
{/literal}```
