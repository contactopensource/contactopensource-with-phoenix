#!/bin/sh

mix phx.gen.html --binary-id \
  PostalContact postal_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    country_id:uuid \
    country_text:text \
    region_id:uuid \
    region_text:text \
    locality_id:uuid \
    locality_text:text \
    neighborhood_id:uuid \
    neighborhood_text:text, \
    postal_code_id:uuid \
    postal_code_text:text \
    street_address_id:uuid \
    street_address_text:text \
    premise_address_id:uuid \
    premise_address_text:text \
    global_location_number_id:uuid \
    global_location_number_text:text

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  PostalContact postal_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    country_id:uuid \
    country_text:text \
    region_id:uuid \
    region_text:text \
    locality_id:uuid \
    locality_text:text \
    neighborhood_id:uuid \
    neighborhood_text:text, \
    postal_code_id:uuid \
    postal_code_text:text \
    street_address_id:uuid \
    street_address_text:text \
    premise_address_id:uuid \
    premise_address_text:text \
    global_location_number_id:uuid \
    global_location_number_text:text
