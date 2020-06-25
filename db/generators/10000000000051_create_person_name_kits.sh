#!/bin/sh

mix phx.gen.html --binary-id \
  Concept PersonNameKit person_name_kits \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    locale_id:uuid \
    given_name:text \
    given_name_phonetic:text \
    middle_name:text \
    middle_name_phonetic:text \
    family_name:text \
    family_name_phonetic:text \
    legal_name:text \
    legal_name_phonetic:text \
    prefix_name:text \
    prefix_name_phonetic:text \
    suffix_name:text \
    suffix_name_phonetic:text \
    salutation_name:text \
    salutation_name_phonetic:text \
    addressee_name:text \
    addressee_name_phonetic:text \
    nickname:text \
    nickname_phonetic:text

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Concept PersonNameKit person_name_kits \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    locale_id:uuid \
    given_name:text \
    given_name_phonetic:text \
    middle_name:text \
    middle_name_phonetic:text \
    family_name:text \
    family_name_phonetic:text \
    legal_name:text \
    legal_name_phonetic:text \
    prefix_name:text \
    prefix_name_phonetic:text \
    suffix_name:text \
    suffix_name_phonetic:text \
    salutation_name:text \
    salutation_name_phonetic:text \
    addressee_name:text \
    addressee_name_phonetic:text \
    nickname:text \
    nickname_phonetic:text
