# Email API


This is a API Document about Email.


| {ts}Parameter Name{/ts} | {ts}Field Help{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Unique Email ID{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | {ts}Required{/ts} |
| contact_id | {ts}FK to Contact ID{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| location_type_id | {ts}Which Location does this email belong to.{/ts} | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  |
| email | {ts}Email address{/ts} | {ts}String{/ts}(varchar) | 64 |  |  |
| is_primary | {ts}Is this the primary?{/ts} | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Default Value{/ts}: 0 |
| is_billing | {ts}Is this the billing?{/ts} | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Default Value{/ts}: 0 |
| on_hold | {ts}Is this address on bounce hold?{/ts} | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Required{/ts}, {ts}Default Value{/ts}: 0 |
| is_bulkmail | {ts}Is this address for bulk mail ?{/ts} | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | {ts}Required{/ts}, {ts}Default Value{/ts}: 0 |
| hold_date | {ts}When the address went on bounce hold{/ts} | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| reset_date | {ts}When the address bounce status was last reset{/ts} | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  |
| signature_text | {ts}Text formatted signature for the email.{/ts} | {ts}String{/ts}(text) | 65535 |  | {ts}Default Value{/ts}: NULL |
| signature_html | {ts}HTML formatted signature for the email.{/ts} | {ts}String{/ts}(text) | 65535 |  | {ts}Default Value{/ts}: NULL |


## Email Get API

{ts}{$api_entity}{/ts} {ts}{$api_action}{/ts} API

### HTTP Method
```
GET
```

### Request URL
```{literal}
<entrypoint>?entity=Email&action=get&json={"contact_id":332,"location_type_id":630,"email":"api.test@civicrm.test.org"}
{/literal}```

### Request body
```{literal}
{
    "contact_id": 332,
    "location_type_id": 630,
    "email": "api.test@civicrm.test.org"
}
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=get&pretty=1&json={"contact_id":332,"location_type_id":630,"email":"api.test@civicrm.test.org"}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
    '<entrypoint>?entity=Email&action=get&json={"contact_id":332,"location_type_id":630,"email":"api.test@civicrm.test.org"}'
```

### Response Example
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 565,
    "values": {
        "565": {
            "id": "565",
            "contact_id": "332",
            "location_type_id": "630",
            "email": "api.test@civicrm.test.org",
            "is_primary": "1",
            "is_billing": "0",
            "on_hold": "0",
            "is_bulkmail": "0"
        }
    }
}
{/literal}```
## Email Create API

{ts}{$api_entity}{/ts} {ts}{$api_action}{/ts} API

### HTTP Method
```
POST
```

### Request URL
```{literal}
<entrypoint>?entity=Email&action=create
{/literal}```

### Request body
```{literal}
{
    "contact_id": 333,
    "location_type_id": 632,
    "email": "api.test@civicrm.test.org",
    "is_primary": 1
}
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={"contact_id":333,"location_type_id":632,"email":"api.test@civicrm.test.org","is_primary":1}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
    --request POST -d 'json={literal}{"contact_id":333,"location_type_id":632,"email":"api.test@civicrm.test.org","is_primary":1}{/literal}' \  '<entrypoint>?entity=Email&action=create'
```

### Response Example
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 566,
    "values": {
        "566": {
            "id": "566",
            "contact_id": "333",
            "location_type_id": "632",
            "email": "api.test@civicrm.test.org",
            "is_primary": "1",
            "is_billing": "",
            "on_hold": "",
            "is_bulkmail": "",
            "hold_date": "",
            "reset_date": "",
            "signature_text": "",
            "signature_html": ""
        }
    }
}
{/literal}```
## Email Update API

{ts}{$api_entity}{/ts} {ts}{$api_action}{/ts} API

### HTTP Method
```
POST
```

### Request URL
```{literal}
<entrypoint>?entity=Email&action=create
{/literal}```

### Request body
```{literal}
{
    "contact_id": 337,
    "location_type_id": 640,
    "email": "test.update@civicrm.test.org",
    "is_primary": 1,
    "id": 570
}
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={"contact_id":337,"location_type_id":640,"email":"test.update@civicrm.test.org","is_primary":1,"id":570}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
    --request POST -d 'json={literal}{"contact_id":337,"location_type_id":640,"email":"test.update@civicrm.test.org","is_primary":1,"id":570}{/literal}' \  '<entrypoint>?entity=Email&action=create'
```

### Response Example
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 570,
    "values": {
        "570": {
            "id": "570",
            "contact_id": "337",
            "location_type_id": "640",
            "email": "test.update@civicrm.test.org",
            "is_primary": "1",
            "is_billing": "",
            "on_hold": "",
            "is_bulkmail": "",
            "hold_date": "",
            "reset_date": "",
            "signature_text": "",
            "signature_html": ""
        }
    }
}
{/literal}```
## Email Delete API

{ts}{$api_entity}{/ts} {ts}{$api_action}{/ts} API

### HTTP Method
```
POST
```

### Request URL
```{literal}
<entrypoint>?entity=Email&action=delete
{/literal}```

### Request body
```{literal}
{
    "id": 571
}
{/literal}```

### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=delete&pretty=1&json={"id":571}
{/literal}```

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
    --request POST -d 'json={literal}{"id":571}{/literal}' \  '<entrypoint>?entity=Email&action=delete'
```

### Response Example
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
{/literal}```
