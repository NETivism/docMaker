

## {ts}Get{/ts} {ts}Email{/ts} 

{ts}This is tests for get Email{/ts} 

**HTTP {ts}methods{/ts}: GET**

**{ts}Path{/ts}**

```
<entrypoint>?entity=Email&action=get&pretty=1&json={literal}\{{/literal}"contact_id":"{$value.contact_id}"{literal}\}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=get&pretty=1&json={literal}\{{/literal}"contact_id":"{$value.contact_id}"{literal}\}{/literal}
```

**{ts}Request Samples{/ts}**

```shell
curl -g --request GET '<entrypoint>?entity=Email&action=get&pretty=1&json={literal}\{{/literal}"contact_id":"{$value.contact_id}"{literal}\}{/literal}' \
{$API_KEY_HEADER} \
{$SITE_KEY_HEADER}
```

{$result}

