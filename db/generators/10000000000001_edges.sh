#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  Edge edges \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    subject_uri:text \
    subject_database:text \
    subject_schema:text \
    subject_table:text \
    subject_id:uuid \
    predicate_uri:text \
    predicate_database:text \
    predicate_schema:text \
    predicate_table:text \
    predicate_id:uuid \
    object_uri:text \
    object_database:text \
    object_schema:text \
    object_table:text \
    object_id:uuid \
    start_at_timestamp_utc:naive_datetime \
    stop_at_timestamp_utc:naive_datetime \
    count:integer \
    weight:decimal \
    probability:decimal

echo yes | mix phx.gen.html --binary-id \
  Graph Edge edges \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    subject_uri:text \
    subject_database:text \
    subject_schema:text \
    subject_table:text \
    subject_id:uuid \
    predicate_uri:text \
    predicate_database:text \
    predicate_schema:text \
    predicate_table:text \
    predicate_id:uuid \
    object_uri:text \
    object_database:text \
    object_schema:text \
    object_table:text \
    object_id:uuid \
    start_at_timestamp_utc:naive_datetime \
    stop_at_timestamp_utc:naive_datetime \
    count:integer \
    weight:decimal \
    probability:decimal

echo yes | mix phx.gen.html --binary-id \
  Graph Edge edges \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    subject_uri:text \
    subject_database:text \
    subject_schema:text \
    subject_table:text \
    subject_id:uuid \
    predicate_uri:text \
    predicate_database:text \
    predicate_schema:text \
    predicate_table:text \
    predicate_id:uuid \
    object_uri:text \
    object_database:text \
    object_schema:text \
    object_table:text \
    object_id:uuid \
    start_at_timestamp_utc:naive_datetime \
    stop_at_timestamp_utc:naive_datetime \
    count:integer \
    weight:decimal \
    probability:decimal

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Graph Edge edges \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    subject_uri:text \
    subject_database:text \
    subject_schema:text \
    subject_table:text \
    subject_id:uuid \
    predicate_uri:text \
    predicate_database:text \
    predicate_schema:text \
    predicate_table:text \
    predicate_id:uuid \
    object_uri:text \
    object_database:text \
    object_schema:text \
    object_table:text \
    object_id:uuid \
    start_at_timestamp_utc:naive_datetime \
    stop_at_timestamp_utc:naive_datetime \
    count:integer \
    weight:decimal \
    probability:decimal
