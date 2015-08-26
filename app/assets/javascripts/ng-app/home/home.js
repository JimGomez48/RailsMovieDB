angular.module('movieDbApp')
    .controller('HomeCtrl', [
        '$scope',
        function ($scope) {
            console.log('GOT TO HOME_CONTROLLER')
            $scope.things = ['Angular', 'Rails 4.1', 'UI Router', 'Together!!'];
        }
    ]);