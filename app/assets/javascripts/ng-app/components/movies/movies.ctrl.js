angular.module('movieDbApp')
    .controller('MoviesCtrl', [
        '$scope',
        function ($scope) {
            console.log('GOT TO MOVIES_CONTROLLER')
            $scope.movies = [
                {
                    title: 'Casino',
                    year: '1995',
                    rating: 'R',
                    company: 'De Fina-Cappa',
                    img_url: '/img/default_movie.png',
                },
                {
                    title: 'The 13th Warrior',
                    year: '1999',
                    rating: 'R',
                    company: 'Touchstone Pictures',
                    img_url: '/img/default_movie.png',
                },
                {
                    title: 'Austin Powers in Goldmember',
                    year: '2002',
                    rating: 'PG-13',
                    company: 'Gratitude International',
                    img_url: '/img/default_movie.png',
                }
            ];
        }
    ]);