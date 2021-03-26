# Email



# {ts}Email{/ts} API {ts}Help{/ts}

{ts}This is a API Document about Email{/ts}



| {ts}Parameter Name{/ts} | {ts}Field Help{/ts} | {ts}Type{/ts} | {ts}Create Rule{/ts} |
| ---- | ---- | ---- | ---- |
| contact_id | {ts}Contact{/ts} | {ts}Number{/ts} |  |
| location_type_id | {ts}Location Type{/ts} | {ts}Number{/ts} |  |
| email | {ts}Email{/ts} | {ts}String{/ts} |  |
| is_primary | {ts}Primary{/ts} | {ts}String{/ts} | {ts}Default Value{/ts}: 0 |
| is_billing | {ts}Billing{/ts} | {ts}Boolean{/ts}({ts}True or False{/ts}) | {ts}Default Value{/ts}: 0 |
| on_hold | {ts}On Hold{/ts} | {ts}Boolean{/ts}({ts}True or False{/ts}) | {ts}Required{/ts}, {ts}Default Value{/ts}: 0 |
| is_bulkmail | {ts}Use for Bulk Mail{/ts} | {ts}Boolean{/ts}({ts}True or False{/ts}) | {ts}Required{/ts}, {ts}Default Value{/ts}: 0 |
| hold_date | {ts}Hold Date{/ts} | {ts}Date{/ts} |  |
| reset_date | {ts}Reset Date{/ts} | {ts}Date{/ts} |  |
| signature_text | {ts}Signature Text{/ts} | {ts}String{/ts} | {ts}Default Value{/ts}: NULL |
| signature_html | {ts}Signature Html{/ts} | {ts}String{/ts} | {ts}Default Value{/ts}: NULL |

{literal}
{{SAMPLE_CODE}}

{{RESULT}}
{/literal}

