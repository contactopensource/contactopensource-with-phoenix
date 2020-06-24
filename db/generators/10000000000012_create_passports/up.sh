#!/bin/sh

mix phx.gen.html --binary-id \
  PassportContact passport_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    country_text:text \
    number_text:text \
    valid_start_date:date \
    valid_stop_date:date

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  PassportContact passport_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    country_text:text \
    number_text:text \
    valid_start_date:date \
    valid_stop_date:date
