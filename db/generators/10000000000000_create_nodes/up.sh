mix phx.gen.html --binary-id  Graph Node nodes \
  tenant_id:uuid \
  type_uri:text \
  type_text:text \
  state_uri:text \
  state_text:text \
  updated_at_timestamp_utc:naive_datetime \
  updated_at_clock_count:integer \
  updated_by_text:text \
  text:text \
  json:map \
  xml:text \
  number:decimal 

mix phx.gen.json --binary-id  Graph Node nodes --web Api --no-context --no-schema \
  tenant_id:uuid \
  type_uri:text \
  type_text:text \
  state_uri:text \
  state_text:text \
  updated_at_timestamp_utc:naive_datetime \
  updated_at_clock_count:integer \
  updated_by_text:text \
  text:text \
  json:map \
  xml:text \
  number:decimal 
