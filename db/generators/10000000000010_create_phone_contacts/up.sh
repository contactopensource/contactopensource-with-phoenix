#!/bin/sh

mix phx.gen.html --binary-id \
  PhoneContact phone_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    number_text:text \
    e164_text varchar(15) \
    e164_country_code varchar(3) \
    e164_national_destination_code varchar(13) \
    e164_group_identification_code varchar(4) \
    e164_trial_identification_code varchar(3) \
    e164_subscriber_number varchar(14)

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  PhoneContact phone_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    number_text:text \
    e164_text varchar(15) \
    e164_country_code varchar(3) \
    e164_national_destination_code varchar(13) \
    e164_group_identification_code varchar(4) \
    e164_trial_identification_code varchar(3) \
    e164_subscriber_number varchar(14)
