'use strict';
app.controller('userController', ['$scope', 'userService', function ($scope, userService) {
    $scope.name = ' ';
    $scope.username = ' ';
    $scope.securityId = ' ';
    $scope.roles = ' ';
    $scope.userAuthToken = ' ';
    $scope.authenticationType = ' ';

    userService.getUserDetails().then(function (response) {

        var data = response.data.Value;
        $scope.name = data.Name || $scope.name;
        $scope.username = data.Username || $scope.username;
        $scope.securityId = data.SecurityId || $scope.securityId;
        $scope.roles = data.Roles && data.Roles.length ? data.Roles.join(', ') : 'Not assigned any';
        $scope.userAuthToken = data.UserAuthToken || $scope.userAuthToken;
        $scope.authenticationType = data.AuthenticationType || $scope.authenticationType;

    }, function (error) {
        //alert(error.data.message);
    });
}]);