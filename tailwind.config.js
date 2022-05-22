module.exports = {
  mode: "jit",
  purge: [
    './app/views/**/*.html.erb',
    './app/views/**/*.html.haml',
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
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
