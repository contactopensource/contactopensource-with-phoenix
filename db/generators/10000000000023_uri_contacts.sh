#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  UriContact uri_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    uri:text \
    locale_id:uuid \
    media_type_id:uuid

echo yes | mix phx.gen.html --binary-id \
  Contactable UriContact uri_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    uri:text \
    locale_id:uuid \
    media_type_id:uuid

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Contactable UriContact uri_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    uri:text \
    locale_id:uuid \
    media_type_id:uuid
