#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  MediaType media_types \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    text:text \
    supertype:text \
    subtype:text \
    tree:text \
    suffix:text \
    parameter_text:text

echo yes | mix phx.gen.html --binary-id \
  Data MediaType media_types \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    text:text \
    supertype:text \
    subtype:text \
    tree:text \
    suffix:text \
    parameter_text:text

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Data MediaType media_types \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    text:text \
    supertype:text \
    subtype:text \
    tree:text \
    suffix:text \
    parameter_text:text
