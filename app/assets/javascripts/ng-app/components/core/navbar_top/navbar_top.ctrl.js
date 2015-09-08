angular.module('movieDbApp')
    .controller('NavbarTopCtrl', [
        '$scope',
        function ($scope) {
            $scope.collapsed = true;
            $scope.active = -1;

            $scope.nav_items = [
                { label : 'Movies', state: 'movies' },
                { label : 'Actors', state: 'actors' },
                { label : 'Directors', state: 'directors' }
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