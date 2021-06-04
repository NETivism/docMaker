# Email



# {ts}Email{/ts} API {ts}Help{/ts}

{ts}This is a API Document about Email{/ts}



| {ts}Parameter Name{/ts} | {ts}Field Help{/ts} | {ts}Type{/ts} | {ts}Create Rule{/ts} |
| ---- | ---- | ---- | ---- |
| contact_id | {ts}Contact{/ts} | {ts}Number{/ts} |  |
| location_type_id | {ts}Location Type{/ts} | {ts}Number{/ts} |  |
| email | {ts}Email{/ts} | {ts}String{/ts} |  |
| is_primary | {ts}Primary{/ts} | {ts}Boolean{/ts}({ts}True or False{/ts}) | {ts}Default Value{/ts}: 0 |
| is_billing | {ts}Billing{/ts} | {ts}Boolean{/ts}({ts}True or False{/ts}) | {ts}Default Value{/ts}: 0 |
| on_hold | {ts}On Hold{/ts} | {ts}Boolean{/ts}({ts}True or False{/ts}) | {ts}Required{/ts}, {ts}Default Value{/ts}: 0 |
| is_bulkmail | {ts}Use for Bulk Mail{/ts} | {ts}Boolean{/ts}({ts}True or False{/ts}) | {ts}Required{/ts}, {ts}Default Value{/ts}: 0 |
| hold_date | {ts}Hold Date{/ts} | {ts}Date{/ts} |  |
| reset_date | {ts}Reset Date{/ts} | {ts}Date{/ts} |  |
| signature_text | {ts}Signature Text{/ts} | {ts}String{/ts} | {ts}Default Value{/ts}: NULL |
| signature_html | {ts}Signature Html{/ts} | {ts}String{/ts} | {ts}Default Value{/ts}: NULL |



## 建立 電子郵件 

This is tests for creating Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Email&action=create&pretty=1&json={literal}{{/literal}"contact_id":"100","location_type_id":"105","is_primary":"1","email":"api@a-team.com"{literal}}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={literal}{{/literal}"contact_id":"100","location_type_id":"105","is_primary":"1","email":"api@a-team.com"{literal}}{/literal}
```

**Request Samples**

```shell
curl -g --request POST '<entrypoint>?entity=Email&action=create&pretty=1&json={literal}{{/literal}"contact_id":"100","location_type_id":"105","is_primary":"1","email":"api@a-team.com"{literal}}{/literal}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**{ts}Response Samples{/ts}** 
{literal}```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 1,
    "values": {
        "1": {
            "id": "1",
            "contact_id": "100",
            "location_type_id": "105",
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
<entrypoint>?entity=Email&action=get&pretty=1&json={literal}{{/literal}"contact_id":"104"{literal}}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=get&pretty=1&json={literal}{{/literal}"contact_id":"104"{literal}}{/literal}
```

**Request Samples**

```shell
curl -g --request GET '<entrypoint>?entity=Email&action=get&pretty=1&json={literal}{{/literal}"contact_id":"104"{literal}}{/literal}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**{ts}Response Samples{/ts}** 
{literal}```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 5,
    "values": {
        "5": {
            "id": "5",
            "contact_id": "104",
            "location_type_id": "113",
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

```{/literal}


## 更新 電子郵件 

This is tests for updating Email 

**HTTP methods: POST**

**路徑**

```
<entrypoint>?entity=Email&action=create&pretty=1&json={literal}{{/literal}"id":"11","contact_id":"106","location_type_id":"117","is_primary":"1","email":"1-4@example.com"{literal}}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={literal}{{/literal}"id":"11","contact_id":"106","location_type_id":"117","is_primary":"1","email":"1-4@example.com"{literal}}{/literal}
```

**Request Samples**

```
curl -g --request POST '<entrypoint>?entity=Email&action=create&pretty=1&json={literal}{{/literal}"id":"11","contact_id":"106","location_type_id":"117","is_primary":"1","email":"1-4@example.com"{literal}}{/literal}' \
--header 'x-civicrm-api-key: <secret-key>' \
--header 'x-civicrm-site-key: <site-key>'
```

**{ts}Response Samples{/ts}** 
{literal}```json
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 11,
    "values": {
        "11": {
            "id": "11",
            "contact_id": "106",
            "location_type_id": "117",
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

