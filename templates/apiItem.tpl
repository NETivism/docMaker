
## {$api_entity} {$api_action} API

{literal}{ts}{$api_entity}{/ts} {ts}{$api_action}{/ts} API{/literal}

### HTTP Method
```
{$http_method}
```

### Request URL
```{ldelim}literal{rdelim}
{$request_url}
{ldelim}/literal{rdelim}```

{if $request_body}
### Request body
```{ldelim}literal{rdelim}
{$request_body}
{ldelim}/literal{rdelim}```
{/if}

{if $api_explorer}
### API Explorer
```{ldelim}literal{rdelim}
{$api_explorer}
{ldelim}/literal{rdelim}```
{/if}

### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' --header 'x-civicrm-site-key: <site-key>' \
  {if $http_method == 'POST'}  --request POST -d 'json={ldelim}literal{rdelim}{$request_body_inline}{ldelim}/literal{rdelim}' \{/if}
  '{$request_url}'
```

### Response Example
```{ldelim}literal{rdelim}
{$response_body}
{ldelim}/literal{rdelim}```
