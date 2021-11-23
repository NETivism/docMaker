# Contribution API


This is a API Document about contribution.


| {ts}Parameter Name{/ts} | {ts}Field Help{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Contribution ID{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts} |
| contact_id | {ts}FK to Contact ID{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts} |
| solicitor_id | {ts}FK to Solicitor ID{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| contribution_type_id | {ts}FK to Contribution Type{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| contribution_page_id | {ts}The Contribution Page which triggered this contribution{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| payment_processor_id | {ts}FK to Payment Processor{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| payment_instrument_id | {ts}FK to Payment Instrument{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| created_date | {ts}when was contribution submitted{/ts} | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| receive_date | {ts}when was gift received{/ts} | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| non_deductible_amount | {ts}Portion of total amount which is NOT tax deductible. Equal to total_amount for non-deductible contribution types.{/ts} | {ts}Number{/ts}(decimal) | 20,2 | 00.00 | {ts}Default Value{/ts}: 0 |
| total_amount | {ts}Total amount of this contribution. Use market value for non-monetary gifts.{/ts} | {ts}Number{/ts}(decimal) | 20,2 | 00.00 | {ts}Required{/ts} |
| fee_amount | {ts}actual processor fee if known - may be 0.{/ts} | {ts}Number{/ts}(decimal) | 20,2 | 00.00 |  |
| net_amount | {ts}actual funds transfer amount. total less fees. if processor does not report actual fee during transaction, this is set to total_amount.{/ts} | {ts}Number{/ts}(decimal) | 20,2 | 00.00 |  |
| trxn_id | {ts}unique transaction id. may be processor id, bank id + trans id, or account number + check number... depending on payment_method{/ts} | {ts}String{/ts}(varchar) | 255 |  |  |
| invoice_id | {ts}unique invoice id, system generated or passed in{/ts} | {ts}String{/ts}(varchar) | 255 |  |  |
| currency | {ts}3 character string, value from config setting or input via user.{/ts} | {ts}String{/ts}(varchar) | 3 |  | {ts}Default Value{/ts}: NULL |
| cancel_date | {ts}when was gift cancelled{/ts} | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| cancel_reason |  | {ts}String{/ts}(text) | 65535 |  |  |
| receipt_date | {ts}when (if) receipt was sent. populated automatically for online donations w/ automatic receipting{/ts} | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| thankyou_date | {ts}when (if) was donor thanked{/ts} | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| source | {ts}Origin of this Contribution.{/ts} | {ts}String{/ts}(varchar) | 255 |  |  |
| amount_level |  | {ts}String{/ts}(text) | 65535 |  |  |
| note | {ts}Note and/or Comment.{/ts} | {ts}String{/ts}(text) | 65535 |  |  |
| contribution_recur_id | {ts}Conditional foreign key to civicrm_contribution_recur id. Each contribution made in connection with a recurring contribution carries a foreign key to the recurring contribution record. This assumes we can track these processor initiated events.{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| honor_contact_id | {ts}FK to contact ID{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| is_test |  | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Default Value{/ts}: 0 |
| is_pay_later |  | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Default Value{/ts}: 0 |
| contribution_status_id |  | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Default Value{/ts}: 1 |
| honor_type_id | {ts}Implicit FK to civicrm_option_value.{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| address_id | {ts}Conditional foreign key to civicrm_address.id. We insert an address record for each contribution when we have associated billing name and address data.{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| check_number |  | {ts}String{/ts}(varchar) | 255 |  |  |
| receipt_id |  | {ts}String{/ts}(varchar) | 255 |  |  |
| expire_date | {ts}when is payment expiration{/ts} | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  |


## Contribution Get API

{ts}{$api_entity}{/ts} {ts}{$api_action}{/ts} API

### HTTP Method
```
GET
```

### Request URL
```{literal}
<entrypoint>?entity=Contribution&action=get&json={"contribution_id":186}
{/literal}```

### Request body
```{literal}
{
    "contribution_id": 186
}
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=get&pretty=1&json={"contribution_id":186}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
    '<entrypoint>?entity=Contribution&action=get&json={"contribution_id":186}'
```

### Response Example
```{literal}
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
{/literal}```
## Contribution Create API

{ts}{$api_entity}{/ts} {ts}{$api_action}{/ts} API

### HTTP Method
```
POST
```

### Request URL
```{literal}
<entrypoint>?entity=Contribution&action=create
{/literal}```

### Request body
```{literal}
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
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=create&pretty=1&json={"contact_id":540,"receive_date":"2021-11-23 19:19:49","total_amount":100,"contribution_type_id":1,"non_deductible_amount":10,"fee_amount":50,"net_amount":90,"source":"Contribution Unit Test","contribution_status_id":1,"trxn_id":"30IuTSVS39","invoice_id":"SPVZjY9rpK","payment_instrument_id":1}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
    --request POST -d 'json={literal}{"contact_id":540,"receive_date":"2021-11-23 19:19:49","total_amount":100,"contribution_type_id":1,"non_deductible_amount":10,"fee_amount":50,"net_amount":90,"source":"Contribution Unit Test","contribution_status_id":1,"trxn_id":"30IuTSVS39","invoice_id":"SPVZjY9rpK","payment_instrument_id":1}{/literal}' \  '<entrypoint>?entity=Contribution&action=create'
```

### Response Example
```{literal}
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
{/literal}```
## Contribution Update API

{ts}{$api_entity}{/ts} {ts}{$api_action}{/ts} API

### HTTP Method
```
POST
```

### Request URL
```{literal}
<entrypoint>?entity=Contribution&action=create
{/literal}```

### Request body
```{literal}
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
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=create&pretty=1&json={"id":194,"total_amount":9999,"contribution_type_id":1,"non_deductible_amount":10,"net_amount":100,"contribution_status_id":3,"cancel_date":"20211123191951","cancel_reason":"The reason to cancel"}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
    --request POST -d 'json={literal}{"id":194,"total_amount":9999,"contribution_type_id":1,"non_deductible_amount":10,"net_amount":100,"contribution_status_id":3,"cancel_date":"20211123191951","cancel_reason":"The reason to cancel"}{/literal}' \  '<entrypoint>?entity=Contribution&action=create'
```

### Response Example
```{literal}
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
{/literal}```
## Contribution Delete API

{ts}{$api_entity}{/ts} {ts}{$api_action}{/ts} API

### HTTP Method
```
POST
```

### Request URL
```{literal}
<entrypoint>?entity=Contribution&action=delete
{/literal}```

### Request body
```{literal}
{
    "id": 195
}
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Contribution&action=delete&pretty=1&json={"id":195}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
    --request POST -d 'json={literal}{"id":195}{/literal}' \  '<entrypoint>?entity=Contribution&action=delete'
```

### Response Example
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 195,
    "values": {
        "195": 1
    }
}
{/literal}```
