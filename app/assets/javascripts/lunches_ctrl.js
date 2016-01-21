(function() {
  "use strict";

  angular.module("app").controller("lunchesCtrl", function($scope, $http) {


    $scope.setup = function() {
      $http.get("/api/v1/lunches.json").then(function(response) {
        // $scope.lunches = response.data;
        $scope.selectedMonth = parseInt(new Date().getMonth()) + 1;
        $scope.original_data = response.data;


        $scope.current_school_id = 1;
        $scope.returnedSchool = "Star of the Sea";

        $scope.getLunchesForMonth();
        $scope.month();

        // console.log(response.data);
      });
      $http.get("/api/v1/students.json").then(
        function(response) {
          $scope.student_data = response.data;
          // console.log(response.data)
      });
    } 
    


    $scope.getLunchesForMonth = function() {
      $scope.lunches = [];
      for (var i = 0; i < $scope.original_data.length; i++) {
          if ((parseInt($scope.original_data[i].date.substring(5,7)) === parseInt(($scope.selectedMonth))) && (parseInt($scope.current_school_id) === parseInt($scope.original_data[i].school_id)))  {
        // console.log(parseInt($scope.current_school_id));
        // console.log($scope.original_data[i].school_id);
            // console.log("lunched updated");
            $scope.lunches.push($scope.original_data[i]);
          }
          else {
          }
            // console.log("helo");
            // console.log($scope.original_data[i].school_id);

        }
            // console.log($scope.current_school_id);
            // console.log($scope.lunches);

    }

    // $scope.getLunchesBySchool = function() {

    // }

    $scope.schoolName = function(student_id, student_data ) {
      var schools = {
        1: "Star of the Sea",
        2: "St. Monica",
        3: "St. Thomas Apostle",
        4: "Zion Lutheran"
      }
        for (var i=0; i < student_data.length; i++) {
          if (student_data[i].id === student_id) {
            $scope.returnedSchool = schools[student_data[i].school_id];
            $scope.current_school_id = student_data[i].school_id;
          }
        }
        
        // console.log($scope.returnedSchool);
        // return $scope.returnedSchool;  
        $scope.getLunchesForMonth();
        $scope.showme = true;
    }
      
 
    // $scope.studentLunches = function(student_id) {
    //   if ($scope.original_data.school_id = student.school_id)
    // }

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
      // console.log($scope.selectedMonth);
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
        // console.log($scope.selectedMonth);
      } else {
      $scope.selectedMonth += 1;
      // console.log($scope.selectedMonth);
      }
      $scope.getLunchesForMonth();
      $scope.month();
    }





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
    
    $scope.tax=0
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

    $scope.reloadPage = function() {
      window.location.reload();
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