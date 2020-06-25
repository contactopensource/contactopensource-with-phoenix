#!/bin/sh

mix phx.gen.html --binary-id \
  Data MediaType media_types \
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

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Data MediaType media_types \
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
