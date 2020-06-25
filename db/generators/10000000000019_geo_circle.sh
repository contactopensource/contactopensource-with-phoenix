#!/bin/sh

mix phx.gen.html --binary-id \
  Geo GeoCircle geo_circles \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    center_as_geo_point_id:uuid, \
    radius_as_meters:decimal

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Geo GeoCircle geo_circles \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    center_as_geo_point_id:uuid, \
    radius_as_meters:decimal
