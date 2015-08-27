angular.module('movieDbApp')
    .controller('NavbarCtrl', [
        '$scope',
        function ($scope) {
            $scope.current_nav = -1;

            $scope.nav_items = [
                {name: 'Movies', sref: 'movies.list'},
                {name: 'Actors', sref: 'actors'},
                {name: 'Directors', sref: 'directors'},
                {name: 'Reviews', sref: 'reviews'},
            ];

            $scope.selectNav = function (index) {
                $scope.current_nav = index;
                console.log('nav ' + index + ' selected');
            };

            $scope.isSelected = function (index) {
                return $scope.current_nav === index;
            }
        }]);
