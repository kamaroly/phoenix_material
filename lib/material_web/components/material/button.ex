defmodule MaterialWeb.Material.Button do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  def button(%{"variant" => "filled"} =assigns) do
    ~H"""
      <button
      class="bg-gray-900 text-white shadow-md shadow-gray-900/10 hover:shadow-lg hover:shadow-gray-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none"
      type="button" style="position: relative; overflow: hidden;">filled</button>
    """
  end

  def button(%{"variant" => "gradient"} = assigns) do
    ~H"""
     <button
       class="bg-gradient-to-tr from-gray-900 to-gray-800 text-white shadow-md shadow-gray-900/10 hover:shadow-lg hover:shadow-gray-900/20 active:opacity-[0.85]"
       type="button">gradient</button>
    """
  end
  def button(%{"variant" => "outlined"} = assigns) do
    ~H"""
    <button
      class="border border-gray-900 text-gray-900 hover:opacity-75 focus:ring focus:ring-gray-300 active:opacity-[0.85]"
      type="button" style="position: relative; overflow: hidden;">outlined</button>
    """
  end
  def button(%{"variant" => "outlined"} = assigns) do
    ~H"""
      <button
      class="text-gray-900 hover:bg-gray-900/10 active:bg-gray-900/20"
      type="button">text</button>
    """
  end


  def button(assigns) do

    IO.inspect(assigns)
    ~H"""
      <button
        class="align-middle select-none font-sans font-bold text-center uppercase transition-all disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none text-xs py-3 px-6 rounded-lg"
      >
       Another Button
      </button>
    """
  end
end
