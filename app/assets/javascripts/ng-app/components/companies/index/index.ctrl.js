angular.module('movieDbApp')
    .controller('CompaniesIndexCtrl', [
        '$scope',
        '$log',
        'Restangular',
        function ($scope, $log, Restangular) {
            $log.debug('instantiate CompaniesIndexCtrl');

            $scope.panelTitle = 'Companies';
            $scope.menuItems = [
                {
                    label: 'company action 1',
                    action: function () {
                        alert('company action 1')
                    }
                },
                {
                    label: 'company action 2',
                    action: function () {
                        alert('company action 2')
                    }
                },
                {
                    label: 'company action 3',
                    action: function () {
                        alert('company action 3')
                    }
                }
            ];

            // initialize list data
            $scope.totalItems = 0;
            $scope.itemsPerPage = 20;
            $scope.currentPage = 0;

            Restangular.all('companies').getList({page: 1}).then(function (companies) {
                $scope.companies = companies;
                $scope.totalItems = companies.pagination['total_items'];
                $scope.itemsPerPage = companies.pagination['items_per_page'];
            });

            $scope.onPageChanged = function () {
                Restangular.all('companies').getList({page: $scope.currentPage}).then(function (companies) {
                    $scope.companies = companies;
                });
            };
        }]);