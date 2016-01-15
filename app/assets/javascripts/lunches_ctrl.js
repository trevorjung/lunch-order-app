(function() {
  "use strict";

  angular.module("app").controller("lunchesCtrl", function($scope, $http) {

    $scope.selectedMonth = parseInt(new Date().getMonth()) + 1;

    $scope.setup = function() {
      $http.get("/api/v1/lunches.json").then(function(response) {
        // $scope.lunches = response.data;
        $scope.original_data = response.data;

        $scope.getLunchesForMonth();

        $scope.month();

        // console.log(response.data);
      });
    } 
    
    $scope.getLunchesForMonth = function() {
      $scope.lunches = [];
      for (var i = 0; i < $scope.original_data.length; i++) {
          if (parseInt($scope.original_data[i].date.substring(5,7)) === parseInt(($scope.selectedMonth))) {
            $scope.lunches.push($scope.original_data[i]);
          }
          else {
          }
        }
    }

    $scope.month = function() {
      var months = {
        1: "January",
        2: "February",
        3: "March",
        4: "April", 
        5: "May",
        6: "June",
        7: "July",
        8: "August",
        9: "September",
        10: "October",
        11: "November",
        12: "December"
      }
      $scope.returnedMonth = months[$scope.selectedMonth];
      // console.log($scope.returnedMonth);
    }

    $scope.previousMonth = function() {
      console.log($scope.selectedMonth);
      if ($scope.selectedMonth === 1) {
        $scope.selectedMonth = 12;
      } else {
      $scope.selectedMonth -= 1;
      }
      $scope.getLunchesForMonth(); 
      $scope.month(); 
    }
        

    $scope.nextMonth = function () {
      if ($scope.selectedMonth === 12) {
        $scope.selectedMonth = 1;
        console.log($scope.selectedMonth);
      } else {
      $scope.selectedMonth += 1;
      console.log($scope.selectedMonth);
      }
      $scope.getLunchesForMonth();
      $scope.month();
    }

    // $scope.criteriaMatch = function(lunch) {
    //   if (lunch) {
    //     console.log(lunch);
    //     console.log(lunch.date.charAt(6));
    //     console.log($scope.selectedMonth);
    //     return lunch.date.charAt(6) === $scope.selectedMonth;    
    //   }
    // }




    $scope.selected_lunches = [];
    
    
    $scope.selectedLunch = function(lunch) {
      lunch.added = !lunch.added;
      // console.log(lunch.added);
    }  

    
    $scope.addLunch = function(lunch, index) {
        $scope.selectedLunch(lunch);
      if (lunch.added) {
        $scope.selected_lunches.push(lunch);
        $scope.calculateTax();
        $scope.calculateSubtotal();
        $scope.calculateTotal();
        
        console.log($scope.tax);
        console.log($scope.subtotal);
        console.log($scope.total);
      } 
      else {
        $scope.selected_lunches.splice(index,1);
        $scope.calculateTax();
        $scope.calculateSubtotal();
        $scope.calculateTotal();
        
      }
        console.log($scope.selected_lunches);
    }
    
    
    // $scope.setDateAndEntree = function(lunch) {
    //   $scope.selectedDate = lunch.date
    //   $scope.selectedEntree = lunch.entree
    // }
        
    
    // $scope.deleteOrder = function(index, newOrder) {
    //   $http.delete("/api/v1/orders/" + newOrder.id + ".json").then(function(response) {
    //     $scope.selected_lunches.splice(index,1);
    //     console.log(index);
    //     });
    // }
    
    $scope.total = 0
    $scope.subtotal = 0
    $scope.price = 4.5


    $scope.makeOrder = function() {

        // console.log($scope.selected_lunches[i].entree)

        // var lunch = $scope.selected_lunches[i];
        // var price = lunch.calculateTax($scope.price)

        var subtotal = $scope.calculateSubtotal();
        var tax = $scope.calculateTax();
        var total = $scope.calculateTotal();

        var newOrder = {
          lunches: $scope.selected_lunches,
          // school_id: lunch.school_id,
          tax: tax,
          subtotal: subtotal,
          total: total
        };

        console.log("New order:");
        console.log(newOrder);

        // var newSelectedDay = {
        //   lunch_id: lunch.id;

        // }
        
          $http.post("/api/v1/orders.json", newOrder).then(function(response) {
             
             console.log(response);

          });
      
        
    } 
        

      

    $scope.calculateTax = function() {
      $scope.tax = ((parseInt($scope.selected_lunches.length) * $scope.price) * 0.09);
      return $scope.tax;
    }

    $scope.calculateSubtotal = function() {
      $scope.subtotal = parseInt($scope.selected_lunches.length) * $scope.price;
      return $scope.subtotal;
    }

    $scope.calculateTotal = function() {
      $scope.total = $scope.tax + $scope.subtotal;
      return $scope.total;
    }


      


        


    window.$scope = $scope;


  });
}());