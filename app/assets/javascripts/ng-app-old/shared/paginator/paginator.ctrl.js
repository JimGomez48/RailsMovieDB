angular.module('movieDbApp')
    .controller('PaginatorCtrl', [
        '$scope',
        '$rootScope',
        '$log',
        function ($scope, $rootScope, $log) {
            //$scope.totalItems = 120;
            //$scope.itemsPerPage = 20;
            $scope.currentPage = 1;
            $log.info('Page controller instantiated!');

            $scope.setPage = function (pageNo) {
                $scope.currentPage = pageNo;
            };

            $scope.getPage = function () {
                return $scope.currentPage;
            };

            $scope.pageChanged = function () {
                $log.info('page changed to: ' + $scope.currentPage);
                $rootScope.$broadcast('PageChangedEvent', {page: $scope.currentPage});
            };

            $scope.maxSize = 5;
            $scope.bigTotalItems = 175;
            $scope.bigCurrentPage = 1;

            return $scope;
        }]);