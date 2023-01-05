// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("@popperjs/core")
require("../stylesheets/application.scss")

import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
