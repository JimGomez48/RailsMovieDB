angular.module('movieDbApp').directive('footerSection', function() {
    return {
        restrict: 'E',
        templateUrl: 'ng-app/components/core/footer/_footer.html',
        controller: 'FooterCtrl'
    }
});
