defmodule Qiita do
  use HTTPotion.Base
  def process_url(url) do
    "https://qiita.com/api/v1/" <> url
  end

  def process_response_body(body) do
    json = :jsx.decode to_string(body)
    atomize_keys_json = Enum.map json, fn ({k,v}) -> { binary_to_atom(k), v } end
    :orddict.from_list atomize_keys_json
  end
end
