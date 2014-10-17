require "rack"

run Proc.new { |env|
  status_code = env["SERVER_NAME"].split(".").first.to_i
  if status_code < 200 || status_code > 999
    [500, {}, ["That doesn't look like an HTTP code!"]]
  else
    [
      status_code,
      {},
      [status_code.to_s]
    ]
  end
}
