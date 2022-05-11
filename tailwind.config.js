module.exports = {
  mode: "jit",
  purge: [
    './app/views/**/*.html.erb',
    './app/**/*/html.erb',
    './app/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/javascript/packs/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
