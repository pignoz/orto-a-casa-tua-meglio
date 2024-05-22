<?php
$host = "localhost";  
$username = "root";  
$password = "";  
$db_nome = "orto a casa tua";  
$conn = new mysqli($host, $username, $password, $db_nome); 
if ($conn->connect_errno) {    
    echo "Impossibile connettersi al server:  " . $conn->connect_error . "\n";    
    exit;  
}

$Pemail = $_REQUEST["customeremail"];
$Ppassword = $_REQUEST["customerPassword"];

// Utilizzare prepared statements per evitare SQL injection
$stmt = $conn->prepare("SELECT email, password FROM clienti WHERE email = ?");
$stmt->bind_param("s", $Pemail);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if ($row['email'] == $Pemail && $row['password'] == $Ppassword) {
        // Link porta a ciao stefano logout
        echo '
        <html>
            <head></head>
            <body>
                <h1>ciao stefano</h1>
                <a href="logout.php">logout</a>
            </body>
        </html>';
    } else {
        // Link porta a pagina di login accendi
        echo '
        <html>
            <head></head>
            <body>
                <h1>ciao stefanononono</h1>
                <a href="registrazione-clienti.html">registrati</a>
            </body>
        </html>';
    }
} else {
    // Link porta a pagina di login accendi
    echo '
    <html>
        <head></head>
        <body>
            <h1>ciao stefano</h1>
            <a href="registrazione-clienti.html">registrati</a>
        </body>
    </html>';
}

$stmt->close();
$conn->close();
?>
