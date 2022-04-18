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
        primary: "#7A28FF",
        secondary: "#9f17f2",
        black: "#060606",
      },
      backgroundImage: {
        "gradient-hero": "var(--gradient-hero)",
      },
      animation: {
        tilt: "tilt 10s infinite linear",
      },
      keyframes: {
        tilt: {
          "0%, 50%, 100%": {
            transform: "rotate(3deg)",
          },
          "25%": {
            transform: "rotate(3.5deg)",
          },
          "75%": {
            transform: "rotate(-1.5deg)",
          },
        },
      },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
