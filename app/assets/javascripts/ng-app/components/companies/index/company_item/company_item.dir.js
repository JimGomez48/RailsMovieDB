angular.module('movieDbApp')
    .directive('companyItem', function () {
        return {
            restrict: 'EA',
            replace: true,
            templateUrl: 'ng-app/components/companies/index/company_item/_company_item.html',
            scope: {
                company: '='
            }
        }
    });