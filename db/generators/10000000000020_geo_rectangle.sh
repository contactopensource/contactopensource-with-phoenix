#!/bin/sh

mix phx.gen.html --binary-id \
  Geo GeoRectangle geo_rectangles \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    north_west_geo_point_id:uuid \
    south_east_geo_point_id:uuid

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Geo GeoRectangle geo_rectangles \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    north_west_geo_point_id:uuid \
    south_east_geo_point_id:uuid
