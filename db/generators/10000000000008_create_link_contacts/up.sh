#!/bin/sh

mix phx.gen.html --binary-id \
  Contactable LinkContact link_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    uri:text \
    locale:uuid \
    media_type:uuid

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Contactable LinkContact link_contacts \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    label:text \
    uri:text \
    locale:uuid \
    media_type:uuid
