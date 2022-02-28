defmodule EmryComponents.ButtonTest do
  use ComponentCase
  import EmryComponents.Button

  test "button" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button />
      """)

    assert html =~ "<button"
    assert html =~ ~s{type="button"}
  end

  test "button type" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button type="submit" />
      """)

    assert html =~ ~s{type="submit"}
  end

  test "button label" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button label="label" />
      """)

    assert html =~ "label"
  end

  test "button slot" do
  end

  test "button disabled" do
  end

  test "button unstyled" do
  end

  test "button sizes" do
  end

  test "button dark mode" do
  end
end
