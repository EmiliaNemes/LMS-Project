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
require("channels/js_for_sidebar")
require ("date")
require ("time")
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require cocoon
//= require_tree .

/*
$(document).on('turbolinks:load', function(){

    $('form').on('click', '.remove_record', function(event){
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('tr').hide();
        return event.preventDefault();
    });

    $('form').on('click', '.add_fields', function(event){
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('.fields').append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });
});
*/

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

import "controllers"
