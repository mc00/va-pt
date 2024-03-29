<?php
// destroy previous session
session_start();
session_regenerate_id();

require 'incs/define.php';
require 'incs/sessman.inc';
?>

<html>
<head>
<title><?php echo title; ?></title>

<link rel="stylesheet" type="text/css" href="incs/index.css" />

</head>
<body>

<div class="application">
 <h1><?php echo title; ?></h1>
 <hr />
 <p><?php echo description; ?></p>
 <hr>
 <p class="ms"><strong><?php echo search; ?></strong> <?php echo $_SESSION['dbstring']; ?>
</div>

<div class="logout">
Logged in as: <?php echo $_SESSION['username'] ?> | <a href="incs/logout.php">logout</a>
</div>

<?php require 'incs/menu.inc' ?>

<div class="search">
<p>OSVDB (Offline) | <a href="exploitdb.php">ExploitDB</a> | <a href="search.php">New Search</a></p>

<?php
// connect to the database
include('incs/vcon.php');
// search string
$search = $_SESSION['dbstring'];

// get the records from the database
if ($result = $conn2->query("select name,description from nvd where description like '%".$search."%'"))
{
// display records if there are records to display
        if ($result->num_rows > 0)
{
// display records in a table
echo "<table border='1' cellpadding='5'>";
// set table headers
echo "<tr><th>Name</th><th>Description</th></tr>";

while ($row = $result->fetch_object())
{
// set up a row for each record
echo "<tr>";
echo "<td>" . $row->name . "</td>";
echo "<td>" . $row->description . "</td>";
echo "</tr>";
}
 echo "</table>";
}
// if there are no records in the database, display an alert message
else
 {
  echo "No results to display!";
  }
}
// show an error if there is an issue with the database query
else
{
echo "Error: " . $conn2->error;
}
// close database connection
$conn2->close();
?>
</div>
</body>
</html>
