#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  Offer offers \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    title:text \
    subtitle:text \
    summary:text \
    saga:text

echo yes | mix phx.gen.html --binary-id \
  Concept Offer offers \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    title:text \
    subtitle:text \
    summary:text \
    saga:text

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Concept Offer offers \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    title:text \
    subtitle:text \
    summary:text \
    saga:text
