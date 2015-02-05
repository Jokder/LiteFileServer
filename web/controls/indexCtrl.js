/**
 * Created by Administrator on 2015/1/21.
 */
'use strict';

fileServer.controller('indexCtrl', ['$scope', '$http', function ($scope, $http) {
    var dataUrl = '/files';
    $scope.datasource = {};
    $http.get(dataUrl).success(function (data) {
        $scope.datasource.files = data;
    });
}]);