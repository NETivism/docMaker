+++
title = "Group API"
menuTitle = "Group"
chapter = false
+++
This is a API Document about Group.

| 變數名稱 | 類型 | 長度 | 格式 | 建立規則 | 說明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 數字(int unsigned) | 10 | >= 0 | 更新時必填 | 群組編號 |
| name | 字串(varchar) | 64 |  |  | Internal name of Group. |
| title | 字串(varchar) | 64 |  |  | Name of Group. |
| description | 字串(text) | 65535 |  |  | Optional verbose description of the group. |
| source | 字串(varchar) | 64 |  |  | Module or process which created this group. |
| saved_search_id | 數字(int unsigned) | 10 | >= 0 |  | FK to saved search table. |
| is_active | 布林值(boolean) | 1 | 0 or 1 |  | Is this entry active? |
| visibility | 字串(enum) |  | User and User Admin Only,Public Pages | 預設值: 'User and User Admin Only' | In what context(s) is this field visible. |
| where_clause | 字串(text) | 65535 |  |  | the sql where clause if a saved search acl |
| select_tables | 字串(text) | 65535 |  |  | the tables to be included in a select data |
| where_tables | 字串(text) | 65535 |  |  | the tables to be included in the count statement |
| group_type | 字串(varchar) | 128 |  |  | FK to group type |
| cache_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Date when we created the cache for a smart group |
| parents | 字串(text) | 65535 |  |  | IDs of the parent(s) |
| children | 字串(text) | 65535 |  |  | IDs of the child(ren) |
| is_hidden | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 | Is this group hidden? |


## Group Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Group&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "name": "Test Group 1 For Create",
    "domain_id": 1,
    "title": "New Test Group For Create",
    "description": "New Test Group Created",
    "is_active": 1,
    "group_type": "1,2",
    "visibility": "Public Pages"
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Group&action=get&pretty=1&json={"name":"Test Group 1 For Create","domain_id":1,"title":"New Test Group For Create","description":"New Test Group Created","is_active":1,"group_type":"1,2","visibility":"Public Pages"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"name":"Test Group 1 For Create","domain_id":1,"title":"New Test Group For Create","description":"New Test Group Created","is_active":1,"group_type":"1,2","visibility":"Public Pages"}' \
  '<entrypoint>?entity=Group&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 167,
    "values": {
        "167": {
            "id": "167",
            "name": "Test Group 1 For Create",
            "title": "New Test Group For Create",
            "description": "New Test Group Created",
            "source": "",
            "saved_search_id": "",
            "is_active": "1",
            "visibility": "Public Pages",
            "where_clause": " ( `civicrm_group_contact-167`.group_id IN ( 167 ) AND `civicrm_group_contact-167`.status IN ('Added') ) ",
            "select_tables": "a:12:{s:15:\"civicrm_contact\";i:1;s:15:\"civicrm_address\";i:1;s:22:\"civicrm_state_province\";i:1;s:15:\"civicrm_country\";i:1;s:13:\"civicrm_email\";i:1;s:13:\"civicrm_phone\";i:1;s:10:\"civicrm_im\";i:1;s:19:\"civicrm_worldregion\";i:1;s:27:\"`civicrm_group_contact-167`\";s:118:\" LEFT JOIN civicrm_group_contact `civicrm_group_contact-167` ON contact_a.id = `civicrm_group_contact-167`.contact_id \";s:6:\"gender\";i:1;s:17:\"individual_prefix\";i:1;s:17:\"individual_suffix\";i:1;}",
            "where_tables": "a:2:{s:15:\"civicrm_contact\";i:1;s:27:\"`civicrm_group_contact-167`\";s:118:\" LEFT JOIN civicrm_group_contact `civicrm_group_contact-167` ON contact_a.id = `civicrm_group_contact-167`.contact_id \";}",
            "group_type": [
                "1",
                "2"
            ],
            "cache_date": "",
            "parents": "",
            "children": "",
            "is_hidden": ""
        }
    }
}
```

## Group Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Group&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 168,
    "title": "New Update title for title",
    "description": "New Update title for description",
    "is_active": 1,
    "visibility": "Public Pages"
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Group&action=create&pretty=1&json={"id":168,"title":"New Update title for title","description":"New Update title for description","is_active":1,"visibility":"Public Pages"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":168,"title":"New Update title for title","description":"New Update title for description","is_active":1,"visibility":"Public Pages"}' \
  '<entrypoint>?entity=Group&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 168,
    "values": {
        "168": {
            "id": "168",
            "name": "",
            "title": "New Update title for title",
            "description": "New Update title for description",
            "source": "",
            "saved_search_id": "",
            "is_active": "1",
            "visibility": "Public Pages",
            "where_clause": " ( `civicrm_group_contact-168`.group_id IN ( 168 ) AND `civicrm_group_contact-168`.status IN ('Added') ) ",
            "select_tables": "a:12:{s:15:\"civicrm_contact\";i:1;s:15:\"civicrm_address\";i:1;s:22:\"civicrm_state_province\";i:1;s:15:\"civicrm_country\";i:1;s:13:\"civicrm_email\";i:1;s:13:\"civicrm_phone\";i:1;s:10:\"civicrm_im\";i:1;s:19:\"civicrm_worldregion\";i:1;s:27:\"`civicrm_group_contact-168`\";s:118:\" LEFT JOIN civicrm_group_contact `civicrm_group_contact-168` ON contact_a.id = `civicrm_group_contact-168`.contact_id \";s:6:\"gender\";i:1;s:17:\"individual_prefix\";i:1;s:17:\"individual_suffix\";i:1;}",
            "where_tables": "a:2:{s:15:\"civicrm_contact\";i:1;s:27:\"`civicrm_group_contact-168`\";s:118:\" LEFT JOIN civicrm_group_contact `civicrm_group_contact-168` ON contact_a.id = `civicrm_group_contact-168`.contact_id \";}",
            "group_type": "null",
            "cache_date": "",
            "parents": "",
            "children": "",
            "is_hidden": ""
        }
    }
}
```

## Group Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Group&action=delete
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 169
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Group&action=delete&pretty=1&json={"id":169}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":169}' \
  '<entrypoint>?entity=Group&action=delete'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": true
}
```

## Group Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```
<entrypoint>?entity=Group&action=get&json={"id":170}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Group&action=get&pretty=1&json={"id":170}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Group&action=get&json='
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 170,
    "values": {
        "170": {
            "id": "170",
            "name": "Test Group 1",
            "title": "New Test Group Created",
            "description": "New Test Group Created",
            "source": "",
            "saved_search_id": "",
            "is_active": "1",
            "visibility": "Public Pages",
            "where_clause": " ( `civicrm_group_contact-170`.group_id IN ( 170 ) AND `civicrm_group_contact-170`.status IN ('Added') ) ",
            "select_tables": "a:12:{s:15:\"civicrm_contact\";i:1;s:15:\"civicrm_address\";i:1;s:22:\"civicrm_state_province\";i:1;s:15:\"civicrm_country\";i:1;s:13:\"civicrm_email\";i:1;s:13:\"civicrm_phone\";i:1;s:10:\"civicrm_im\";i:1;s:19:\"civicrm_worldregion\";i:1;s:27:\"`civicrm_group_contact-170`\";s:118:\" LEFT JOIN civicrm_group_contact `civicrm_group_contact-170` ON contact_a.id = `civicrm_group_contact-170`.contact_id \";s:6:\"gender\";i:1;s:17:\"individual_prefix\";i:1;s:17:\"individual_suffix\";i:1;}",
            "where_tables": "a:2:{s:15:\"civicrm_contact\";i:1;s:27:\"`civicrm_group_contact-170`\";s:118:\" LEFT JOIN civicrm_group_contact `civicrm_group_contact-170` ON contact_a.id = `civicrm_group_contact-170`.contact_id \";}",
            "group_type": [
                "1",
                "2"
            ],
            "cache_date": "",
            "parents": "",
            "children": "",
            "is_hidden": "0"
        }
    }
}
```