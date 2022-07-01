module.exports = {
  purge: [
    './app/views/**/*.{html,html.erb,erb}',
    './app/javascript/components/**/*.{vue,js,ts}',
    './app/javascript/**/*.{vue,js,ts}',
    './app/**/*.{vue,js,ts}',
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
