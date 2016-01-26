angular
  .module('angular-example')
  .config(['$routeProvider', config]);

config.$inject = ['$routeProvider'];
function config($routeProvider) {
  $routeProvider
    .when('/users', {
      templateUrl:'/users/index.html',
      controller: "usersController",
      controllerAs:'user'
    })
    .otherwise({
      redirectTo: '/users'
    });
};
