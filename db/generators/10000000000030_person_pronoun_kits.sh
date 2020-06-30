#!/bin/sh

echo yes | mix phx.gen.schema --binary-id --migration \
  PersonPronounKit person_pronoun_kits \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    subject_pronoun:text \
    object_pronoun:text \
    dependent_possessive_pronoun:text \
    independent_possessive_pronoun:text \
    reflexive_pronoun:text \
    intensive_pronoun:text \
    disjunctive_pronoun:text

echo yes | mix phx.gen.html --binary-id \
  Person PersonPronounKit person_pronoun_kits \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    subject_pronoun:text \
    object_pronoun:text \
    dependent_possessive_pronoun:text \
    independent_possessive_pronoun:text \
    reflexive_pronoun:text \
    intensive_pronoun:text \
    disjunctive_pronoun:text

echo yes | mix phx.gen.json --binary-id --no-context --no-schema --web Api \
  Person PersonPronounKit person_pronoun_kits \
    created_at_timestamp_utc:naive_datetime \
    created_at_clock_count:integer \
    updated_at_timestamp_utc:naive_datetime \
    updated_at_clock_count:integer \
    updated_by_uri:text \
    tenant_uri:text \
    type_uri:text \
    state_uri:text \
    subject_pronoun:text \
    object_pronoun:text \
    dependent_possessive_pronoun:text \
    independent_possessive_pronoun:text \
    reflexive_pronoun:text \
    intensive_pronoun:text \
    disjunctive_pronoun:text
