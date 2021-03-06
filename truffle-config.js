// require('babel-register');
// require('babel-pollyfill');


module.exports = {
    networks: {
        development: {
            host: '127.0.0.1',
            port: '7545', //ganahce's default port
            // port: '9545', //truffle's default port
            network_id: '*' // connect to any network
        }
    },
    contracts_directory: './src/contracts',
    contracts_build_directory: './src/truffle_apis',
    compilers: {
        solc: {
            version: '^0.5.0',
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    }
}