angular.module('movieDbApp')
    .controller('SearchCtrl', [
        '$scope',
        function ($scope) {
            $scope.searchTerm = '';
        }]);
