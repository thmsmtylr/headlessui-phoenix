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
    "../lib/**/*.ex",
    "../lib/**/*.leex",
    "../lib/**/*.heex",
    "../lib/**/*.eex",
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
