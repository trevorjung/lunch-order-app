(function() {
  "use strict";

  angular.module("app").controller("lunchesCtrl", function($scope, $http) {
    
    $scope.setup = function() {
      $http.get("/api/v1/lunches.json").then(function(response) {
        $scope.lunches = response.data;
      });
    } 

    $scope.addLunch = function(lunch) {
      lunch.toAdd = !lunch.toAdd;
      console.log(lunch.toAdd);
    }
      




    $scope.purchaseLunch = function(lunch) {
      if (lunch.toAdd = true) {
        
        $http.post("/api/v1/orders.json", newLunch).then(function(response) {
        $scope.purchaseLunch = response.data;
        });
      } 

    }
    




    window.$scope = $scope;


  });
}());