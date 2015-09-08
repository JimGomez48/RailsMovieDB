angular.module('movieDbApp').directive('footerSection', function() {
    return {
        restrict: 'E',
        templateUrl: 'ng-app-old/components/core/footer/_footer.html',
        controller: 'FooterCtrl'
    }
});
