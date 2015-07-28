/**
 * Created by Administrator on 2015/1/20.
 */
'use strict';

var fileServer = angular.module('fileServer', [
    'ngRoute'

]);
fileServer.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'index.html',
            controller: 'IndexCtrl'
        })
        .otherwise({
            redirectTo: '/'
        });
}]);

fileServer.filter('filename', function () {
    return function (inputStr) {
        if (inputStr.indexOf('/') > -1) {
            return inputStr.substr(inputStr.lastIndexOf('/') + 1);
        }
        return inputStr;
    }
});