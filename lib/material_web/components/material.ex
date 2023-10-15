defmodule MaterialWeb.Material do
  alias __MODULE__
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  # AVATAR

  attr :src, :string, required: true
  attr :alt, :string, default: nil
  attr :class, :string, default: nil
  def avatar(%{variant: "square"} = assigns) do
    ~H"""
      <Material.avatar src={@src} alt={@alt}
        class="inline-block relative object-cover object-center !rounded-none w-12 h-12 rounded-lg" />
    """
  end
  def avatar(%{variant: "rounded"} = assigns) do
    ~H"""
      <Material.avatar src={@src} alt={@alt}
        class="inline-block relative object-cover object-center w-12 h-12 rounded-lg" />
    """
  end
  def avatar(assigns) do
    ~H"""
      <img src={@src} alt={@alt}
           class={["inline-block relative object-cover object-center !rounded-full w-12 h-12 rounded-lg", @class]} />
    """
  end

  # BUTTONS SECTION
  attr :type, :string, default: nil
  attr :class, :string, default: nil
  attr :grouped, :boolean, default: false
  attr :color, :string, default: "gray"
  attr :rest, :global, include: ~w(disabled form name value)
  attr :variant, :string, default: nil
  slot :inner_block, required: true
  def button(%{variant: "filled"} =assigns) do
    ~H"""
      <Material.button
        class={"align-middle select-none font-sans font-bold text-center uppercase transition-all disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none text-xs py-3 px-6 rounded-lg bg-#{@color}-900 text-white shadow-md shadow-#{@color}-900/10 hover:shadow-lg hover:shadow-#{@color}-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none"}
        type={@type}>
        <%= render_slot(@inner_block) %>
      </Material.button>
    """
  end
  def button(%{variant: "gradient"} = assigns) do
    ~H"""
     <Material.button
       class={"bg-gradient-to-tr from-#{@color}-900 to-#{@color}-800 text-white shadow-md shadow-#{@color}-900/10 hover:shadow-lg hover:shadow-#{@color}-900/20 active:opacity-[0.85]"}
       type={@type}>
        <%= render_slot(@inner_block) %>
      </Material.button>
    """
  end
  def button(%{variant: "outlined"} = assigns) do
    ~H"""
    <Material.button
      class={"border border-#{@color}-900 text-#{@color}-900 hover:opacity-75 focus:ring focus:ring-#{@color}-300 active:opacity-[0.85]"}
      type={@type} >
        <%= render_slot(@inner_block) %>
      </Material.button>
    """
  end
  def button(%{variant: "text"} = assigns) do
    ~H"""
      <Material.button
        class={["text-#{@color}-900 hover:bg-#{@color}-900/10 active:bg-#{@color}-900/20", @class]}
      >
        <%= render_slot(@inner_block) %>
      </Material.button>
    """
  end

  def button(assigns) do
    ~H"""
      <button
        class={[
          "flex items-center gap-3 align-middle select-none font-sans font-bold text-center uppercase transition-all disabled:opacity-50",
          "disabled:shadow-none disabled:pointer-events-none text-xs py-3 px-6 rounded-lg",
          @class
          ]}
        {@rest}

        style="position: relative; overflow: hidden;"
      >
       <%= render_slot(@inner_block) %>
      </button>
    """
  end

  # INPUT SECTION
  def input(assigns) do
    ~H"""
    <div class="relative w-full min-w-[200px] h-10">
        <input
        class="peer w-full h-full bg-transparent text-blue-gray-700 font-sans font-normal outline outline-0 focus:outline-0 disabled:bg-blue-gray-50 disabled:border-0 transition-all placeholder-shown:border placeholder-shown:border-blue-gray-200 placeholder-shown:border-t-blue-gray-200 border focus:border-2 border-t-transparent focus:border-t-transparent text-sm px-3 py-2.5 rounded-[7px] border-blue-gray-200 focus:border-gray-900"
        placeholder=" ">

        </div>
    """
  end

  slot :inner_block, required: true
  def label(assigns) do
    ~H"""
    <label
        class={["flex w-full h-full select-none pointer-events-none absolute left-0 font-normal",
              "!overflow-visible truncate peer-placeholder-shown:text-blue-gray-500 leading-tight",
              "peer-focus:leading-tight peer-disabled:text-transparent peer-disabled:peer-placeholder-shown:text-blue-gray-500",
              "transition-all -top-1.5 peer-placeholder-shown:text-sm text-[11px] peer-focus:text-[11px]",
              "before:content[' '] before:block before:box-border before:w-2.5 before:h-1.5 before:mt-[6.5px]",
              "before:mr-1 peer-placeholder-shown:before:border-transparent before:rounded-tl-md before:border-t",
              "peer-focus:before:border-t-2 before:border-l peer-focus:before:border-l-2 before:pointer-events-none",
              "before:transition-all peer-disabled:before:border-transparent after:content[' '] after:block after:flex-grow",
              "after:box-border after:w-2.5 after:h-1.5 after:mt-[6.5px] after:ml-1 peer-placeholder-shown:after:border-transparent",
              "after:rounded-tr-md after:border-t peer-focus:after:border-t-2 after:border-r peer-focus:after:border-r-2 after:pointer-events-none",
              "after:transition-all peer-disabled:after:border-transparent peer-placeholder-shown:leading-[3.75] text-gray-500 peer-focus:text-gray-900",
              "before:border-blue-gray-200 peer-focus:before:!border-gray-900 after:border-blue-gray-200 peer-focus:after:!border-gray-900"
              ]}>
        <%= render_slot(@inner_block) %>
      </label>
    """
  end
end
