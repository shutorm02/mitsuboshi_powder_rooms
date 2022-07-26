module.exports = {
  purge: [
    './app/views/**/*.{html,html.erb,erb}',
    './app/javascript/components/**/*.{vue,js,ts}',
    './app/javascript/**/*.{vue,js,ts}',
    './app/**/*.{vue,js,ts}',
  ],
  darkMode: false, // or 'media' or 'class'
  safelist: [
    'powder-pink',
    'baby-pink',
    'fitting-pink',
    'mitsuboshi-gray',
    'alert-success',
    'alert-info',
    'alert-warning',
    'alert-danger',
  ],
  theme: {
    extend: {
      fontFamily: {
        josefin: ['Josefin Sans', 'sans-serif'],
        yusei: ['Yusei Magic', 'sans-serif'],
      },
      colors: {
        'base-color': '#FFF5E9',
        'fitting-pink': '#EABEBF',
        'fitting-pink-hover': '#EEB2B4',
        'powder-pink': '#D6A3DC',
        'baby-blue': '#A5DEE5',
        'twitter-blue': '#1DA1F2',
        'mitsuboshi-blue': '#75CCE8',
        'mitsuboshi-yellow': '#F7DB70',
        'mitsuboshi-gray': '#E5E5E5',
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
