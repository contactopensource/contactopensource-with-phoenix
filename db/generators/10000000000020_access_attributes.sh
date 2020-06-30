#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  AccessAttribute access_attributes \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    key: text \
    name: text

echo yes | mix phx.gen.html --binary-id \
  Access AccessAttribute access_attributes \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    key: text \
    name: text

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Access AccessAttribute access_attributes \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    key: text \
    name: text
