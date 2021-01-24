 path = require('path');
 fs = require('fs')

 /**
  * Custom config for watchman-processor (https://github.com/markis/watchman-processor)
  * With this custom config we supply a command line argument to define the product(s) to watch.
  * 
  * To get started, first install watchman-processor:
  *   `$ brew update`
  *   `$ brew install watchman`
  *   `$ npm install watchman-processor -g`
  * 
  * Then start using this config by placing this config file in your home dir.
  * Next, run watchman-processor and pass a command-line argument containing your products:
  * Example usage: `$ subs=<myProduct> base=<baseProjectsFolderName> server=<serverName> watchman-processor`
  * 
  * subs: a subscription represents the top level folder containing your project. This can be a comma separated
  *       list of projects if you wish to watch more than one folder, example: subs=myWebProject,myApiProject
  * 
  * base: the base directory path that contains all your projects
  * 
  * server: this can be the server name (from your ssh config file) or the [user@]hostAddress
  * 
  * suffix (optional): we check if product is found at BASE_DIR/myProduct_suffix
                       and if not there then we check if it is found at BASE_DIR/myProduct
  * 
  */ 

const BASE_DIR = process.env.base;
const finalServerPath = process.env.server;
const SUBS = process.env['subs'].split(',');
const HOME_FOLDER = process.env['HOME'];
const suffix = process.env['suffix'];

if (!BASE_DIR || !finalServerPath || SUBS.length === 0 || !HOME_FOLDER) {
  console.log(`Unable to start. Required env variables:
    \n - base: ${BASE_DIR}
    \n - server: ${finalServerPath}
    \n - subs[]]: ${SUBS}
    \n - HOME: ${HOME_FOLDER}
    \n - [suffix]: ${suffix}
   `);
  process.exit();
}

const SUFFIX = '_trunk';
const IGNORE_FOLDERS = [
  'node_modules',
  'build',
  'tmp',
  '.gradle',
  'dist',
  '.idea',
  'logs',
  'i18n',
  '.eyeglass_cache',
  'bower_components',
  'pemberly',
  '.pemberlyrc',
  '.pemberly-serve',
  '.public',
  'public',
  'var',
];

// a command line list of products
const subscriptions= {};

SUBS.forEach((productName) => {
  // check if the product requires the SUFFIX
  const useSuffix = !!suffix && fs.existsSync(`${BASE_DIR}/${productName}${SUFFIX}/`);
  const productDir = useSuffix ? `${BASE_DIR}/${productName}${SUFFIX}/` : `${BASE_DIR}/${productName}/`;
  if (!fs.existsSync(`${BASE_DIR}/${productName}/`)) {
    console.log(`path not valid for ${productName} at ${BASE_DIR}/${productName}${SUFFIX} or ${BASE_DIR}/${productName}`);
    process.exit();
  } 

  subscriptions[productName] = {
    type: 'rsync',
    source: path.join(HOME_FOLDER, `${productDir}/`),
    destination: `${finalServerPath}:~/${productDir}/`,
    ignoreFolders: IGNORE_FOLDERS
  }
});

module.exports = {
  debug: true,
  emoji: true,
  controlWatchman: true,
  rsyncCmd: 'rsync',
  maxFileLength: 100,
  subscriptions
};
