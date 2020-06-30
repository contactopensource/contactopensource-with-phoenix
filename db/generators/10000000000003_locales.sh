#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  Locale locales \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    text:text \
    language_code:text \
    country_code:text \
    script_code:text \
    region_code:text \
    variant_code:text \
    decimal_separator:text \
    grouping_separator:text \
    currency_code:text \
    currency_symbol:text \
    quotation_start_delimiter:text \
    quotation_stop_delimiter:text 

echo yes | mix phx.gen.html --binary-id \
  Data Locale locales \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    text:text \
    language_code:text \
    country_code:text \
    script_code:text \
    region_code:text \
    variant_code:text \
    decimal_separator:text \
    grouping_separator:text \
    currency_code:text \
    currency_symbol:text \
    quotation_start_delimiter:text \
    quotation_stop_delimiter:text 

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Data Locale locales \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    text:text \
    language_code:text \
    country_code:text \
    script_code:text \
    region_code:text \
    variant_code:text \
    decimal_separator:text \
    grouping_separator:text \
    currency_code:text \
    currency_symbol:text \
    quotation_start_delimiter:text \
    quotation_stop_delimiter:text 
