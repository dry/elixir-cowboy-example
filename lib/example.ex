defmodule Example do
  @behaviour :application

  def start do
    start_app :lager
    start_app :cowboy
    start_app :example
    start :undefined, []
  end

  def stop(_state) do
    stop_app :example
    stop_app :cowboy
    stop_app :lager
    :ok
  end

  def exit do
    stop(:ok)
    System.halt(0)
  end

  def start(_type, _args) do
    dispatch = [{:_, [
      {[], Handlers.Status, []},
    ]}]
    :cowboy.start_listener :example_http_listener, 100,
    :cowboy_tcp_transport, [{:port, 8080}],
    :cowboy_http_protocol, [{:dispatch, dispatch}]

    ExampleSup.start_link
  end

  defp start_app(app) do
    _status = :application.start app
  end

  defp stop_app(app) do
    _status = :application.stop app
  end
end
