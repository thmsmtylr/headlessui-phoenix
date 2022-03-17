function withOpacityValue(variable) {
  return ({ opacityValue }) => {
    if (opacityValue === undefined) {
      return `rgb(var(${variable}))`;
    }
    return `rgb(var(${variable}) / ${opacityValue})`;
  };
}

// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/*_web.ex",
    "../lib/*_web/**/*.*ex",
    "../lib/emry/emry_components/**/*.*ex",
  ],
  theme: {
    extend: {
      colors: {
        primary: withOpacityValue("#7A28FF"),
      },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
