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
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button><span></span></.button>
      """)

    assert html =~ "<span"
  end

  test "button disabled" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button disabled={true} />
      """)

    assert html =~ ~s{disabled}
  end

  test "button variant default" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button />
      """)

    assert html =~ "inline-flex items-center px-6 py-3"
  end

  test "button custom styles" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button variant="custom" classnames="arbitrary classes" />
      """)

    assert html =~ "arbitrary classes"
  end

  test "button sizes" do
  end

  test "button dark mode" do
  end
end
