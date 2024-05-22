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



$template = $conn->prepare("INSERT INTO utenti(nome, cognome, email, password) VALUES (?, ?, ?, ?)");
$template->bind_param("ssss", $nome, $cognome, $email, $password);

if($template){
    $template->bind_param("ssss", $nome, $cognome, $email, $password);
    $result=$template->execute();
    echo "<h1> Utente inserito </h1>";
}else{
    echo "<h1> Errore </h1>";
}
$template->close();
$conn->close();
?>
