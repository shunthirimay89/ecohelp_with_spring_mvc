
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
  rel="stylesheet">
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>List of Donors</title>
<style>
body {
  background-image:
    "https://img.freepik.com/free-vector/colorful-confetti-background-with-text-space_1017-32374.jpg";
  background-color: #DEF1D9; /* Light Gray */
  font-family: Arial, sans-serif;
}

.container {
  margin-top: 50px;
}

h1 {
  text-align: center;
  color: #007bff; /* Blue */
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
  background-color: #ffffff; /* White */
  border: 1px solid #d1d3e2;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th, td {
  text-align: left;
  padding: 12px;
  border-bottom: 1px solid #d1d3e2;
}

th {
  background-color: #007bff; /* Blue */
  color: #ffffff; /* White */
}

tr:nth-child(even) {
  background-color: #f2f2f2; /* Light Gray */
}

img.screenshot {
  max-width: 100px;
  height: auto;
}

.notification-icon {
  position: relative;
  display: inline-block;
}

.notification-icon i {
  font-size: 24px;
  cursor: pointer;
}

.badge-danger {
  background-color: #ff0000; /* Red */
  color: #ffffff; /* White */
  position: absolute;
  top: 0;
  right: 0;
  padding: 4px 8px;
  border-radius: 50%;
  font-size: 12px;
}

/* Style for the beautiful chart container */
.beautiful-chart {
  background-color: #f5f5f5; /* Background color */
  border: 1px solid #ddd; /* Border */
  border-radius: 10px; /* Rounded corners */
  padding: 20px; /* Spacing around the chart */
  margin-bottom: 20px; /* Margin between charts */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Shadow */
  text-align: center; /* Center-align text */
}

/* Style for the chart caption */
.chart-caption {
  font-size: 24px; /* Font size */
  color: #333; /* Text color */
  margin-top: 10px; /* Margin above caption */
}
body {
	margin: 0;
	padding: 0;
	font-family: montserrat;
}

nav {
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flex;
	display: -o-flex;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 100px;
	color: #fff;
	background: #C2F6B5 ;
}

.logo {
	font-size: 25px;
	color: #fff;
	
}
.menu ul li {
	display: inline-block;
	margin: 0 15px;
}

.menu ul li a {
	text-decoration: none;
	cursor: pointer;
	font-weight: bold;
	font-size: 18px;
	text-transform: uppercase;
	font-family: montserrat;
	color: #fff;
	padding: 5px 15px;
}

.menu ul li a:hover {
	background: green;
}
.socials a {
	text-decoration: none;
	background: green;
	color: #fff;
	padding: 10px 35px;
}

</style>
</head>
<body>


<div class="header">
			<nav>
				<div class="logo">EcoHelp</div>
				<div class="menu">
					<ul>
						<li><a href="/EcoHelp/">Home</a></li>
						<li><a href=>Donation Progress</a></li>
						<li><a href="/EcoHelp/donateplace">DonatePlaces</a></li>
					</ul>
				</div>
			
			</nav>
		</div>
<!-- Donor Data -->
<c:set var="donorData" value="${list}" />

  <!-- Include Chart.js library -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>

  <!-- Donor Data -->
  <c:set var="donorData" value="${list}" />

  <!-- Chart 1: Donor Distribution by Address (Pie Chart) -->
  <div class="container">
    <h1>Donor Distribution by Address (Pie Chart)</h1>
    <div class="chart-container">
      <canvas id="donorCountryChart"></canvas>
    </div>
  </div>
   
     <!-- Chart 2: Payment Type Distribution (Bar Chart) -->
    <div class="container">
      <h1>Payment Type Distribution (Bar Chart)</h1>
      <div class="chart-container">
        <canvas id="donationTypeChart"></canvas>
      </div>
    </div>


<!-- Chart 3: Amount vs. Donation Date (Line Chart) -->
    <div class="container">
        <h1>Amount vs. Donation Date (Line Chart)</h1>
        <div class="chart-container">
          <canvas id="amountVsDateChart"></canvas>
        </div>
        
    </div> 
    
    
    <!-- Chart 4: Donors with Highest Donation (Bar Chart) -->
        <div class="container">
          <h1>Donors with Highest Donation (Bar Chart)</h1>
          <div class="chart-container">
          <canvas id="highestDonorChart"></canvas>
          
          </div>
          
          </div>

          <!-- Chart 5: Issue-wise Donation Amount (Bar Chart) -->
          <div class="container">
            <h1>Issue-wise Donation Amount (Bar Chart)</h1>
            <div class="chart-container">
              <canvas id="issueDonationChart"></canvas>
            </div>
            
            </div> 


<script>
    $(document).ready(function () {
        // Handle search input
        $("#searchDonor").on("keyup", function () {
            var input = $(this).val().toLowerCase();
            $("table tbody tr").each(function () {
                var donorName = $(this).find("td:eq(1)").text().toLowerCase();
                if (donorName.includes(input)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });

        // Calculate and display total sum
        function calculateTotalSum() {
            var totalAmount = 0;
            $("table tbody tr:visible").each(function () {
                var amount = parseFloat($(this).find("td:eq(5)").text());
                if (!isNaN(amount)) {
                    totalAmount += amount;
                }
            });
            $("#totalAmount").text(totalAmount.toFixed(2));
            if (totalAmount > 0) {
                $("#totalAmountDisplay").show();
            } else {
                $("#totalAmountDisplay").hide();
            }
        }

        // Call the calculateTotalSum function initially and whenever the search results change
        $("#searchDonor").on("keyup", calculateTotalSum);
    });
</script>



<script>
    // Prepare data for Chart 1: Donor Distribution by Address
    var countryLabels = [];
    var countryData = [];
    var countryDonors = {};
    <c:forEach var="donar" items="${list}">
        var country = "${donar.user_address}";
        if (countryDonors[country]) {
            countryDonors[country]++;
        } else {
            countryDonors[country] = 1;
        }
    </c:forEach>
    for (var key in countryDonors) {
        countryLabels.push(key);
        countryData.push(countryDonors[key]);
    }

    // Chart 1: Donor Distribution by Country
    var donorCountryChart = new Chart(document.getElementById('donorCountryChart').getContext('2d'), {
        type: 'pie',
        data: {
            labels: countryLabels,
            datasets: [{
                data: countryData,
                backgroundColor: [                
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 206, 86, 0.5)',
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(153, 102, 255, 0.5)',
                    'rgba(255, 159, 64, 0.5)',   // Additional color 1 (orange)
                    'rgba(46, 204, 113, 0.5)',  // Additional color 2 (green)
                    'rgba(255, 87, 51, 0.5)',   // Additional color 3 (coral)
                    'rgba(0, 128, 255, 0.5)',   // Additional color 4 (blue)
                    'rgba(128, 0, 128, 0.5)'    // Additional color 5 (purple)
                ],
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: 'Donor Distribution by Address'
            }
        }
    });


// Prepare data for Chart 2: Payment Type Distribution
     
     
   /*   var donationTypeLabels = [
      <c:forEach var="paymethod" items="${payList}" varStatus="loop">
            "${paymethod.paymentType}"
            <c:if test="${!loop.last}">, </c:if>
        </c:forEach>
  ];
    var donationTypeData = Array(donationTypeLabels.length).fill(0);
    <c:forEach var="donor" items="${list}">
    var donationType = "${donor.paymentmethod_name}";
    var index = donationTypeLabels.indexOf(donationType);
    if (index !== -1) {
        donationTypeData[index]++;
    }
  </c:forEach> */
    
     var donationTypeLabels = ["K Pay", "Wave Pay", "CB Pay"];      
    var donationTypeData = [0, 0, 0]; 
  <c:forEach var="donor" items="${list}">
        var donationType = "${donor.paymentmethod_name}";
        if (donationType === "K Pay") {
            donationTypeData[0]++;
        } else if (donationType === "Wave Pay") {
            donationTypeData[1]++;
        } else if (donationType === "CB Pay") {
            donationTypeData[2]++;
        }
    </c:forEach> 
   


    // Chart 2: Payment Type Distribution
    var donationTypeChart = new Chart(document.getElementById('donationTypeChart').getContext('2d'), {
        type: 'bar',
        data: {
            labels: donationTypeLabels,
            datasets: [{
                data: donationTypeData,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 206, 86, 0.5)',
                ],
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: 'Payment Type Distribution'
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    
    // Prepare data for Chart 3: Amount vs. Donation Date
    var donationDateLabels = [];
    var donationAmounts = [];
    <c:forEach var="donor" items="${list}">
        donationDateLabels.push("${donor.donationDate}");
        donationAmounts.push("${donor.amount}");
    </c:forEach>

    // Chart 3: Amount vs. Donation Date
    var amountVsDateChart = new Chart(document.getElementById('amountVsDateChart').getContext('2d'), {
        type: 'line',
        data: {
            labels: donationDateLabels,
            datasets: [{
                data: donationAmounts,
                label: 'Donation Amount',
                borderColor: 'rgba(75, 192, 192, 1)',
                fill: false,
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: 'Amount vs. Donation Date'
            }
        }
    }); 
</script>

<script>
    $(document).ready(function () {
        $("#showThisMonthsDonors").click(function () {
            // Get the current date
            var currentDate = new Date();

            // Filter and display this month's donors
            $("table tbody tr").each(function () {
                var donationDate = new Date($(this).find("td:last").text());
                if (donationDate.getMonth() === currentDate.getMonth()) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>
        

<script>
//Prepare data for Chart 4: Donors with Highest Donation
var donorNames = [];
var donorAmounts = [];
var donorDataArray = [];
<c:forEach var="donor" items="${list}">
    console.log("${donor.user_name}");
    console.log("${donor.amount}");

    donorDataArray.push({ name: "${donor.user_name}", amount: "${donor.amount}" });
    console.log("DonorData " + donorDataArray[donorDataArray.length - 1].name + " " + donorDataArray[donorDataArray.length - 1].amount);

</c:forEach>

// Sort donorDataArray by donation amount in descending order
donorDataArray.sort(function (a, b) {
    return b.amount - a.amount;
});

// Get the top 5 donors
donorDataArray.slice(0, 5).forEach(function (donor) {
    donorNames.push(donor.name);
    donorAmounts.push(donor.amount);
});

// Chart 4: Donors with Highest Donation (Bar Chart)
var highestDonorChart = new Chart(document.getElementById('highestDonorChart').getContext('2d'), {
    type: 'bar',
    data: {
        labels: donorNames,
        datasets: [{
            data: donorAmounts,
            backgroundColor: 'rgba(255, 99, 132, 0.5)',
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        title: {
            display: true,
            text: 'Donors with Highest Donation'
        },
        scales: {
            y: {
                beginAtZero: true,
            }
        }
    }
});

   

     // Prepare data for Chart 5: Issue-wise Donation Amount
    var issueLabels = [];
    var issueAmounts = [];
    var issueDonationData = {};
    <c:forEach var="donor" items="${list}">
        var issueChosen = "${donor.donateplace_name}";
        if (issueDonationData[issueChosen]) {
            issueDonationData[issueChosen] += ${donor.amount};
        } else {
            issueDonationData[issueChosen] = ${donor.amount};
        }
    </c:forEach>
    for (var key in issueDonationData) {
        issueLabels.push(key);
        issueAmounts.push(issueDonationData[key]);
    }

    // Chart 5: Issue-wise Donation Amount (Bar Chart)
    var issueDonationChart = new Chart(document.getElementById('issueDonationChart').getContext('2d'), {
        type: 'bar',
        data: {
            labels: issueLabels,
            datasets: [{
                data: issueAmounts,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: 'Issue-wise Donation Amount'
            },
            scales: {
                y: {
                    beginAtZero: true,
                }
            }
        }
    }); 
    
</script> 


<div class="container">
  <h1>List of Donors</h1>

            <!-- Search input field -->
              <div class="form-group">
                <label for="searchDonor">Search Total Amount By Donor Name:</label> <input
                  type="text" class="form-control" id="searchDonor"
                  placeholder="Enter donor name" oninput="filterDonors()">
              </div>

              <!-- Display total sum -->
              <div class="alert alert-success" id="totalAmountDisplay"
                style="display: none;">
                Total Amount: $<span id="totalAmount"></span>
              </div>


</div>

<script>
    // Function to filter donors and calculate total amount
    function filterDonors() {
        var searchInput = document.getElementById("searchDonor").value.toLowerCase();
        var donorRows = document.querySelectorAll("tbody tr");
        var totalAmount = 0;

        donorRows.forEach(function (row) {
            var donorName = row.querySelector("td:nth-child(2)").textContent.toLowerCase();

            if (donorName.includes(searchInput)) {
                row.style.display = "table-row"; // Show matching rows
                totalAmount += parseFloat(row.querySelector("td:nth-child(6)").textContent); // Add to total amount
            } else {
                row.style.display = "none"; // Hide non-matching rows
            }
        });

        // Display the total amount
        var totalAmountDisplay = document.getElementById("totalAmountDisplay");
        var totalAmountSpan = document.getElementById("totalAmount");

if (searchInput === "") {
            totalAmountDisplay.style.display = "none"; // Hide total amount when search input is empty
        } else {
            totalAmountDisplay.style.display = "block"; // Show total amount
            totalAmountSpan.textContent = totalAmount.toFixed(2); // Display total amount with two decimal places
        }
    }
</script>



<div class="container">
  <button type="button" class="btn btn-primary" id="showThisMonthsDonors">This Month's Donors</button>
              


<script>
        function checkForNewDonors() {
            $.ajax({
                url: '/EcoHelp/donarList', // URL to check for new donors (adjust accordingly)
                method: 'GET',
                success: function (data) {
                    if (data.hasNewDonor) {
                        var notificationCount = parseInt($('#notification-count').text()) + 1;
                        $('#notification-count').text(notificationCount);
                        $('#notification-icon').addClass('text-danger');
                    }
                },
                error: function (error) {
                    console.error('Error checking for new donors: ' + error);
                }
            });
        }

        setInterval(checkForNewDonors, 5000); // Check every 5 seconds (adjust as needed)
    </script>

  <button type="button" class="btn btn-primary" id="showTodaysDonors">Today's Donors</button>
  
<script>
    $(document).ready(function () {
        $("#showTodaysDonors").click(function () {
            // Get the current date
            var currentDate = new Date();

            // Filter and display today's donors
            $("table tbody tr").each(function () {
                var donationDate = new Date($(this).find("td:last").text());
                if (
                    donationDate.getDate() === currentDate.getDate() &&
                    donationDate.getMonth() === currentDate.getMonth() &&
                    donationDate.getFullYear() === currentDate.getFullYear()
                ) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>

              <button type="button" class="btn btn-primary"
                id="showThisWeeksDonors">This Week's Donors</button>
<script>
    $(document).ready(function () {
        // Click event handler for "This Week's Donors" button
        $("#showThisWeeksDonors").click(function () {
            // Get the current date
            var currentDate = new Date();

            // Filter and display this week's donors
            $("table tbody tr").each(function () {
                var donationDate = new Date($(this).find("td:last").text());
                var daysDifference = Math.floor((currentDate - donationDate) / (1000 * 60 * 60 * 24));
                if (daysDifference <= 7) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>



              <button type="button" class="btn btn-secondary"
                id="showAllDonors">Show All Donors</button>

<script>
    $(document).ready(function () {
        // Click event handler for "Show All Donors" button
        $("#showAllDonors").click(function () {
            // Show all rows
            $("table tbody tr").show();
        });
    });
</script>


              <div class="container">


<!-- Filter by Country -->
               <!--  <div class="form-group">
                  <label for="filterCountry">Filter by Address:</label> <select
                    class="form-control form-control-sm" id="filterCountry">
                    <option value="">All</option>
                    <option value="YGN">YGN</option>
                    <option value="MDY">MDY</option>
                    <option value="MON">MON</option>
                    <option value="RK">RK</option>
                    Add options for other countries as needed
                  </select>
                </div>
 -->
                <!-- Filter by Issue Chosen -->
               <!--  <div class="form-group">
                  <label for="filterIssue">Filter by Issue Chosen:</label> <select
                    class="form-control form-control-sm" id="filterIssue">
                    <option value="">All</option>
                    <option value="deforestation">Deforestation</option>
                    <option value="wildfire">Wildfire</option>
                    <option value="flood">Flood</option>
                    Add options for other issues as needed
                  </select>
                </div>
 -->
                <!-- Filter by Donation Type -->
                <!-- <div class="form-group">
                  <label for="filterDonationType">Filter by Payment Type:</label>
                  <select class="form-control form-control-sm"
                    id="filterDonationType">
                    <option value="">All</option>
                    <option value="Kpay">Kpay</option>
                    <option value="WavePay">WavePay</option>
                    <option value="CBPay">CBPay</option>
                    Add options for other donation types as needed
                  </select>
                </div> -->
                <!-- Progress bar for displaying percentage -->
                <div class="progress" style="display: none;">
                  <div
                    class="progress-bar progress-bar-striped progress-bar-animated"
                    role="progressbar" aria-valuenow="0" aria-valuemin="0"
                    aria-valuemax="100"></div>
                </div>

                <!-- Total amount and percentage display -->
                <div id="percentageDisplay" style="display: none;">
                  <p>
                    Total Amount: $<span id="totalAmount"></span>
                  </p>
                  <p>
                    Percentage: <span id="percentage"></span>%
                  </p>
                </div>

                <table class="table table-striped table-bordered">
                  <thead class="thead-dark">
                    <tr>
                      <th>ID</th>
                      <th>Donors Name</th>
                      <th>Address</th>
                      <th>Donate Place</th>
                      <th>Payment Type</th>
                      <th>Donation Amount</th>
                      <th>Donation Date</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- Loop through donor data retrieved from the server -->
                    <c:forEach var="donor" items="${list}">
                      <tr>
                        <td>${donor.id}</td>
                        <td>${donor.user_name}</td>
                        <td>${donor.user_address}</td>
                        <td>${donor.donateplace_name}</td>
                        <td>${donor.paymentmethod_name}</td>
                        <td>${donor.amount}</td>
                        <td>${donor.donationDate}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>


<script>
    $(document).ready(function () {
        // Function to apply filters
        function applyFilters() {
            var selectedCountry = $("#filterCountry").val();
            var selectedIssue = $("#filterIssue").val();
            var selectedDonationType = $("#filterDonationType").val();

            $("table tbody tr").each(function () {
                var rowCountry = $(this).find("td:eq(2)").text(); // Adjust the index accordingly
                var rowIssue = $(this).find("td:eq(3)").text(); // Adjust the index accordingly
                var rowDonationType = $(this).find("td:eq(4)").text(); // Adjust the index accordingly

                // Check if the row matches the selected filters
                var countryMatch = selectedCountry === ""  rowCountry === selectedCountry;
                var issueMatch = selectedIssue === ""  rowIssue === selectedIssue;
                var donationTypeMatch = selectedDonationType === "" || rowDonationType === selectedDonationType;

                if (countryMatch && issueMatch && donationTypeMatch) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }

        // Call the applyFilters function when filter values change
        $("#filterCountry, #filterIssue, #filterDonationType").change(function () {
            applyFilters();
        });
    });
</script>

<script>
    $(document).ready(function () {
        // Function to calculate total amount and percentage
        function calculateTotalAndPercentage(issueChosen) {
            var totalAmount = 0;
            var goalAmount = 1000000000; // Set your goal amount here

            // Calculate total amount for the specified issueChosen
            $("table tbody tr").each(function () {
                var rowIssue = $(this).find("td:eq(3)").text(); // Adjust the index accordingly
                var rowAmount = parseFloat($(this).find("td:eq(5)").text()); // Adjust the index accordingly

                if (rowIssue === issueChosen) {
                    totalAmount += rowAmount;
                }
            });

            // Calculate percentage
            var percentage = (totalAmount / goalAmount) * 100;

            return {
                totalAmount: totalAmount.toFixed(2), // Format total amount to two decimal places
                percentage: percentage.toFixed(2), // Format percentage to two decimal places
            };
        }

        // Call the calculateTotalAndPercentage function when filter values change
        $("#filterIssue").change(function () {
            var selectedIssue = $("#filterIssue").val();
            if (selectedIssue) {
                var result = calculateTotalAndPercentage(selectedIssue);
                $("#percentageDisplay").show();
                $("#totalAmount").text(result.totalAmount);
                $("#percentage").text(result.percentage);

                // Update the progress bar
                $(".progress-bar").css("width", result.percentage + "%").attr("aria-valuenow", result.percentage);
                $(".progress").show();
            } else {
                // Hide the progress bar and percentage display if no issue is selected
                $(".progress").hide();
                $("#percentageDisplay").hide();
            }
        });
    });
</script>
</body>
</html>