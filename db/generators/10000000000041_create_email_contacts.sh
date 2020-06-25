#!/bin/sh

mix phx.gen.html --binary-id \
  Contactable EmailContact email_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    address:text \
    display_name:text \
    addr_spec:text

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Contactable EmailContact email_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    address:text \
    display_name:text \
    addr_spec:text
