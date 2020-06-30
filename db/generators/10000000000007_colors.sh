#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  Color colors \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    rgb_unit_interval_r:decimal \
    rgb_unit_interval_g:decimal \
    rgb_unit_interval_b:decimal \
    cymk_unit_interval_c:decimal \
    cymk_unit_interval_y:decimal \
    cymk_unit_interval_m:decimal \
    cymk_unit_interval_k:decimal \
    hex:text \
    html_color_name:text \
    x11_color_name:text \
    color_naming_system_name:text \
    pantone_matching_system_name:text

echo yes | mix phx.gen.html --binary-id \
  Qualia Color colors \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    rgb_unit_interval_r:decimal \
    rgb_unit_interval_g:decimal \
    rgb_unit_interval_b:decimal \
    cymk_unit_interval_c:decimal \
    cymk_unit_interval_y:decimal \
    cymk_unit_interval_m:decimal \
    cymk_unit_interval_k:decimal \
    hex:text \
    html_color_name:text \
    x11_color_name:text \
    color_naming_system_name:text \
    pantone_matching_system_name:text

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Qualia Color colors \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    rgb_unit_interval_r:decimal \
    rgb_unit_interval_g:decimal \
    rgb_unit_interval_b:decimal \
    cymk_unit_interval_c:decimal \
    cymk_unit_interval_y:decimal \
    cymk_unit_interval_m:decimal \
    cymk_unit_interval_k:decimal \
    hex:text \
    html_color_name:text \
    x11_color_name:text \
    color_naming_system_name:text \
    pantone_matching_system_name:text
