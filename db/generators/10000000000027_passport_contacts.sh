#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  PassportContact passport_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
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

echo yes | mix phx.gen.html --binary-id \
  Contactable PassportContact passport_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
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

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Contactable PassportContact passport_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
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
