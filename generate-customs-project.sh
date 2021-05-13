#!/bin/sh
# GLOBAL VARIALBE
## FRONTEND PACKAGES$
WEBPACK="webpack webpack-cli webpack-dev-server css-loader html-webpack-plugin @babel/plugin-proposal-class-properties file-loader"
BABEL="@babel/core @babel/polyfill @babel/preset-env @babel/preset-react babel-loader"
F_DEV_DEPENDENCIES="${WEBPACK} ${BABEL}"

ICONS="@fortawesome/fontawesome-svg-core @fortawesome/free-solid-svg-icons @fortawesome/react-fontawesome"
STYLE="bootstrap react-bootstrap"
REACT="prop-types react react-dom react-router-dom"
SOCKET="socket.io-client"
F_DEPENDENCIES="${ICONS} ${STYLE} ${REACT} ${SOCKET}"

## BACKEND PACKAGE
TYPESCRIPT="@types/express @types/node typescript"
TOOL="cors dotenv json-server"
B_DEV_DEPENDENCIES="${TYPESCRIPT} ${TOOL}"

EXPRESS="express express-form-data express-session"
MYSQL="mysql2"
SOCKET="socket.io"
BYCRYPT="bcrypt"
UUID="uuid"
PARSER="body-parser"
B_DEPENDENCIES="${BYCRYPT} ${UUID} ${PARSER} ${EXPRESS} ${MYSQL} ${SOCKET}"

#not forget the $ when we want to use MY_PROJECT
read -p "What is the project name?
" MY_PROJECT

mkdir $MY_PROJECT && cd $MY_PROJECT && mkdir Frontend && mkdir Backend
git init

# Frontend
cd Frontend
npm init -y
#yarn add $F_DEV_DEPENDENCIES $F_DEPENDENCIES --dev

# Backend
cd ../Backend
npm init -y
#yarn add $B_DEV_DEPENDENCIES $B_DEPENDENCIES --dev

cd ../..
cp webpack.config.js $MY_PROJECT/Frontend/ && cd $MY_PROJECT/Frontend/

# webpack config
echo "which port you want to use?"
read port

#sed -i webpack.config.js -e "s/${port}/$PORT/" 
sed -i "s/PORT/$port/" webpack.config.js

