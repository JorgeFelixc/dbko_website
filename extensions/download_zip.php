<?php 


// Download Created Zip file
if(isset($_POST['download'])){
  $zipFileName = "dbko_client.zip";
  $filesPath = './downloads/';
  $files = array('Tibia.exe', 'tibia.dat', 'tibia.pic', 'tibia.spr');
    // Create instance of ZipArchive. and open the zip folder.
    $zip = new \ZipArchive();
    if ($zip->open($zipFileName, \ZipArchive::CREATE) !== TRUE) {
        exit("cannot open <$zipFileName>\n");
    }

    // Adding every attachments files into the ZIP.
    foreach ($files as $file) {
        $zip->addFile($filesPath . $file, $file);
    }
    $zip->close();

    // Download the created zip file
    header("Content-type: application/zip");
    header("Content-Disposition: attachment; filename = $zipFileName");
    header("Pragma: no-cache");
    header("Expires: 0");
    readfile("$zipFileName");
    exit;
}
?>

