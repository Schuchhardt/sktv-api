# config/initializers/pg_search.rb
PgSearch.multisearch_options = {
  using: { tsearch: { any_word: true, prefix: true } }
  # ignoring: :accents
}