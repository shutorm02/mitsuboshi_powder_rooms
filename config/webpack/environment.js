const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } =require('vue-loader')

environment.plugins.prepend(
    'VueLoaderPlugin',
    new VueLoaderPlugin()
)

environment.loaders.prepend('vue', {
    test: /\.vue$\,
    user: [{
        loader: 'vue-loader'
    }]
]}

module.exports = environment
