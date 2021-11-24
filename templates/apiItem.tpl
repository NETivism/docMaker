
## {$api_entity} {$api_action} API

### {ts}Request Example{/ts}

#### HTTP Method
```
{$http_method}
```

#### Request URL
```{ldelim}literal{rdelim}
{$request_url}
{ldelim}/literal{rdelim}```

{if $request_body && $http_method == 'POST'}
#### Request Content Type
```{ldelim}literal{rdelim}
{$request_content_type}
{ldelim}/literal{rdelim}```

{/if}
{if $request_body && $http_method == 'POST'}
#### Request body
```{ldelim}literal{rdelim}
{$request_body}
{ldelim}/literal{rdelim}```

{/if}
{if $api_explorer}
#### API Explorer
```{ldelim}literal{rdelim}
{$api_explorer}
{ldelim}/literal{rdelim}```
{/if}

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
{if $http_method == 'POST'}  --header 'content-type: application/json' \
  --request POST \
  --data '{ldelim}literal{rdelim}{$request_body_inline}{ldelim}/literal{rdelim}' \
{/if}
  '{$request_url}'
```

### {ts}Response Example{/ts}

```{ldelim}literal{rdelim}
{$response_body}
{ldelim}/literal{rdelim}```