defmodule Phoenix.HTML.SimplifiedHelpers.Router do
  use Phoenix.Router

  pipeline :browser do
    plug(:accepts, ~w(html))
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
  end

  pipeline :api do
    plug(:accepts, ~w(json))
  end

  scope "/", Phoenix.HTML.SimplifiedHelpers do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", HomeController, :index)

    scope "/release" do
      get("/:alias", EntryController, :release)
      get("/", EntryController, :release)
    end
  end
end

ExUnit.start()
