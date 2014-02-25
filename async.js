"use strict";

var React   = require('react');
var Router  = require('./lib/AsyncRouter');
var Route   = require('./lib/Route');
var Link    = require('./lib/Link');

module.exports = {
  Locations: Router.Locations,
  Pages: Router.Pages,

  Location: Route.Route,
  Page: Route.Route,
  NotFound: Route.NotFound,

  Link: Link
}

