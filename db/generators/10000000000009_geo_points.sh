#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  GeoPoint geo_points \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    latitude_as_decimal_degrees:decimal \
    longitude_as_decimal_degrees:decimal \
    altitude_agl_as_meters:decimal \
    altitude_msl_as_meters:decimal \
    elevation_agl_as_meters:decimal \
    elevation_msl_as_meters:decimal

echo yes | mix phx.gen.html --binary-id \
  Geo GeoPoint geo_points \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    latitude_as_decimal_degrees:decimal \
    longitude_as_decimal_degrees:decimal \
    altitude_agl_as_meters:decimal \
    altitude_msl_as_meters:decimal \
    elevation_agl_as_meters:decimal \
    elevation_msl_as_meters:decimal

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Geo GeoPoint geo_points \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    latitude_as_decimal_degrees:decimal \
    longitude_as_decimal_degrees:decimal \
    altitude_agl_as_meters:decimal \
    altitude_msl_as_meters:decimal \
    elevation_agl_as_meters:decimal \
    elevation_msl_as_meters:decimal
