#!/bin/sh

mix phx.gen.html --binary-id \
  Person PersonPronounKit person_pronoun_kits \
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

mix phx.gen.json --binary-id --web Api --no-context --no-schema \
  Person PersonPronounKit person_pronoun_kits \
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
