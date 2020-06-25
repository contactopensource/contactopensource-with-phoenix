#!/bin/sh

mix phx.gen.html --binary-id \
  Data Tag tags \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    set_id:uuid \
    parent_id:uuid \
    text:text \
    description:text

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Data Tag tags \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    set_id:uuid \
    parent_id:uuid \
    text:text \
    description:text
