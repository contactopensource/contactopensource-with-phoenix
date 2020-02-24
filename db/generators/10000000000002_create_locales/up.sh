mix phx.gen.html Data Locale locales \
  tenant_id:uuid \
  type_uri:text \
  type_text:text \
  state_uri:text \
  state_text:text \
  updated_at_timestamp_utc:naive_datetime \
  updated_at_clock_count:integer \
  updated_by_text:text \
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

mix phx.gen.json Data Locale locales --web Api --no-context --no-schema \
  tenant_id:uuid \
  type_uri:text \
  type_text:text \
  state_uri:text \
  state_text:text \
  updated_at_timestamp_utc:naive_datetime \
  updated_at_clock_count:integer \
  updated_by_text:text \
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
