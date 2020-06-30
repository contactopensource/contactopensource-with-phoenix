#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  Codec codecs \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    set_id:uuid \
    parent_id:uuid \
    name:text \
    code:text \
    icon:text \
    link:text \
    note:text \
    creator_name:text \
    prefer_file_extension:text \
    prefer_media_type_id:uuid \
    lossy_flag:boolean \
    floss_flag:boolean \
    bit_rate:decimal \
    bit_rate_minimum:decimal \
    bit_rate_maximum:decimal \
    variable_bit_rate_flag:boolean \
    channel_count:integer \
    channel_count_minimum:integer \
    channel_count_maximum:integer \
    variable_channel_count_flag:boolean
    
echo yes | mix phx.gen.html --binary-id \
  Data Codec codecs \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    set_id:uuid \
    parent_id:uuid \
    name:text \
    code:text \
    icon:text \
    link:text \
    note:text \
    creator_name:text \
    prefer_file_extension:text \
    prefer_media_type_id:uuid \
    lossy_flag:boolean \
    floss_flag:boolean \
    bit_rate:decimal \
    bit_rate_minimum:decimal \
    bit_rate_maximum:decimal \
    variable_bit_rate_flag:boolean \
    channel_count:integer \
    channel_count_minimum:integer \
    channel_count_maximum:integer \
    variable_channel_count_flag:boolean
    
echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Data Codec codecs \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    set_id:uuid \
    parent_id:uuid \
    name:text \
    code:text \
    icon:text \
    link:text \
    note:text \
    creator_name:text \
    prefer_file_extension:text \
    prefer_media_type_id:uuid \
    lossy_flag:boolean \
    floss_flag:boolean \
    bit_rate:decimal \
    bit_rate_minimum:decimal \
    bit_rate_maximum:decimal \
    variable_bit_rate_flag:boolean \
    channel_count:integer \
    channel_count_minimum:integer \
    channel_count_maximum:integer \
    variable_channel_count_flag:boolean
