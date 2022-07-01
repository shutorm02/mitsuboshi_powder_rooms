const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const { DefinePlugin } = require('webpack')

environment.plugins.prepend(
    'VueLoaderPlugin',
    new VueLoaderPlugin()
)

environment.plugins.prepend(
  'Define',
  new DefinePlugin({
    __VUE_OPTIONS_API__: true,
    __VUE_PROD_DEVTOOLS__: false,
  })
)

environment.loaders.prepend('vue', {
    test: /\.vue$/,
    use: [{
        loader: 'vue-loader'
    }]
})
module.exports = environment
