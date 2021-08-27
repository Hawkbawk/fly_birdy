defmodule FlyBirdyWeb.PageController do
  use FlyBirdyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
