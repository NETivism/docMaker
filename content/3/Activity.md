+++
title = "Activity API"
menuTitle = "Activity"
chapter = false
+++
This is a API Document about Activity.

| 變數名稱 | 類型 | 長度 | 格式 | 建立規則 | 說明 |
| ---- | ---- | ---- | ---- | ---- | ---- |
| id | 數字(int unsigned) | 10 | >= 0 | 更新時必填 | Unique  Other Activity ID |
| source_contact_id | 數字(int unsigned) | 10 | >= 0 |  | Contact ID of the person scheduling or logging this Activity. Usually the authenticated user. |
| source_record_id | 數字(int unsigned) | 10 | >= 0 |  | Artificial FK to original transaction (e.g. contribution) IF it is not an Activity. Table can be figured out through activity_type_id, and further through component registry. |
| activity_type_id | 數字(int unsigned) | 10 | >= 0 | 必填, 預設值: 1 | FK to civicrm_option_value.id, that has to be valid, registered activity type. |
| target_entity_table | 字串(varchar) | 64 |  | 必填 | Name of table where item being referenced is stored. |
| target_entity_id | 數字(int unsigned) | 10 | >= 0 | 必填 | Foreign key to the referenced item. |
| subject | 字串(varchar) | 255 |  |  | The subject/purpose/short description of the activity. |
| scheduled_date | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Date and time meeting is scheduled to occur. |
| activity_date_time | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Date and time this activity is scheduled to occur. Formerly named scheduled_date_time. |
| due_date_time | 日期(datetime) |  | yyyy-mm-dd hh:ii:ss |  | Date and time this activity is due. |
| duration_hours | 數字(int unsigned) | 10 | >= 0 |  | Planned or actual duration of meeting - hours. |
| duration_minutes | 數字(int unsigned) | 10 | >= 0 |  | Planned or actual duration of meeting - minutes. |
| duration | 數字(int unsigned) | 10 | >= 0 |  | Planned or actual duration of activity expressed in minutes. Conglomerate of former duration_hours and duration_minutes. |
| location | 字串(varchar) | 255 |  |  | Location of the activity (optional, open text). |
| phone_id | 數字(int unsigned) | 10 | >= 0 |  | Phone ID of the number called (optional - used if an existing phone number is selected). |
| phone_number | 字串(varchar) | 64 |  |  | Phone number in case the number does not exist in the civicrm_phone table. |
| details | 字串(text) | 65535 |  |  | Details about the activity (agenda, notes, etc). |
| status | 字串(enum) |  | Scheduled, Completed |  | What is the status of this meeting? Completed meeting status results in activity history entry. |
| status_id | 數字(int unsigned) | 10 | >= 0 |  | ID of the status this activity is currently in. Foreign key to civicrm_option_value. |
| priority_id | 數字(int unsigned) | 10 | >= 0 |  | ID of the priority given to this activity. Foreign key to civicrm_option_value. |
| parent_id | 數字(int unsigned) | 10 | >= 0 |  | Parent meeting ID (if this is a follow-up item). This is not currently implemented |
| is_test | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| medium_id | 數字(int unsigned) | 10 | >= 0 | 預設值: NULL | Activity Medium, Implicit FK to civicrm_option_value where option_group = encounter_medium. |
| is_auto | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |
| relationship_id | 數字(int unsigned) | 10 | >= 0 | 預設值: NULL | FK to Relationship ID |
| is_current_revision | 布林值(boolean) | 1 | 0 or 1 | 預設值: 1 |  |
| original_id | 數字(int unsigned) | 10 | >= 0 |  | Activity ID of the first activity record in versioning chain. |
| result | 字串(varchar) | 255 |  |  | Currently being used to store result id for survey activity, FK to option value. |
| is_deleted | 布林值(boolean) | 1 | 0 or 1 | 預設值: 0 |  |


## Activity Create API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Activity&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
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
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Activity&action=get&pretty=1&json={"source_contact_id":1,"activity_type_id":"43","subject":"test activity type id","activity_date_time":"2011-06-02 14:36:13","status_id":2,"priority_id":1,"duration":120,"location":"Pensulvania","details":"a test activity"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"source_contact_id":1,"activity_type_id":"43","subject":"test activity type id","activity_date_time":"2011-06-02 14:36:13","status_id":2,"priority_id":1,"duration":120,"location":"Pensulvania","details":"a test activity"}' \
  '<entrypoint>?entity=Activity&action=create'
```

### 回傳範例
```
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
```

## Activity Get API

### 傳送範例
#### HTTP Method
```
GET
```

#### Request URL
```
<entrypoint>?entity=Activity&action=get&json={"source_contact_id":54,"activity_type_id":"45","subject":"test activity type id","activity_date_time":"2011-06-02 14:36:13","status_id":2,"priority_id":1,"duration":120,"location":"Pensulvania","details":"a test activity"}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Activity&action=get&pretty=1&json={"source_contact_id":54,"activity_type_id":"45","subject":"test activity type id","activity_date_time":"2011-06-02 14:36:13","status_id":2,"priority_id":1,"duration":120,"location":"Pensulvania","details":"a test activity"}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  '<entrypoint>?entity=Activity&action=get&json='
```

### 回傳範例
```
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
```

## Activity Update API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Activity&action=create
```

#### Request Content Type
```
application/json
```

#### Request body
```
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
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Activity&action=create&pretty=1&json={"id":22,"subject":"Updated Make-it-Happen Meeting","duration":120,"location":"21, Park Avenue","details":"Lets update Meeting","status_id":1,"activity_name":"Test activity type","priority_id":1}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":22,"subject":"Updated Make-it-Happen Meeting","duration":120,"location":"21, Park Avenue","details":"Lets update Meeting","status_id":1,"activity_name":"Test activity type","priority_id":1}' \
  '<entrypoint>?entity=Activity&action=create'
```

### 回傳範例
```
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
```

## Activity Delete API

### 傳送範例
#### HTTP Method
```
POST
```

#### Request URL
```
<entrypoint>?entity=Activity&action=delete
```

#### Request Content Type
```
application/json
```

#### Request body
```
{
    "id": 20
}
```

#### API Explorer
```
/civicrm/apibrowser#/civicrm/ajax/rest?entity=Activity&action=delete&pretty=1&json={"id":20}
```

#### curl Example
```
curl -g \
  --header 'x-civicrm-api-key: <secret-key>' \
  --header 'x-civicrm-site-key: <site-key>' \ 
  --header 'content-type: application/json' \
  --request POST \
  --data '{"id":20}' \
  '<entrypoint>?entity=Activity&action=delete'
```

### 回傳範例
```
{
    "is_error": 0,
    "version": 3,
    "count": 1,
    "values": 1
}
```