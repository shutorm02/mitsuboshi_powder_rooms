module.exports = {
  purge: [
    './app/views/**/*.{html,html.erb,erb}',
    './app/javascript/components/**/*.{vue,js,ts}',
    './app/javascript/**/*.{vue,js,ts}',
    './app/**/*.{vue,js,ts}',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'thema': '#FFF5E9',
        'fitting-pink': '#EABEBF',
        'powder-pink': '#D6A3DC',
        'baby-blue': '#A5DEE5',
        'twitter-blue': '#1DA1F2',
        'mitsuboshi-blue': '#75CCE8',
        'mitsuboshi-yellow': '#F7DB70',
        'mitsuboshi-gray': '#E5E5E5',
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
