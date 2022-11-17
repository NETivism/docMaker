+++
title = "Activity API"
menuTitle = "Activity"
chapter = false
+++
This is a API Document about Activity.

| {ts}Parameter Name{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} | {ts}Field Help{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 更新時必填 | {ts}Unique  Other Activity ID{/ts} |
| source_contact_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Contact ID of the person scheduling or logging this Activity. Usually the authenticated user.{/ts} |
| source_record_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Artificial FK to original transaction (e.g. contribution) IF it is not an Activity. Table can be figured out through activity_type_id, and further through component registry.{/ts} |
| activity_type_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 必填, 預設值: 1 | {ts}FK to civicrm_option_value.id, that has to be valid, registered activity type.{/ts} |
| target_entity_table | {ts}String{/ts}(varchar) | 64 |  | 必填 | {ts}Name of table where item being referenced is stored.{/ts} |
| target_entity_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 必填 | {ts}Foreign key to the referenced item.{/ts} |
| subject | {ts}String{/ts}(varchar) | 255 |  |  | {ts}The subject/purpose/short description of the activity.{/ts} |
| scheduled_date | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Date and time meeting is scheduled to occur.{/ts} |
| activity_date_time | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Date and time this activity is scheduled to occur. Formerly named scheduled_date_time.{/ts} |
| due_date_time | {ts}Date{/ts}(datetime) |  | yyyy-mm-dd hh:ii:ss |  | {ts}Date and time this activity is due.{/ts} |
| duration_hours | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Planned or actual duration of meeting - hours.{/ts} |
| duration_minutes | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Planned or actual duration of meeting - minutes.{/ts} |
| duration | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Planned or actual duration of activity expressed in minutes. Conglomerate of former duration_hours and duration_minutes.{/ts} |
| location | {ts}String{/ts}(varchar) | 255 |  |  | {ts}Location of the activity (optional, open text).{/ts} |
| phone_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Phone ID of the number called (optional - used if an existing phone number is selected).{/ts} |
| phone_number | {ts}String{/ts}(varchar) | 64 |  |  | {ts}Phone number in case the number does not exist in the civicrm_phone table.{/ts} |
| details | {ts}String{/ts}(text) | 65535 |  |  | {ts}Details about the activity (agenda, notes, etc).{/ts} |
| status | {ts}String{/ts}(enum) |  | Scheduled, Completed |  | {ts}What is the status of this meeting? Completed meeting status results in activity history entry.{/ts} |
| status_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}ID of the status this activity is currently in. Foreign key to civicrm_option_value.{/ts} |
| priority_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}ID of the priority given to this activity. Foreign key to civicrm_option_value.{/ts} |
| parent_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Parent meeting ID (if this is a follow-up item). This is not currently implemented{/ts} |
| is_test | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| medium_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 預設值: NULL | {ts}Activity Medium, Implicit FK to civicrm_option_value where option_group = encounter_medium.{/ts} |
| is_auto | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| relationship_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 | 預設值: NULL | {ts}FK to Relationship ID{/ts} |
| is_current_revision | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 1 |  |
| original_id | {ts}Number{/ts}(int unsigned) | 10 | >= 0 |  | {ts}Activity ID of the first activity record in versioning chain.{/ts} |
| result | {ts}String{/ts}(varchar) | 255 |  |  | {ts}Currently being used to store result id for survey activity, FK to option value.{/ts} |
| is_deleted | {ts}Boolean{/ts}(boolean) | 1 | 0 or 1 | 預設值: 0 |  |


## Activity Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Activity&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "source_contact_id": 1,
    "activity_type_id": "43",
    "subject": "test activity type id",
    "activity_date_time": "2011-06-02 14:36:13",
    "status_id": 2,
    "priority_id": 1,
    "duration": 120,
    "location": "Pensulvania",
    "details": "a test activity"
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Activity&action=get&pretty=1&json={"source_contact_id":1,"activity_type_id":"43","subject":"test activity type id","activity_date_time":"2011-06-02 14:36:13","status_id":2,"priority_id":1,"duration":120,"location":"Pensulvania","details":"a test activity"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"source_contact_id":1,"activity_type_id":"43","subject":"test activity type id","activity_date_time":"2011-06-02 14:36:13","status_id":2,"priority_id":1,"duration":120,"location":"Pensulvania","details":"a test activity"}{/literal}' \
  '<entrypoint>?entity=Activity&action=create'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 1,
    "values": {
        "1": {
            "id": "1",
            "source_contact_id": "1",
            "source_record_id": "",
            "activity_type_id": "43",
            "subject": "test activity type id",
            "activity_date_time": "20110602143613",
            "duration": "120",
            "location": "Pensulvania",
            "phone_id": "",
            "phone_number": "",
            "details": "a test activity",
            "status_id": "2",
            "priority_id": "1",
            "parent_id": "",
            "is_test": "",
            "medium_id": "",
            "is_auto": "",
            "relationship_id": "",
            "is_current_revision": "",
            "original_id": "",
            "result": "",
            "is_deleted": ""
        }
    }
}
{/literal}```

## Activity Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```{literal}
<entrypoint>?entity=Activity&action=get&json={"source_contact_id":54,"activity_type_id":"45","subject":"test activity type id","activity_date_time":"2011-06-02 14:36:13","status_id":2,"priority_id":1,"duration":120,"location":"Pensulvania","details":"a test activity"}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Activity&action=get&pretty=1&json={"source_contact_id":54,"activity_type_id":"45","subject":"test activity type id","activity_date_time":"2011-06-02 14:36:13","status_id":2,"priority_id":1,"duration":120,"location":"Pensulvania","details":"a test activity"}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Activity&action=get&json={"source_contact_id":54,"activity_type_id":"45","subject":"test activity type id","activity_date_time":"2011-06-02 14:36:13","status_id":2,"priority_id":1,"duration":120,"location":"Pensulvania","details":"a test activity"}'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 18,
    "values": {
        "18": {
            "id": "18",
            "source_contact_id": "54",
            "activity_type_id": "45",
            "subject": "test activity type id",
            "activity_date_time": "2011-06-02 14:36:13",
            "duration": "120",
            "location": "Pensulvania",
            "details": "a test activity",
            "status_id": "2",
            "priority_id": "1",
            "is_test": "0",
            "is_auto": "0",
            "is_current_revision": "1",
            "is_deleted": "0"
        }
    }
}
{/literal}```

## Activity Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Activity&action=create
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "id": 22,
    "subject": "Updated Make-it-Happen Meeting",
    "duration": 120,
    "location": "21, Park Avenue",
    "details": "Lets update Meeting",
    "status_id": 1,
    "activity_name": "Test activity type",
    "priority_id": 1
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Activity&action=create&pretty=1&json={"id":22,"subject":"Updated Make-it-Happen Meeting","duration":120,"location":"21, Park Avenue","details":"Lets update Meeting","status_id":1,"activity_name":"Test activity type","priority_id":1}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":22,"subject":"Updated Make-it-Happen Meeting","duration":120,"location":"21, Park Avenue","details":"Lets update Meeting","status_id":1,"activity_name":"Test activity type","priority_id":1}{/literal}' \
  '<entrypoint>?entity=Activity&action=create'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "id": 22,
    "values": {
        "22": {
            "id": "22",
            "source_contact_id": "",
            "source_record_id": "",
            "activity_type_id": "41",
            "subject": "Updated Make-it-Happen Meeting",
            "activity_date_time": "",
            "duration": "120",
            "location": "21, Park Avenue",
            "phone_id": "",
            "phone_number": "",
            "details": "Lets update Meeting",
            "status_id": "1",
            "priority_id": "1",
            "parent_id": "",
            "is_test": "",
            "medium_id": "",
            "is_auto": "",
            "relationship_id": "",
            "is_current_revision": "",
            "original_id": "",
            "result": "",
            "is_deleted": ""
        }
    }
}
{/literal}```

## Activity Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```{literal}
<entrypoint>?entity=Activity&action=delete
{/literal}```

#### Request Content Type
```{literal}
application/json
{/literal}```

#### Request body
```{literal}
{
    "id": 20
}
{/literal}```

#### API Explorer
```{literal}
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Activity&action=delete&pretty=1&json={"id":20}
{/literal}```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{literal}{"id":20}{/literal}' \
  '<entrypoint>?entity=Activity&action=delete'
```

### 回傳範例
```{literal}
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
{/literal}```
