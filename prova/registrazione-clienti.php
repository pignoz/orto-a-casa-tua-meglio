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

$email=$_REQUEST["email"];
$nome=$_REQUEST["nome"];
$cognome=$_REQUEST["cognome"];
$password=$_REQUEST["password"];


$template = $conn->prepare("INSERT INTO clienti(email, nome, cognome, password) VALUES (?, ?, ?, ?)");
$template->bind_param("ssss", $email, $nome, $cognome, $password);

if($template){
    $template->bind_param("ssss", $email, $nome, $cognome, $password);
    $result=$template->execute();
    echo "<h1> Utente inserito </h1>";

    


}else{
    echo "<h1> Errore </h1>";
}
$template->close();
$conn->close();
?>
