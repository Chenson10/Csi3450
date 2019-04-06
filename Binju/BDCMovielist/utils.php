<?php

// Function createa DB connection

function connectToDB()
{   
    global $conn;
    
    $servername = "localhost";
    $username = "root";         // Local Bitname Server
    //$username = "singh";      // For SECS server
    $password = "Binjus1234";
    //$dbname = "university";     // Local Bitname Server
    $dbname = "university";        // For SECS server
    
    //echo "DEBUG: Connecting to DB <br>";
	$conn = new mysqli($servername, $username, $password, $dbname);
    
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
  
    //echo "DEBUG: Connected successfully (". $conn->host_info. ") <br>";
    
}

// Function for inserting records to a database. Here 
function insertRecord()
{
    global $conn;
    
    $eId = $_POST['eId'];
    $eDate = $_POST['eDate'];
    $eTitle = $_POST['eTitle'];
    $eText = $_POST['eText'];
    $eURL = $_POST['eURL'];
    $eGroup = $_POST['eGroup'];
        
    if (!empty($eDate) && !empty($eId)){
        $sql = "insert into journal (eId, eDate, eTitle, eText, eURL, eGroup)" .
                    " values ('$eId', '$eDate', '$eTitle', '$eText', '$eURL', '$eGroup')";
        if ($conn->query ($sql) == TRUE) {
            //echo "DEBUG: Record added <br>";
        }
        else
        {
            echo "Could not add record: " . $conn->connect_error . "<br>";
        }
    } 
    else
    {
        echo "Must provide a eId and eDate to enter a record <br>";
        $action = 'showInsertForm';
    }
}

function deleteRecord()
{
    global $conn;
    $eId = $_POST['eId'];
    if (!empty($eId)){
        $sql = "delete from journal where eId = '$eId'";
        //echo $sql . "<br>";
        if ($conn->query ($sql) == TRUE) {
            //echo "DEBUG: Record deleted <br>";
        }
        else
        {
            echo "Could not add record: " . $conn->connect_error . "<br>";
        }
    }
    else
    {
        echo "Must provide a eId to delete a record a record <br>";
    }
}

function displayPreamble()
{
    global $thisPHP;
    
    // Heredoc
    
    $str = <<<PREM
    <table><tr><td>
    <h3>Insert</h3>
    <form id='insertForm' action='{$thisPHP}' method='post'>
        <fieldset>
            <legend>Click to Insert New Journal</legend> 
            <input type='submit' name='showInsertForm' value='Add New Journal'>
        </fieldset>
    </form>
    </td>
        
    <td>
    <h3>Search &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	 <form style='display:inline'><input type='submit' name='reset' 
		value='Reset'></form></h3> 
    <form id='searchForm' action='{$thisPHP}' method='post'>
        <fieldset>
            <legend>Enter people, movie or company to Search</legend>
            <p>Select Search Term
                <select name="Searchtype">
                    <option value="">Select...</option>
                    <option value="People">People</option>
                    <option value="Directors">Directors</option>
                    <option value="Company">Company</option>
                </select>
            </p>
            <input type='text' name='txtSearchTerm' value=''>
            <input type='submit' name='searchDB' value='Search DB'>
        </fieldset>
    </form> 
    </td>
    </tr>
    </table>
PREM;
    echo $str;
}
function displayPreambleAndRecords($sql)
{
    global $conn;
    global $thisPHP;
    
    displayPreamble();
    
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        
        echo "<h4>BDCMovielist Database</h4>";
        
        while($row = $result->fetch_assoc())
        if (SearchType = 'People')
        {
            echo "<tbody><tr>";
            $peopleFNAM = $row["peopleFNAM"];
            echo  "<td>" . $peopleFNAM . "  </td><td>".$row["DoB"]."</td>"; 
               
            echo "<form action='{$thisPHP}' method='post' style='display:inline' >";
            echo "<input type='hidden' name='peopleFNAM' value='{$peopleFNAM}'>";
            echo "<input type='submit' name='btnDelete' value='Delete'></form>";
            echo "</td></tr></tbody>";
        }
        elseif(Searchtype = 'Directors')
        {
            echo "<tbody><tr>";
            $movieName = $row["movieName"];
            echo  "<td>" . $movieName . "</td>"; 
               
            echo "<form action='{$thisPHP}' method='post' style='display:inline' >";
            echo "<input type='hidden' name='movieName' value='{$movieName}'>";
            echo "<input type='submit' name='btnDelete' value='Delete'></form>";
            echo "</td></tr></tbody>";  
        }
        elseif(Searchtype = 'Company')
        {
            echo "<tbody><tr>";
            $movieName = $row["movieName"];
            echo  "<td>" . $movieName . "</td>"; 
               
            echo "<form action='{$thisPHP}' method='post' style='display:inline' >";
            echo "<input type='hidden' name='movieName' value='{$movieName}'>";
            echo "<input type='submit' name='btnDelete' value='Delete'></form>";
            echo "</td></tr></tbody>";  
        }   
        
        
        echo "</table>";
    } 
    else 
    {
        echo "0 results";
    }
}



function displayInsertForm()
{
    global $thisPHP;
    
    // A heredoc for specifying really long strings
    $str = <<<EOD
    <form action='{$thisPHP}' method='post'>
    <fieldset>
        <legend>Student Journal Entry</legend> eId:
        <input type="eId" name="eId" size="10"><br>
        <br> eDate:
        <input type="eDate" name="eDate" size="30"><br>
        <br> eTitle:
        <input type="eTitle" name="eTitle"><br>
        <br> eText:
        <input type="eText" name="eText"><br>
        <br> eURL:
        <input type="eURL" name="eURL"><br>
        <br> eGroup
        <input type="eGroup" name="eGroup"><br>
        <input type="submit" name="btnInsert" value="Insert"><br>
    </fieldset>
    </form>
EOD;

    echo $str;
}
function showStudentRecords()
{
	$sql = "select * from availableon";
    $sql = "select * from company";
    $sql = "select * from directs";
    $sql = "select * from movie";
    $sql = "select * from people";
    $sql = "select * from production";
    $sql = "select * from service";
    $sql = "select * from starsin";
	displayPreambleAndRecords($sql);
}


function showSearchResults()
{
	$term = trim($_POST['txtSearchTerm']);
    $type = trim($_POST['Searchtype']);
    
    if ($type = 'Directors')
        {
        $sql="SELECT movieName FROM Production WHERE companyName LIKE '%".$term ."%'";
        displayPreambleAndRecords($sql);
    }
        
    /*{
        $sql = "SELECT movie FROM Directs WHERE peopleID = ANY (SELECT peopleID FROM People WHERE peopleFNAM LIKE '%".$term ."%')";
        displayPreambleAndRecords($sql);
    }*/
    else if($type ='Company')
    {
        $sql="SELECT movieName FROM Production WHERE companyName LIKE '%".$term ."%'";
        displayPreambleAndRecords($sql);
    }
    
    else if($type ='People')
    {
        $sql="SELECT * FROM People WHERE peopleFNAM LIKE '%".$term ."%'";
        displayPreambleAndRecords($sql);
    }
    //$sql = "SELECT movieName FROM Production WHERE companyName like '%".$term ."%'";
    
    displayPreambleAndRecords($sql);
}

?>
