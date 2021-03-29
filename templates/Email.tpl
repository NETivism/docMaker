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


  
  ### {ts}Create{/ts} {ts}Email{/ts}
  
  {ts}This is tests for creating Email{/ts}
  
  ```
  curl -g --request POST '<entrypoint>?entity=Contact&action=delete&pretty=1&json=' \
  --header 'x-civicrm-api-key: <secret-key>'\
  --header 'x-civicrm-site-key: <site-key>''
  ```
  
  {literal}{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 145,
    "values": {
        "145": {
            "id": "145",
            "contact_id": "145",
            "location_type_id": "292",
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
}{/literal}
  
  
  
  ### {ts}Get{/ts} {ts}Email{/ts}
  
  {ts}This is tests for get Email{/ts}
  
  ```
  Sample Source Code
  ```
  
  {literal}{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 146,
    "values": {
        "146": {
            "id": "146",
            "contact_id": "146",
            "location_type_id": "294",
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
}{/literal}
  
  
  
  ### {ts}Delete{/ts} {ts}Email{/ts}
  
  {ts}This is tests for deleting Email{/ts}
  
  ```
  Sample Source Code
  ```
  
  {literal}{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}{/literal}
  
  
  
  ### {ts}Update{/ts} {ts}Email{/ts}
  
  {ts}This is tests for updating Email{/ts}
  
  ```
  Sample Source Code
  ```
  
  {literal}null{/literal}
  
  

{literal}
{{RESULT}}
{/literal}

