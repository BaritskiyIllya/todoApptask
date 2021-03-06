// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "bootstrap"
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require("sortablejs")
import '../src/application'

// import '../src/devise'
import Sortable from 'sortablejs';
document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
})
global.$ = jQuery;


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"

document.addEventListener('turbolinks:load', () => {
    var el = document.getElementById("tasks-list");
    var sortable = Sortable.create(el, {
        handle: '.handle',
        animation: 200,
        ghostClass: 'light-bg'
    })
})