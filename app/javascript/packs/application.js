// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

global.toastr = require("toastr")

require ("jquery")
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

//import { Controller } from "stimulus"
const Choices = require('choices.js')

document.addEventListener("turbolinks:load", function(){
    var dropDownSelects = new Choices('#dropdown-choice-select')
})
/*
export default class extends Controller {
  static targets = [ "input" ]

  connect() {
    this.inputTarget.choices = new Choices(this.inputTarget);
  }

  disconnect() {
    this.inputTarget.choices.destroy();
  }
}
*/
