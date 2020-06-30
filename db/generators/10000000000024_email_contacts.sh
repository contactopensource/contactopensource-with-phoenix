#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  EmailContact email_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    address:text \
    display_name:text \
    addr_spec:text

echo yes | mix phx.gen.html --binary-id \
  Contactable EmailContact email_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    address:text \
    display_name:text \
    addr_spec:text

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Contactable EmailContact email_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    address:text \
    display_name:text \
    addr_spec:text
