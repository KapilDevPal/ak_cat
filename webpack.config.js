const path = require('path');

module.exports = {
  mode: 'development',
  entry: {
    'bx_block_god/app': './app/javascript/bx_block_god/app.jsx',
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, 'app/assets/builds'),
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env', '@babel/preset-react'],
          },
        },
      },
      {
        test: /\.css$/i,
        use: ['style-loader', 'css-loader'],
      },
    ],
  },
  resolve: {
    extensions: ['.js', '.jsx'],
  },
}; 