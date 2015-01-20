Geocoder.configure(
  timeout: 30,

  lookup: :google,

  ip_lookup: :telize,

  language: :en,

  http_headers: {},

  use_https: false,

  http_proxy: nil,

  https_proxy: nil,

  api_key: nil,

  cache: nil,

  cache_prefix: "geocoder:",

  units: :mi,

  distances: :linear
)
