#!/bin/sh

mix phx.gen.html --binary-id \
  Data DateTimeRange date_time_ranges \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    start_as_timestamp_utc:naive_datetime \
    stop_as_timestamp_utc:naive_datetime \
    duration_as_seconds:decimal

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Data MediaType media_types \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    start_as_timestamp_utc:naive_datetime \
    stop_as_timestamp_utc:naive_datetime \
    duration_as_seconds:decimal
