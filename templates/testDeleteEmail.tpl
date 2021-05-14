

## {ts}Delete{/ts} {ts}Email{/ts} 

{ts}This is tests for deleting Email{/ts} 

**HTTP {ts}methods{/ts}: POST**

**{ts}Path{/ts}**

```
<entrypoint>?entity=Email&action=delete&pretty=1&json={literal}\{{/literal}"id":"1"{literal}\}{/literal}
```

**API Explorer**

```
https://<site-domain>/civicrm/apibrowser#/civicrm/ajax/rest?entity=Email&action=delete&pretty=1&json={literal}\{{/literal}"id":"1"{literal}\}{/literal}
```
**{ts}Request Samples{/ts}**

```bash
curl -g --request POST '<entrypoint>?entity=Email&action=delete&pretty=1&json={literal}\{{/literal}"id":"1"{literal}\}{/literal}' \
{$API_KEY_HEADER} \
{$SITE_KEY_HEADER}
```

{$result}

