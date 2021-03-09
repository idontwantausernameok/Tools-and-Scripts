$logname = "./CyrillicToLatinRecursiveFiles.log"
Get-Date | Out-File $logname
foreach ($folder in Get-ChildItem -Directory -Recurse)
{
    Add-Content $logname ""
    Add-Content $logname $folder.FullName
    foreach ($file in Get-ChildItem -File -LiteralPath $folder.FullName)
    {
        $newFileName=$file.Name.Replace("А","A")
        $newFileName=$newFileName.Replace("а","a")
        $newFileName=$newFileName.Replace("Б","B")
        $newFileName=$newFileName.Replace("б","b")
        $newFileName=$newFileName.Replace("В","V")
        $newFileName=$newFileName.Replace("в","v")
        $newFileName=$newFileName.Replace("Г","G")
        $newFileName=$newFileName.Replace("г","g")
        $newFileName=$newFileName.Replace("Д","D")
        $newFileName=$newFileName.Replace("д","d")
        $newFileName=$newFileName.Replace("Е","E")
        $newFileName=$newFileName.Replace("е","e")
        $newFileName=$newFileName.Replace("Ж","J")
        $newFileName=$newFileName.Replace("ж","j")
        $newFileName=$newFileName.Replace("З","Z")
        $newFileName=$newFileName.Replace("з","z")
        $newFileName=$newFileName.Replace("И","I")
        $newFileName=$newFileName.Replace("и","i")
        $newFileName=$newFileName.Replace("Й","Y")
        $newFileName=$newFileName.Replace("й","y")
        $newFileName=$newFileName.Replace("К","K")
        $newFileName=$newFileName.Replace("к","k")
        $newFileName=$newFileName.Replace("Л","L")
        $newFileName=$newFileName.Replace("л","l")
        $newFileName=$newFileName.Replace("М","M")
        $newFileName=$newFileName.Replace("м","m")
        $newFileName=$newFileName.Replace("Н","N")
        $newFileName=$newFileName.Replace("н","n")
        $newFileName=$newFileName.Replace("О","O")
        $newFileName=$newFileName.Replace("о","o")
        $newFileName=$newFileName.Replace("П","P")
        $newFileName=$newFileName.Replace("п","p")
        $newFileName=$newFileName.Replace("Р","R")
        $newFileName=$newFileName.Replace("р","r")
        $newFileName=$newFileName.Replace("С","S")
        $newFileName=$newFileName.Replace("с","s")
        $newFileName=$newFileName.Replace("Т","T")
        $newFileName=$newFileName.Replace("т","t")
        $newFileName=$newFileName.Replace("У","U")
        $newFileName=$newFileName.Replace("у","u")
        $newFileName=$newFileName.Replace("Ф","F")
        $newFileName=$newFileName.Replace("ф","f")
        $newFileName=$newFileName.Replace("Х","H")
        $newFileName=$newFileName.Replace("х","h")
        $newFileName=$newFileName.Replace("Ц","Ts")
        $newFileName=$newFileName.Replace("ц","ts")
        $newFileName=$newFileName.Replace("Ч","Ch")
        $newFileName=$newFileName.Replace("ч","ch")
        $newFileName=$newFileName.Replace("Ш","Sh")
        $newFileName=$newFileName.Replace("ш","sh")
        $newFileName=$newFileName.Replace("Щ","Sht")
        $newFileName=$newFileName.Replace("щ","sht")
        $newFileName=$newFileName.Replace("Ъ","A")
        $newFileName=$newFileName.Replace("ъ","a")
        $newFileName=$newFileName.Replace("Ю","Yu")
        $newFileName=$newFileName.Replace("ю","yu")
        $newFileName=$newFileName.Replace("Я","Ya")
        $newFileName=$newFileName.Replace("я","ya")
        
        $fname = $file.Name

        if($fname -ne $newFileName)
        {
            $logLine = "    $fname ==> $newFileName"
            echo $logLine
            Add-Content $logname $logLine
            Rename-Item -LiteralPath $file.FullName -NewName $newFileName
        }
    }
}