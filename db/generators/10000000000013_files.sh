#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  File files \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    locale_id:uuid \
    media_type_id:uuid \
    codec_id:uuid \
    title:text \
    subtitle:text \
    summary:text \
    saga:text

echo yes | mix phx.gen.html --binary-id \
  Content File files \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    locale_id:uuid \
    media_type_id:uuid \
    codec_id:uuid \
    title:text \
    subtitle:text \
    summary:text \
    saga:text

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Content File files \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    locale_id:uuid \
    media_type_id:uuid \
    codec_id:uuid \
    title:text \
    subtitle:text \
    summary:text \
    saga:text