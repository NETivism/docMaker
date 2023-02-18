+++
title = "Group API"
menuTitle = "Group"
chapter = false
+++
This is a API Document about Group.

| {ts}Parameter Name{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} | {ts}Field Help{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 更新時必填 | {ts}Group ID{/ts} |
| name | {ts}String{/ts}(varchar) | 64 |  |  | {ts}Internal name of Group.{/ts} |
| title | {ts}String{/ts}(varchar) | 64 |  |  | {ts}Name of Group.{/ts} |
| description | {ts}String{/ts}(text) | 65535 |  |  | {ts}Optional verbose description of the group.{/ts} |
| source | {ts}String{/ts}(varchar) | 64 |  |  | {ts}Module or process which created this group.{/ts} |
| saved_search_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}FK to saved search table.{/ts} |
| is_active | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 |  | {ts}Is this entry active?{/ts} |
| visibility | {ts}String{/ts}(enum) |  | User and User Admin Only,Public Pages | 預設值: 'User and User Admin Only' | {ts}In what context(s) is this field visible.{/ts} |
| where_clause | {ts}String{/ts}(text) | 65535 |  |  | {ts}the sql where clause if a saved search acl{/ts} |
| select_tables | {ts}String{/ts}(text) | 65535 |  |  | {ts}the tables to be included in a select data{/ts} |
| where_tables | {ts}String{/ts}(text) | 65535 |  |  | {ts}the tables to be included in the count statement{/ts} |
| group_type | {ts}String{/ts}(varchar) | 128 |  |  | {ts}FK to group type{/ts} |
| cache_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Date when we created the cache for a smart group{/ts} |
| parents | {ts}String{/ts}(text) | 65535 |  |  | {ts}IDs of the parent(s){/ts} |
| children | {ts}String{/ts}(text) | 65535 |  |  | {ts}IDs of the child(ren){/ts} |
| is_hidden | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 | {ts}Is this group hidden?{/ts} |


## Group Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Group&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "name": "Test Group 1",
    "domain_id": 1,
    "title": "New Test Group Created",
    "description": "New Test Group Created",
    "is_active": 1,
    "visibility": "Public Pages",
    "group_type": "1"
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Group&action=get&pretty=1&json={"name":"Test Group 1","domain_id":1,"title":"New Test Group Created","description":"New Test Group Created","is_active":1,"visibility":"Public Pages","group_type":"1"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"name":"Test Group 1","domain_id":1,"title":"New Test Group Created","description":"New Test Group Created","is_active":1,"visibility":"Public Pages","group_type":"1"}{/literal}' \
  '<entrypoint>?entity=Group&action=create'
```

### 回傳範例
```{literal}
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
{/literal}```
