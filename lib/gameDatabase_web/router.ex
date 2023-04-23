defmodule GameDatabaseWeb.Router do
  use GameDatabaseWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {GameDatabaseWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GameDatabaseWeb do
    pipe_through :browser

    live "/brands", BrandLive.Index, :index
    live "/brands/new", BrandLive.Index, :new
    live "/brands/:id/edit", BrandLive.Index, :edit

    live "/brands/:id", BrandLive.Show, :show
    live "/brands/:id/show/edit", BrandLive.Show, :edit

    live "/primary_operating_systems", Primary_Operating_SystemLive.Index, :index
    live "/primary_operating_systems/new", Primary_Operating_SystemLive.Index, :new
    live "/primary_operating_systems/:id/edit", Primary_Operating_SystemLive.Index, :edit

    live "/primary_operating_systems/:id", Primary_Operating_SystemLive.Show, :show
    live "/primary_operating_systems/:id/show/edit", Primary_Operating_SystemLive.Show, :edit

    live "/games", GameLive.Index, :index
    live "/games/new", GameLive.Index, :new
    live "/games/:id/edit", GameLive.Index, :edit

    live "/games/:id", GameLive.Show, :show
    live "/games/:id/show/edit", GameLive.Show, :edit

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", GameDatabaseWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:gameDatabase, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: GameDatabaseWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
