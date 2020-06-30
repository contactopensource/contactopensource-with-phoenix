#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  PhoneContact phone_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    number_text:text \
    e164_text:text \
    e164_country_code:text \
    e164_national_destination_code:text \
    e164_group_identification_code:text \
    e164_trial_identification_code:text \
    e164_subscriber_number:text

echo yes | mix phx.gen.html --binary-id \
  Contactable PhoneContact phone_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    number_text:text \
    e164_text:text \
    e164_country_code:text \
    e164_national_destination_code:text \
    e164_group_identification_code:text \
    e164_trial_identification_code:text \
    e164_subscriber_number:text

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Contactable PhoneContact phone_contacts \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    number_text:text \
    e164_text:text \
    e164_country_code:text \
    e164_national_destination_code:text \
    e164_group_identification_code:text \
    e164_trial_identification_code:text \
    e164_subscriber_number:text
