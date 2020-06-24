#!/bin/sh

mix phx.gen.html --binary-id \
  Concept Person persons \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    name:text

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Concept Person persons \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    name:text
