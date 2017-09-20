var config = {
   entry: './main.js',
   
   output: {
      path:'/',
      filename: 'index.js',
   },
   
   devServer: {
      inline: true,
      port: 1442,
      proxy: {
         '*': { target: 'http://13.90.196.105:1442'}
      }
   },
   
   module: {
      loaders: [
         {
            test: /\.jsx?$/,
            exclude: /node_modules/,
            loader: 'babel-loader',
            
            query: {
               presets: ['es2015', 'react']
            }
         }
      ]
   }
}

module.exports = config;
