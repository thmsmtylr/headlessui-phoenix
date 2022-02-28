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
    assert html =~ "disabled:cursor-not-allowed opacity-65"
  end

  test "button variant default" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button />
      """)

    assert html =~ "inline-flex items-center px-6 py-3"
  end

  test "custom button variant without classnames" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button variant="custom" classnames="" />
      """)

      assert html =~ ~s{class=""}
  end

  test "custom button variant with classnames" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <.button variant="custom" classnames="custom-button-class" />
      """)

      assert html =~ ~s{class="custom-button-class"}
  end

  test "button sizes" do
  end

  test "button dark mode" do
  end
end
