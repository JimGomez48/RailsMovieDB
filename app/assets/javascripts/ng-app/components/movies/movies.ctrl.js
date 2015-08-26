angular.module('movieDbApp')
    .controller('MoviesCtrl', [
        '$scope',
        function ($scope) {
            console.log('GOT TO MOVIES_CONTROLLER')
            $scope.things = ['Angular', 'Rails 4.1', 'UI Router', 'Together!!'];
        }
    ]);