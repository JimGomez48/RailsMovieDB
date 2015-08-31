angular.module('movieDbApp')
    .controller('MoviesCtrl', [
        '$scope',
        'Restangular',
        function ($scope, Restangular) {
            $scope.$parent.panel_title = 'Movies';
            $scope.$parent.$parent.panel_glyph = 'glyphicon-film';
            //$scope.$parent.panel_title = {
            //    title: 'Movies',
            //    glyphicon: 'glyphicon glyphicon-film'
            //};

            $scope.$parent.panel_menu_items = [
                {title: 'action 1', action: '1'},
                {title: 'action 2', action: '2'},
                {title: 'action 3', action: '3'},
            ];

            Restangular.all('movies').getList({page: 1}).then(function (movies) {
                $scope.movies = movies;
            });
        }
    ]);