# Contribution API


This is a API Document about contribution.


| 變數名稱 | 說明 | 類型 | 長度 | 格式 | 建立規則 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 捐款編號 | 數字(int unsigned) | 10 | >= 0 | 必填 |
| contact_id | FK to Contact ID | 數字(int unsigned) | 10 | >= 0 | 必填 |
| solicitor_id | FK to Solicitor ID | 數字(int unsigned) | 10 | >= 0 |  |
| contribution_type_id | FK to Contribution Type | 數字(int unsigned) | 10 | >= 0 |  |
| contribution_page_id | The Contribution Page which triggered this contribution | 數字(int unsigned) | 10 | >= 0 |  |
| payment_processor_id | FK to Payment Processor | 數字(int unsigned) | 10 | >= 0 |  |
| payment_instrument_id | FK to Payment Instrument | 數字(int unsigned) | 10 | >= 0 |  |
| created_date | when was contribution submitted | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| receive_date | when was gift received | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| non_deductible_amount | Portion of total amount which is NOT tax deductible. Equal to total_amount for non-deductible contribution types. | 數字(decimal) | 20,2 | 00.00 | 預設值: 0 |
| total_amount | Total amount of this contribution. Use market value for non-monetary gifts. | 數字(decimal) | 20,2 | 00.00 | 必填 |
| fee_amount | actual processor fee if known - may be 0. | 數字(decimal) | 20,2 | 00.00 |  |
| net_amount | actual funds transfer amount. total less fees. if processor does not report actual fee during transaction, this is set to total_amount. | 數字(decimal) | 20,2 | 00.00 |  |
| trxn_id | unique transaction id. may be processor id, bank id + trans id, or account number + check number... depending on payment_method | 字串(varchar) | 255 |  |  |
| invoice_id | unique invoice id, system generated or passed in | 字串(varchar) | 255 |  |  |
| currency | 3 character string, value from config setting or input via user. | 字串(varchar) | 3 |  | 預設值: NULL |
| cancel_date | when was gift cancelled | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| cancel_reason |  | 字串(text) | 65535 |  |  |
| receipt_date | when (if) receipt was sent. populated automatically for online donations w/ automatic receipting | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| thankyou_date | when (if) was donor thanked | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| source | Origin of this Contribution. | 字串(varchar) | 255 |  |  |
| amount_level |  | 字串(text) | 65535 |  |  |
| note | Note and/or Comment. | 字串(text) | 65535 |  |  |
| contribution_recur_id | Conditional foreign key to civicrm_contribution_recur id. Each contribution made in connection with a recurring contribution carries a foreign key to the recurring contribution record. This assumes we can track these processor initiated events. | 數字(int unsigned) | 10 | >= 0 |  |
| honor_contact_id | FK to contact ID | 數字(int unsigned) | 10 | >= 0 |  |
| is_test |  | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |
| is_pay_later |  | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |
| contribution_status_id |  | 數字(int unsigned) | 10 | >= 0 | 預設值: 1 |
| honor_type_id | Implicit FK to civicrm_option_value. | 數字(int unsigned) | 10 | >= 0 |  |
| address_id | Conditional foreign key to civicrm_address.id. We insert an address record for each contribution when we have associated billing name and address data. | 數字(int unsigned) | 10 | >= 0 |  |
| check_number |  | 字串(varchar) | 255 |  |  |
| receipt_id |  | 字串(varchar) | 255 |  |  |
| expire_date | when is payment expiration | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  |


## Contribution Get API

  API

### HTTP Method
```
GET
```

### Request URL
```
<entrypoint>?entity=Contribution&action=get&json={"contribution_id":186}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=get&pretty=1&json={"contribution_id":186}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Contribution&action=get&json='
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 186,
    "values": {
        "186": {
            "contact_id": "539",
            "contact_type": "Individual",
            "contact_sub_type": "",
            "sort_name": "Test axcKQ Unit",
            "display_name": "Test axcKQ Unit",
            "contribution_id": "186",
            "currency": "USD",
            "contribution_page_id": "",
            "created_date": "2021-11-23 19:19:49",
            "receive_date": "2021-11-23 19:19:49",
            "non_deductible_amount": "10.00",
            "total_amount": "100.00",
            "fee_amount": "50.00",
            "net_amount": "90.00",
            "trxn_id": "P026IUyL9B",
            "invoice_id": "xQNLHVDVSM",
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

  API

### HTTP Method
```
POST
```

### Request URL
```
<entrypoint>?entity=Contribution&action=create
```

### Request Content Type
```
application/json
```

### Request body
```
{
    "contact_id": 540,
    "receive_date": "2021-11-23 19:19:49",
    "total_amount": 100,
    "contribution_type_id": 1,
    "non_deductible_amount": 10,
    "fee_amount": 50,
    "net_amount": 90,
    "source": "Contribution Unit Test",
    "contribution_status_id": 1,
    "trxn_id": "30IuTSVS39",
    "invoice_id": "SPVZjY9rpK",
    "payment_instrument_id": 1
}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=create&pretty=1&json={"contact_id":540,"receive_date":"2021-11-23 19:19:49","total_amount":100,"contribution_type_id":1,"non_deductible_amount":10,"fee_amount":50,"net_amount":90,"source":"Contribution Unit Test","contribution_status_id":1,"trxn_id":"30IuTSVS39","invoice_id":"SPVZjY9rpK","payment_instrument_id":1}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"contact_id":540,"receive_date":"2021-11-23 19:19:49","total_amount":100,"contribution_type_id":1,"non_deductible_amount":10,"fee_amount":50,"net_amount":90,"source":"Contribution Unit Test","contribution_status_id":1,"trxn_id":"30IuTSVS39","invoice_id":"SPVZjY9rpK","payment_instrument_id":1}' \
  '<entrypoint>?entity=Contribution&action=create'
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 188,
    "values": {
        "188": {
            "id": "188",
            "contact_id": "540",
            "contribution_type_id": "1",
            "contribution_page_id": "",
            "payment_processor_id": "",
            "payment_instrument_id": "1",
            "created_date": "20211123191949",
            "receive_date": "20211123191949",
            "non_deductible_amount": "10",
            "total_amount": "100",
            "fee_amount": "50",
            "net_amount": "90",
            "trxn_id": "30IuTSVS39",
            "invoice_id": "SPVZjY9rpK",
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
    }
}
```

## Contribution Update API

  API

### HTTP Method
```
POST
```

### Request URL
```
<entrypoint>?entity=Contribution&action=create
```

### Request Content Type
```
application/json
```

### Request body
```
{
    "id": 194,
    "total_amount": 9999,
    "contribution_type_id": 1,
    "non_deductible_amount": 10,
    "net_amount": 100,
    "contribution_status_id": 3,
    "cancel_date": "20211123191951",
    "cancel_reason": "The reason to cancel"
}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=create&pretty=1&json={"id":194,"total_amount":9999,"contribution_type_id":1,"non_deductible_amount":10,"net_amount":100,"contribution_status_id":3,"cancel_date":"20211123191951","cancel_reason":"The reason to cancel"}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":194,"total_amount":9999,"contribution_type_id":1,"non_deductible_amount":10,"net_amount":100,"contribution_status_id":3,"cancel_date":"20211123191951","cancel_reason":"The reason to cancel"}' \
  '<entrypoint>?entity=Contribution&action=create'
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 194,
    "values": {
        "194": {
            "id": "194",
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
            "cancel_date": "20211123191951",
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

  API

### HTTP Method
```
POST
```

### Request URL
```
<entrypoint>?entity=Contribution&action=delete
```

### Request Content Type
```
application/json
```

### Request body
```
{
    "id": 195
}
```

### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=delete&pretty=1&json={"id":195}
```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":195}' \
  '<entrypoint>?entity=Contribution&action=delete'
```

### Response Example
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 195,
    "values": {
        "195": 1
    }
}
```
