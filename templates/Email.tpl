# Email



# {ts}Email{/ts} API {ts}Help{/ts}

{ts}This is a API Document about Email{/ts}



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



## 建立 電子郵件 

This is tests for creating Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Email&action=create&pretty=1&json={literal}{{/literal}"contact_id":"137","location_type_id":"179","is_primary":"1","email":"api@a-team.com"{literal}}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={literal}{{/literal}"contact_id":"137","location_type_id":"179","is_primary":"1","email":"api@a-team.com"{literal}}{/literal}
```

**Request Samples**

```shell
curl -g --request POST '<entrypoint>?entity=Email&action=create&pretty=1&json={literal}{{/literal}"contact_id":"137","location_type_id":"179","is_primary":"1","email":"api@a-team.com"{literal}}{/literal}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**{ts}Response Samples{/ts}** 
{literal}```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 46,
    "values": {
        "46": {
            "id": "46",
            "contact_id": "137",
            "location_type_id": "179",
            "email": "api@a-team.com",
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
```{/literal}


## Get 電子郵件 

This is tests for get Email 

**HTTP methods: GET**

**路徑**

```
<entrypoint>?entity=Email&action=get&pretty=1&json={literal}{{/literal}"contact_id":"141"{literal}}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=get&pretty=1&json={literal}{{/literal}"contact_id":"141"{literal}}{/literal}
```

**Request Samples**

```shell
curl -g --request GET '<entrypoint>?entity=Email&action=get&pretty=1&json={literal}{{/literal}"contact_id":"141"{literal}}{/literal}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**{ts}Response Samples{/ts}** 
{literal}```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 50,
    "values": {
        "50": {
            "id": "50",
            "contact_id": "141",
            "location_type_id": "187",
            "email": "api@a-team.com",
            "is_primary": "1",
            "is_billing": "0",
            "on_hold": "0",
            "is_bulkmail": "0"
        }
    }
}
```{/literal}


## 刪除 電子郵件 

This is tests for deleting Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Email&action=delete&pretty=1&json={literal}{{/literal}"id":"1"{literal}}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=delete&pretty=1&json={literal}{{/literal}"id":"1"{literal}}{/literal}
```
**Request Samples**

```bash
curl -g --request POST '<entrypoint>?entity=Email&action=delete&pretty=1&json={literal}{{/literal}"id":"1"{literal}}{/literal}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**{ts}Response Samples{/ts}** 
{literal}```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
```{/literal}


## 更新 電子郵件 

This is tests for updating Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Email&action=create&pretty=1&json={literal}{{/literal}"id":"56","contact_id":"143","location_type_id":"191","is_primary":"1","email":"1-4@example.com"{literal}}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={literal}{{/literal}"id":"56","contact_id":"143","location_type_id":"191","is_primary":"1","email":"1-4@example.com"{literal}}{/literal}
```

**Request Samples**

```
curl -g --request POST '<entrypoint>?entity=Email&action=create&pretty=1&json={literal}{{/literal}"id":"56","contact_id":"143","location_type_id":"191","is_primary":"1","email":"1-4@example.com"{literal}}{/literal}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**{ts}Response Samples{/ts}** 
{literal}```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 56,
    "values": {
        "56": {
            "id": "56",
            "contact_id": "143",
            "location_type_id": "191",
            "email": "1-4@example.com",
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
```{/literal}

