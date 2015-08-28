angular.module('movieDbApp')
    .controller('MoviesCtrl', [
        '$scope',
        function ($scope) {
            $scope.$parent.panel_title = 'Movies';
            //$scope.$parent.panel_title = {
            //    title: 'Movies',
            //    glyphicon: 'glyphicon glyphicon-film'
            //};

            $scope.$parent.panel_menu_items = [
                {title: 'action 1', action: '1'},
                {title: 'action 2', action: '2'},
                {title: 'action 3', action: '3'},
            ];

            $scope.movies = [
                {
                    id: '667',
                    title: 'Casino',
                    year: '1995',
                    rating: 'R',
                    company: 'De Fina-Cappa',
                    img_url: '/img/default_movie.png',
                },
                {
                    id: '9',
                    title: 'The 13th Warrior',
                    year: '1999',
                    rating: 'R',
                    company: 'Touchstone Pictures',
                    img_url: '/img/default_movie.png',
                },
                {
                    id: '253',
                    title: 'Austin Powers in Goldmember',
                    year: '2002',
                    rating: 'PG-13',
                    company: 'Gratitude International',
                    img_url: '/img/default_movie.png',
                }
            ];
        }
    ]);