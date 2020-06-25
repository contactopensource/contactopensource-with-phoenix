#!/bin/sh

mix phx.gen.html --binary-id \
  Graph Node nodes \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    text:text \
    json:map \
    xml:text \
    number:decimal 

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Graph Node nodes \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    text:text \
    json:map \
    xml:text \
    number:decimal 
