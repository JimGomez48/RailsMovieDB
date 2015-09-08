angular.module('movieDbApp')
    .controller('NavbarCtrl', [
        '$scope',
        function ($scope) {
            $scope.collapsed = true;
            $scope.active = -1;

            $scope.nav_items = [
                {name: 'Movies', sref: 'movies.list'},
                {name: 'Actors', sref: 'actors.list'},
                {name: 'Directors', sref: 'directors.list'},
                {name: 'Reviews', sref: 'reviews'},
            ];

            $scope.setActive = function (index) {
                $scope.active = index;
                $scope.collapsed = true;
            };

            $scope.isActive = function (index) {
                return $scope.active === index;
            };

            $scope.setCollapse = function (state) {
                $scope.collapsed = state;
            }

            $scope.toggleCollapse = function () {
                $scope.collapsed = !$scope.collapsed;
            };

            $scope.isCollapsed = function () {
                return $scope.collapsed;
            }
        }]);
