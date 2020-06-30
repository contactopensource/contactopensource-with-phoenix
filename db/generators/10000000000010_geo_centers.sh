#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  GeoCenter geo_centers \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    center_as_geo_point_id:uuid \
    spread_as_meters:decimal

echo yes | mix phx.gen.html --binary-id \
  Geo GeoCenter geo_centers \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    center_as_geo_point_id:uuid \
    spread_as_meters:decimal

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Geo GeoCenter geo_centers \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    center_as_geo_point_id:uuid \
    spread_as_meters:decimal
