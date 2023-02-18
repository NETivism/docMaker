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
    "name": "Test Group 1",
    "domain_id": 1,
    "title": "New Test Group Created",
    "description": "New Test Group Created",
    "is_active": 1,
    "visibility": "Public Pages",
    "group_type": "1"
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Group&action=get&pretty=1&json={"name":"Test Group 1","domain_id":1,"title":"New Test Group Created","description":"New Test Group Created","is_active":1,"visibility":"Public Pages","group_type":"1"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"name":"Test Group 1","domain_id":1,"title":"New Test Group Created","description":"New Test Group Created","is_active":1,"visibility":"Public Pages","group_type":"1"}' \
  '<entrypoint>?entity=Group&action=create'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 12,
    "values": {
        "12": {
            "id": "12",
            "name": "Test Group 1",
            "title": "New Test Group Created",
            "description": "New Test Group Created",
            "source": "",
            "saved_search_id": "",
            "is_active": "1",
            "visibility": "Public Pages",
            "where_clause": " ( `civicrm_group_contact-12`.group_id IN ( 12 ) AND `civicrm_group_contact-12`.status IN ('Added') ) ",
            "select_tables": "a:12:{s:15:\"civicrm_contact\";i:1;s:15:\"civicrm_address\";i:1;s:22:\"civicrm_state_province\";i:1;s:15:\"civicrm_country\";i:1;s:13:\"civicrm_email\";i:1;s:13:\"civicrm_phone\";i:1;s:10:\"civicrm_im\";i:1;s:19:\"civicrm_worldregion\";i:1;s:26:\"`civicrm_group_contact-12`\";s:116:\" LEFT JOIN civicrm_group_contact `civicrm_group_contact-12` ON contact_a.id = `civicrm_group_contact-12`.contact_id \";s:6:\"gender\";i:1;s:17:\"individual_prefix\";i:1;s:17:\"individual_suffix\";i:1;}",
            "where_tables": "a:2:{s:15:\"civicrm_contact\";i:1;s:26:\"`civicrm_group_contact-12`\";s:116:\" LEFT JOIN civicrm_group_contact `civicrm_group_contact-12` ON contact_a.id = `civicrm_group_contact-12`.contact_id \";}",
            "group_type": "1",
            "cache_date": "",
            "parents": "",
            "children": "",
            "is_hidden": ""
        }
    }
}
```