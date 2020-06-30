#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  PostalContact postal_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    freeform:text \
    country_text:text \
    region_text:text \
    locality_text:text \
    neighborhood_text:text \
    postal_code_text:text \
    street_address_text:text \
    premise_address_text:text \
    global_location_number_text:text

echo yes | mix phx.gen.html --binary-id \
  Contactable PostalContact postal_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    freeform:text \
    country_text:text \
    region_text:text \
    locality_text:text \
    neighborhood_text:text \
    postal_code_text:text \
    street_address_text:text \
    premise_address_text:text \
    global_location_number_text:text

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Contactable PostalContact postal_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    freeform:text \
    country_text:text \
    region_text:text \
    locality_text:text \
    neighborhood_text:text \
    postal_code_text:text \
    street_address_text:text \
    premise_address_text:text \
    global_location_number_text:text
