#!/bin/sh

mix phx.gen.html --binary-id \
  Concept Organization organizations \
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

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Concept Organization organizations \
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