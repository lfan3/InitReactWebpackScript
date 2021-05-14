#!/bin/sh
# GLOBAL VARIALBE
## FRONTEND PACKAGES$
WEBPACK="webpack webpack-cli webpack-dev-server css-loader html-webpack-plugin @babel/plugin-proposal-class-properties file-loader"
BABEL="@babel/core @babel/polyfill @babel/preset-env @babel/preset-react babel-loader"
F_DEV_DEPENDENCIES="${WEBPACK} ${BABEL}"

ICONS="@fortawesome/fontawesome-svg-core @fortawesome/free-solid-svg-icons @fortawesome/react-fontawesome"
STYLE="bootstrap react-bootstrap"
REACT="prop-types react react-dom react-router-dom"
F_DEPENDENCIES="${ICONS} ${STYLE} ${REACT}"

## BACKEND PACKAGE
TYPESCRIPT="@types/express @types/node typescript"
TOOL="cors dotenv json-server"
B_DEV_DEPENDENCIES="${TYPESCRIPT} ${TOOL}"

EXPRESS="express express-form-data express-session"
MYSQL="mysql2"
BYCRYPT="bcrypt"
UUID="uuid"
PARSER="body-parser"
B_DEPENDENCIES="${BYCRYPT} ${UUID} ${PARSER} ${EXPRESS} ${MYSQL}"

#not forget the $ when we want to use MY_PROJECT
read -p "What is the project name?
" MY_PROJECT

mkdir $MY_PROJECT && cd $MY_PROJECT && mkdir Frontend && mkdir Backend
git init
# config webpack
cd ..
cp webpack.config.js $MY_PROJECT/Frontend/ && cd $MY_PROJECT/Frontend/
echo "which port you want to use for Front?"
read portF
sed -i "s/PORT/$portF/" webpack.config.js
# init npm
npm init -y
yarn add $F_DEV_DEPENDENCIES $F_DEPENDENCIES --dev

# Backend
cd ../Backend
npm init -y
touch router.js && mkdir app
yarn add $B_DEV_DEPENDENCIES $B_DEPENDENCIES --dev
echo "which port you want to use for Back?"
read portB
cp ../../server.js index.js
sed -i "s/PORT/$portB/" index.js




