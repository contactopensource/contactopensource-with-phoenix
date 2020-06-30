#!/bin/sh

mix phx.gen.html --binary-id \
  Contactable PhoneContact phone_contacts \
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

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Contactable PhoneContact phone_contacts \
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
