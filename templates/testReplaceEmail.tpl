

## {ts}Update{/ts} {ts}Email{/ts} 

{ts}This is tests for updating Email{/ts} 

**HTTP {ts}methods{/ts}: POST**

**{ts}Path{/ts}**

```
<entrypoint>?entity=Email&action=create&pretty=1&json={literal}\{{/literal}"id":"{$value.id}","contact_id":"{$value.contact_id}","location_type_id":"{$value.location_type_id}","is_primary":"{$value.is_primary}","email":"{$value.email}"{literal}\}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=create&pretty=1&json={literal}\{{/literal}"id":"{$value.id}","contact_id":"{$value.contact_id}","location_type_id":"{$value.location_type_id}","is_primary":"{$value.is_primary}","email":"{$value.email}"{literal}\}{/literal}
```

**{ts}Request Samples{/ts}**

```
curl -g --request POST '<entrypoint>?entity=Email&action=create&pretty=1&json={literal}\{{/literal}"id":"{$value.id}","contact_id":"{$value.contact_id}","location_type_id":"{$value.location_type_id}","is_primary":"{$value.is_primary}","email":"{$value.email}"{literal}\}{/literal}' \
{$API_KEY_HEADER} \
{$SITE_KEY_HEADER}
```

{$result}

